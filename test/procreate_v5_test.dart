import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  // Test cases using the provided V5 assets
  final v5Assets = [
    './assets/procreate/procreate3.swatches',
    './assets/procreate/cromatica.swatches',
    './assets/procreate/shido-10.swatches',
    './assets/procreate/sunfall.swatches',
  ];

  for (final assetPath in v5Assets) {
    test(
      'isValidFormat returns true for valid Procreate V5 file: $assetPath',
      () {
        final procreateFile = File(assetPath);
        final bytes = procreateFile.readAsBytesSync();
        expect(ProcreateV5Palette.isValidFormat(bytes), isTrue);
      },
    );
  }

  test('isValidFormat returns false for invalid Procreate V5 file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ProcreateV5Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('read procreate v5 files', () {
    for (final assetPath in v5Assets) {
      final procreateFile = File(assetPath);
      final procreatePalette = ProcreateV5Palette.fromBytes(
        procreateFile.readAsBytesSync(),
      );
      // print('$assetPath: ${procreatePalette.toJson()}'); // Optional: print decoded data

      // Check palette name
      expect(procreatePalette.name, isNotNull);
      expect(procreatePalette.name, isNotEmpty);

      // Check swatches
      expect(procreatePalette.swatches, isNotNull);
      expect(
        procreatePalette.swatches,
        isNotEmpty,
        reason: 'Swatches list should not be empty for $assetPath',
      );
      for (final swatch in procreatePalette.swatches) {
        // V5 format allows null swatches in the list
        if (swatch != null) {
          expect(swatch.alpha, isNotNull);
          expect(swatch.alpha, greaterThanOrEqualTo(0.0));
          expect(swatch.alpha, lessThanOrEqualTo(1.0));

          expect(swatch.brightness, isNotNull);
          expect(swatch.brightness, greaterThanOrEqualTo(0.0));
          expect(swatch.brightness, lessThanOrEqualTo(1.0));

          expect(swatch.saturation, isNotNull);
          expect(swatch.saturation, greaterThanOrEqualTo(0.0));
          expect(swatch.saturation, lessThanOrEqualTo(1.0));

          expect(swatch.hue, isNotNull);
          expect(swatch.hue, greaterThanOrEqualTo(0.0));
          expect(swatch.hue, lessThanOrEqualTo(1.0));

          expect(swatch.components, isNotNull);
          expect(swatch.components, isNotEmpty);

          expect(swatch.version, isNotNull);
          expect(swatch.colorProfile, isNotNull);
          // Add more specific checks if expected values are known
        }
      }

      // Check color profiles
      expect(procreatePalette.colorProfiles, isNotNull);

      // It's possible for a palette to have no specific profiles,
      // but the list itself should exist.
      // expect(procreatePalette.colorProfiles, isNotEmpty, reason: 'Color Profiles list should not be empty for $assetPath'); // This might fail if some files have no profiles

      for (final profile in procreatePalette.colorProfiles) {
        expect(profile.colorSpace, isNotNull);
        expect(profile.hash, isNotNull);
        expect(profile.hash, isNotEmpty);
        expect(profile.iccData, isNotNull);
        // iccData might be empty, but should exist
        expect(profile.iccName, isNotNull);
        expect(profile.iccName, isNotEmpty);
      }
    }
  });

  test('write procreate v5 file', () async {
    // Example V5 Swatch data (adjust values as needed)
    final exampleSwatches = [
      ProcreateV5Swatch(
        alpha: 1.0,
        origin: 0,
        colorSpace: 0,
        colorModel: 0,
        brightness: 0.8,
        components: [0.5, 0.6, 0.8],
        version: '1.0',
        colorProfile: 'sRGB IEC61966-2.1',
        saturation: 0.6,
        hue: 0.5,
      ),
      ProcreateV5Swatch(
        alpha: 0.9,
        origin: 1,
        colorSpace: 1,
        colorModel: 1,
        brightness: 0.7,
        components: [0.1, 0.9, 0.2],
        version: '1.0',
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
