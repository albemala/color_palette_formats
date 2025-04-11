import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/skencil/mini.spl': SkencilPalette(
      colors: [
        SkencilPaletteColor(red: 0.0, green: 0.0, blue: 0.0, name: 'Black'),
      ],
    ),
    './assets/skencil/www.spl': SkencilPalette(
      colors: [
        SkencilPaletteColor(red: 0.0, green: 0.0, blue: 0.0, name: '#000000'),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Skencil Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final skencilFile = File(filePath);
        bytes = skencilFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(SkencilPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final skencilPalette = SkencilPalette.fromBytes(bytes);

        // Compare colors
        expect(
          skencilPalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (skencilPalette.colors.isNotEmpty) {
          final firstColor = skencilPalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
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
        }
      });
    });
  });

  test('isValidFormat returns false for invalid SkencilPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SkencilPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write skencil file', () {
    final skencilPalette = SkencilPalette(
      colors: [
        SkencilPaletteColor(name: 'Test Red', red: 1.0, green: 0.0, blue: 0.0),
        SkencilPaletteColor(
          name: 'Test Green',
          red: 0.0,
          green: 1.0,
          blue: 0.0,
        ),
        SkencilPaletteColor(name: 'Test Blue', red: 0.0, green: 0.0, blue: 1.0),
        SkencilPaletteColor(name: 'Test Gray', red: 0.5, green: 0.5, blue: 0.5),
      ],
    );
    // print(skencilPalette.toJson()); // Optional: for debugging

    // write to temp file
    final tempFile = File('./test/test.spl');
    tempFile.writeAsBytesSync(skencilPalette.toBytes());
    // print(tempFile.readAsStringSync()); // Optional: for debugging

    final decodedPalette = SkencilPalette.fromBytes(tempFile.readAsBytesSync());
    // print(decodedPalette.toJson()); // Optional: for debugging

    expect(decodedPalette.colors.length, equals(4));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Test Red'));
    expect(decodedPalette.colors[0].red, closeTo(1.0, 0.000001));
    expect(decodedPalette.colors[0].green, closeTo(0.0, 0.000001));
    expect(decodedPalette.colors[0].blue, closeTo(0.0, 0.000001));

    // Verify last color
    expect(decodedPalette.colors[3].name, equals('Test Gray'));
    expect(decodedPalette.colors[3].red, closeTo(0.5, 0.000001));
    expect(decodedPalette.colors[3].green, closeTo(0.5, 0.000001));
    expect(decodedPalette.colors[3].blue, closeTo(0.5, 0.000001));

    // delete temp file
    tempFile.deleteSync();
  });
}
