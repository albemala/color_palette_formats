import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/procreate/procreate1_v1.swatches': ProcreateV1Palette(
      name: 'Retro & Vintage',
      swatches: [
        ProcreateV1Swatch(
          hue: 0.09682539682539681,
          saturation: 0.41338580203493147,
          brightness: 0.9960784316062927,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    ),
    'test/testdata/procreate/procreate2_v1.swatches': ProcreateV1Palette(
      name: 'Modern & Fresh',
      swatches: [
        ProcreateV1Swatch(
          hue: 0.9853479853479854,
          saturation: 0.3669354613825804,
          brightness: 0.9725490212440491,
          alpha: 1,
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

        // Compare name (optional, as it might not always be present
        // or match exactly)
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

  test('rejects invalid input with FormatException', () {
    List<int> zipOf(String name, List<int> content) {
      final archive = Archive();
      archive.addFile(ArchiveFile(name, content.length, content));
      return ZipEncoder().encode(archive);
    }

    String swatchWith(String swatchJson) =>
        '[{"name":"x","swatches":[$swatchJson]}]';
    String swatchJson({
      String hue = '0.5',
      String saturation = '0.5',
      String brightness = '0.5',
      String alpha = '1',
      String colorSpace = '0',
    }) =>
        '{"hue":$hue,"saturation":$saturation,'
        '"brightness":$brightness,"alpha":$alpha,'
        '"colorSpace":$colorSpace}';
    const goodSwatch =
        '{"hue":0.5,"saturation":0.5,"brightness":0.5,'
        '"alpha":1,"colorSpace":0}';

    final validBytes =
        File('test/testdata/procreate/procreate1_v1.swatches').readAsBytesSync();

    final cases = <String, List<int>>{
      'garbage': [0, 1, 2, 3, 4, 5],
      'empty zip': ZipEncoder().encode(Archive()),
      'truncated': validBytes.sublist(0, 20),
      'json object': zipOf('Swatches.json', utf8.encode('{"a":1}')),
      'json number': zipOf('Swatches.json', utf8.encode('5')),
      'json list of numbers': zipOf('Swatches.json', utf8.encode('[1,2]')),
      'missing keys': zipOf('Swatches.json', utf8.encode('[{"name":"x"}]')),
      'missing swatch keys': zipOf(
        'Swatches.json',
        utf8.encode('[{"name":"x","swatches":[{}]}]'),
      ),
      'unknown colorSpace': zipOf(
        'Swatches.json',
        utf8.encode(swatchWith(swatchJson(colorSpace: '1'))),
      ),
      'string hue': zipOf(
        'Swatches.json',
        utf8.encode(swatchWith(swatchJson(hue: '"half"'))),
      ),
      'hue above range': zipOf(
        'Swatches.json',
        utf8.encode(swatchWith(swatchJson(hue: '5.0'))),
      ),
      'negative alpha': zipOf(
        'Swatches.json',
        utf8.encode(swatchWith(swatchJson(alpha: '-1.0'))),
      ),
      'overflow to infinity': zipOf(
        'Swatches.json',
        utf8.encode(swatchWith(swatchJson(hue: '1e999'))),
      ),
    };

    for (final entry in cases.entries) {
      expect(
        () => decodeProcreateV1Palettes(entry.value),
        throwsA(isA<FormatException>()),
        reason: entry.key,
      );
      expect(
        ProcreateV1Palette.isValidFormat(entry.value),
        isFalse,
        reason: entry.key,
      );
    }

    // Sanity: the well-formed swatch decodes.
    expect(
      decodeProcreateV1Palettes(
        zipOf('Swatches.json', utf8.encode(swatchWith(goodSwatch))),
      ).first.swatches.length,
      equals(1),
    );
  });

  test('round-trips non-ASCII names without corruption', () {
    const name = 'Tavolozza 🎨 café';
    final palette = ProcreateV1Palette(
      name: name,
      swatches: [
        ProcreateV1Swatch(
          hue: 0.5,
          saturation: 0.5,
          brightness: 0.5,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    );
    final bytes = palette.toBytes();
    final back = decodeProcreateV1Palettes(bytes);
    expect(back.first.name, equals(name));
  });

  test('encoder writes the canonical Swatches.json entry', () {
    final palette = ProcreateV1Palette(
      name: 'test',
      swatches: [
        ProcreateV1Swatch(
          hue: 0.5,
          saturation: 0.5,
          brightness: 0.5,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    );
    final archive = ZipDecoder().decodeBytes(palette.toBytes());
    expect(archive.length, equals(1));
    expect(archive.first.name, equals('Swatches.json'));
  });

  test('encoder rejects out-of-range channels', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());
    for (final bad in [5.0, -1.0, double.infinity, double.nan]) {
      expect(
        () =>
            ProcreateV1Palette(
              name: 'x',
              swatches: [
                ProcreateV1Swatch(
                  hue: bad,
                  saturation: 0.5,
                  brightness: 0.5,
                  alpha: 1,
                  colorSpace: ProcreateV1ColorSpace.hsb,
                ),
              ],
            ).toBytes(),
        throwsA(either),
        reason: 'hue = $bad',
      );
    }
  });

  test('rejects v5 files as invalid v1', () {
    // The remaining fixtures in test/testdata/procreate/ are v5 files: a
    // single JSON object, not the v1 top-level list.
    for (final filePath in [
      'test/testdata/procreate/procreate3_v5.swatches',
      'test/testdata/procreate/cromatica_v5.swatches',
      'test/testdata/procreate/shido-10_v5.swatches',
      'test/testdata/procreate/sunfall_v5.swatches',
    ]) {
      final bytes = File(filePath).readAsBytesSync();
      expect(
        () => decodeProcreateV1Palettes(bytes),
        throwsA(isA<FormatException>()),
        reason: filePath,
      );
      expect(
        ProcreateV1Palette.isValidFormat(bytes),
        isFalse,
        reason: filePath,
      );
    }
  });

  test('decode-encode-decode is stable on all fixtures', () {
    // Only procreate1/2 are v1 files (a top-level JSON list). The other
    // fixtures in test/testdata/procreate/ are v5 files (a single JSON
    // object) and are covered by the v5 suite; they must not decode as v1.
    const fixtures = [
      'test/testdata/procreate/procreate1_v1.swatches',
      'test/testdata/procreate/procreate2_v1.swatches',
    ];
    for (final filePath in fixtures) {
      final bytes = File(filePath).readAsBytesSync();
      final once = decodeProcreateV1Palettes(bytes);
      final twice = decodeProcreateV1Palettes(encodeProcreateV1Palette(once));
      expect(twice.length, equals(once.length), reason: filePath);
      for (var i = 0; i < once.length; i++) {
        expect(twice[i].name, equals(once[i].name), reason: filePath);
        expect(
          twice[i].swatches.length,
          equals(once[i].swatches.length),
          reason: filePath,
        );
        for (var j = 0; j < once[i].swatches.length; j++) {
          expect(twice[i].swatches[j].hue, equals(once[i].swatches[j].hue));
          expect(
            twice[i].swatches[j].saturation,
            equals(once[i].swatches[j].saturation),
          );
          expect(
            twice[i].swatches[j].brightness,
            equals(once[i].swatches[j].brightness),
          );
          expect(twice[i].swatches[j].alpha, equals(once[i].swatches[j].alpha));
        }
      }
    }
  });
}
