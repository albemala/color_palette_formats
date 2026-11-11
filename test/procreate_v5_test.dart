import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/procreate/procreate3_v5.swatches': ProcreateV5Palette(
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
          version: ProcreateV5Swatch.defaultVersion,
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
    'test/testdata/procreate/cromatica_v5.swatches': ProcreateV5Palette(
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
          version: ProcreateV5Swatch.defaultVersion,
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
    'test/testdata/procreate/shido-10_v5.swatches': ProcreateV5Palette(
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
          version: ProcreateV5Swatch.defaultVersion,
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
    'test/testdata/procreate/sunfall_v5.swatches': ProcreateV5Palette(
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
          version: ProcreateV5Swatch.defaultVersion,
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

        // Compare name (optional, as it might not always be present
        // or match exactly)
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
        version: ProcreateV5Swatch.defaultVersion,
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
        version: ProcreateV5Swatch.defaultVersion,
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

  group('tolerant decoding (ColorPaletteCodable)', () {
    List<int> zipJson(dynamic jsonObject, {String name = 'Swatches.json'}) {
      final archive = Archive();
      final bytes = utf8.encode(json.encode(jsonObject));
      archive.addFile(ArchiveFile(name, bytes.length, bytes));
      return ZipEncoder().encode(archive);
    }

    test('numeric version and missing optionals fall back to defaults', () {
      final bytes = zipJson({
        'name': 'tolerant',
        'swatches': [
          {'hue': 0.5, 'saturation': 0.5, 'brightness': 0.5, 'version': 5.0},
        ],
      });
      final decoded = ProcreateV5Palette.fromBytes(bytes);
      final swatch = decoded.swatches.first!;
      expect(swatch.version, equals('5.0'));
      expect(swatch.alpha, equals(1.0));
      expect(swatch.origin, equals(0));
      expect(swatch.colorSpace, equals(0));
      expect(swatch.colorModel, equals(0));
      expect(swatch.colorProfile, equals(''));
      expect(swatch.components, equals([0.5, 0.5, 0.5]));
      expect(decoded.colorProfiles, isEmpty);
    });

    test('single-element array palette decodes', () {
      final bytes = zipJson([
        {
          'name': 'tolerant',
          'swatches': [
            {
              'hue': 0.5,
              'saturation': 0.5,
              'brightness': 0.5,
              'version': '5.0',
            },
          ],
        },
      ]);
      expect(ProcreateV5Palette.fromBytes(bytes).name, equals('tolerant'));
    });

    test('lowercase swatches.json entry still decodes', () {
      final bytes = zipJson({
        'name': 'tolerant',
        'swatches': <dynamic>[],
        'colorProfiles': <dynamic>[],
      }, name: 'swatches.json');
      expect(ProcreateV5Palette.fromBytes(bytes).name, equals('tolerant'));
    });

    test('encoder writes Swatches.json entry', () {
      final palette = ProcreateV5Palette(
        name: 'enc',
        swatches: const [],
        colorProfiles: const [],
      );
      final archive = ZipDecoder().decodeBytes(palette.toBytes());
      expect(archive.files.any((f) => f.name == 'Swatches.json'), isTrue);
    });
  });

  group('validation', () {
    List<int> zipSwatch(String swatchJson) {
      final archive = Archive();
      final content = utf8.encode(
        '{"name":"x","swatches":[$swatchJson],"colorProfiles":[]}',
      );
      archive.addFile(ArchiveFile('Swatches.json', content.length, content));
      return ZipEncoder().encode(archive);
    }

    String swatchJson({
      String alpha = '1',
      String brightness = '0.5',
      String saturation = '0.5',
      String hue = '0.5',
      String components = '[0.1,0.2,0.5]',
    }) =>
        '{"alpha":$alpha,"origin":0,"colorSpace":0,"colorModel":0,'
        '"brightness":$brightness,"components":$components,'
        '"colorProfile":"","saturation":$saturation,'
        '"hue":$hue,"version":"5.0"}';

    test('rejects malformed entries with FormatException', () {
      final cases = <String, List<int>>{
        'missing hue': zipSwatch('{"alpha":1}'),
        'components as string': zipSwatch(swatchJson(components: '"nope"')),
        'components with strings': zipSwatch(
          swatchJson(components: '[0.1,"x",0.5]'),
        ),
        'components empty': zipSwatch(swatchJson(components: '[]')),
        'alpha above range': zipSwatch(swatchJson(alpha: '5.0')),
        'negative hue': zipSwatch(swatchJson(hue: '-0.5')),
        'overflow to infinity': zipSwatch(swatchJson(brightness: '1e999')),
      };

      for (final entry in cases.entries) {
        expect(
          () => ProcreateV5Palette.fromBytes(entry.value),
          throwsA(isA<FormatException>()),
          reason: entry.key,
        );
        expect(
          ProcreateV5Palette.isValidFormat(entry.value),
          isFalse,
          reason: entry.key,
        );
      }
    });

    test('encoder rejects out-of-range swatches', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());

      ProcreateV5Swatch swatchWith({
        double alpha = 1,
        double brightness = 0.5,
        double saturation = 0.5,
        double hue = 0.5,
        List<double> components = const [0.1, 0.2, 0.5],
      }) => ProcreateV5Swatch(
        alpha: alpha,
        origin: 0,
        colorSpace: 0,
        colorModel: 0,
        brightness: brightness,
        components: components,
        colorProfile: '',
        saturation: saturation,
        hue: hue,
        version: ProcreateV5Swatch.defaultVersion,
      );

      for (final bad in [5.0, -1.0, double.infinity, double.nan]) {
        expect(
          () =>
              ProcreateV5Palette(
                name: 'x',
                swatches: [swatchWith(alpha: bad)],
                colorProfiles: const [],
              ).toBytes(),
          throwsA(either),
          reason: 'alpha = $bad',
        );
      }
      expect(
        () =>
            ProcreateV5Palette(
              name: 'x',
              swatches: [swatchWith(components: [])],
              colorProfiles: const [],
            ).toBytes(),
        throwsA(either),
        reason: 'empty components',
      );
    });

    test('v1-shaped file decodes with defaults applied', () {
      // A v1 file (top-level JSON list of palettes) is indistinguishable
      // from the tolerated single-element array, so it decodes as v5.
      final bytes =
          File(
            'test/testdata/procreate/procreate1_v1.swatches',
          ).readAsBytesSync();
      final palette = ProcreateV5Palette.fromBytes(bytes);
      expect(palette.name, equals('Retro & Vintage'));
      expect(palette.swatches.length, equals(30));
      expect(palette.colorProfiles, isEmpty);
      final first = palette.swatches.first!;
      expect(first.colorModel, equals(0));
      expect(first.version, equals(ProcreateV5Swatch.defaultVersion));
    });
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final once = ProcreateV5Palette.fromBytes(bytes);
      final twice = ProcreateV5Palette.fromBytes(once.toBytes());
      expect(twice.name, equals(once.name), reason: filePath);
      expect(
        twice.swatches.length,
        equals(once.swatches.length),
        reason: filePath,
      );
      for (var i = 0; i < once.swatches.length; i++) {
        final a = once.swatches[i];
        final b = twice.swatches[i];
        expect(b?.alpha, equals(a?.alpha), reason: filePath);
        expect(b?.components, equals(a?.components), reason: filePath);
        expect(b?.version, equals(a?.version), reason: filePath);
      }
      expect(
        twice.colorProfiles.length,
        equals(once.colorProfiles.length),
        reason: filePath,
      );
    }
  });
}
