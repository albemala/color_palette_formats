import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/sketchpalette/sketchpalette1_v1.4.sketchpalette': SketchPalette(
      compatibleVersion: SketchPalette.validVersion,
      pluginVersion: SketchPalette.validVersion,
      colors: [
        SketchPaletteColor(red: 0.28, green: 0.16, blue: 0.18, alpha: 1.0),
      ],
    ),
    './assets/sketchpalette/sketchpalette2_v1.4.sketchpalette': SketchPalette(
      compatibleVersion: SketchPalette.validVersion,
      pluginVersion: SketchPalette.validVersion,
      colors: [
        SketchPaletteColor(
          red: 0.3529411764705882,
          green: 0.7843137254901961,
          blue: 0.9803921568627451,
          alpha: 1.0,
        ),
      ],
    ),
    './assets/sketchpalette/material-design.sketchpalette': SketchPalette(
      compatibleVersion: SketchPalette.validVersion,
      pluginVersion: SketchPalette.validVersion,
      colors: [
        SketchPaletteColor(
          red: 0.9568627450980391,
          green: 0.2627450980392157,
          blue: 0.21176470588235294,
          alpha: 1.0,
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Sketch Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final sketchpaletteFile = File(filePath);
        bytes = sketchpaletteFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(SketchPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final sketchpalette = SketchPalette.fromBytes(bytes);

        expect(
          sketchpalette.compatibleVersion,
          equals(expectedPalette.compatibleVersion),
          reason: 'Compatible version mismatch',
        );
        expect(
          sketchpalette.pluginVersion,
          equals(expectedPalette.pluginVersion),
          reason: 'Plugin version mismatch',
        );

        // Compare colors
        expect(
          sketchpalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (sketchpalette.colors.isNotEmpty) {
          final firstColor = sketchpalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          // Use closeTo for floating point comparisons
          expect(
            firstColor.red,
            closeTo(expectedFirstColor.red, 1e-9),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            closeTo(expectedFirstColor.green, 1e-9),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            closeTo(expectedFirstColor.blue, 1e-9),
            reason: 'Blue value mismatch for the first color',
          );
          expect(
            firstColor.alpha,
            closeTo(expectedFirstColor.alpha, 1e-9),
            reason: 'Alpha value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid SketchPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SketchPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write sketchpalette file', () {
    final sketchPalette = SketchPalette(
      compatibleVersion: SketchPalette.validVersion,
      pluginVersion: SketchPalette.validVersion,
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
      equals(SketchPalette.validVersion),
    );
    expect(
      decodedSketchPalette.pluginVersion,
      equals(SketchPalette.validVersion),
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
