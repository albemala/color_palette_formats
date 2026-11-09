import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/autocad_acb/pantone-cotton.acb': AutoCadColorBook(
      bookName: 'PANTONE(R) a & i-cotton',
      majorVersion: 2,
      minorVersion: 0,
      pageColor: AutoCadColorBookPageColor(encryptedRgb: ['TPE', 'WQH', 'QCT']),
      colors: [
        AutoCadColorBookColor(
          name: 'PANTONE 11-0103 TC',
          encryptedRgb: ['HGO', 'PQH', 'UCX'],
        ),
      ],
    ),
    'test/testdata/autocad_acb/acme-plain.acb': AutoCadColorBook(
      bookName: 'ACME Colors',
      pageColor: AutoCadColorBookPageColor(rgb: [100, 100, 100]),
      colors: [
        AutoCadColorBookColor(name: 'Color-1', rgb: [100, 20, 10]),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/autocad_acb/pantone-cotton.acb': 3,
    'test/testdata/autocad_acb/acme-plain.acb': 2,
  };

  expectedData.forEach((filePath, expectedBook) {
    group('AutoCAD ACB File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acbFile = File(filePath);
        bytes = acbFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AutoCadColorBook.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final book = AutoCadColorBook.fromBytes(bytes);

        expect(
          book.bookName,
          equals(expectedBook.bookName),
          reason: 'Book name mismatch',
        );
        expect(
          book.majorVersion,
          equals(expectedBook.majorVersion),
          reason: 'Major version mismatch',
        );
        expect(
          book.minorVersion,
          equals(expectedBook.minorVersion),
          reason: 'Minor version mismatch',
        );
        expect(
          listEquals(book.pageColor.rgb, expectedBook.pageColor.rgb),
          isTrue,
          reason: 'Page color RGB mismatch',
        );
        expect(
          listEquals(
            book.pageColor.encryptedRgb,
            expectedBook.pageColor.encryptedRgb,
          ),
          isTrue,
          reason: 'Page color encrypted codes mismatch',
        );

        expect(
          book.colors.length,
          equals(expectedCounts[filePath]),
          reason: 'Color count mismatch',
        );
        expect(book.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (book.colors.isNotEmpty) {
          final firstColor = book.colors.first;
          final expectedFirstColor = expectedBook.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Color name mismatch for the first color',
          );
          expect(
            listEquals(firstColor.rgb, expectedFirstColor.rgb),
            isTrue,
            reason: 'RGB values mismatch for the first color',
          );
          expect(
            listEquals(
              firstColor.encryptedRgb,
              expectedFirstColor.encryptedRgb,
            ),
            isTrue,
            reason: 'Encrypted codes mismatch for the first color',
          );
        }
      });
    });
  });

  test('keeps encrypted codes raw without decoding', () {
    final book = AutoCadColorBook.fromBytes(
      File('test/testdata/autocad_acb/pantone-cotton.acb').readAsBytesSync(),
    );

    expect(book.colors[1].name, equals('PANTONE 11-0602 TC'));
    expect(book.colors[1].rgb, isNull);
    expect(
      listEquals(book.colors[1].encryptedRgb, ['OMU', 'NLE', 'AIN']),
      isTrue,
    );
  });

  test('isValidFormat returns false for invalid AutoCAD ACB file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AutoCadColorBook.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat distinguishes Adobe ACB from AutoCAD ACB', () {
    final adobeBytes = File('test/testdata/acb/acb1_v1.acb').readAsBytesSync();
    expect(AutoCadColorBook.isValidFormat(adobeBytes), isFalse);
    expect(AdobeColorBook.isValidFormat(adobeBytes), isTrue);

    final autocadBytes =
        File('test/testdata/autocad_acb/acme-plain.acb').readAsBytesSync();
    expect(AdobeColorBook.isValidFormat(autocadBytes), isFalse);
    expect(AutoCadColorBook.isValidFormat(autocadBytes), isTrue);
  });

  test('write autocad acb file', () {
    final book = AutoCadColorBook(
      bookName: 'Test Book',
      majorVersion: 1,
      minorVersion: 0,
      pageColor: AutoCadColorBookPageColor(rgb: [255, 255, 255]),
      colors: [
        AutoCadColorBookColor(name: 'Test Red', rgb: [255, 0, 0]),
        AutoCadColorBookColor(
          name: 'Test Sealed',
          encryptedRgb: ['AAA', 'BBB', 'CCC'],
        ),
      ],
    );

    // Write to temp file
    final acbFile = File('./test/test.acb');
    acbFile.writeAsBytesSync(book.toBytes());

    // Read back and verify
    final decodedBook = AutoCadColorBook.fromBytes(acbFile.readAsBytesSync());

    expect(decodedBook.bookName, equals('Test Book'));
    expect(decodedBook.majorVersion, equals(1));
    expect(decodedBook.minorVersion, equals(0));
    expect(listEquals(decodedBook.pageColor.rgb, [255, 255, 255]), isTrue);

    expect(decodedBook.colors.length, equals(2));
    expect(decodedBook.colors[0].name, equals('Test Red'));
    expect(listEquals(decodedBook.colors[0].rgb, [255, 0, 0]), isTrue);
    expect(decodedBook.colors[1].name, equals('Test Sealed'));
    expect(decodedBook.colors[1].rgb, isNull);
    expect(
      listEquals(decodedBook.colors[1].encryptedRgb, ['AAA', 'BBB', 'CCC']),
      isTrue,
    );

    // Delete temp file
    acbFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = AutoCadColorBook.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
