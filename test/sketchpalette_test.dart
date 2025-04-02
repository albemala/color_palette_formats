import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read sketchpalette file', () {
    final sketchpaletteFile1 = File(
      './assets/sketchpalette/sketchpalette1_v1.4.sketchpalette',
    );
    final sketchpalette1 = SketchPalette.fromBytes(
      sketchpaletteFile1.readAsBytesSync(),
    );
    // print(sketchpalette1.toJson());

    expect(
      sketchpalette1.compatibleVersion,
      equals(supportedSketchPaletteVersion),
    );
    expect(sketchpalette1.pluginVersion, equals(supportedSketchPaletteVersion));
    expect(sketchpalette1.colors.length, equals(6));

    final sketchpaletteFile2 = File(
      './assets/sketchpalette/sketchpalette2_v1.4.sketchpalette',
    );
    final sketchpalette2 = SketchPalette.fromBytes(
      sketchpaletteFile2.readAsBytesSync(),
    );
    // print(sketchpalette2.toJson());

    expect(
      sketchpalette2.compatibleVersion,
      equals(supportedSketchPaletteVersion),
    );
    expect(sketchpalette2.pluginVersion, equals(supportedSketchPaletteVersion));
    expect(sketchpalette2.colors.length, equals(10));
  });

  test('write sketchpalette file', () async {
    final sketchPalette = SketchPalette(
      compatibleVersion: supportedSketchPaletteVersion,
      pluginVersion: supportedSketchPaletteVersion,
      colors: [
        SketchPaletteColor(red: 1, green: 0, blue: 0, alpha: 1),
        SketchPaletteColor(red: 0, green: 1, blue: 0, alpha: 1),
        SketchPaletteColor(red: 0, green: 0, blue: 1, alpha: 1),
      ],
    );

    // write to temp file
    final sketchPaletteFile = File('./test/test.sketchpalette');
    sketchPaletteFile.writeAsBytesSync(sketchPalette.toBytes());
    // print(sketchPaletteFile.readAsStringSync());

    final decodedSketchPalette = SketchPalette.fromBytes(
      sketchPaletteFile.readAsBytesSync(),
    );
    // print(decodedSketchPalette.toJson());

    expect(
      decodedSketchPalette.compatibleVersion,
      equals(supportedSketchPaletteVersion),
    );
    expect(
      decodedSketchPalette.pluginVersion,
      equals(supportedSketchPaletteVersion),
    );

    expect(decodedSketchPalette.colors.length, equals(3));

    expect(decodedSketchPalette.colors[0].red, equals(1));
    expect(decodedSketchPalette.colors[0].green, equals(0));
    expect(decodedSketchPalette.colors[0].blue, equals(0));
    expect(decodedSketchPalette.colors[0].alpha, equals(1));

    expect(decodedSketchPalette.colors[1].red, equals(0));
    expect(decodedSketchPalette.colors[1].green, equals(1));
    expect(decodedSketchPalette.colors[1].blue, equals(0));
    expect(decodedSketchPalette.colors[1].alpha, equals(1));

    expect(decodedSketchPalette.colors[2].red, equals(0));
    expect(decodedSketchPalette.colors[2].green, equals(0));
    expect(decodedSketchPalette.colors[2].blue, equals(1));
    expect(decodedSketchPalette.colors[2].alpha, equals(1));

    // delete temp file
    sketchPaletteFile.deleteSync();
  });
}
