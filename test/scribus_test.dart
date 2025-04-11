import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/scribus/Scribus.xml': ScribusPalette(
      name: 'tango',
      colors: [
        ScribusColor(
          name: ' Aluminum 1',
          rgb: '#eeeeec',
          spot: '0',
          register: '0',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Scribus Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final scribusFile = File(filePath);
        bytes = scribusFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ScribusPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = ScribusPalette.fromBytes(bytes);

        // Verify palette name
        expect(
          palette.name,
          equals(expectedPalette.name),
          reason: 'Palette name mismatch',
        );

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
            firstColor.rgb,
            equals(expectedFirstColor.rgb),
            reason: 'RGB value mismatch for the first color',
          );
          expect(
            firstColor.spot,
            equals(expectedFirstColor.spot),
            reason: 'Spot value mismatch for the first color',
          );
          expect(
            firstColor.register,
            equals(expectedFirstColor.register),
            reason: 'Register value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid Scribus Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ScribusPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write scribus file', () {
    final palette = ScribusPalette(
      name: 'Test Scribus Palette',
      colors: [
        ScribusColor(
          name: 'Test Red',
          rgb: '#FF0000',
          spot: '1', // Example non-default value
          register: '0',
        ),
        ScribusColor(
          name: 'Test Green',
          rgb: '#00FF00',
          // spot and register will use defaults ("0")
        ),
        ScribusColor(
          name: 'Test Blue',
          rgb: '#0000FF',
          spot: '0',
          register: '1', // Example non-default value
        ),
      ],
    );

    // Write to temp file
    final tempFile = File('./test/test_scribus.xml');
    tempFile.writeAsBytesSync(palette.toBytes());

    // Read back and verify
    final decodedPalette = ScribusPalette.fromBytes(tempFile.readAsBytesSync());

    // Verify palette name
    expect(decodedPalette.name, equals(palette.name));

    // Verify number of colors
    expect(decodedPalette.colors.length, equals(palette.colors.length));

    // Verify first color details
    expect(decodedPalette.colors[0].name, equals(palette.colors[0].name));
    expect(decodedPalette.colors[0].rgb, equals(palette.colors[0].rgb));
    expect(decodedPalette.colors[0].spot, equals(palette.colors[0].spot));
    expect(
      decodedPalette.colors[0].register,
      equals(palette.colors[0].register),
    );

    // Verify second color details (including defaults)
    expect(decodedPalette.colors[1].name, equals(palette.colors[1].name));
    expect(decodedPalette.colors[1].rgb, equals(palette.colors[1].rgb));
    expect(decodedPalette.colors[1].spot, equals('0')); // Check default
    expect(decodedPalette.colors[1].register, equals('0')); // Check default

    // Verify third color details
    expect(decodedPalette.colors[2].name, equals(palette.colors[2].name));
    expect(decodedPalette.colors[2].rgb, equals(palette.colors[2].rgb));
    expect(decodedPalette.colors[2].spot, equals(palette.colors[2].spot));
    expect(
      decodedPalette.colors[2].register,
      equals(palette.colors[2].register),
    );

    // Delete temp file
    tempFile.deleteSync();
  });
}
