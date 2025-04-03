import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read gimp file', () {
    final gimpFile1 = File('./assets/gimp/gpl1.gimp');
    final gimp1 = GimpPalette.fromBytes(gimpFile1.readAsBytesSync());
    // print(gimp1.toJson());

    expect(gimp1.info.first, equals('Name: Visibone2'));
    expect(gimp1.colors.length, equals(256));

    final gimpFile2 = File('./assets/gimp/gpl2.gpl');
    final gimp2 = GimpPalette.fromBytes(gimpFile2.readAsBytesSync());
    // print(gimp2.toJson());

    expect(gimp2.info.first, equals('Name: Oxygen'));
    expect(gimp2.colors.length, equals(126));
  });

  test('write gimp file', () async {
    final gimp = GimpPalette(
      info: ['Name: Test Gimp Palette'],
      comments: ['Comment: Test comment'],
      colors: [
        GimpPaletteColor(name: 'red', red: 255, green: 0, blue: 0),
        GimpPaletteColor(name: '', red: 0, green: 255, blue: 255),
        GimpPaletteColor(name: 'gray', red: 128, green: 128, blue: 128),
      ],
    );
    // print(gimp.toJson());

    // write to temp file
    final gimpFile = File('./test/test.gpl');
    gimpFile.writeAsBytesSync(gimp.toBytes());
    // print(gimpFile.readAsStringSync());

    final decodedGimp = GimpPalette.fromBytes(gimpFile.readAsBytesSync());
    // print(decodedGimp.toJson());

    expect(decodedGimp.info.first, equals('Name: Test Gimp Palette'));
    expect(decodedGimp.comments, equals(['Comment: Test comment']));
    expect(decodedGimp.colors.length, equals(3));

    expect(decodedGimp.colors[0].name, equals('red'));
    expect(decodedGimp.colors[0].red, equals(255));
    expect(decodedGimp.colors[0].green, equals(0));
    expect(decodedGimp.colors[0].blue, equals(0));

    expect(decodedGimp.colors[1].name, equals(''));
    expect(decodedGimp.colors[1].red, equals(0));
    expect(decodedGimp.colors[1].green, equals(255));
    expect(decodedGimp.colors[1].blue, equals(255));

    expect(decodedGimp.colors[2].name, equals('gray'));
    expect(decodedGimp.colors[2].red, equals(128));
    expect(decodedGimp.colors[2].green, equals(128));
    expect(decodedGimp.colors[2].blue, equals(128));

    // delete temp file
    gimpFile.deleteSync();
  });
}
