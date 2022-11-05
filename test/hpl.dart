import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read hpl file', () {
    final hplFile1 = File('./assets/hpl1.hpl');
    final hpl1 = decodeHomesitePalette(hplFile1);
    // print(hpl1.toJson());

    expect(hpl1.version, equals(supportedHomesitePaletteVersion));
    expect(hpl1.colors.length, equals(287));

    final hplFile2 = File('./assets/hpl2.hpl');
    final hpl2 = decodeHomesitePalette(hplFile2);
    // print(hpl2.toJson());

    expect(hpl2.version, equals(supportedHomesitePaletteVersion));
    expect(hpl2.colors.length, equals(256));
  });

  test('write hpl file', () async {
    const hpl = HomesitePalette(
      version: supportedHomesitePaletteVersion,
      colors: [
        HomesitePaletteColor(
          red: 255,
          green: 0,
          blue: 0,
        ),
        HomesitePaletteColor(
          red: 0,
          green: 255,
          blue: 255,
        ),
        HomesitePaletteColor(
          red: 128,
          green: 128,
          blue: 128,
        ),
      ],
    );

    // write to temp file
    final hplFile = File('./test/test.hpl');
    encodeHomesitePalette(hpl, hplFile);
    // print(hplFile.readAsStringSync());

    final decodedHpl = decodeHomesitePalette(hplFile);
    // print(decodedHpl.toJson());

    expect(decodedHpl.version, equals(supportedHomesitePaletteVersion));
    expect(decodedHpl.colors.length, equals(3));

    // delete temp file
    hplFile.deleteSync();
  });
}