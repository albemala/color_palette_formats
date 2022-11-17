import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read ase file', () {
    final aseFile1 = File('./assets/ase1.ase');
    final ase1 = decodeAdobeSwatchExchange(aseFile1);
    // print(ase1.toJson());

    expect(ase1.version, equals(supportedAdobeSwatchExchangeVersion));
    expect(ase1.groups.length, equals(0));
    expect(ase1.colors.length, equals(122));

    final aseFile2 = File('./assets/ase2.ase');
    final ase2 = decodeAdobeSwatchExchange(aseFile2);
    // print(ase2.toJson());

    expect(ase2.version, equals(supportedAdobeSwatchExchangeVersion));
    expect(ase2.groups.length, equals(0));
    expect(ase2.colors.length, equals(6));
  });

  test('write ase file', () async {
    const ase = AdobeSwatchExchange(
      version: supportedAdobeSwatchExchangeVersion,
      groups: [],
      colors: [
        AdobeSwatchExchangeColor(
          name: 'red',
          model: AdobeSwatchExchangeColorModel.rgb,
          values: [1, 0, 0],
          type: AdobeSwatchExchangeColorType.global,
        ),
        AdobeSwatchExchangeColor(
          name: 'cyan',
          model: AdobeSwatchExchangeColorModel.cmyk,
          values: [1, 0, 0, 0],
          type: AdobeSwatchExchangeColorType.global,
        ),
        AdobeSwatchExchangeColor(
          name: 'gray',
          model: AdobeSwatchExchangeColorModel.gray,
          values: [0.5],
          type: AdobeSwatchExchangeColorType.global,
        ),
      ],
    );

    // write to temp file
    final aseFile = File('./test/test.ase');
    encodeAdobeSwatchExchange(ase, aseFile);

    final decodedAse = decodeAdobeSwatchExchange(aseFile);
    // print(decodedAse.toJson());

    expect(decodedAse.version, equals(supportedAdobeSwatchExchangeVersion));
    expect(decodedAse.groups.length, equals(0));
    expect(decodedAse.colors.length, equals(3));

    // delete temp file
    aseFile.deleteSync();
  });
}
