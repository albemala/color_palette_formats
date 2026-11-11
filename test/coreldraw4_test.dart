import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/coreldraw4/coreldraw.pal': CorelDraw4Palette(
      colors: [
        CorelDraw4PaletteColor(
          cyan: 0,
          magenta: 0,
          yellow: 100,
          black: 0,
          name: 'PANTONE Process Yellow CH',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('CorelDraw4 Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final corelFile = File(filePath);
        bytes = corelFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(CorelDraw4Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final corelPalette = CorelDraw4Palette.fromBytes(bytes);

        // Compare colors
        expect(
          corelPalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (corelPalette.colors.isNotEmpty) {
          final firstColor = corelPalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.cyan,
            equals(expectedFirstColor.cyan),
            reason: 'Cyan value mismatch for the first color',
          );
          expect(
            firstColor.magenta,
            equals(expectedFirstColor.magenta),
            reason: 'Magenta value mismatch for the first color',
          );
          expect(
            firstColor.yellow,
            equals(expectedFirstColor.yellow),
            reason: 'Yellow value mismatch for the first color',
          );
          expect(
            firstColor.black,
            equals(expectedFirstColor.black),
            reason: 'Black value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid CorelDraw4Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(CorelDraw4Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('parses all fixture colors', () {
    final palette = CorelDraw4Palette.fromBytes(
      File('test/testdata/coreldraw4/coreldraw.pal').readAsBytesSync(),
    );

    final expected = [
      ('PANTONE Process Yellow CH', [0, 0, 100, 0]),
      ('PANTONE Process Magenta CH', [0, 100, 0, 0]),
      ('PANTONE Process Cyan CH', [100, 0, 0, 0]),
      ('PANTONE Process Black CH', [0, 0, 0, 100]),
      ('PANTONE Orange 021 CH', [0, 48, 89, 0]),
      ('PANTONE Red 032 CH', [0, 74, 82, 0]),
      ('PANTONE Blue 072 CH', [100, 84, 0, 0]),
      ('PANTONE 100 CH', [2, 0, 32, 0]),
      ('PANTONE 101 CH', [3, 0, 46, 0]),
      ('PANTONE 102 CH', [4, 0, 60, 0]),
      ('PANTONE Yellow CH', [6, 0, 80, 0]),
      ('PANTONE 103 CH', [2, 0, 100, 20]),
    ];
    expect(palette.colors.length, equals(expected.length));
    for (var i = 0; i < expected.length; i++) {
      final color = palette.colors[i];
      expect(color.name, equals(expected[i].$1), reason: 'color $i name');
      expect(
        [color.cyan, color.magenta, color.yellow, color.black],
        equals(expected[i].$2),
        reason: 'color $i channels',
      );
    }
  });

  test('decode rejects out-of-range and unparseable input', () {
    List<int> bytes(String s) => s.codeUnits;
    final cases = {
      'channel over 100': '"Bad" 0 0 0 999\n',
      'huge channel': '"Bad" 99999999999999999999 0 0 0\n',
      'negative channel': '"Neg" 0 0 0 -5\n',
      'trailing junk only': '"A" 0 0 0 0 extra\n',
      'garbage only': 'hello world\n',
      'empty input': '',
    };
    cases.forEach((reason, content) {
      final input = bytes(content);
      expect(CorelDraw4Palette.isValidFormat(input), isFalse, reason: reason);
      expect(
        () => CorelDraw4Palette.fromBytes(input),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('skips junk lines but keeps valid colors', () {
    final bytes =
        '"Good" 0 0 0 10\nthis is not a color\n\x1a\n"Also Good" 1 2 3 4\n'
            .codeUnits;
    final palette = CorelDraw4Palette.fromBytes(bytes);
    expect(CorelDraw4Palette.isValidFormat(bytes), isTrue);
    expect(palette.colors.length, equals(2));
    expect(palette.colors[0].name, equals('Good'));
    expect(palette.colors[1].name, equals('Also Good'));
    expect([
      palette.colors[1].cyan,
      palette.colors[1].magenta,
      palette.colors[1].yellow,
      palette.colors[1].black,
    ], equals([1, 2, 3, 4]));
  });

  test('decodes lone-CR line endings', () {
    final bytes = '"A" 0 0 0 10\r"B" 0 0 0 20\r'.codeUnits;
    final palette = CorelDraw4Palette.fromBytes(bytes);
    expect(palette.colors.length, equals(2));
    expect(palette.colors[0].name, equals('A'));
    expect(palette.colors[0].black, equals(10));
    expect(palette.colors[1].name, equals('B'));
    expect(palette.colors[1].black, equals(20));
  });

  test('encoder writes one line per color without trailing blank line', () {
    final palette = CorelDraw4Palette(
      colors: [
        CorelDraw4PaletteColor(
          name: 'Test Cyan',
          cyan: 100,
          magenta: 0,
          yellow: 0,
          black: 0,
        ),
      ],
    );

    final decoded = String.fromCharCodes(palette.toBytes());
    expect(decoded, equals('"Test Cyan"    100    0    0    0\n'));
  });

  test('decode-encode-decode is stable on the fixture', () {
    final bytes =
        File('test/testdata/coreldraw4/coreldraw.pal').readAsBytesSync();
    final once = CorelDraw4Palette.fromBytes(bytes);
    final twice = CorelDraw4Palette.fromBytes(once.toBytes());

    expect(twice.colors.length, equals(once.colors.length));
    for (var i = 0; i < once.colors.length; i++) {
      expect(twice.colors[i].name, equals(once.colors[i].name));
      expect(twice.colors[i].cyan, equals(once.colors[i].cyan));
      expect(twice.colors[i].magenta, equals(once.colors[i].magenta));
      expect(twice.colors[i].yellow, equals(once.colors[i].yellow));
      expect(twice.colors[i].black, equals(once.colors[i].black));
    }
    expect(twice.toBytes(), equals(once.toBytes()));
  });

  test('encoder rejects unencodable palettes', () {
    // Out-of-range values trip the constructor asserts in debug builds
    // and the encoder validation in release; accept either.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    CorelDraw4PaletteColor color({
      String name = 'Red',
      int cyan = 0,
      int magenta = 0,
      int yellow = 0,
      int black = 0,
    }) => CorelDraw4PaletteColor(
      name: name,
      cyan: cyan,
      magenta: magenta,
      yellow: yellow,
      black: black,
    );

    expect(
      () => CorelDraw4Palette(colors: []).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => CorelDraw4Palette(colors: [color(cyan: 101)]).toBytes(),
      throwsA(either),
    );
    expect(
      () => CorelDraw4Palette(colors: [color(name: '')]).toBytes(),
      throwsA(either),
    );
    expect(
      () => CorelDraw4Palette(colors: [color(name: 'Q"UOTE')]).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => CorelDraw4Palette(colors: [color(name: 'A\nB')]).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('write coreldraw4 pal file', () {
    final corelPalette = CorelDraw4Palette(
      colors: [
        CorelDraw4PaletteColor(
          name: 'Test Cyan',
          cyan: 100,
          magenta: 0,
          yellow: 0,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Magenta',
          cyan: 0,
          magenta: 100,
          yellow: 0,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Yellow',
          cyan: 0,
          magenta: 0,
          yellow: 100,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Black',
          cyan: 0,
          magenta: 0,
          yellow: 0,
          black: 100,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Gray 50%',
          cyan: 0,
          magenta: 0,
          yellow: 0,
          black: 50,
        ),
      ],
    );

    // write to temp file
    final tempFile = File('./test/test_coreldraw4.pal');
    tempFile.writeAsBytesSync(corelPalette.toBytes());
    // print(tempFile.readAsStringSync()); // Optional: for debugging

    final decodedPalette = CorelDraw4Palette.fromBytes(
      tempFile.readAsBytesSync(),
    );

    expect(decodedPalette.colors.length, equals(5));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Test Cyan'));
    expect(decodedPalette.colors[0].cyan, equals(100));
    expect(decodedPalette.colors[0].magenta, equals(0));
    expect(decodedPalette.colors[0].yellow, equals(0));
    expect(decodedPalette.colors[0].black, equals(0));

    // Verify last color
    expect(decodedPalette.colors[4].name, equals('Test Gray 50%'));
    expect(decodedPalette.colors[4].cyan, equals(0));
    expect(decodedPalette.colors[4].magenta, equals(0));
    expect(decodedPalette.colors[4].yellow, equals(0));
    expect(decodedPalette.colors[4].black, equals(50));

    // delete temp file
    tempFile.deleteSync();
  });
}
