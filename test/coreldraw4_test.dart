import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/coreldraw4/coreldraw.pal': CorelDraw4Palette(
      colors: [
        CorelDraw4PaletteColor(
          cyan: 0,
          magenta: 0,
          yellow: 100,
          black: 0,
          name: 'PANTONE Process Yellow CH',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('CorelDraw4 Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final corelFile = File(filePath);
        bytes = corelFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(CorelDraw4Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final corelPalette = CorelDraw4Palette.fromBytes(bytes);

        // Compare colors
        expect(
          corelPalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (corelPalette.colors.isNotEmpty) {
          final firstColor = corelPalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.cyan,
            equals(expectedFirstColor.cyan),
            reason: 'Cyan value mismatch for the first color',
          );
          expect(
            firstColor.magenta,
            equals(expectedFirstColor.magenta),
            reason: 'Magenta value mismatch for the first color',
          );
          expect(
            firstColor.yellow,
            equals(expectedFirstColor.yellow),
            reason: 'Yellow value mismatch for the first color',
          );
          expect(
            firstColor.black,
            equals(expectedFirstColor.black),
            reason: 'Black value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid CorelDraw4Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(CorelDraw4Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('write coreldraw4 pal file', () {
    final corelPalette = CorelDraw4Palette(
      colors: [
        CorelDraw4PaletteColor(
          name: 'Test Cyan',
          cyan: 100,
          magenta: 0,
          yellow: 0,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Magenta',
          cyan: 0,
          magenta: 100,
          yellow: 0,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Yellow',
          cyan: 0,
          magenta: 0,
          yellow: 100,
          black: 0,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Black',
          cyan: 0,
          magenta: 0,
          yellow: 0,
          black: 100,
        ),
        CorelDraw4PaletteColor(
          name: 'Test Gray 50%',
          cyan: 0,
          magenta: 0,
          yellow: 0,
          black: 50,
        ),
      ],
    );

    // write to temp file
    final tempFile = File('./test/test_coreldraw4.pal');
    tempFile.writeAsBytesSync(corelPalette.toBytes());
    // print(tempFile.readAsStringSync()); // Optional: for debugging

    final decodedPalette = CorelDraw4Palette.fromBytes(
      tempFile.readAsBytesSync(),
    );

    expect(decodedPalette.colors.length, equals(5));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Test Cyan'));
    expect(decodedPalette.colors[0].cyan, equals(100));
    expect(decodedPalette.colors[0].magenta, equals(0));
    expect(decodedPalette.colors[0].yellow, equals(0));
    expect(decodedPalette.colors[0].black, equals(0));

    // Verify last color
    expect(decodedPalette.colors[4].name, equals('Test Gray 50%'));
    expect(decodedPalette.colors[4].cyan, equals(0));
    expect(decodedPalette.colors[4].magenta, equals(0));
    expect(decodedPalette.colors[4].yellow, equals(0));
    expect(decodedPalette.colors[4].black, equals(50));

    // delete temp file
    tempFile.deleteSync();
  });
}
