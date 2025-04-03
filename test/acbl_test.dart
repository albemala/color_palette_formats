import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid ACBL file', () {
    final acblFile = File('./assets/acbl/ACBL.acbl');
    final bytes = acblFile.readAsBytesSync();
    expect(AdobeColorBookLegacy.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid ACBL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeColorBookLegacy.isValidFormat(invalidBytes), isFalse);
  });

  test('read acbl file', () {
    final acblFile = File('./assets/acbl/ACBL.acbl');
    final acbl = AdobeColorBookLegacy.fromBytes(acblFile.readAsBytesSync());

    expect(acbl.version, equals(1));
    expect(acbl.bookId, equals(3002));

    // Test prefix/postfix pairs
    expect(acbl.prefixPostfixPairs.length, equals(2));
    expect(acbl.prefixPostfixPairs[0].prefix, equals('PANTONE '));
    expect(acbl.prefixPostfixPairs[0].postfix, equals(' C'));
    expect(acbl.prefixPostfixPairs[1].id, equals('LegacyCVC'));

    // Test formats
    expect(acbl.formats.length, equals(1));
    expect(acbl.formats[0].colorSpace, equals('CMYK'));
    expect(acbl.formats[0].encoding, equals('Float'));
    expect(acbl.formats[0].channels, equals(4));

    // Test colors
    expect(acbl.colors.length, equals(11));

    // Test specific color values
    expect(acbl.colors[0].name, equals('Yellow'));
    expect(listEquals(acbl.colors[0].values, [0, 0.01, 1, 0]), isTrue);

    expect(acbl.colors[10].name, equals('8321'));
    expect(listEquals(acbl.colors[10].values, [0.2, 0, 0.3, 0.25]), isTrue);
  });

  test('write acbl file', () async {
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
