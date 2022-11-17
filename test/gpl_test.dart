import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

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
    expect(gpl2.columns, equals(null));
    expect(gpl2.colors.length, equals(126));
  });

  test('write gpl file', () async {
    const gpl = GimpPalette(
      name: 'gpl',
      columns: 8,
      comments: ' test',
      colors: [
        GimpPaletteColor(
          name: 'red',
          red: 255,
          green: 0,
          blue: 0,
        ),
        GimpPaletteColor(
          name: 'cyan',
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

    // write to temp file
    final gplFile = File('./test/test.gpl');
    encodeGimpPalette(gpl, gplFile);
    // print(gplFile.readAsStringSync());

    final decodedGpl = decodeGimpPalette(gplFile);
    // print(decodedGpl.toJson());

    expect(decodedGpl.name, equals('gpl'));
    expect(decodedGpl.columns, equals(8));
    expect(decodedGpl.colors.length, equals(3));

    // delete temp file
    gplFile.deleteSync();
  });
}
