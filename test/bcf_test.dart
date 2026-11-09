import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/bcf/dic-v10.bcf': BcfPalette(
      version: 'ACF 1.0',
      name: 'DIC COLOR GUIDE',
      libraryVersion: '1.0',
      copyright: '© Test Ink',
      description: 'Process Color Note',
      namesFormat: BcfNamesFormat.partial,
      rows: 5,
      columns: 4,
      prefix: 'DIC ',
      suffix: '',
      type: BcfPaletteType.spot,
      models: [BcfColorModel.xyz, BcfColorModel.cmyk, BcfColorModel.rgb],
      preferredModel: 'RGB',
      colors: [
        BcfPaletteColor(
          name: '100',
          values: [
            BcfPaletteColorValue(
              model: BcfColorModel.xyz,
              values: [1000, 2000, 3000],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.cmyk,
              values: [0, 32896, 65535, 0],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.rgb,
              values: [65535, 32639, 20560],
            ),
          ],
          type: 1,
        ),
      ],
    ),
    'test/testdata/bcf/test-v21.bcf': BcfPalette(
      version: 'ACF 2.1',
      name: 'Test HiFi Palette',
      libraryVersion: '2.0',
      copyright: 'Test',
      description: '${'D'.padRight(512, 'D')} Extended description.',
      namesFormat: BcfNamesFormat.full,
      rows: 2,
      columns: 1,
      prefix: '',
      suffix: '',
      type: BcfPaletteType.process,
      models: [BcfColorModel.lab, BcfColorModel.cmyk, BcfColorModel.rgb],
      preferredModel: 'CMYK',
      inks: [
        BcfHiFiInk(
          angle: '45.00000',
          frequency: '175.00000',
          density: 65535,
          name: 'Orange Ink',
        ),
      ],
      colors: [
        BcfPaletteColor(
          name: 'Orange 021',
          values: [
            BcfPaletteColorValue(
              model: BcfColorModel.lab,
              values: [5000, 2500, -1500],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.cmyk,
              values: [0, 32896, 65535, 0],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.rgb,
              values: [65535, 32639, 20560],
            ),
          ],
          type: 1,
        ),
      ],
    ),
    'test/testdata/bcf/pantone-hex.bcf': BcfPalette(
      version: 'BCF 2.0',
      name: 'PANTONE Hexachrome',
      libraryVersion: '1.0',
      copyright: 'Test',
      description: 'Hexachrome test',
      namesFormat: BcfNamesFormat.partial,
      rows: 1,
      columns: 2,
      prefix: 'PANTONE ',
      suffix: ' HC',
      type: BcfPaletteType.hifi,
      models: [
        BcfColorModel.lab,
        BcfColorModel.cmyk,
        BcfColorModel.rgb,
        BcfColorModel.hifi,
      ],
      preferredModel: 'hifi',
      inks: [
        BcfHiFiInk(
          angle: '0.00000',
          frequency: '175.00000',
          density: 39321,
          name: 'Hexachrome Black',
        ),
      ],
      colors: [
        BcfPaletteColor(
          name: 'Yellow',
          values: [
            BcfPaletteColorValue(
              model: BcfColorModel.lab,
              values: [8900, -200, 9900],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.cmyk,
              values: [0, 0, 65535, 0],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.rgb,
              values: [58000, 52000, 5000],
            ),
            BcfPaletteColorValue(
              model: BcfColorModel.hifi,
              values: [0, 0, 1, 0, 2, 65535, 3, 0, 4, 0, 5, 0],
            ),
          ],
          type: 1,
          preferredModel: 'hifi',
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/bcf/dic-v10.bcf': 3,
    'test/testdata/bcf/test-v21.bcf': 2,
    'test/testdata/bcf/pantone-hex.bcf': 2,
  };

  final expectedInkCounts = {
    'test/testdata/bcf/dic-v10.bcf': 0,
    'test/testdata/bcf/test-v21.bcf': 2,
    'test/testdata/bcf/pantone-hex.bcf': 6,
  };

  expectedData.forEach((filePath, expectedBcf) {
    group('BCF Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final bcfFile = File(filePath);
        bytes = bcfFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(BcfPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final bcf = BcfPalette.fromBytes(bytes);

        expect(bcf.version, equals(expectedBcf.version));
        expect(bcf.name, equals(expectedBcf.name));
        expect(bcf.libraryVersion, equals(expectedBcf.libraryVersion));
        expect(bcf.copyright, equals(expectedBcf.copyright));
        expect(bcf.description, equals(expectedBcf.description));
        expect(bcf.namesFormat, equals(expectedBcf.namesFormat));
        expect(bcf.rows, equals(expectedBcf.rows));
        expect(bcf.columns, equals(expectedBcf.columns));
        expect(bcf.prefix, equals(expectedBcf.prefix));
        expect(bcf.suffix, equals(expectedBcf.suffix));
        expect(bcf.type, equals(expectedBcf.type));
        expect(bcf.models, equals(expectedBcf.models));
        expect(bcf.preferredModel, equals(expectedBcf.preferredModel));
        expect(bcf.inks.length, equals(expectedInkCounts[filePath]));
        expect(bcf.colors.length, equals(expectedCounts[filePath]));

        expect(bcf.colors.isNotEmpty, isTrue, reason: 'No colors');

        if (bcf.colors.isNotEmpty) {
          final firstColor = bcf.colors.first;
          final expectedFirstColor = expectedBcf.colors.first;

          expect(firstColor.name, equals(expectedFirstColor.name));
          expect(firstColor.type, equals(expectedFirstColor.type));
          expect(
            firstColor.preferredModel,
            equals(expectedFirstColor.preferredModel),
          );
          expect(
            firstColor.values.length,
            equals(expectedFirstColor.values.length),
          );
          for (var i = 0; i < firstColor.values.length; i++) {
            expect(
              firstColor.values[i].model,
              equals(expectedFirstColor.values[i].model),
            );
            expect(
              firstColor.values[i].values,
              equals(expectedFirstColor.values[i].values),
            );
          }
        }

        if (bcf.inks.isNotEmpty) {
          final firstInk = bcf.inks.first;
          final expectedFirstInk = expectedBcf.inks.first;

          expect(firstInk.angle, equals(expectedFirstInk.angle));
          expect(firstInk.frequency, equals(expectedFirstInk.frequency));
          expect(firstInk.density, equals(expectedFirstInk.density));
          expect(firstInk.name, equals(expectedFirstInk.name));
        }
      });
    });
  });

  test('keeps signed Lab values without normalizing', () {
    final bcf = BcfPalette.fromBytes(
      File('test/testdata/bcf/test-v21.bcf').readAsBytesSync(),
    );

    expect(bcf.colors[1].name, equals('Greenish'));
    expect(bcf.colors[1].values.first.values, equals([4000, -2000, 1000]));
  });

  test('isValidFormat returns false for invalid BcfPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(BcfPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat distinguishes BCF from ACF text', () {
    final acfBytes = File('test/testdata/acf/acf1_v1.0.acf').readAsBytesSync();
    expect(BcfPalette.isValidFormat(acfBytes), isFalse);
    expect(AcfPalette.isValidFormat(acfBytes), isTrue);

    final bcfBytes = File('test/testdata/bcf/dic-v10.bcf').readAsBytesSync();
    expect(AcfPalette.isValidFormat(bcfBytes), isFalse);
    expect(BcfPalette.isValidFormat(bcfBytes), isTrue);
  });

  test('write bcf file', () {
    final bcf = BcfPalette(
      version: 'ACF 1.0',
      name: 'Test Palette',
      libraryVersion: '1.0',
      copyright: 'Test',
      description: 'Test palette',
      namesFormat: BcfNamesFormat.full,
      rows: 1,
      columns: 2,
      prefix: '',
      suffix: '',
      type: BcfPaletteType.process,
      models: [BcfColorModel.rgb],
      preferredModel: 'RGB',
      colors: [
        BcfPaletteColor(
          name: 'red',
          values: [
            BcfPaletteColorValue(
              model: BcfColorModel.rgb,
              values: [65535, 0, 0],
            ),
          ],
          type: 2,
        ),
        BcfPaletteColor(
          name: 'green',
          values: [
            BcfPaletteColorValue(
              model: BcfColorModel.rgb,
              values: [0, 65535, 0],
            ),
          ],
          type: 2,
        ),
      ],
    );

    // write to temp file
    final bcfFile = File('./test/test.bcf');
    bcfFile.writeAsBytesSync(bcf.toBytes());

    final decodedBcf = BcfPalette.fromBytes(bcfFile.readAsBytesSync());

    expect(decodedBcf.version, equals('ACF 1.0'));
    expect(decodedBcf.name, equals('Test Palette'));
    expect(decodedBcf.colors.length, equals(2));

    expect(decodedBcf.colors[0].name, equals('red'));
    expect(decodedBcf.colors[0].values.single.model, BcfColorModel.rgb);
    expect(decodedBcf.colors[0].values.single.values, equals([65535, 0, 0]));

    expect(decodedBcf.colors[1].name, equals('green'));
    expect(decodedBcf.colors[1].values.single.values, equals([0, 65535, 0]));

    // delete temp file
    bcfFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = BcfPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
