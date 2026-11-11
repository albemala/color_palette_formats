import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/paint-dot-net/paint-dot-net1.txt': PaintDotNetPalette(
      colors: [PaintDotNetPaletteColor(red: 0, green: 0, blue: 0, alpha: 255)],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Paint.NET Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final paintDotNetFile = File(filePath);
        bytes = paintDotNetFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(PaintDotNetPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final paintDotNet = PaintDotNetPalette.fromBytes(bytes);

        // Compare colors
        expect(
          paintDotNet.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (paintDotNet.colors.isNotEmpty) {
          final firstColor = paintDotNet.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue value mismatch for the first color',
          );
          expect(
            firstColor.alpha,
            equals(expectedFirstColor.alpha),
            reason: 'Alpha value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid PaintDotNetPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PaintDotNetPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write paint-dot-net file', () {
    final paintDotNet = PaintDotNetPalette(
      colors: [
        PaintDotNetPaletteColor(red: 255, green: 0, blue: 0, alpha: 255),
        PaintDotNetPaletteColor(red: 0, green: 255, blue: 255, alpha: 255),
        PaintDotNetPaletteColor(red: 128, green: 128, blue: 128, alpha: 255),
      ],
    );

    // write to temp file
    final paintDotNetFile = File('./test/test.txt');
    paintDotNetFile.writeAsBytesSync(paintDotNet.toBytes());

    final decodedPaintDotNet = PaintDotNetPalette.fromBytes(
      paintDotNetFile.readAsBytesSync(),
    );

    expect(decodedPaintDotNet.colors.length, equals(3));

    expect(decodedPaintDotNet.colors[0].red, equals(255));
    expect(decodedPaintDotNet.colors[0].green, equals(0));
    expect(decodedPaintDotNet.colors[0].blue, equals(0));
    expect(decodedPaintDotNet.colors[0].alpha, equals(255));

    expect(decodedPaintDotNet.colors[1].red, equals(0));
    expect(decodedPaintDotNet.colors[1].green, equals(255));
    expect(decodedPaintDotNet.colors[1].blue, equals(255));
    expect(decodedPaintDotNet.colors[1].alpha, equals(255));

    expect(decodedPaintDotNet.colors[2].red, equals(128));
    expect(decodedPaintDotNet.colors[2].green, equals(128));
    expect(decodedPaintDotNet.colors[2].blue, equals(128));
    expect(decodedPaintDotNet.colors[2].alpha, equals(255));

    // delete temp file
    paintDotNetFile.deleteSync();
  });

  test('rejects malformed color lines with FormatException', () {
    String fileWith(String body) => '; paint.net Palette File\n$body';

    // Short, long, and non-hex lines throw FormatException, never RangeError.
    for (final body in [
      'FF00\n',
      'ABC\n',
      'FF00000\n',
      'FF0000000\n',
      'GGGGGGGG\n',
      'FF00FF0\nFF00FF0G\n',
      'FF 00 FF 00\n',
    ]) {
      expect(
        () => PaintDotNetPalette.fromBytes(fileWith(body).codeUnits),
        throwsA(isA<FormatException>()),
        reason: 'body "$body"',
      );
      expect(
        PaintDotNetPalette.isValidFormat(fileWith(body).codeUnits),
        isFalse,
        reason: 'body "$body"',
      );
    }
  });

  test('tolerates case, whitespace, comments, and BOM', () {
    String fileWith(String body) => '; paint.net Palette File\n$body';

    // Lowercase hex decodes like uppercase.
    final lower = PaintDotNetPalette.fromBytes(
      fileWith('ff00ff00\n').codeUnits,
    );
    expect(lower.colors.length, equals(1));
    expect(lower.colors.first.green, equals(255));

    // Trailing whitespace, whitespace-only lines, and indented comments
    // are tolerated.
    final tolerant = PaintDotNetPalette.fromBytes(
      fileWith('FF00FF00  \n   \n  ; indented comment\n').codeUnits,
    );
    expect(tolerant.colors.length, equals(1));

    // A leading UTF-8 BOM (as written by Paint.NET) is stripped.
    final bom = [0xEF, 0xBB, 0xBF, ...fileWith('FF000000\n').codeUnits];
    final bomPalette = PaintDotNetPalette.fromBytes(bom);
    expect(bomPalette.colors.length, equals(1));
    expect(PaintDotNetPalette.isValidFormat(bom), isTrue);
  });

  test('decodes lone-CR line endings', () {
    final bytes =
        File(
          'test/testdata/paint-dot-net/paint-dot-net1.txt',
        ).readAsBytesSync();
    // The fixture ends without a trailing newline, so a plain newline
    // swap is a faithful lone-CR rendering of the same file.
    final crBytes = utf8.decode(bytes).replaceAll('\n', '\r').codeUnits;
    final palette = PaintDotNetPalette.fromBytes(crBytes);
    expect(palette.colors.length, equals(96));
    expect(palette.colors.first.alpha, equals(255));
  });

  test('encoder rejects out-of-range channels', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());
    for (final bad in [256, -1]) {
      expect(
        () =>
            PaintDotNetPalette(
              colors: [
                PaintDotNetPaletteColor(
                  red: bad,
                  green: 0,
                  blue: 0,
                  alpha: 255,
                ),
              ],
            ).toBytes(),
        throwsA(either),
        reason: 'red = $bad',
      );
      expect(
        () =>
            PaintDotNetPalette(
              colors: [
                PaintDotNetPaletteColor(red: 0, green: 0, blue: 0, alpha: bad),
              ],
            ).toBytes(),
        throwsA(either),
        reason: 'alpha = $bad',
      );
    }
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final once = PaintDotNetPalette.fromBytes(bytes);
      final twice = PaintDotNetPalette.fromBytes(once.toBytes());
      expect(twice.colors.length, equals(once.colors.length), reason: filePath);
      for (var i = 0; i < once.colors.length; i++) {
        expect(twice.colors[i].red, equals(once.colors[i].red));
        expect(twice.colors[i].green, equals(once.colors[i].green));
        expect(twice.colors[i].blue, equals(once.colors[i].blue));
        expect(twice.colors[i].alpha, equals(once.colors[i].alpha));
      }
    }
  });
}
