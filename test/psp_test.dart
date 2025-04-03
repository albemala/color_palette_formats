import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid PaintShopProPalette file', () {
    final palFile = File('./assets/psp/pal1_v0100.pal');
    final bytes = palFile.readAsBytesSync();
    expect(PaintShopProPalette.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid PaintShopProPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PaintShopProPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('read pal file', () {
    final palFile1 = File('./assets/psp/pal1_v0100.pal');
    final pal1 = PaintShopProPalette.fromBytes(palFile1.readAsBytesSync());
    // print(pal1.toJson());

    expect(pal1.colors.length, equals(3));
  });

  test('write pal file', () async {
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
