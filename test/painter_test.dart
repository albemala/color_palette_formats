import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/painter/painter1.txt': PainterPalette(
      rows: 7,
      columns: 1,
      width: 140,
      height: 30,
      textHeight: 12,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 247,
          green: 224,
          blue: 23,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'PANTONE Yellow C',
        ),
      ],
    ),
    'test/testdata/painter/painter2.txt': PainterPalette(
      rows: 16,
      columns: 6,
      width: 41,
      height: 12,
      textHeight: 14,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 255,
          green: 255,
          blue: 255,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'FFFFFF',
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/painter/painter1.txt': 3,
    'test/testdata/painter/painter2.txt': 2,
  };

  expectedData.forEach((filePath, expectedPainter) {
    group('Painter Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final painterFile = File(filePath);
        bytes = painterFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(PainterPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final painter = PainterPalette.fromBytes(bytes);

        expect(painter.rows, equals(expectedPainter.rows));
        expect(painter.columns, equals(expectedPainter.columns));
        expect(painter.width, equals(expectedPainter.width));
        expect(painter.height, equals(expectedPainter.height));
        expect(painter.textHeight, equals(expectedPainter.textHeight));
        expect(painter.spacing, equals(expectedPainter.spacing));
        expect(painter.colors.length, equals(expectedCounts[filePath]));

        expect(
          painter.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (painter.colors.isNotEmpty) {
          final firstColor = painter.colors.first;
          final expectedFirstColor = expectedPainter.colors.first;

          expect(firstColor.red, equals(expectedFirstColor.red));
          expect(firstColor.green, equals(expectedFirstColor.green));
          expect(firstColor.blue, equals(expectedFirstColor.blue));
          expect(firstColor.hv, equals(expectedFirstColor.hv));
          expect(firstColor.sv, equals(expectedFirstColor.sv));
          expect(firstColor.vv, equals(expectedFirstColor.vv));
          expect(firstColor.name, equals(expectedFirstColor.name));
        }
      });
    });
  });

  test('parses non-zero variability values', () {
    final painter = PainterPalette.fromBytes(
      File('test/testdata/painter/painter1.txt').readAsBytesSync(),
    );

    final secondColor = painter.colors[1];
    expect(secondColor.name, equals('PANTONE Orange 021 C'));
    expect(secondColor.red, equals(237));
    expect(secondColor.green, equals(110));
    expect(secondColor.blue, equals(0));
    expect(secondColor.hv, equals(1.25));
    expect(secondColor.sv, equals(2.5));
    expect(secondColor.vv, equals(3.75));
  });

  test('tolerates varying whitespace around separators', () {
    final bytes = utf8.encode(
      'ROWS 16\n'
      'COLS 6\n'
      'WIDTH 41\n'
      'HEIGHT 12\n'
      'TEXTHEIGHT 14\n'
      'SPACING 1\n'
      'R: 255, G:255, B:0 HV:0.00, SV:0.00, VV:0.00  FFFF00',
    );

    expect(PainterPalette.isValidFormat(bytes), isTrue);
    final painter = PainterPalette.fromBytes(bytes);
    expect(painter.colors.length, equals(1));
    expect(painter.colors.single.red, equals(255));
    expect(painter.colors.single.green, equals(255));
    expect(painter.colors.single.blue, equals(0));
    expect(painter.colors.single.name, equals('FFFF00'));
  });

  test('isValidFormat returns false for invalid PainterPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PainterPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write painter file', () {
    final painter = PainterPalette(
      rows: 1,
      columns: 2,
      width: 140,
      height: 30,
      textHeight: 12,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 255,
          green: 0,
          blue: 0,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'red',
        ),
        PainterPaletteColor(
          red: 0,
          green: 0,
          blue: 255,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'blue',
        ),
      ],
    );

    // write to temp file
    final painterFile = File('./test/test.txt');
    painterFile.writeAsBytesSync(painter.toBytes());

    final decodedPainter = PainterPalette.fromBytes(
      painterFile.readAsBytesSync(),
    );

    expect(decodedPainter.rows, equals(1));
    expect(decodedPainter.columns, equals(2));
    expect(decodedPainter.colors.length, equals(2));

    expect(decodedPainter.colors[0].name, equals('red'));
    expect(decodedPainter.colors[0].red, equals(255));
    expect(decodedPainter.colors[0].green, equals(0));
    expect(decodedPainter.colors[0].blue, equals(0));

    expect(decodedPainter.colors[1].name, equals('blue'));
    expect(decodedPainter.colors[1].blue, equals(255));

    // delete temp file
    painterFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = PainterPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
