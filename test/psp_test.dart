import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/psp/pal1_v0100.pal': PaintShopProPalette(
      colors: [PaintShopProPaletteColor(red: 71, green: 41, blue: 45)],
    ),
    'test/testdata/psp/VisiBone2_km.psppalette': PaintShopProPalette(
      colors: [PaintShopProPaletteColor(red: 255, green: 255, blue: 255)],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('PaintShopPro Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final palFile = File(filePath);
        bytes = palFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(PaintShopProPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final pal = PaintShopProPalette.fromBytes(bytes);

        // Compare colors
        expect(pal.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (pal.colors.isNotEmpty) {
          final firstColor = pal.colors.first;
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
        }
      });
    });
  });

  test('isValidFormat returns false for invalid PaintShopProPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PaintShopProPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write pal file', () {
    final pal = PaintShopProPalette(
      colors: [
        PaintShopProPaletteColor(red: 255, green: 0, blue: 0),
        PaintShopProPaletteColor(red: 0, green: 255, blue: 0),
        PaintShopProPaletteColor(red: 0, green: 0, blue: 255),
      ],
    );

    // write to temp file
    final palFile = File('./test/test.pal');
    palFile.writeAsBytesSync(pal.toBytes());

    final decodedPal = PaintShopProPalette.fromBytes(palFile.readAsBytesSync());

    expect(decodedPal.colors.length, equals(3));

    expect(decodedPal.colors[0].red, equals(255));
    expect(decodedPal.colors[0].green, equals(0));
    expect(decodedPal.colors[0].blue, equals(0));

    expect(decodedPal.colors[1].red, equals(0));
    expect(decodedPal.colors[1].green, equals(255));
    expect(decodedPal.colors[1].blue, equals(0));

    expect(decodedPal.colors[2].red, equals(0));
    expect(decodedPal.colors[2].green, equals(0));
    expect(decodedPal.colors[2].blue, equals(255));

    // delete temp file
    palFile.deleteSync();
  });

  group('validation', () {
    List<int> bytes(String content) => utf8.encode(content);

    test('rejects malformed input with FormatException', () {
      final cases = <String, List<int>>{
        'empty': [],
        'single line': bytes('JASC-PAL'),
        'header and version only': bytes('JASC-PAL\n0100'),
        'non-numeric count': bytes('JASC-PAL\n0100\nabc\n71 41 45'),
        'negative count': bytes('JASC-PAL\n0100\n-1\n71 41 45'),
        'two values': bytes('JASC-PAL\n0100\n1\n71 41'),
        'four values': bytes('JASC-PAL\n0100\n1\n71 41 45 99'),
        'non-numeric channel': bytes('JASC-PAL\n0100\n1\nxx 41 45'),
        'overflow channel': bytes(
          'JASC-PAL\n0100\n1\n9999999999999999999999 41 45',
        ),
        'negative channel': bytes('JASC-PAL\n0100\n1\n-5 41 45'),
        'channel above range': bytes('JASC-PAL\n0100\n1\n300 41 45'),
      };

      for (final entry in cases.entries) {
        expect(
          () => PaintShopProPalette.fromBytes(entry.value),
          throwsA(isA<FormatException>()),
          reason: entry.key,
        );
        expect(
          PaintShopProPalette.isValidFormat(entry.value),
          isFalse,
          reason: entry.key,
        );
      }
    });

    test('is whitespace-tolerant', () {
      final variants = <String, String>{
        'trailing space': 'JASC-PAL\n0100\n1\n71 41 45 ',
        'double space': 'JASC-PAL\n0100\n1\n71  41 45',
        'tab separated': 'JASC-PAL\n0100\n1\n71\t41\t45',
        'blank lines': 'JASC-PAL\n0100\n1\n\n   \n71 41 45\n\n',
        'lone CR endings': 'JASC-PAL\r0100\r1\r71 41 45',
      };

      for (final entry in variants.entries) {
        final palette = PaintShopProPalette.fromBytes(bytes(entry.value));
        expect(palette.colors.length, equals(1), reason: entry.key);
        expect(palette.colors.first.red, equals(71), reason: entry.key);
        expect(palette.colors.first.green, equals(41), reason: entry.key);
        expect(palette.colors.first.blue, equals(45), reason: entry.key);
        expect(
          PaintShopProPalette.isValidFormat(bytes(entry.value)),
          isTrue,
          reason: entry.key,
        );
      }
    });

    test('tolerates count mismatches and empty palettes', () {
      // Declared count differs from the actual color lines.
      final mismatched = PaintShopProPalette.fromBytes(
        bytes('JASC-PAL\n0100\n99\n71 41 45'),
      );
      expect(mismatched.colors.length, equals(1));

      // A count of zero with no color lines is a legal empty palette.
      final empty = PaintShopProPalette.fromBytes(bytes('JASC-PAL\n0100\n0'));
      expect(empty.colors, isEmpty);
      expect(
        PaintShopProPalette.isValidFormat(bytes('JASC-PAL\n0100\n0')),
        isTrue,
      );
    });

    test('encoder rejects out-of-range channels', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      for (final bad in [300, -1]) {
        expect(
          () =>
              PaintShopProPalette(
                colors: [PaintShopProPaletteColor(red: bad, green: 0, blue: 0)],
              ).toBytes(),
          throwsA(either),
          reason: 'red = $bad',
        );
      }
    });
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final fileBytes = File(filePath).readAsBytesSync();
      final once = PaintShopProPalette.fromBytes(fileBytes);
      final twice = PaintShopProPalette.fromBytes(once.toBytes());
      expect(twice.colors.length, equals(once.colors.length), reason: filePath);
      for (var i = 0; i < once.colors.length; i++) {
        expect(
          twice.colors[i].red,
          equals(once.colors[i].red),
          reason: filePath,
        );
        expect(
          twice.colors[i].green,
          equals(once.colors[i].green),
          reason: filePath,
        );
        expect(
          twice.colors[i].blue,
          equals(once.colors[i].blue),
          reason: filePath,
        );
      }
    }
  });
}
