import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rebelle Palette File: default.colors', () {
    late List<int> bytes;

    setUpAll(() {
      final rebelleFile = File('test/testdata/rebelle/default.colors');
      bytes = rebelleFile.readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(RebellePalette.isValidFormat(bytes), isTrue);
    });

    test('parses correctly', () {
      final rebellePalette = RebellePalette.fromBytes(bytes);

      // The default.colors file has 96 colors (all hex values, no names)
      expect(rebellePalette.colors.length, equals(96));

      // Check first color (black)
      final firstColor = rebellePalette.colors.first;
      expect(firstColor.red, equals(0));
      expect(firstColor.green, equals(0));
      expect(firstColor.blue, equals(0));
      expect(firstColor.name, equals(''));

      // Check a middle color (white at index 4)
      final whiteColor = rebellePalette.colors[4];
      expect(whiteColor.red, equals(255));
      expect(whiteColor.green, equals(255));
      expect(whiteColor.blue, equals(255));
      expect(whiteColor.name, equals(''));

      // Check red at index 5
      final redColor = rebellePalette.colors[5];
      expect(redColor.red, equals(255));
      expect(redColor.green, equals(0));
      expect(redColor.blue, equals(0));
      expect(redColor.name, equals(''));
    });
  });

  test('isValidFormat returns false for invalid RebellePalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(RebellePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write rebelle file', () {
    final rebellePalette = RebellePalette(
      colors: [
        RebellePaletteColor(name: 'Red', red: 255, green: 0, blue: 0),
        RebellePaletteColor(name: 'Green', red: 0, green: 255, blue: 0),
        RebellePaletteColor(name: 'Blue', red: 0, green: 0, blue: 255),
        RebellePaletteColor(name: '', red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final tempFile = File('./test/test.colors');
    tempFile.writeAsBytesSync(rebellePalette.toBytes());

    final decodedPalette = RebellePalette.fromBytes(tempFile.readAsBytesSync());

    expect(decodedPalette.colors.length, equals(4));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Red'));
    expect(decodedPalette.colors[0].red, equals(255));
    expect(decodedPalette.colors[0].green, equals(0));
    expect(decodedPalette.colors[0].blue, equals(0));

    // Verify second color
    expect(decodedPalette.colors[1].name, equals('Green'));
    expect(decodedPalette.colors[1].red, equals(0));
    expect(decodedPalette.colors[1].green, equals(255));
    expect(decodedPalette.colors[1].blue, equals(0));

    // Verify third color
    expect(decodedPalette.colors[2].name, equals('Blue'));
    expect(decodedPalette.colors[2].red, equals(0));
    expect(decodedPalette.colors[2].green, equals(0));
    expect(decodedPalette.colors[2].blue, equals(255));

    // Verify last color (with empty name)
    expect(decodedPalette.colors[3].name, equals(''));
    expect(decodedPalette.colors[3].red, equals(128));
    expect(decodedPalette.colors[3].green, equals(128));
    expect(decodedPalette.colors[3].blue, equals(128));

    // delete temp file
    tempFile.deleteSync();
  });

  test('round-trip with empty names', () {
    final original = RebellePalette(
      colors: [
        RebellePaletteColor(name: '', red: 0, green: 0, blue: 0),
        RebellePaletteColor(name: '', red: 255, green: 255, blue: 255),
      ],
    );

    final encoded = original.toBytes();
    final decoded = RebellePalette.fromBytes(encoded);

    expect(decoded.colors.length, equals(2));
    expect(decoded.colors[0].name, equals(''));
    expect(decoded.colors[1].name, equals(''));
  });

  group('validation', () {
    List<int> bytes(String content) => utf8.encode(content);

    test('rejects malformed lines with FormatException', () {
      final cases = <String, List<int>>{
        'garbage line': bytes('#ff0000\tRed\nnot a color\n#00ff00\tGreen\n'),
        'three-digit hex': bytes('#fff\n'),
        'no hash': bytes('ff0000\n'),
        'eight-digit hex': bytes('#ff0000ff\n'),
        'non-hex digits': bytes('#zzzzzz\n'),
        'extra columns': bytes('#ff0000\tRed\textra\n'),
        'empty': <int>[],
        'blank lines only': bytes('\n   \n'),
      };

      for (final entry in cases.entries) {
        expect(
          () => RebellePalette.fromBytes(entry.value),
          throwsA(isA<FormatException>()),
          reason: entry.key,
        );
        expect(
          RebellePalette.isValidFormat(entry.value),
          isFalse,
          reason: entry.key,
        );
      }
    });

    test('reads lone-CR endings as separate colors', () {
      final palette = RebellePalette.fromBytes(
        bytes('#ff0000\tRed\r#00ff00\tGreen\r'),
      );
      expect(palette.colors.length, equals(2));
      expect(palette.colors[0].name, equals('Red'));
      expect(palette.colors[1].name, equals('Green'));
      expect(
        RebellePalette.isValidFormat(bytes('#ff0000\tRed\r#00ff00\tGreen\r')),
        isTrue,
      );
    });

    test('accepts uppercase hex', () {
      final palette = RebellePalette.fromBytes(bytes('#FF0000\tRed\n'));
      expect(palette.colors.first.red, equals(255));
      expect(palette.colors.first.green, equals(0));
      expect(palette.colors.first.blue, equals(0));
    });

    test('encoder rejects invalid colors', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      for (final bad in [300, -1]) {
        expect(
          () =>
              RebellePalette(
                colors: [
                  RebellePaletteColor(red: bad, green: 0, blue: 0, name: 'x'),
                ],
              ).toBytes(),
          throwsA(either),
          reason: 'red = $bad',
        );
      }
      for (final badName in ['a\n#bada55', 'a\tb', 'a\rb']) {
        expect(
          () =>
              RebellePalette(
                colors: [
                  RebellePaletteColor(red: 1, green: 2, blue: 3, name: badName),
                ],
              ).toBytes(),
          throwsA(isA<FormatException>()),
          reason: 'name = ${badName.codeUnits}',
        );
      }
    });
  });

  test('decode-encode-decode is stable on the fixture', () {
    final fileBytes =
        File('test/testdata/rebelle/default.colors').readAsBytesSync();
    final once = RebellePalette.fromBytes(fileBytes);
    final twice = RebellePalette.fromBytes(once.toBytes());
    expect(twice.colors.length, equals(once.colors.length));
    for (var i = 0; i < once.colors.length; i++) {
      expect(twice.colors[i].red, equals(once.colors[i].red));
      expect(twice.colors[i].green, equals(once.colors[i].green));
      expect(twice.colors[i].blue, equals(once.colors[i].blue));
      expect(twice.colors[i].name, equals(once.colors[i].name));
    }
  });
}
