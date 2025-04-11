import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/aco/aco1_v1.aco': AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [124, 124, 124],
        ),
      ],
    ),
    './assets/aco/aco2_v1.aco': AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [255, 255, 255],
        ),
      ],
    ),
    './assets/aco/NES.aco': AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [124, 124, 124],
        ),
      ],
    ),
    './assets/aco/VisiBone2.aco': AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [255, 255, 255],
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedAco) {
    group('ACO File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acoFile = File(filePath);
        bytes = acoFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorSwatch.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final aco = AdobeColorSwatch.fromBytes(bytes);

        // Compare colors
        expect(aco.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (aco.colors.isNotEmpty) {
          final firstColor = aco.colors.first;
          final expectedFirstColor = expectedAco.colors.first;

          expect(
            firstColor.colorSpace,
            equals(expectedFirstColor.colorSpace),
            reason: 'Color space mismatch for the first color',
          );
          expect(
            listEquals(firstColor.values, expectedFirstColor.values),
            isTrue,
            reason: 'Color values mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid ACO file', () {
    final invalidBytes = [1, 1, 1, 1, 1, 1]; // Example invalid data
    expect(AdobeColorSwatch.isValidFormat(invalidBytes), isFalse);
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
