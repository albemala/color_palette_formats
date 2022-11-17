import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read acb file', () {
    final acbFile1 = File('./assets/acb1_v1.acb');
    final acb1 = decodeAdobeColorBook(acbFile1);
    // print(acb1.toJson());

    expect(acb1.version, equals(supportedAdobeColorBookVersion));
    expect(acb1.colors.length, equals(300));
  });

/*
test('write acb file', () async {
    const acb = AdobeColorSwatch(
      version: supportedAdobeColorSwatchVersion,
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [64, 128, 255],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.hsb,
          values: [300, 50, 50],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.cmyk,
          values: [10, 20, 30, 40],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.grayscale,
          values: [0.5],
        ),
      ],
    );

    // write to temp file
    final acbFile = File('./test/test.acb');
    encodeAdobeColorSwatch(acb, acbFile);

    final decodedAcb = decodeAdobeColorSwatch(acbFile);
    // print(decodedAcb.toJson());

    expect(decodedAcb.version, equals(supportedAdobeColorSwatchVersion));
    expect(decodedAcb.colors.length, equals(4));

    // delete temp file
    acbFile.deleteSync();
  });
*/
}
