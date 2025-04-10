import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/acb/acb1_v1.acb': AdobeColorBook(
      identifier: 3000,
      title: r'$$$/colorbook/ANPA/title=ANPA Color',
      description: r'$$$/colorbook/ANPA/description=',
      colorNamePrefix: r'$$$/colorbook/ANPA/prefix=ANPA ',
      colorNameSuffix: r'$$$/colorbook/ANPA/postfix= AdPro',
      colorCount: 300,
      pageSize: 6,
      pageSelectorOffset: 5,
      colorSpace: AdobeColorBookColorSpace.lab,
      // Define only the expected *first* color for detailed checking.
      colors: [
        AdobeColorBookColor(name: '71-1', code: ' 71-1D', values: [98, -5, -5]),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedAcb) {
    group('ACB File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acbFile = File(filePath);
        bytes = acbFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorBook.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final acb = AdobeColorBook.fromBytes(bytes);

        // Compare top-level properties
        expect(
          acb.identifier,
          equals(expectedAcb.identifier),
          reason: 'Identifier mismatch',
        );
        expect(acb.title, equals(expectedAcb.title), reason: 'Title mismatch');
        expect(
          acb.description,
          equals(expectedAcb.description),
          reason: 'Description mismatch',
        );
        expect(
          acb.colorNamePrefix,
          equals(expectedAcb.colorNamePrefix),
          reason: 'Prefix mismatch',
        );
        expect(
          acb.colorNameSuffix,
          equals(expectedAcb.colorNameSuffix),
          reason: 'Suffix mismatch',
        );
        expect(
          acb.colorCount,
          equals(expectedAcb.colorCount),
          reason: 'Color count mismatch',
        );
        expect(
          acb.pageSize,
          equals(expectedAcb.pageSize),
          reason: 'Page size mismatch',
        );
        expect(
          acb.pageSelectorOffset,
          equals(expectedAcb.pageSelectorOffset),
          reason: 'Page selector offset mismatch',
        );
        expect(
          acb.colorSpace,
          equals(expectedAcb.colorSpace),
          reason: 'Color space mismatch',
        );

        // Check if the number of parsed colors matches the count in the header
        expect(
          acb.colors.length,
          equals(acb.colorCount),
          reason: 'Parsed color list length does not match colorCount field',
        );

        // Check if the expected data contains at least one color to check
        expect(
          expectedAcb.colors,
          isNotEmpty,
          reason: 'Expected data should contain at least the first color.',
        );

        // Compare only the first color against the first color defined in expectedData
        if (acb.colors.isNotEmpty && expectedAcb.colors.isNotEmpty) {
          final actualFirstColor = acb.colors.first;
          final expectedFirstColor = expectedAcb.colors.first;

          expect(
            actualFirstColor.name,
            equals(expectedFirstColor.name),
            reason: 'First color name mismatch',
          );
          expect(
            actualFirstColor.code,
            equals(expectedFirstColor.code),
            reason: 'First color code mismatch',
          );
          expect(
            actualFirstColor.values,
            equals(expectedFirstColor.values),
            reason: 'First color values mismatch',
          );
        } else if (acb.colors.isEmpty) {
          fail('Actual color list is empty, cannot check the first color.');
        }
      });
    });
  });

  test('isValidFormat returns false for invalid ACB file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeColorBook.isValidFormat(invalidBytes), isFalse);
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
