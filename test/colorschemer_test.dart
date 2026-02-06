import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/colorschemer/Pumpkin.cs': ColorSchemerPalette(
      version: 3,
      baseColor: [0x55, 0x11, 0x00],
      colors: [
        ColorSchemerColor(
          name: '#331100',
          red: 0x33,
          green: 0x11,
          blue: 0x00,
          hexValue: '331100',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('ColorSchemer File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final file = File(filePath);
        bytes = file.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ColorSchemerPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = ColorSchemerPalette.fromBytes(bytes);

        // Compare version
        expect(palette.version, equals(expectedPalette.version));

        // Compare base color
        expect(palette.baseColor.length, equals(3));
        expect(palette.baseColor[0], equals(expectedPalette.baseColor[0]));
        expect(palette.baseColor[1], equals(expectedPalette.baseColor[1]));
        expect(palette.baseColor[2], equals(expectedPalette.baseColor[2]));

        // Compare colors
        expect(
          palette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (palette.colors.isNotEmpty) {
          final firstColor = palette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue mismatch for the first color',
          );
          expect(
            firstColor.hexValue,
            equals(expectedFirstColor.hexValue),
            reason: 'Hex value mismatch for the first color',
          );
          expect(
            firstColor.developed,
            equals(expectedFirstColor.developed),
            reason: 'Developed flag mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid CS file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(ColorSchemerPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write cs file', () {
    final palette = ColorSchemerPalette(
      version: 3,
      baseColor: [0xFF, 0x00, 0x00],
      colors: [
        ColorSchemerColor(
          name: 'Red',
          red: 255,
          green: 0,
          blue: 0,
          hexValue: 'FF0000',
          developed: true,
        ),
        ColorSchemerColor(
          name: 'Green',
          red: 0,
          green: 255,
          blue: 0,
          hexValue: '00FF00',
          // developed: false,
        ),
        ColorSchemerColor(
          name: 'Blue',
          red: 0,
          green: 0,
          blue: 255,
          hexValue: '0000FF',
          developed: true,
        ),
      ],
    );

    // write to temp file
    final csFile = File('./test/test.cs');
    csFile.writeAsBytesSync(palette.toBytes());

    final decodedPalette = ColorSchemerPalette.fromBytes(
      csFile.readAsBytesSync(),
    );

    expect(decodedPalette.version, equals(3));
    expect(decodedPalette.baseColor, equals([0xFF, 0x00, 0x00]));
    expect(decodedPalette.colors.length, equals(3));

    expect(decodedPalette.colors[0].name, equals('Red'));
    expect(decodedPalette.colors[0].red, equals(255));
    expect(decodedPalette.colors[0].green, equals(0));
    expect(decodedPalette.colors[0].blue, equals(0));
    expect(decodedPalette.colors[0].hexValue, equals('FF0000'));
    expect(decodedPalette.colors[0].developed, isTrue);

    expect(decodedPalette.colors[1].name, equals('Green'));
    expect(decodedPalette.colors[1].red, equals(0));
    expect(decodedPalette.colors[1].green, equals(255));
    expect(decodedPalette.colors[1].blue, equals(0));
    expect(decodedPalette.colors[1].hexValue, equals('00FF00'));
    expect(decodedPalette.colors[1].developed, isFalse);

    expect(decodedPalette.colors[2].name, equals('Blue'));
    expect(decodedPalette.colors[2].red, equals(0));
    expect(decodedPalette.colors[2].green, equals(0));
    expect(decodedPalette.colors[2].blue, equals(255));
    expect(decodedPalette.colors[2].hexValue, equals('0000FF'));
    expect(decodedPalette.colors[2].developed, isTrue);

    // delete temp file
    csFile.deleteSync();
  });
}
