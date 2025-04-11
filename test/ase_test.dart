import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/ase/ase1_v1.0.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'RGB Red',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1.0, 0.0, 0.0],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
    './assets/ase/ase2_v1.0.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'Color 1',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.2800000011920929, 0.1599999964237213, 0.18000000715255737],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
    './assets/ase/cromatica.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'fbf8fd',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.9843137264251709, 0.9725490212440491, 0.9921568632125854],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
    './assets/ase/shido-10.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: '000000',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.0, 0.0, 0.0],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
    './assets/ase/sunfall.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: '000809',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.0, 0.0313725508749485, 0.03529411926865578],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
    './assets/ase/blue.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'White',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1.0, 1.0, 1.0],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedAse) {
    group('ASE File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final aseFile = File(filePath);
        bytes = aseFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeSwatchExchange.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final ase = AdobeSwatchExchange.fromBytes(bytes);

        // Compare colors
        expect(ase.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (ase.colors.isNotEmpty) {
          final firstColor = ase.colors.first;
          final expectedFirstColor = expectedAse.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.model,
            equals(expectedFirstColor.model),
            reason: 'Model mismatch for the first color',
          );
          // Use closeTo for floating point comparisons
          expect(
            firstColor.values.length,
            equals(expectedFirstColor.values.length),
            reason: 'Values length mismatch for the first color',
          );
          for (var i = 0; i < firstColor.values.length; i++) {
            expect(
              firstColor.values[i],
              closeTo(expectedFirstColor.values[i], 1e-9),
              reason: 'Value mismatch at index $i for the first color',
            );
          }
          expect(
            firstColor.type,
            equals(expectedFirstColor.type),
            reason: 'Type mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid ASE file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeSwatchExchange.isValidFormat(invalidBytes), isFalse);
  });

  test('write ase file', () {
    final ase = AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'red',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1, 0, 0],
        ),
        AdobeSwatchExchangeColor(
          name: 'cyan',
          model: AdobeSwatchExchangeColorModel.cmyk,
          values: [1, 0, 0, 0],
        ),
        AdobeSwatchExchangeColor(
          name: 'gray',
          model: AdobeSwatchExchangeColorModel.gray,
          values: [0.5],
        ),
      ],
    );

    // write to temp file
    final aseFile = File('./test/test.ase');
    aseFile.writeAsBytesSync(ase.toBytes());

    final decodedAse = AdobeSwatchExchange.fromBytes(aseFile.readAsBytesSync());
    // print(decodedAse.toJson());

    expect(decodedAse.groups.length, equals(0));

    expect(decodedAse.colors.length, equals(3));

    expect(decodedAse.colors[0].name, equals('red'));
    expect(
      decodedAse.colors[0].model,
      equals(AdobeSwatchExchangeColorModel.rgb),
    );
    expect(decodedAse.colors[0].values, equals([1, 0, 0]));
    expect(
      decodedAse.colors[0].type,
      equals(AdobeSwatchExchangeColorType.global),
    );

    expect(decodedAse.colors[1].name, equals('cyan'));
    expect(
      decodedAse.colors[1].model,
      equals(AdobeSwatchExchangeColorModel.cmyk),
    );
    expect(decodedAse.colors[1].values, equals([1, 0, 0, 0]));
    expect(
      decodedAse.colors[1].type,
      equals(AdobeSwatchExchangeColorType.global),
    );

    expect(decodedAse.colors[2].name, equals('gray'));
    expect(
      decodedAse.colors[2].model,
      equals(AdobeSwatchExchangeColorModel.gray),
    );
    expect(decodedAse.colors[2].values, equals([0.5]));
    expect(
      decodedAse.colors[2].type,
      equals(AdobeSwatchExchangeColorType.global),
    );

    // delete temp file
    aseFile.deleteSync();
  });
}
