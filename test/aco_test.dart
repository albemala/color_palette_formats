import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid ACO file', () {
    final acoFile = File('./assets/aco/aco1_v1.aco');
    final bytes = acoFile.readAsBytesSync();
    expect(AdobeColorSwatch.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid ACO file', () {
    final invalidBytes = [1, 1, 1, 1, 1, 1]; // Example invalid data
    expect(AdobeColorSwatch.isValidFormat(invalidBytes), isFalse);
  });

  test('read aco file', () {
    final acoFile1 = File('./assets/aco/aco1_v1.aco');
    final aco1 = AdobeColorSwatch.fromBytes(acoFile1.readAsBytesSync());
    // print(aco1.toJson());

    expect(aco1.colors.length, equals(52));

    final acoFile2 = File('./assets/aco/aco2_v1.aco');
    final aco2 = AdobeColorSwatch.fromBytes(acoFile2.readAsBytesSync());
    // print(aco2.toJson());

    expect(aco2.colors.length, equals(256));
  });

  test('write aco file', () async {
    final aco = AdobeColorSwatch(
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
          values: [128],
        ),
      ],
    );

    // write to temp file
    final acoFile = File('./test/test.aco');
    acoFile.writeAsBytesSync(aco.toBytes());

    final decodedAco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
    // print(decodedAco.toJson());

    expect(decodedAco.colors.length, equals(4));
    for (var i = 0; i < decodedAco.colors.length; i++) {
      expect(decodedAco.colors[i].colorSpace, equals(aco.colors[i].colorSpace));
      expect(
        listEquals(decodedAco.colors[i].values, aco.colors[i].values),
        true,
      );
    }

    // delete temp file
    acoFile.deleteSync();
  });
}
