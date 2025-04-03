import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read koffice file', () {
    final kofficeFile = File('./assets/koffice/KDE40.colors');
    final kofficePalette = KOfficePalette.fromBytes(
      kofficeFile.readAsBytesSync(),
    );
    // print(kofficePalette.toJson());

    expect(kofficePalette.colors.length, equals(40));

    // Check first color
    expect(kofficePalette.colors[0].r, equals(0));
    expect(kofficePalette.colors[0].g, equals(0));
    expect(kofficePalette.colors[0].b, equals(0));
    expect(kofficePalette.colors[0].name, equals('Black'));

    // Check last color
    expect(kofficePalette.colors[39].r, equals(255));
    expect(kofficePalette.colors[39].g, equals(220));
    expect(kofficePalette.colors[39].b, equals(168));
    expect(kofficePalette.colors[39].name, equals('Very light orange'));
  });

  test('write koffice file', () async {
    final kofficePalette = KOfficePalette(
      colors: [
        KOfficePaletteColor(r: 255, g: 0, b: 0, name: 'Red'),
        KOfficePaletteColor(r: 0, g: 255, b: 0, name: 'Green'),
        KOfficePaletteColor(r: 0, g: 0, b: 255, name: 'Blue'),
        KOfficePaletteColor(r: 128, g: 128, b: 128, name: 'Gray'),
      ],
    );
    // print(kofficePalette.toJson());

    // write to temp file
    final tempFile = File('./test/test.colors');
    tempFile.writeAsBytesSync(kofficePalette.toBytes());
    // print(tempFile.readAsStringSync());

    final decodedPalette = KOfficePalette.fromBytes(tempFile.readAsBytesSync());
    // print(decodedPalette.toJson());

    expect(decodedPalette.colors.length, equals(4));

    expect(decodedPalette.colors[0].r, equals(255));
    expect(decodedPalette.colors[0].g, equals(0));
    expect(decodedPalette.colors[0].b, equals(0));
    expect(decodedPalette.colors[0].name, equals('Red'));

    expect(decodedPalette.colors[1].r, equals(0));
    expect(decodedPalette.colors[1].g, equals(255));
    expect(decodedPalette.colors[1].b, equals(0));
    expect(decodedPalette.colors[1].name, equals('Green'));

    expect(decodedPalette.colors[2].r, equals(0));
    expect(decodedPalette.colors[2].g, equals(0));
    expect(decodedPalette.colors[2].b, equals(255));
    expect(decodedPalette.colors[2].name, equals('Blue'));

    expect(decodedPalette.colors[3].r, equals(128));
    expect(decodedPalette.colors[3].g, equals(128));
    expect(decodedPalette.colors[3].b, equals(128));
    expect(decodedPalette.colors[3].name, equals('Gray'));

    // delete temp file
    tempFile.deleteSync();
  });
}
