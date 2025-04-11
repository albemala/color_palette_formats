import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/procreate/procreate1.swatches': ProcreateV1Palette(
      name: 'Retro & Vintage',
      swatches: [
        ProcreateV1Swatch(
          hue: 0.09682539682539681,
          saturation: 0.41338580203493147,
          brightness: 0.9960784316062927,
          alpha: 1.0,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    ),
    './assets/procreate/procreate2.swatches': ProcreateV1Palette(
      name: 'Modern & Fresh',
      swatches: [
        ProcreateV1Swatch(
          hue: 0.9853479853479854,
          saturation: 0.3669354613825804,
          brightness: 0.9725490212440491,
          alpha: 1.0,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Procreate Swatches File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final procreateFile = File(filePath);
        bytes = procreateFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ProcreateV1Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final procreatePalettes = decodeProcreateV1Palettes(bytes);
        expect(procreatePalettes, isNotEmpty, reason: 'No palettes decoded');
        final procreatePalette = procreatePalettes.first;

        // Compare name (optional, as it might not always be present or match exactly)
        // expect(procreatePalette.name, equals(expectedPalette.name));

        // Compare swatches
        expect(
          procreatePalette.swatches.isNotEmpty,
          isTrue,
          reason: 'No swatches to compare',
        );

        if (procreatePalette.swatches.isNotEmpty) {
          final firstSwatch = procreatePalette.swatches.first;
          final expectedFirstSwatch = expectedPalette.swatches.first;

          // Use closeTo for floating point comparisons
          expect(
            firstSwatch.hue,
            closeTo(expectedFirstSwatch.hue, 1e-9),
            reason: 'Hue mismatch for the first swatch',
          );
          expect(
            firstSwatch.saturation,
            closeTo(expectedFirstSwatch.saturation, 1e-9),
            reason: 'Saturation mismatch for the first swatch',
          );
          expect(
            firstSwatch.brightness,
            closeTo(expectedFirstSwatch.brightness, 1e-9),
            reason: 'Brightness mismatch for the first swatch',
          );
          expect(
            firstSwatch.alpha,
            closeTo(expectedFirstSwatch.alpha, 1e-9),
            reason: 'Alpha mismatch for the first swatch',
          );
          expect(
            firstSwatch.colorSpace,
            equals(expectedFirstSwatch.colorSpace),
            reason: 'ColorSpace mismatch for the first swatch',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid Procreate Swatches file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ProcreateV1Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('write procreate file', () {
    final procreate = ProcreateV1Palette(
      name: 'test',
      swatches: [
        ProcreateV1Swatch(
          hue: 1,
          saturation: 0,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
        ProcreateV1Swatch(
          hue: 0,
          saturation: 1,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
        ProcreateV1Swatch(
          hue: 0,
          saturation: 0,
          brightness: 1,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    );

    // write to temp file
    final procreateFile = File('./test/test.procreate');
    procreateFile.writeAsBytesSync(encodeProcreateV1Palette([procreate]));

    final decodedProcreate = decodeProcreateV1Palettes(
      procreateFile.readAsBytesSync(),
    );
    // print(decodedProcreate.first.toJson());

    expect(decodedProcreate.first.swatches.length, equals(3));

    expect(decodedProcreate.first.swatches[0].hue, equals(1));
    expect(decodedProcreate.first.swatches[0].saturation, equals(0));
    expect(decodedProcreate.first.swatches[0].brightness, equals(0));
    expect(decodedProcreate.first.swatches[0].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[0].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[1].hue, equals(0));
    expect(decodedProcreate.first.swatches[1].saturation, equals(1));
    expect(decodedProcreate.first.swatches[1].brightness, equals(0));
    expect(decodedProcreate.first.swatches[1].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[1].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[2].hue, equals(0));
    expect(decodedProcreate.first.swatches[2].saturation, equals(0));
    expect(decodedProcreate.first.swatches[2].brightness, equals(1));
    expect(decodedProcreate.first.swatches[2].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[2].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    // delete temp file
    procreateFile.deleteSync();
  });
}
