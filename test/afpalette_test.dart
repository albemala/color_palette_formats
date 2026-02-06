import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/afpalette/afpalette-test.afpalette': (
      fileName: 'afpalette-test',
      colorCount: 5,
      firstColor: AffinityDesignerPaletteColor(
        name: 'Black',
        red: 0,
        green: 0,
        blue: 0,
      ),
    ),
    './assets/afpalette/3WHITE0OPC3WHITE100OPC.afpalette': (
      fileName: '3WHITE0OPC3WHITE100OPC',
      colorCount: 2,
      firstColor: AffinityDesignerPaletteColor(
        name: 'R:255 G:255 B:255 A:0% 3',
        red: 1,
        green: 1,
        blue: 1,
        alpha: 0,
      ),
    ),
    './assets/afpalette/EMPTY.afpalette': (
      fileName: 'EMPTY',
      colorCount: 0,
      firstColor: null,
    ),
    './assets/afpalette/EMPTY2.afpalette': (
      fileName: 'EMPTY2',
      colorCount: 0,
      firstColor: null,
    ),
    './assets/afpalette/EMPTYDOC.afpalette': (
      fileName: 'EMPTYDOC',
      colorCount: 0,
      firstColor: null,
    ),
    './assets/afpalette/Grays.afpalette': (
      fileName: 'Grays',
      colorCount: 21,
      firstColor: AffinityDesignerPaletteColor(
        name: 'Black',
        red: 0,
        green: 0,
        blue: 0,
      ),
    ),
    './assets/afpalette/Kit - Grade UI - Fills.afpalette': (
      fileName: 'Kit - Grade UI - Fills',
      colorCount: 13,
      firstColor: AffinityDesignerPaletteColor(
        name: 'R:0 G:129 B:213',
        red: 0,
        green: 0.5058823823928833,
        blue: 0.8352941870689392,
      ),
    ),
    './assets/afpalette/Maurice Denis 01.afpalette': (
      fileName: 'Maurice Denis 01',
      colorCount: 0,
      firstColor: null,
    ),
    './assets/afpalette/Simple Test A.afpalette': (
      fileName: 'Simple Test A',
      colorCount: 1,
      firstColor: AffinityDesignerPaletteColor(
        name: 'R:0 G:0 B:0',
        red: 0,
        green: 0,
        blue: 0,
      ),
    ),
    './assets/afpalette/Simple Test B.afpalette': (
      fileName: 'Simple Test B',
      colorCount: 1,
      firstColor: AffinityDesignerPaletteColor(
        name: 'R:1 G:0 B:0',
        red: 0.003921568859368563,
        green: 0,
        blue: 0,
      ),
    ),
    './assets/afpalette/_FMPEnlHHs01.afpalette': (
      fileName: '_FMPEnlHHs01',
      colorCount: 8,
      firstColor: AffinityDesignerPaletteColor(
        name: 'R:119 G:14 B:34',
        red: 0.46666669845581055,
        green: 0.05490196496248245,
        blue: 0.13333334028720856,
      ),
    ),
    './assets/afpalette/cromatica.afpalette': (
      fileName: 'cromatica',
      colorCount: 10,
      firstColor: AffinityDesignerPaletteColor(
        name: 'fbf8fd',
        red: 0.9843137264251709,
        green: 0.9725490212440491,
        blue: 0.9921568632125854,
      ),
    ),
    './assets/afpalette/shido-10.afpalette': (
      fileName: 'shido-10',
      colorCount: 10,
      firstColor: AffinityDesignerPaletteColor(
        name: '000000',
        red: 0,
        green: 0,
        blue: 0,
      ),
    ),
    './assets/afpalette/sunfall.afpalette': (
      fileName: 'sunfall',
      colorCount: 10,
      firstColor: AffinityDesignerPaletteColor(
        name: '000809',
        red: 0,
        green: 0.0313725508749485,
        blue: 0.03529411926865578,
      ),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('Affinity Designer Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final file = File(filePath);
        bytes = file.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AffinityDesignerPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = AffinityDesignerPalette.fromBytes(bytes);

        // Check filename
        expect(
          palette.fileName,
          equals(expected.fileName),
          reason: 'Filename mismatch',
        );

        // Check color count
        expect(
          palette.colors.length,
          equals(expected.colorCount),
          reason: 'Color count mismatch',
        );

        // Check first color if it exists
        if (expected.firstColor != null) {
          expect(
            palette.colors.isNotEmpty,
            isTrue,
            reason: 'Expected colors but palette is empty',
          );

          final firstColor = palette.colors.first;
          final expectedFirstColor = expected.firstColor!;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );

          // Use closeTo for floating point comparisons
          expect(
            firstColor.red,
            closeTo(expectedFirstColor.red, 1e-9),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            closeTo(expectedFirstColor.green, 1e-9),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            closeTo(expectedFirstColor.blue, 1e-9),
            reason: 'Blue value mismatch for the first color',
          );
          expect(
            firstColor.alpha,
            closeTo(expectedFirstColor.alpha, 1e-9),
            reason: 'Alpha value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid afpalette file', () {
    // Test with some random bytes that don't match the magic number
    final invalidBytes = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07];
    expect(AffinityDesignerPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat returns false for short file', () {
    // Test with bytes that are too short
    final shortBytes = [0x00, 0xFF, 0x4B, 0x41];
    expect(AffinityDesignerPalette.isValidFormat(shortBytes), isFalse);
  });

  test('toMap produces valid JSON-serializable map', () {
    final file = File('./assets/afpalette/afpalette-test.afpalette');
    final palette = AffinityDesignerPalette.fromBytes(file.readAsBytesSync());

    final map = palette.toMap();
    expect(map, isA<Map<String, dynamic>>());
    expect(map['fileName'], equals('afpalette-test'));
    expect(map['colors'], isA<List<dynamic>>());
    expect((map['colors'] as List).length, equals(5));
  });
}
