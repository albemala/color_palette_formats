import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/gimp/gpl1.gimp': GimpPalette(
      colors: [
        GimpPaletteColor(
          red: 255,
          green: 255,
          blue: 255,
          name: 'RGB = 255 255 255, Hex = FFFFFF',
        ),
      ],
    ),
    './assets/gimp/gpl2.gpl': GimpPalette(
      colors: [
        GimpPaletteColor(red: 56, green: 37, blue: 9, name: 'wood brown6'),
      ],
    ),
    './assets/gimp/cromatica.gpl': GimpPalette(
      colors: [
        GimpPaletteColor(red: 251, green: 248, blue: 253, name: 'fbf8fd'),
      ],
    ),
    './assets/gimp/shido-10.gpl': GimpPalette(
      colors: [GimpPaletteColor(red: 0, green: 0, blue: 0, name: '000000')],
    ),
    './assets/gimp/sunfall.gpl': GimpPalette(
      colors: [GimpPaletteColor(red: 0, green: 8, blue: 9, name: '000809')],
    ),
  };

  expectedData.forEach((filePath, expectedGimp) {
    group('GIMP Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final gimpFile = File(filePath);
        bytes = gimpFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(GimpPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final gimp = GimpPalette.fromBytes(bytes);

        // Compare colors
        expect(gimp.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (gimp.colors.isNotEmpty) {
          final firstColor = gimp.colors.first;
          final expectedFirstColor = expectedGimp.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid GimpPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(GimpPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write gimp file', () {
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
