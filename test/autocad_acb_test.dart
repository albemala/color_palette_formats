import 'dart:convert';
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

  test('isValidFormat rejects valid root with broken body', () {
    String doc(String body) =>
        '<?xml version="1.0" encoding="UTF-8"?><colorBook>$body</colorBook>';
    const pageColor =
        '<pageColor><RGB8><red>0</red><green>0</green><blue>0</blue></RGB8>'
        '</pageColor>';
    const entry =
        '<colorEntry><colorName>C</colorName><RGB8><red>1</red><green>2</green>'
        '<blue>3</blue></RGB8></colorEntry>';
    final cases = {
      'no pages': doc('<bookName>B</bookName>'),
      'no colors': doc('<colorPage>$pageColor</colorPage>'),
      'missing bookName': doc('<colorPage>$pageColor$entry</colorPage>'),
      'out-of-range channel': doc(
        '<bookName>B</bookName><colorPage>$pageColor'
        '<colorEntry><colorName>C</colorName><RGB8><red>300</red>'
        '<green>0</green><blue>0</blue></RGB8></colorEntry></colorPage>',
      ),
      'non-integer channel': doc(
        '<bookName>B</bookName><colorPage>$pageColor'
        '<colorEntry><colorName>C</colorName><RGB8><red>xx</red>'
        '<green>0</green><blue>0</blue></RGB8></colorEntry></colorPage>',
      ),
      'entry with no RGB values': doc(
        '<bookName>B</bookName><colorPage>$pageColor'
        '<colorEntry><colorName>C</colorName></colorEntry></colorPage>',
      ),
      'empty encrypted code': doc(
        '<bookName>B</bookName><colorPage><pageColor><RGB8Encrypt>'
        '<redEncrypt></redEncrypt><greenEncrypt>B</greenEncrypt>'
        '<blueEncrypt>C</blueEncrypt></RGB8Encrypt></pageColor>'
        '$entry</colorPage>',
      ),
      'truncated': doc('<bookName>B</bookName><colorPage>$pageColor$entry'),
    };
    cases.forEach((reason, xml) {
      final bytes = utf8.encode(xml);
      expect(AutoCadColorBook.isValidFormat(bytes), isFalse, reason: reason);
      expect(
        () => AutoCadColorBook.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('concatenates multi-page colors keeping first pageColor', () {
    const rgb = '<RGB8><red>1</red><green>2</green><blue>3</blue></RGB8>';
    const rgb2 = '<RGB8><red>9</red><green>8</green><blue>7</blue></RGB8>';
    String entry(String name, String values) =>
        '<colorEntry><colorName>$name</colorName>$values</colorEntry>';
    final xml =
        '<?xml version="1.0" encoding="UTF-8"?><colorBook> '
        '<bookName>Multi</bookName>'
        '<colorPage><pageColor>$rgb</pageColor>${entry('A', rgb)}</colorPage>'
        '<colorPage><pageColor>$rgb2</pageColor>${entry('B', rgb2)}</colorPage>'
        '</colorBook>';
    final book = AutoCadColorBook.fromBytes(utf8.encode(xml));
    expect(book.colors.length, equals(2));
    expect(listEquals(book.pageColor.rgb, [1, 2, 3]), isTrue);
    expect(book.colors[0].name, equals('A'));
    expect(book.colors[1].name, equals('B'));
    // The encoder collapses to a single colorPage.
    final reEncoded = utf8.decode(book.toBytes());
    expect('<colorPage>'.allMatches(reEncoded).length, equals(1));
  });

  test('plain RGB8 wins when both shapes are present', () {
    const both =
        '<RGB8><red>1</red><green>2</green><blue>3</blue></RGB8>'
        '<RGB8Encrypt><redEncrypt>AAA</redEncrypt>'
        '<greenEncrypt>BBB</greenEncrypt>'
        '<blueEncrypt>CCC</blueEncrypt></RGB8Encrypt>';
    const xml =
        '<?xml version="1.0" encoding="UTF-8"?><colorBook> '
        '<bookName>B</bookName>'
        '<colorPage><pageColor>$both</pageColor>'
        '<colorEntry><colorName>C</colorName>$both</colorEntry>'
        '</colorPage></colorBook>';
    final book = AutoCadColorBook.fromBytes(utf8.encode(xml));
    expect(listEquals(book.pageColor.rgb, [1, 2, 3]), isTrue);
    expect(book.pageColor.encryptedRgb, isNull);
    expect(listEquals(book.colors.single.rgb, [1, 2, 3]), isTrue);
    expect(book.colors.single.encryptedRgb, isNull);
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
