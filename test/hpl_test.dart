import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read hpl file', () {
    final hplFile1 = File('./assets/hpl1_v4.0.hpl');
    final hpl1 = HomesitePalette.fromBytes(hplFile1.readAsBytesSync());
    // print(hpl1.toJson());

    expect(hpl1.colors.length, equals(287));

    final hplFile2 = File('./assets/hpl2_v4.0.hpl');
    final hpl2 = HomesitePalette.fromBytes(hplFile2.readAsBytesSync());
    // print(hpl2.toJson());

    expect(hpl2.colors.length, equals(256));
  });

  test('write hpl file', () async {
    final hpl = HomesitePalette(
      colors: [
        HomesitePaletteColor(red: 255, green: 0, blue: 0),
        HomesitePaletteColor(red: 0, green: 255, blue: 255),
        HomesitePaletteColor(red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final hplFile = File('./test/test.hpl');
    hplFile.writeAsBytesSync(hpl.toBytes());
    // print(hplFile.readAsStringSync());

    final decodedHpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());
    // print(decodedHpl.toJson());

    expect(decodedHpl.colors.length, equals(3));

    expect(decodedHpl.colors[0].red, equals(255));
    expect(decodedHpl.colors[0].green, equals(0));
    expect(decodedHpl.colors[0].blue, equals(0));

    expect(decodedHpl.colors[1].red, equals(0));
    expect(decodedHpl.colors[1].green, equals(255));
    expect(decodedHpl.colors[1].blue, equals(255));

    expect(decodedHpl.colors[2].red, equals(128));
    expect(decodedHpl.colors[2].green, equals(128));
    expect(decodedHpl.colors[2].blue, equals(128));

    // delete temp file
    hplFile.deleteSync();
  });
}
