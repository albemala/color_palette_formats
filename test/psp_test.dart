import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/psp/pal1_v0100.pal': PaintShopProPalette(
      colors: [PaintShopProPaletteColor(red: 71, green: 41, blue: 45)],
    ),
    './assets/psp/VisiBone2_km.psppalette': PaintShopProPalette(
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
    // print(palFile.readAsStringSync());

    final decodedPal = PaintShopProPalette.fromBytes(palFile.readAsBytesSync());
    // print(decodedPal.toJson());

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
}
