import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid ASE file', () {
    final aseFile = File('./assets/ase/ase1_v1.0.ase');
    final bytes = aseFile.readAsBytesSync();
    expect(AdobeSwatchExchange.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid ASE file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeSwatchExchange.isValidFormat(invalidBytes), isFalse);
  });

  test('read ase1_v1.0.ase file', () {
    const filePath = './assets/ase/ase1_v1.0.ase';
    final bytes = File(filePath).readAsBytesSync();
    final ase = AdobeSwatchExchange.fromBytes(bytes);

    expect(ase.groups.length, equals(0));
    expect(ase.colors.length, equals(122));
  });

  test('read ase2_v1.0.ase file', () {
    const filePath = './assets/ase/ase2_v1.0.ase';
    final bytes = File(filePath).readAsBytesSync();
    final ase = AdobeSwatchExchange.fromBytes(bytes);

    expect(ase.groups.length, equals(0));
    expect(ase.colors.length, equals(6));
  });

  test('read blue.ase file', () {
    const filePath = './assets/ase/blue.ase';
    final bytes = File(filePath).readAsBytesSync();
    final ase = AdobeSwatchExchange.fromBytes(bytes);

    expect(ase.groups.length, equals(0));
    expect(ase.colors.length, equals(16));
  });

  test('write ase file', () async {
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
