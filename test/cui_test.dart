import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/cui/solid-hex.cui': QuarkXPressCui(
      rowsPerPage: 7,
      prefix: 'PANTONE',
      suffix: 'HC',
      columnBreaks: [6, 543, 549, 554, 560, 566],
    ),
  };

  expectedData.forEach((filePath, expectedCui) {
    group('CUI File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final cuiFile = File(filePath);
        bytes = cuiFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(QuarkXPressCui.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final cui = QuarkXPressCui.fromBytes(bytes);

        expect(cui.rowsPerPage, equals(expectedCui.rowsPerPage));
        expect(cui.prefix, equals(expectedCui.prefix));
        expect(cui.suffix, equals(expectedCui.suffix));
        expect(
          listEquals(cui.columnBreaks, expectedCui.columnBreaks),
          isTrue,
          reason: 'Column breaks mismatch',
        );
      });
    });
  });

  test('isValidFormat returns false for invalid CUI file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(QuarkXPressCui.isValidFormat(invalidBytes), isFalse);
  });

  test('write cui file', () {
    final cui = QuarkXPressCui(
      rowsPerPage: 5,
      prefix: 'TEST',
      suffix: '',
      columnBreaks: const [],
    );

    // Write to temp file
    final cuiFile = File('./test/test.cui');
    cuiFile.writeAsBytesSync(cui.toBytes());

    // Read back and verify
    final decodedCui = QuarkXPressCui.fromBytes(cuiFile.readAsBytesSync());

    expect(decodedCui.rowsPerPage, equals(5));
    expect(decodedCui.prefix, equals('TEST'));
    expect(decodedCui.suffix, equals(''));
    expect(decodedCui.columnBreaks, isEmpty);

    // Delete temp file
    cuiFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = QuarkXPressCui.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
