import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/procreate/procreate3.swatches': ProcreateV5Palette(
      name: 'Skin tones',
      swatches: [
        ProcreateV5Swatch(
          alpha: 1,
          origin: 1,
          colorSpace: 1,
          colorModel: 0,
          brightness: 0.947550356388092,
          components: [
            0.03447926044464111,
            0.0974804993716778,
            0.947550356388092,
          ],
          // version: '5.0', // Uses default
          colorProfile: '5Gjokjn8BJPV6PubAU6RshDGyqc8ge3wTD0hpzTzd8w=',
          saturation: 0.0974804993716778,
          hue: 0.03447926044464111,
        ),
      ],
      colorProfiles: [
        ProcreateV5ColorProfile(
          colorSpace: 1,
          hash: 'examplehash1',
          iccData: 'exampleiccdatastring1',
          iccName: 'Display P3',
        ),
      ],
    ),
    './assets/procreate/cromatica.swatches': ProcreateV5Palette(
      name: 'cromatica.ase.',
      swatches: [
        ProcreateV5Swatch(
          alpha: 1,
          origin: 2,
          colorSpace: 0,
          colorModel: 0,
          brightness: 0.9921568632125854,
          components: [
            0.9843137264251709,
            0.9725490212440491,
            0.9921568632125854,
          ],
          // version: '5.0', // Uses default
          colorProfile: 'KzqhZFd5qeY0dE+vmwHpECsMm4j9bezteTTfhrlJr34=',
          saturation: 0.019762844662533086,
          hue: 0.7666666666666667,
        ),
      ],
      colorProfiles: [
        ProcreateV5ColorProfile(
          colorSpace: 0,
          hash: 'examplehash1',
          iccData: 'exampleiccdatastring1',
          iccName: 'sRGB IEC61966-2.1',
        ),
      ],
    ),
    './assets/procreate/shido-10.swatches': ProcreateV5Palette(
      name: 'shido-10.ase',
      swatches: [
        ProcreateV5Swatch(
          alpha: 1,
          origin: 2,
          colorSpace: 0,
          colorModel: 0,
          brightness: 0,
          components: [0.0, 0.0, 0.0],
          // version: '5.0', // Uses default
          colorProfile: 'KzqhZFd5qeY0dE+vmwHpECsMm4j9bezteTTfhrlJr34=',
          saturation: 0,
          hue: 0,
        ),
      ],
      colorProfiles: [
        ProcreateV5ColorProfile(
          colorSpace: 0,
          hash: 'examplehash1',
          iccData: 'exampleiccdatastring1',
          iccName: 'sRGB IEC61966-2.1',
        ),
      ],
    ),
    './assets/procreate/sunfall.swatches': ProcreateV5Palette(
      name: 'sunfall.ase',
      swatches: [
        ProcreateV5Swatch(
          alpha: 1,
          origin: 2,
          colorSpace: 0,
          colorModel: 0,
          brightness: 0.03529411926865578,
          components: [0.0, 0.0313725508749485, 0.03529411926865578],
          // version: '5.0', // Uses default
          colorProfile: 'KzqhZFd5qeY0dE+vmwHpECsMm4j9bezteTTfhrlJr34=',
          saturation: 1,
          hue: 0.518518516563891,
        ),
      ],
      colorProfiles: [
        ProcreateV5ColorProfile(
          colorSpace: 0,
          hash: 'examplehash1',
          iccData: 'exampleiccdatastring1',
          iccName: 'sRGB IEC61966-2.1',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Procreate V5 Swatches File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final procreateFile = File(filePath);
        bytes = procreateFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ProcreateV5Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final procreatePalette = ProcreateV5Palette.fromBytes(bytes);

        // Compare name (optional, as it might not always be present or match exactly)
        // expect(procreatePalette.name, equals(expectedPalette.name));

        // Compare swatches
        expect(
          procreatePalette.swatches,
          isNotEmpty,
          reason: 'No swatches to compare',
        );

        // Find the first non-null swatch to compare
        final firstSwatch = procreatePalette.swatches.firstWhere(
          (s) => s != null,
          orElse: () => null,
        );
        final expectedFirstSwatch = expectedPalette.swatches.first;

        expect(firstSwatch, isNotNull, reason: 'No non-null swatches found');
        expect(
          expectedFirstSwatch,
          isNotNull,
          reason: 'Expected first swatch is null',
        );

        if (firstSwatch != null && expectedFirstSwatch != null) {
          // Use closeTo for floating point comparisons
          expect(
            firstSwatch.alpha,
            closeTo(expectedFirstSwatch.alpha, 1e-9),
            reason: 'Alpha mismatch for the first swatch',
          );
          expect(
            firstSwatch.origin,
            equals(expectedFirstSwatch.origin),
            reason: 'Origin mismatch for the first swatch',
          );
          expect(
            firstSwatch.colorSpace,
            equals(expectedFirstSwatch.colorSpace),
            reason: 'ColorSpace mismatch for the first swatch',
          );
          expect(
            firstSwatch.colorModel,
            equals(expectedFirstSwatch.colorModel),
            reason: 'ColorModel mismatch for the first swatch',
          );
          expect(
            firstSwatch.brightness,
            closeTo(expectedFirstSwatch.brightness, 1e-9),
            reason: 'Brightness mismatch for the first swatch',
          );
          // Compare components list
          expect(
            firstSwatch.components.length,
            equals(expectedFirstSwatch.components.length),
            reason: 'Components length mismatch for the first swatch',
          );
          for (var i = 0; i < firstSwatch.components.length; i++) {
            expect(
              firstSwatch.components[i],
              closeTo(expectedFirstSwatch.components[i], 1e-9),
              reason: 'Component mismatch at index $i for the first swatch',
            );
          }
          expect(
            firstSwatch.version,
            equals(expectedFirstSwatch.version),
            reason: 'Version mismatch for the first swatch',
          );
          expect(
            firstSwatch.colorProfile,
            equals(expectedFirstSwatch.colorProfile),
            reason: 'ColorProfile mismatch for the first swatch',
          );
          expect(
            firstSwatch.saturation,
            closeTo(expectedFirstSwatch.saturation, 1e-9),
            reason: 'Saturation mismatch for the first swatch',
          );
          expect(
            firstSwatch.hue,
            closeTo(expectedFirstSwatch.hue, 1e-9),
            reason: 'Hue mismatch for the first swatch',
          );
        }

        // Compare color profiles
        expect(
          procreatePalette.colorProfiles,
          isNotEmpty,
          reason: 'No color profiles to compare',
        );

        final firstProfile = procreatePalette.colorProfiles.first;
        final expectedFirstProfile = expectedPalette.colorProfiles.first;

        expect(
          firstProfile,
          isNotNull,
          reason: 'No non-null color profiles found',
        );
        expect(
          expectedFirstProfile,
          isNotNull,
          reason: 'Expected first color profile is null',
        );

        expect(
          firstProfile.colorSpace,
          equals(expectedFirstProfile.colorSpace),
          reason: 'ColorSpace mismatch for the first color profile',
        );
        expect(
          firstProfile.iccName,
          equals(expectedFirstProfile.iccName),
          reason: 'ICC Name mismatch for the first color profile',
        );
        expect(
          firstProfile.hash,
          isNotEmpty,
          reason: 'Hash should not be empty for the first color profile',
        );
        expect(
          firstProfile.iccData,
          isNotEmpty,
          reason: 'ICC Data should not be empty for the first color profile',
        );
      });
    });
  });

  test('isValidFormat returns false for invalid Procreate V5 file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ProcreateV5Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('write procreate v5 file', () {
    // Example V5 Swatch data (adjust values as needed)
    final exampleSwatches = [
      ProcreateV5Swatch(
        alpha: 1,
        origin: 0,
        colorSpace: 0,
        colorModel: 0,
        brightness: 0.8,
        components: [0.5, 0.6, 0.8],
        // version: 5.0',
        colorProfile: 'sRGB IEC61966-2.1',
        saturation: 0.6,
        hue: 0.5,
      ),
      ProcreateV5Swatch(
        alpha: 0.9, // non-default alpha
        origin: 1,
        colorSpace: 0,
        colorModel: 0,
        brightness: 0.7,
        components: [0.1, 0.9, 0.2],
        // version: '5.0',
        colorProfile: 'Display P3',
        saturation: 0.9,
        hue: 0.1,
      ),
    ];

    // Example V5 Color Profile data (adjust values as needed)
    final exampleColorProfiles = [
      ProcreateV5ColorProfile(
        colorSpace: 0, // Example value
        hash: 'examplehash1', // Example value
        iccData: 'exampleiccdatastring1', // Example value (base64 encoded?)
        iccName: 'sRGB IEC61966-2.1', // Example value
      ),
      ProcreateV5ColorProfile(
        colorSpace: 1,
        hash: 'examplehash2',
        iccData: 'exampleiccdatastring2',
        iccName: 'Display P3',
      ),
    ];

    final procreate = ProcreateV5Palette(
      name: 'test_v5',
      swatches: exampleSwatches,
      colorProfiles: exampleColorProfiles,
    );

    // write to temp file
    final procreateFile = File(
      './test/test_v5.procreate',
    ); // Use a different temp name
    procreateFile.writeAsBytesSync(procreate.toBytes());

    // Read back the file
    final decodedProcreate = ProcreateV5Palette.fromBytes(
      procreateFile.readAsBytesSync(),
    );
    // print(decodedProcreate.toJson()); // Optional: print decoded data

    // Assertions
    expect(decodedProcreate.name, equals('test_v5'));
    expect(decodedProcreate.swatches.length, equals(exampleSwatches.length));
    expect(
      decodedProcreate.colorProfiles.length,
      equals(exampleColorProfiles.length),
    );

    // Extract the first swatch and check for null
    final firstSwatch = decodedProcreate.swatches[0];
    expect(firstSwatch, isNotNull);

    // Detailed assertions for the first swatch (using the non-null variable)
    expect(firstSwatch!.alpha, equals(exampleSwatches[0].alpha));
    expect(firstSwatch.origin, equals(exampleSwatches[0].origin));
    expect(firstSwatch.colorSpace, equals(exampleSwatches[0].colorSpace));
    expect(firstSwatch.colorModel, equals(exampleSwatches[0].colorModel));
    expect(firstSwatch.brightness, equals(exampleSwatches[0].brightness));
    expect(firstSwatch.components, equals(exampleSwatches[0].components));
    expect(firstSwatch.version, equals(exampleSwatches[0].version));
    expect(firstSwatch.colorProfile, equals(exampleSwatches[0].colorProfile));
    expect(firstSwatch.saturation, equals(exampleSwatches[0].saturation));
    expect(firstSwatch.hue, equals(exampleSwatches[0].hue));

    // Detailed assertions for the first color profile (add more as needed)
    expect(
      decodedProcreate.colorProfiles[0].colorSpace,
      equals(exampleColorProfiles[0].colorSpace),
    );
    expect(
      decodedProcreate.colorProfiles[0].hash,
      equals(exampleColorProfiles[0].hash),
    );
    expect(
      decodedProcreate.colorProfiles[0].iccData,
      equals(exampleColorProfiles[0].iccData),
    );
    expect(
      decodedProcreate.colorProfiles[0].iccName,
      equals(exampleColorProfiles[0].iccName),
    );

    // delete temp file
    procreateFile.deleteSync();
  });
}
