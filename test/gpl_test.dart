import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read gpl file', () {
    final gplFile1 = File('./assets/gpl1.gimp');
    final gpl1 = decodeGimpPalette(gplFile1);
    // print(gpl1.toJson());

    expect(gpl1.name, equals('Visibone2'));
    expect(gpl1.columns, equals(16));
    expect(gpl1.colors.length, equals(256));

    final gplFile2 = File('./assets/gpl2.gpl');
    final gpl2 = decodeGimpPalette(gplFile2);
    // print(gpl2.toJson());

    expect(gpl2.name, equals('Oxygen'));
    expect(gpl2.columns, equals(1));
    expect(gpl2.colors.length, equals(126));
  });

  test('write gpl file', () async {
    final gpl = GimpPalette(
      name: 'gpl',
      comments: ' test',
      colors: [
        GimpPaletteColor(
          name: 'red',
          red: 255,
          green: 0,
          blue: 0,
        ),
        GimpPaletteColor(
          name: '',
          red: 0,
          green: 255,
          blue: 255,
        ),
        GimpPaletteColor(
          name: 'gray',
          red: 128,
          green: 128,
          blue: 128,
        ),
      ],
    );
    // print(gpl.toJson());

    // write to temp file
    final gplFile = File('./test/test.gpl');
    encodeGimpPalette(gpl, gplFile);
    // print(gplFile.readAsStringSync());

    final decodedGpl = decodeGimpPalette(gplFile);
    // print(decodedGpl.toJson());

    expect(decodedGpl.name, equals('gpl'));
    expect(decodedGpl.columns, equals(1));
    expect(decodedGpl.comments, equals(' test\n'));
    expect(decodedGpl.colors.length, equals(3));

    expect(decodedGpl.colors[0].name, equals('red'));
    expect(decodedGpl.colors[0].red, equals(255));
    expect(decodedGpl.colors[0].green, equals(0));
    expect(decodedGpl.colors[0].blue, equals(0));

    expect(decodedGpl.colors[1].name, equals(''));
    expect(decodedGpl.colors[1].red, equals(0));
    expect(decodedGpl.colors[1].green, equals(255));
    expect(decodedGpl.colors[1].blue, equals(255));

    expect(decodedGpl.colors[2].name, equals('gray'));
    expect(decodedGpl.colors[2].red, equals(128));
    expect(decodedGpl.colors[2].green, equals(128));
    expect(decodedGpl.colors[2].blue, equals(128));

    // delete temp file
    gplFile.deleteSync();
  });
}
