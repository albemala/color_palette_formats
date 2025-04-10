import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validCorelDraw4PaletteFiles = ['./assets/coreldraw4/coreldraw.pal'];

  for (final filePath in validCorelDraw4PaletteFiles) {
    test(
      'isValidFormat returns true for valid CorelDraw4Palette file: $filePath',
      () {
        final corelFile = File(filePath);
        final bytes = corelFile.readAsBytesSync();
        expect(CorelDraw4Palette.isValidFormat(bytes), isTrue);
      },
    );

    test('read coreldraw4 pal file: $filePath', () {
      final corelFile = File(filePath);
      final corelPalette = CorelDraw4Palette.fromBytes(
        corelFile.readAsBytesSync(),
      );

      // Based on the provided assets/coreldraw4/coreldraw.pal content
      expect(corelPalette.colors.length, equals(12));

      // Check first color
      expect(corelPalette.colors[0].name, equals('PANTONE Process Yellow CH'));
      expect(corelPalette.colors[0].cyan, equals(0));
      expect(corelPalette.colors[0].magenta, equals(0));
      expect(corelPalette.colors[0].yellow, equals(100));
      expect(corelPalette.colors[0].black, equals(0));

      // Check last color (index 11)
      expect(corelPalette.colors[11].name, equals('PANTONE 103 CH'));
      expect(corelPalette.colors[11].cyan, equals(2));
      expect(corelPalette.colors[11].magenta, equals(0));
      expect(corelPalette.colors[11].yellow, equals(100));
      expect(corelPalette.colors[11].black, equals(20));
    });
  }

  test('isValidFormat returns false for invalid CorelDraw4Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(CorelDraw4Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('write coreldraw4 pal file', () async {
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
