import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Full color counts verified against the raw block structure; ase1 also
  // covers the Gray and CMYK model paths, NNN Palette covers zero-length
  // (terminator-less) names.
  final expectedCounts = {
    'test/testdata/ase/ase1_v1.0.ase': 122,
    'test/testdata/ase/ase2_v1.0.ase': 6,
    'test/testdata/ase/cromatica.ase': 10,
    'test/testdata/ase/shido-10.ase': 10,
    'test/testdata/ase/sunfall.ase': 10,
    'test/testdata/ase/blue.ase': 16,
    'test/testdata/ase/NNN Palette.ase': 64,
  };

  final expectedData = {
    'test/testdata/ase/ase1_v1.0.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'RGB Red',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1.0, 0.0, 0.0],
        ),
      ],
    ),
    'test/testdata/ase/ase2_v1.0.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'Color 1',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.2800000011920929, 0.1599999964237213, 0.18000000715255737],
        ),
      ],
    ),
    'test/testdata/ase/cromatica.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'fbf8fd',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.9843137264251709, 0.9725490212440491, 0.9921568632125854],
        ),
      ],
    ),
    'test/testdata/ase/shido-10.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: '000000',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.0, 0.0, 0.0],
        ),
      ],
    ),
    'test/testdata/ase/sunfall.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: '000809',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.0, 0.0313725508749485, 0.03529411926865578],
        ),
      ],
    ),
    'test/testdata/ase/blue.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'White',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1.0, 1.0, 1.0],
        ),
      ],
    ),
    'test/testdata/ase/NNN Palette.ase': AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: '',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [0.9019607901573181, 0.8509804010391235, 0.9803921580314636],
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

  test('decodes every color block in each fixture', () {
    expectedCounts.forEach((filePath, expectedCount) {
      final bytes = File(filePath).readAsBytesSync();
      final ase = AdobeSwatchExchange.fromBytes(bytes);
      expect(ase.colors.length, equals(expectedCount), reason: filePath);
    });
  });

  test('decodes gray and cmyk models', () {
    final bytes = File('test/testdata/ase/ase1_v1.0.ase').readAsBytesSync();
    final ase = AdobeSwatchExchange.fromBytes(bytes);
    final models = ase.colors.map((c) => c.model).toSet();
    expect(
      models,
      containsAll([
        AdobeSwatchExchangeColorModel.rgb,
        AdobeSwatchExchangeColorModel.gray,
        AdobeSwatchExchangeColorModel.cmyk,
      ]),
    );
    final gray = ase.colors.firstWhere(
      (c) => c.model == AdobeSwatchExchangeColorModel.gray,
    );
    expect(gray.values.length, equals(1));
    final cmyk = ase.colors.firstWhere(
      (c) => c.model == AdobeSwatchExchangeColorModel.cmyk,
    );
    expect(cmyk.values.length, equals(4));
  });

  test('decodes zero-length names as empty', () {
    final bytes = File('test/testdata/ase/NNN Palette.ase').readAsBytesSync();
    final ase = AdobeSwatchExchange.fromBytes(bytes);
    expect(ase.colors.length, equals(64));
    expect(ase.colors.every((c) => c.name.isEmpty), isTrue);
  });

  test('lab colors round-trip with spec ranges', () {
    // Stored LAB: L is a fraction of 100, a/b are raw (-128..127).
    final ase = AdobeSwatchExchange(
      colors: [
        AdobeSwatchExchangeColor(
          name: 'lab',
          model: AdobeSwatchExchangeColorModel.lab,
          values: [0.5, -20.0, 30.0],
        ),
      ],
    );

    final decoded = AdobeSwatchExchange.fromBytes(ase.toBytes());
    expect(decoded.colors.length, equals(1));
    expect(decoded.colors[0].name, equals('lab'));
    expect(decoded.colors[0].values[0], closeTo(0.5, 1e-6));
    expect(decoded.colors[0].values[1], closeTo(-20.0, 1e-4));
    expect(decoded.colors[0].values[2], closeTo(30.0, 1e-4));
  });

  test('unsupported version throws UnsupportedError and is not valid', () {
    final bytes = File('test/testdata/ase/blue.ase').readAsBytesSync().toList();
    // Bump the minor version 1.0 -> 1.1.
    bytes[7] = 1;
    expect(AdobeSwatchExchange.isValidFormat(bytes), isFalse);
    expect(
      () => AdobeSwatchExchange.fromBytes(bytes),
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('truncated file throws FormatException and is not valid', () {
    final bytes = File('test/testdata/ase/ase1_v1.0.ase').readAsBytesSync();
    for (final truncated in [
      bytes.sublist(0, 6),
      bytes.sublist(0, 12),
      bytes.sublist(0, bytes.length ~/ 2),
      bytes.sublist(0, bytes.length - 4),
    ]) {
      expect(AdobeSwatchExchange.isValidFormat(truncated), isFalse);
      expect(
        () => AdobeSwatchExchange.fromBytes(truncated),
        throwsA(isA<FormatException>()),
      );
    }
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
        AdobeSwatchExchangeColor(
          name: 'lab color',
          model: AdobeSwatchExchangeColorModel.lab,
          values: [0.5, 0.25, 0.75],
        ),
      ],
    );

    // write to temp file
    final aseFile = File('./test/test.ase');
    aseFile.writeAsBytesSync(ase.toBytes());

    final decodedAse = AdobeSwatchExchange.fromBytes(aseFile.readAsBytesSync());
    // print(decodedAse.toJson());

    expect(decodedAse.groups.length, equals(0));

    expect(decodedAse.colors.length, equals(4));

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

    expect(decodedAse.colors[3].name, equals('lab color'));
    expect(
      decodedAse.colors[3].model,
      equals(AdobeSwatchExchangeColorModel.lab),
    );
    expect(decodedAse.colors[3].values, equals([0.5, 0.25, 0.75]));
    expect(
      decodedAse.colors[3].type,
      equals(AdobeSwatchExchangeColorType.global),
    );

    // delete temp file
    aseFile.deleteSync();
  });
}
