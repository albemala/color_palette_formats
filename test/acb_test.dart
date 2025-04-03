import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid ACB file', () {
    final acbFile = File('./assets/acb/acb1_v1.acb');
    final bytes = acbFile.readAsBytesSync();
    expect(AdobeColorBook.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid ACB file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeColorBook.isValidFormat(invalidBytes), isFalse);
  });

  test('read acb file', () {
    final acbFile1 = File('./assets/acb/acb1_v1.acb');
    final acb1 = AdobeColorBook.fromBytes(acbFile1.readAsBytesSync());
    // print(acb1.toJson());
    expect(acb1.colors.length, equals(300));
  });

  /*
test('write acb file', () async {
    final acb = AdobeColorSwatch(
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
