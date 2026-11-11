import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // First, second, and last color of each fixture, verified against
  // the raw bytes.
  final expectedData = {
    'test/testdata/starcraft/Units.pal': (
      first: StarCraftPaletteColor(red: 0, green: 0, blue: 0),
      second: StarCraftPaletteColor(red: 35, green: 35, blue: 255),
      last: StarCraftPaletteColor(red: 255, green: 255, blue: 255),
    ),
    'test/testdata/starcraft/Terrain.pal': (
      first: StarCraftPaletteColor(red: 0, green: 0, blue: 0),
      second: StarCraftPaletteColor(red: 39, green: 39, blue: 59),
      last: StarCraftPaletteColor(red: 255, green: 255, blue: 255),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('StarCraft File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final starcraftFile = File(filePath);
        bytes = starcraftFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(StarCraftPalette.isValidFormat(bytes), isTrue);
      });

      test('parses all 256 colors', () {
        final starcraft = StarCraftPalette.fromBytes(bytes);

        expect(
          starcraft.colors.length,
          equals(StarCraftPalette.colorsCount),
          reason: 'Expected 256 colors',
        );

        final firstColor = starcraft.colors.first;
        expect(firstColor.red, equals(expected.first.red));
        expect(firstColor.green, equals(expected.first.green));
        expect(firstColor.blue, equals(expected.first.blue));

        final secondColor = starcraft.colors[1];
        expect(secondColor.red, equals(expected.second.red));
        expect(secondColor.green, equals(expected.second.green));
        expect(secondColor.blue, equals(expected.second.blue));

        final lastColor = starcraft.colors.last;
        expect(lastColor.red, equals(expected.last.red));
        expect(lastColor.green, equals(expected.last.green));
        expect(lastColor.blue, equals(expected.last.blue));
      });

      test('re-encodes byte-for-byte', () {
        final starcraft = StarCraftPalette.fromBytes(bytes);
        expect(starcraft.toBytes(), equals(bytes));
      });
    });
  });

  test('isValidFormat returns false for wrong-sized files', () {
    final bytes = File('test/testdata/starcraft/Units.pal').readAsBytesSync();
    // Truncated, oversized (772-byte ACT footer shape), and tiny inputs.
    for (final invalid in [
      bytes.sublist(0, 100),
      bytes.sublist(0, 767),
      [...bytes, 0],
      [1, 1, 1, 1, 1, 1],
    ]) {
      expect(StarCraftPalette.isValidFormat(invalid), isFalse);
      expect(
        () => StarCraftPalette.fromBytes(invalid),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('write starcraft file', () {
    final starcraft = StarCraftPalette(
      colors:
          List.generate(
            StarCraftPalette.colorsCount,
            (index) =>
                StarCraftPaletteColor(green: index, blue: index, red: index),
          ).toList(),
    );

    // write to temp file
    final starcraftFile = File('./test/test.pal');
    starcraftFile.writeAsBytesSync(starcraft.toBytes());

    final decodedStarcraft = StarCraftPalette.fromBytes(
      starcraftFile.readAsBytesSync(),
    );

    expect(
      decodedStarcraft.colors.length,
      equals(StarCraftPalette.colorsCount),
    );
    for (var i = 0; i < StarCraftPalette.colorsCount; i++) {
      expect(decodedStarcraft.colors[i].red, equals(i));
      expect(decodedStarcraft.colors[i].green, equals(i));
      expect(decodedStarcraft.colors[i].blue, equals(i));
    }

    // delete temp file
    starcraftFile.deleteSync();
  });
}
