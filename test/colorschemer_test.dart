import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/colorschemer/Pumpkin.cs': ColorSchemerPalette(
      version: 3,
      baseColor: [0x55, 0x11, 0x00],
      colors: [
        ColorSchemerColor(
          name: '#331100',
          red: 0x33,
          green: 0x11,
          blue: 0x00,
          hexValue: '331100',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('ColorSchemer File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final file = File(filePath);
        bytes = file.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ColorSchemerPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = ColorSchemerPalette.fromBytes(bytes);

        // Compare version
        expect(palette.version, equals(expectedPalette.version));

        // Compare base color
        expect(palette.baseColor.length, equals(3));
        expect(palette.baseColor[0], equals(expectedPalette.baseColor[0]));
        expect(palette.baseColor[1], equals(expectedPalette.baseColor[1]));
        expect(palette.baseColor[2], equals(expectedPalette.baseColor[2]));

        // Compare colors
        expect(
          palette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (palette.colors.isNotEmpty) {
          final firstColor = palette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue mismatch for the first color',
          );
          expect(
            firstColor.hexValue,
            equals(expectedFirstColor.hexValue),
            reason: 'Hex value mismatch for the first color',
          );
          expect(
            firstColor.developed,
            equals(expectedFirstColor.developed),
            reason: 'Developed flag mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid CS file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(ColorSchemerPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('parses all fixture colors', () {
    final palette = ColorSchemerPalette.fromBytes(
      File('test/testdata/colorschemer/Pumpkin.cs').readAsBytesSync(),
    );

    expect(palette.version, equals(3));
    expect(palette.baseColor, equals([0x55, 0x11, 0x00]));
    expect(palette.colors.length, equals(9));

    final expected = [
      ('#331100', [0x33, 0x11, 0x00], '331100'),
      ('#552200', [0x55, 0x22, 0x00], '552200'),
      ('#BB4411', [0xBB, 0x44, 0x11], 'BB4411'),
      ('#EEEEAA', [0xEE, 0xEE, 0xAA], 'EEEEAA'),
      ('#DDAA55', [0xDD, 0xAA, 0x55], 'DDAA55'),
      ('#CC3300', [0xCC, 0x33, 0x00], 'CC3300'),
      ('#FFFFBB', [0xFF, 0xFF, 0xBB], 'FFFFBB'),
      ('#EEBB55', [0xEE, 0xBB, 0x55], 'EEBB55'),
      ('#551100', [0x55, 0x11, 0x00], '551100'),
    ];
    for (var i = 0; i < expected.length; i++) {
      final color = palette.colors[i];
      expect(color.name, equals(expected[i].$1), reason: 'color $i name');
      expect(
        [color.red, color.green, color.blue],
        equals(expected[i].$2),
        reason: 'color $i rgb',
      );
      expect(color.hexValue, equals(expected[i].$3), reason: 'color $i hex');
      expect(color.developed, isFalse, reason: 'color $i developed');
    }
  });

  test('wrong version throws FormatException and is not valid', () {
    final bytes =
        File(
          'test/testdata/colorschemer/Pumpkin.cs',
        ).readAsBytesSync().toList();
    bytes[0] = 9;
    expect(ColorSchemerPalette.isValidFormat(bytes), isFalse);
    expect(
      () => ColorSchemerPalette.fromBytes(bytes),
      throwsA(isA<FormatException>()),
    );
  });

  test('truncated file throws FormatException and is not valid', () {
    final bytes = File(
      'test/testdata/colorschemer/Pumpkin.cs',
    ).readAsBytesSync().sublist(0, 242);
    for (final truncated in [
      bytes.sublist(0, 2),
      bytes.sublist(0, 6),
      bytes.sublist(0, 10),
      bytes.sublist(0, 20),
      bytes.sublist(0, 50),
      bytes.sublist(0, 150),
    ]) {
      expect(ColorSchemerPalette.isValidFormat(truncated), isFalse);
      expect(
        () => ColorSchemerPalette.fromBytes(truncated),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('corrupt entries throw FormatException and are not valid', () {
    final bytes =
        File(
          'test/testdata/colorschemer/Pumpkin.cs',
        ).readAsBytesSync().toList();
    // Entry 0 layout: rgb at 8, name length at 12, hex length at 26.
    final corrupt = <String, List<int>>{
      'negative name length': [12, 0xFF, 0xFF, 0xFF, 0xFF],
      'oversized name length': [12, 200, 0, 0, 0],
      'bad hex length': [26, 3],
    };
    corrupt.forEach((reason, patch) {
      final corrupted = bytes.toList();
      for (var i = 1; i < patch.length; i++) {
        corrupted[patch[0] + i - 1] = patch[i];
      }
      expect(
        ColorSchemerPalette.isValidFormat(corrupted),
        isFalse,
        reason: reason,
      );
      expect(
        () => ColorSchemerPalette.fromBytes(corrupted),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('encoder writes names without null terminators', () {
    final palette = ColorSchemerPalette(
      version: 3,
      baseColor: [0xFF, 0x00, 0x00],
      colors: [
        ColorSchemerColor(
          name: 'Red',
          red: 255,
          green: 0,
          blue: 0,
          hexValue: 'FF0000',
        ),
      ],
    );

    final bytes = palette.toBytes();
    // Header (8) then rgb (3) + pad (1); name length follows.
    final nameLength =
        bytes[12] | (bytes[13] << 8) | (bytes[14] << 16) | (bytes[15] << 24);
    expect(nameLength, equals(3));
    expect(bytes.sublist(16, 19), equals('Red'.codeUnits));
    // No null terminator: repeated RGB starts right after the name.
    expect(bytes.sublist(19, 22), equals([255, 0, 0]));
  });

  test('decode-encode-decode is stable on the fixture', () {
    final bytes =
        File('test/testdata/colorschemer/Pumpkin.cs').readAsBytesSync();
    final once = ColorSchemerPalette.fromBytes(bytes);
    final twice = ColorSchemerPalette.fromBytes(once.toBytes());

    expect(twice.version, equals(once.version));
    expect(twice.baseColor, equals(once.baseColor));
    expect(twice.colors.length, equals(once.colors.length));
    for (var i = 0; i < once.colors.length; i++) {
      expect(twice.colors[i].name, equals(once.colors[i].name));
      expect(twice.colors[i].hexValue, equals(once.colors[i].hexValue));
    }
    expect(twice.toBytes(), equals(once.toBytes()));
  });

  test('encoder rejects unencodable palettes', () {
    // Out-of-range values trip the constructor asserts in debug builds
    // and the encoder validation in release; accept either.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    ColorSchemerColor color({
      String name = 'Red',
      int red = 255,
      int green = 0,
      int blue = 0,
      String hexValue = 'FF0000',
    }) => ColorSchemerColor(
      name: name,
      red: red,
      green: green,
      blue: blue,
      hexValue: hexValue,
    );
    ColorSchemerPalette build({
      int version = 3,
      List<int> baseColor = const [0xFF, 0x00, 0x00],
      List<ColorSchemerColor>? colors,
    }) => ColorSchemerPalette(
      version: version,
      baseColor: baseColor,
      colors: colors ?? [color()],
    );

    expect(() => build(version: 9).toBytes(), throwsA(either));
    expect(() => build(baseColor: [0xFF, 0x00]).toBytes(), throwsA(either));
    expect(
      () => build(baseColor: [0xFF, 0x00, 0x100]).toBytes(),
      throwsA(either),
    );
    expect(() => build(colors: [color(red: 300)]).toBytes(), throwsA(either));
    expect(
      () => build(colors: [color(hexValue: 'FFF')]).toBytes(),
      throwsA(either),
    );
    // Names are single-byte wire strings.
    expect(
      () => build(colors: [color(name: 'Grün €')]).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('write cs file', () {
    final palette = ColorSchemerPalette(
      version: 3,
      baseColor: [0xFF, 0x00, 0x00],
      colors: [
        ColorSchemerColor(
          name: 'Red',
          red: 255,
          green: 0,
          blue: 0,
          hexValue: 'FF0000',
          developed: true,
        ),
        ColorSchemerColor(
          name: 'Green',
          red: 0,
          green: 255,
          blue: 0,
          hexValue: '00FF00',
          // developed: false,
        ),
        ColorSchemerColor(
          name: 'Blue',
          red: 0,
          green: 0,
          blue: 255,
          hexValue: '0000FF',
          developed: true,
        ),
      ],
    );

    // write to temp file
    final csFile = File('./test/test.cs');
    csFile.writeAsBytesSync(palette.toBytes());

    final decodedPalette = ColorSchemerPalette.fromBytes(
      csFile.readAsBytesSync(),
    );

    expect(decodedPalette.version, equals(3));
    expect(decodedPalette.baseColor, equals([0xFF, 0x00, 0x00]));
    expect(decodedPalette.colors.length, equals(3));

    expect(decodedPalette.colors[0].name, equals('Red'));
    expect(decodedPalette.colors[0].red, equals(255));
    expect(decodedPalette.colors[0].green, equals(0));
    expect(decodedPalette.colors[0].blue, equals(0));
    expect(decodedPalette.colors[0].hexValue, equals('FF0000'));
    expect(decodedPalette.colors[0].developed, isTrue);

    expect(decodedPalette.colors[1].name, equals('Green'));
    expect(decodedPalette.colors[1].red, equals(0));
    expect(decodedPalette.colors[1].green, equals(255));
    expect(decodedPalette.colors[1].blue, equals(0));
    expect(decodedPalette.colors[1].hexValue, equals('00FF00'));
    expect(decodedPalette.colors[1].developed, isFalse);

    expect(decodedPalette.colors[2].name, equals('Blue'));
    expect(decodedPalette.colors[2].red, equals(0));
    expect(decodedPalette.colors[2].green, equals(0));
    expect(decodedPalette.colors[2].blue, equals(255));
    expect(decodedPalette.colors[2].hexValue, equals('0000FF'));
    expect(decodedPalette.colors[2].developed, isTrue);

    // delete temp file
    csFile.deleteSync();
  });
}
