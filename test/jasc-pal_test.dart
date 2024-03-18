import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read pal file', () {
    final palFile1 = File('./assets/pal1_v0100.pal');
    final pal1 = JascPalette.fromBytes(palFile1.readAsBytesSync());
    // print(pal1.toJson());

    expect(pal1.version, equals(supportedJascPaletteVersion));
    expect(pal1.colors.length, equals(3));
  });

  test('write pal file', () async {
    final pal = JascPalette(
      version: supportedJascPaletteVersion,
      colors: [
        JascPaletteColor(
          red: 255,
          green: 0,
          blue: 0,
        ),
        JascPaletteColor(
          red: 0,
          green: 255,
          blue: 0,
        ),
        JascPaletteColor(
          red: 0,
          green: 0,
          blue: 255,
        ),
      ],
    );

    // write to temp file
    final palFile = File('./test/test.pal');
    palFile.writeAsBytesSync(pal.toBytes());
    // print(palFile.readAsStringSync());

    final decodedPal = JascPalette.fromBytes(palFile.readAsBytesSync());
    // print(decodedPal.toJson());

    expect(decodedPal.version, equals(supportedJascPaletteVersion));

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
