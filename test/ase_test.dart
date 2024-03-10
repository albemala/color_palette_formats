import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read ase file', () {
    final aseFile1 = File('./assets/ase1_v1.0.ase');
    final ase1 = decodeAdobeSwatchExchange(aseFile1);
    // print(ase1.toJson());

    expect(ase1.version, equals(supportedAdobeSwatchExchangeVersion));
    expect(ase1.groups.length, equals(0));
    expect(ase1.colors.length, equals(122));

    final aseFile2 = File('./assets/ase2_v1.0.ase');
    final ase2 = decodeAdobeSwatchExchange(aseFile2);
    // print(ase2.toJson());

    expect(ase2.version, equals(supportedAdobeSwatchExchangeVersion));
    expect(ase2.groups.length, equals(0));
    expect(ase2.colors.length, equals(6));
  });

  test('write ase file', () async {
    final ase = AdobeSwatchExchange(
      version: supportedAdobeSwatchExchangeVersion,
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
    encodeAdobeSwatchExchange(ase, aseFile);

    final decodedAse = decodeAdobeSwatchExchange(aseFile);
    // print(decodedAse.toJson());

    expect(decodedAse.version, equals(supportedAdobeSwatchExchangeVersion));

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
