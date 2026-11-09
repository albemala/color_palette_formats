import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/acf/acf1_v1.0.acf': AcfPalette(
      version: 'ACF 1.0',
      name: 'Test Palette',
      libraryVersion: '1.0',
      copyright: 'Test',
      description: 'Test palette for unit tests',
      namesFormat: AcfNamesFormat.full,
      rows: 1,
      columns: 3,
      prefix: '',
      suffix: '',
      type: AcfPaletteType.process,
      models: [AcfColorModel.rgb],
      preferredModel: 'RGB',
      colors: [
        AcfPaletteColor(
          name: 'Red',
          values: [
            AcfPaletteColorValue(
              model: AcfColorModel.rgb,
              values: [65535, 0, 0],
            ),
          ],
        ),
      ],
    ),
    'test/testdata/acf/acf2_v2.1.acf': AcfPalette(
      version: 'ACF 2.1',
      name: 'Test HiFi Palette',
      libraryVersion: '2.0',
      copyright: 'Test',
      description: 'Test hifi palette for unit tests',
      namesFormat: AcfNamesFormat.partial,
      rows: 2,
      columns: 1,
      prefix: 'PANTONE',
      suffix: 'C',
      type: AcfPaletteType.mixed,
      models: [AcfColorModel.cmyk, AcfColorModel.rgb],
      preferredModel: 'CMYK',
      inks: ['Orange Ink', 'Green Ink'],
      colors: [
        AcfPaletteColor(
          name: 'Orange 021',
          values: [
            AcfPaletteColorValue(
              model: AcfColorModel.cmyk,
              values: [0, 32896, 65535, 0],
            ),
            AcfPaletteColorValue(
              model: AcfColorModel.rgb,
              values: [65535, 32639, 20560],
            ),
          ],
          type: 'Spot',
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/acf/acf1_v1.0.acf': 3,
    'test/testdata/acf/acf2_v2.1.acf': 2,
  };

  expectedData.forEach((filePath, expectedAcf) {
    group('ACF Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acfFile = File(filePath);
        bytes = acfFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AcfPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final acf = AcfPalette.fromBytes(bytes);

        expect(acf.version, equals(expectedAcf.version));
        expect(acf.name, equals(expectedAcf.name));
        expect(acf.libraryVersion, equals(expectedAcf.libraryVersion));
        expect(acf.copyright, equals(expectedAcf.copyright));
        expect(acf.description, equals(expectedAcf.description));
        expect(acf.namesFormat, equals(expectedAcf.namesFormat));
        expect(acf.rows, equals(expectedAcf.rows));
        expect(acf.columns, equals(expectedAcf.columns));
        expect(acf.prefix, equals(expectedAcf.prefix));
        expect(acf.suffix, equals(expectedAcf.suffix));
        expect(acf.type, equals(expectedAcf.type));
        expect(acf.models, equals(expectedAcf.models));
        expect(acf.preferredModel, equals(expectedAcf.preferredModel));
        expect(acf.inks, equals(expectedAcf.inks));
        expect(acf.colors.length, equals(expectedCounts[filePath]));

        expect(acf.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (acf.colors.isNotEmpty) {
          final firstColor = acf.colors.first;
          final expectedFirstColor = expectedAcf.colors.first;

          expect(firstColor.name, equals(expectedFirstColor.name));
          expect(firstColor.type, equals(expectedFirstColor.type));
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
      });
    });
  });

  test('isValidFormat returns false for invalid AcfPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AcfPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write acf file', () {
    final acf = AcfPalette(
      version: 'ACF 1.0',
      name: 'Test Palette',
      libraryVersion: '1.0',
      copyright: 'Test',
      description: 'Test palette',
      namesFormat: AcfNamesFormat.full,
      rows: 1,
      columns: 2,
      prefix: '',
      suffix: '',
      type: AcfPaletteType.process,
      models: [AcfColorModel.rgb],
      preferredModel: 'RGB',
      colors: [
        AcfPaletteColor(
          name: 'red',
          values: [
            AcfPaletteColorValue(
              model: AcfColorModel.rgb,
              values: [65535, 0, 0],
            ),
          ],
        ),
        AcfPaletteColor(
          name: 'green',
          values: [
            AcfPaletteColorValue(
              model: AcfColorModel.rgb,
              values: [0, 65535, 0],
            ),
          ],
        ),
      ],
    );

    // write to temp file
    final acfFile = File('./test/test.acf');
    acfFile.writeAsBytesSync(acf.toBytes());

    final decodedAcf = AcfPalette.fromBytes(acfFile.readAsBytesSync());

    expect(decodedAcf.version, equals('ACF 1.0'));
    expect(decodedAcf.name, equals('Test Palette'));
    expect(decodedAcf.colors.length, equals(2));

    expect(decodedAcf.colors[0].name, equals('red'));
    expect(decodedAcf.colors[0].values.single.model, AcfColorModel.rgb);
    expect(decodedAcf.colors[0].values.single.values, equals([65535, 0, 0]));

    expect(decodedAcf.colors[1].name, equals('green'));
    expect(decodedAcf.colors[1].values.single.values, equals([0, 65535, 0]));

    // delete temp file
    acfFile.deleteSync();
  });

  test('truncated file throws FormatException and is not valid', () {
    final bytes = File('test/testdata/acf/acf1_v1.0.acf').readAsBytesSync();
    final truncated = bytes.sublist(0, bytes.length ~/ 2);
    expect(AcfPalette.isValidFormat(truncated), isFalse);
    expect(
      () => AcfPalette.fromBytes(truncated),
      throwsA(isA<FormatException>()),
    );
  });

  test('wrong channel count throws FormatException', () {
    // acf1_v1.0.acf uses RGB (3 channels); patch the first color line to
    // carry 2 channels.
    final lines = File(
      'test/testdata/acf/acf1_v1.0.acf',
    ).readAsStringSync().split('\n');
    final dataIndex = lines.indexOf('Data:');
    lines[dataIndex + 1] = '1 2';
    final bytes = lines.join('\n').codeUnits;
    expect(AcfPalette.isValidFormat(bytes), isFalse);
    expect(
      () => AcfPalette.fromBytes(bytes),
      throwsA(isA<FormatException>()),
    );
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = AcfPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
