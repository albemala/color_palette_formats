import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read sketchpalette file', () {
    final sketchpaletteFile1 =
        File('./assets/sketchpalette1_v1.4.sketchpalette');
    final sketchpalette1 = decodeSketchPalette(sketchpaletteFile1);
    // print(sketchpalette1.toJson());

    expect(
      sketchpalette1.compatibleVersion,
      equals(supportedSketchPaletteVersion),
    );
    expect(sketchpalette1.pluginVersion, equals(supportedSketchPaletteVersion));
    expect(sketchpalette1.colors.length, equals(6));

    final sketchpaletteFile2 =
        File('./assets/sketchpalette2_v1.4.sketchpalette');
    final sketchpalette2 = decodeSketchPalette(sketchpaletteFile2);
    // print(sketchpalette2.toJson());

    expect(
      sketchpalette2.compatibleVersion,
      equals(supportedSketchPaletteVersion),
    );
    expect(sketchpalette2.pluginVersion, equals(supportedSketchPaletteVersion));
    expect(sketchpalette2.colors.length, equals(10));
  });

  test('write sketchpalette file', () async {
    const sketchPalette = SketchPalette(
      compatibleVersion: supportedSketchPaletteVersion,
      pluginVersion: supportedSketchPaletteVersion,
      colors: [
        SketchPaletteColor(
          red: 1,
          green: 0,
          blue: 0,
          alpha: 1,
        ),
        SketchPaletteColor(
          red: 0,
          green: 1,
          blue: 0,
          alpha: 1,
        ),
        SketchPaletteColor(
          red: 0,
          green: 0,
          blue: 1,
          alpha: 1,
        ),
      ],
    );

    // write to temp file
    final sketchPaletteFile = File('./test/test.sketchpalette');
    encodeSketchPalette(sketchPalette, sketchPaletteFile);
    // print(sketchPaletteFile.readAsStringSync());

    final decodedSketchPalette = decodeSketchPalette(sketchPaletteFile);
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

    // delete temp file
    sketchPaletteFile.deleteSync();
  });
}
