import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/acbl/ACBL.acbl': AdobeColorBookLegacy(
      version: 1,
      bookId: 3002,
      prefixPostfixPairs: [
        AdobeColorBookLegacyPrefixPostfix(
          prefix: 'PANTONE ',
          postfix: ' C',
          id: null,
        ),
        AdobeColorBookLegacyPrefixPostfix(
          prefix: 'PANTONE ',
          postfix: ' CVC',
          id: 'LegacyCVC',
        ),
      ],
      formats: [
        AdobeColorBookLegacyFormat(
          colorSpace: 'CMYK',
          encoding: 'Float',
          channels: 4,
          id: '0',
        ),
      ],
      colors: [
        AdobeColorBookLegacyColor(
          name: 'Yellow',
          values: [0.0, 0.01, 1.0, 0.0],
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedAcbl) {
    group('ACBL File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acblFile = File(filePath);
        bytes = acblFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorBookLegacy.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final acbl = AdobeColorBookLegacy.fromBytes(bytes);

        // Compare top-level properties
        expect(
          acbl.version,
          equals(expectedAcbl.version),
          reason: 'Version mismatch',
        );
        expect(
          acbl.bookId,
          equals(expectedAcbl.bookId),
          reason: 'Book ID mismatch',
        );

        // Compare prefix/postfix pairs
        expect(
          acbl.prefixPostfixPairs.length,
          equals(expectedAcbl.prefixPostfixPairs.length),
          reason: 'Prefix/Postfix pair count mismatch',
        );
        for (var i = 0; i < acbl.prefixPostfixPairs.length; i++) {
          expect(
            acbl.prefixPostfixPairs[i].prefix,
            equals(expectedAcbl.prefixPostfixPairs[i].prefix),
            reason: 'Prefix mismatch at index $i',
          );
          expect(
            acbl.prefixPostfixPairs[i].postfix,
            equals(expectedAcbl.prefixPostfixPairs[i].postfix),
            reason: 'Postfix mismatch at index $i',
          );
          expect(
            acbl.prefixPostfixPairs[i].id,
            equals(expectedAcbl.prefixPostfixPairs[i].id),
            reason: 'ID mismatch in Prefix/Postfix pair at index $i',
          );
        }

        // Compare formats
        expect(
          acbl.formats.length,
          equals(expectedAcbl.formats.length),
          reason: 'Format count mismatch',
        );
        for (var i = 0; i < acbl.formats.length; i++) {
          expect(
            acbl.formats[i].colorSpace,
            equals(expectedAcbl.formats[i].colorSpace),
            reason: 'ColorSpace mismatch in Format at index $i',
          );
          expect(
            acbl.formats[i].encoding,
            equals(expectedAcbl.formats[i].encoding),
            reason: 'Encoding mismatch in Format at index $i',
          );
          expect(
            acbl.formats[i].channels,
            equals(expectedAcbl.formats[i].channels),
            reason: 'Channels mismatch in Format at index $i',
          );
          expect(
            acbl.formats[i].id,
            equals(expectedAcbl.formats[i].id),
            reason: 'ID mismatch in Format at index $i',
          );
        }

        // Compare colors
        expect(acbl.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (acbl.colors.isNotEmpty) {
          final firstColor = acbl.colors.first;
          final expectedFirstColor = expectedAcbl.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Color name mismatch for the first color',
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

  test('isValidFormat returns false for invalid ACBL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeColorBookLegacy.isValidFormat(invalidBytes), isFalse);
  });

  test('write acbl file', () {
    final acbl = AdobeColorBookLegacy(
      version: 1,
      bookId: 1234,
      prefixPostfixPairs: [
        AdobeColorBookLegacyPrefixPostfix(prefix: 'TEST ', postfix: ' X'),
      ],
      formats: [
        AdobeColorBookLegacyFormat(
          colorSpace: 'CMYK',
          encoding: 'Float',
          channels: 4,
          id: '0',
        ),
      ],
      colors: [
        AdobeColorBookLegacyColor(
          name: 'Test Color 1',
          values: [0.5, 0.4, 0.3, 0.2],
        ),
        AdobeColorBookLegacyColor(
          name: 'Test Color 2',
          values: [0.1, 0.2, 0.3, 0.4],
        ),
      ],
    );

    // Write to temp file
    final acblFile = File('./test/test.acbl');
    acblFile.writeAsBytesSync(acbl.toBytes());

    // Read back and verify
    final decodedAcbl = AdobeColorBookLegacy.fromBytes(
      acblFile.readAsBytesSync(),
    );

    expect(decodedAcbl.version, equals(acbl.version));
    expect(decodedAcbl.bookId, equals(acbl.bookId));

    expect(decodedAcbl.prefixPostfixPairs.length, equals(1));
    expect(decodedAcbl.prefixPostfixPairs[0].prefix, equals('TEST '));
    expect(decodedAcbl.prefixPostfixPairs[0].postfix, equals(' X'));

    expect(decodedAcbl.formats.length, equals(1));
    expect(decodedAcbl.formats[0].colorSpace, equals('CMYK'));

    expect(decodedAcbl.colors.length, equals(2));
    expect(decodedAcbl.colors[0].name, equals('Test Color 1'));
    expect(
      listEquals(decodedAcbl.colors[0].values, [0.5, 0.4, 0.3, 0.2]),
      isTrue,
    );

    // Delete temp file
    acblFile.deleteSync();
  });
}
