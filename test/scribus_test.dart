import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid Scribus Palette file', () {
    final scribusFile = File('./assets/scribus/Scribus.xml');
    final bytes = scribusFile.readAsBytesSync();
    expect(ScribusPalette.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid Scribus Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ScribusPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('read scribus file', () {
    final scribusFile = File('./assets/scribus/Scribus.xml');
    final palette = ScribusPalette.fromBytes(scribusFile.readAsBytesSync());

    // Verify palette name
    expect(palette.name, equals('tango'));

    // Verify number of colors (count from the example file)
    expect(palette.colors.length, equals(66));

    // Verify details of the first color
    expect(palette.colors[0].name, equals(' Aluminum 1'));
    expect(palette.colors[0].rgb, equals('#eeeeec'));
    expect(palette.colors[0].spot, equals('0'));
    expect(palette.colors[0].register, equals('0'));

    // Verify details of the color at index 8
    expect(palette.colors[8].name, equals(' Blue 3'));
    expect(palette.colors[8].rgb, equals('#214184'));
    expect(palette.colors[8].spot, equals('0'));
    expect(palette.colors[8].register, equals('0'));
  });

  test('write scribus file', () async {
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
