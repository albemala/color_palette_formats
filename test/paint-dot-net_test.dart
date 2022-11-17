import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read paint-dot-net file', () {
    final paintDotNetFile1 = File('./assets/paint-dot-net1.txt');
    final paintDotNet1 = decodePaintDotNetPalette(paintDotNetFile1);
    // print(paintDotNet1.toJson());

    expect(paintDotNet1.colors.length, equals(96));
  });

  test('write paint-dot-net file', () async {
    const paintDotNet = PaintDotNetPalette(
      colors: [
        PaintDotNetPaletteColor(
          red: 255,
          green: 0,
          blue: 0,
          alpha: 255,
        ),
        PaintDotNetPaletteColor(
          red: 0,
          green: 255,
          blue: 255,
          alpha: 255,
        ),
        PaintDotNetPaletteColor(
          red: 128,
          green: 128,
          blue: 128,
          alpha: 255,
        ),
      ],
    );

    // write to temp file
    final paintDotNetFile = File('./test/test.txt');
    encodePaintDotNetPalette(paintDotNet, paintDotNetFile);
    // print(paintDotNetFile.readAsStringSync());

    final decodedPaintDotNet = decodePaintDotNetPalette(paintDotNetFile);
    // print(decodedPaintDotNet.toJson());

    expect(decodedPaintDotNet.colors.length, equals(3));

    // delete temp file
    paintDotNetFile.deleteSync();
  });
}
