import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // First, second, and last color of each fixture, verified against
  // the raw bytes.
  final expectedData = {
    'test/testdata/starcraft_padded/badlands.wpe': (
      first: StarCraftPaddedPaletteColor(red: 0, green: 0, blue: 0),
      second: StarCraftPaddedPaletteColor(red: 0, green: 0, blue: 0),
      last: StarCraftPaddedPaletteColor(red: 255, green: 255, blue: 255),
    ),
    'test/testdata/starcraft_padded/badlands-nc.wpe': (
      first: StarCraftPaddedPaletteColor(red: 0, green: 0, blue: 0),
      second: StarCraftPaddedPaletteColor(red: 35, green: 35, blue: 255),
      last: StarCraftPaddedPaletteColor(red: 255, green: 255, blue: 255),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('StarCraft Padded File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final starcraftPaddedFile = File(filePath);
        bytes = starcraftPaddedFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(StarCraftPaddedPalette.isValidFormat(bytes), isTrue);
      });

      test('parses all 256 colors', () {
        final starcraftPadded = StarCraftPaddedPalette.fromBytes(bytes);

        expect(
          starcraftPadded.colors.length,
          equals(StarCraftPaddedPalette.colorsCount),
          reason: 'Expected 256 colors',
        );

        final firstColor = starcraftPadded.colors.first;
        expect(firstColor.red, equals(expected.first.red));
        expect(firstColor.green, equals(expected.first.green));
        expect(firstColor.blue, equals(expected.first.blue));

        final secondColor = starcraftPadded.colors[1];
        expect(secondColor.red, equals(expected.second.red));
        expect(secondColor.green, equals(expected.second.green));
        expect(secondColor.blue, equals(expected.second.blue));

        final lastColor = starcraftPadded.colors.last;
        expect(lastColor.red, equals(expected.last.red));
        expect(lastColor.green, equals(expected.last.green));
        expect(lastColor.blue, equals(expected.last.blue));
      });

      test('re-encodes byte-for-byte', () {
        final starcraftPadded = StarCraftPaddedPalette.fromBytes(bytes);
        expect(starcraftPadded.toBytes(), equals(bytes));
      });
    });
  });

  test('isValidFormat returns false for wrong-sized files', () {
    final bytes =
        File('test/testdata/starcraft_padded/badlands.wpe').readAsBytesSync();
    // Truncated, oversized, unpadded 768-byte StarCraft shape, and
    // tiny inputs.
    final rawStarcraft =
        File('test/testdata/starcraft/Units.pal').readAsBytesSync();
    for (final invalid in [
      bytes.sublist(0, 100),
      bytes.sublist(0, 1023),
      [...bytes, 0],
      rawStarcraft,
      [1, 1, 1, 1, 1, 1],
    ]) {
      expect(StarCraftPaddedPalette.isValidFormat(invalid), isFalse);
      expect(
        () => StarCraftPaddedPalette.fromBytes(invalid),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('write starcraft padded file', () {
    final starcraftPadded = StarCraftPaddedPalette(
      colors:
          List.generate(
            StarCraftPaddedPalette.colorsCount,
            (index) => StarCraftPaddedPaletteColor(
              green: index,
              blue: index,
              red: index,
            ),
          ).toList(),
    );

    // write to temp file
    final starcraftPaddedFile = File('./test/test.wpe');
    starcraftPaddedFile.writeAsBytesSync(starcraftPadded.toBytes());

    final decodedStarcraftPadded = StarCraftPaddedPalette.fromBytes(
      starcraftPaddedFile.readAsBytesSync(),
    );

    expect(
      decodedStarcraftPadded.colors.length,
      equals(StarCraftPaddedPalette.colorsCount),
    );
    for (var i = 0; i < StarCraftPaddedPalette.colorsCount; i++) {
      expect(decodedStarcraftPadded.colors[i].red, equals(i));
      expect(decodedStarcraftPadded.colors[i].green, equals(i));
      expect(decodedStarcraftPadded.colors[i].blue, equals(i));
    }

    // delete temp file
    starcraftPaddedFile.deleteSync();
  });
}
