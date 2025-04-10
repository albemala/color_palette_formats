import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validSketchPaletteFiles = [
    './assets/sketchpalette/sketchpalette1_v1.4.sketchpalette',
    './assets/sketchpalette/sketchpalette2_v1.4.sketchpalette',
  ];

  for (final filePath in validSketchPaletteFiles) {
    test(
      'isValidFormat returns true for valid SketchPalette file: $filePath',
      () {
        final sketchpaletteFile = File(filePath);
        final bytes = sketchpaletteFile.readAsBytesSync();
        expect(SketchPalette.isValidFormat(bytes), isTrue);
      },
    );

    test('read sketchpalette file: $filePath', () {
      final sketchpaletteFile = File(filePath);
      final sketchpalette = SketchPalette.fromBytes(
        sketchpaletteFile.readAsBytesSync(),
      );
      // print(sketchpalette.toJson());

      expect(
        sketchpalette.compatibleVersion,
        equals(supportedSketchPaletteVersion),
      );
      expect(
        sketchpalette.pluginVersion,
        equals(supportedSketchPaletteVersion),
      );

      if (filePath ==
          './assets/sketchpalette/sketchpalette1_v1.4.sketchpalette') {
        expect(sketchpalette.colors.length, equals(6));
      } else if (filePath ==
          './assets/sketchpalette/sketchpalette2_v1.4.sketchpalette') {
        expect(sketchpalette.colors.length, equals(10));
      }
    });
  }

  test('isValidFormat returns false for invalid SketchPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SketchPalette.isValidFormat(invalidBytes), isFalse);
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
