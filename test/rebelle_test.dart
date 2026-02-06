import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rebelle Palette File: default.colors', () {
    late List<int> bytes;

    setUpAll(() {
      final rebelleFile = File('./assets/rebelle/default.colors');
      bytes = rebelleFile.readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(RebellePalette.isValidFormat(bytes), isTrue);
    });

    test('parses correctly', () {
      final rebellePalette = RebellePalette.fromBytes(bytes);

      // The default.colors file has 96 colors (all hex values, no names)
      expect(rebellePalette.colors.length, equals(96));

      // Check first color (black)
      final firstColor = rebellePalette.colors.first;
      expect(firstColor.red, equals(0));
      expect(firstColor.green, equals(0));
      expect(firstColor.blue, equals(0));
      expect(firstColor.name, equals(''));

      // Check a middle color (white at index 4)
      final whiteColor = rebellePalette.colors[4];
      expect(whiteColor.red, equals(255));
      expect(whiteColor.green, equals(255));
      expect(whiteColor.blue, equals(255));
      expect(whiteColor.name, equals(''));

      // Check red at index 5
      final redColor = rebellePalette.colors[5];
      expect(redColor.red, equals(255));
      expect(redColor.green, equals(0));
      expect(redColor.blue, equals(0));
      expect(redColor.name, equals(''));
    });
  });

  test('isValidFormat returns false for invalid RebellePalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(RebellePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write rebelle file', () {
    final rebellePalette = RebellePalette(
      colors: [
        RebellePaletteColor(name: 'Red', red: 255, green: 0, blue: 0),
        RebellePaletteColor(name: 'Green', red: 0, green: 255, blue: 0),
        RebellePaletteColor(name: 'Blue', red: 0, green: 0, blue: 255),
        RebellePaletteColor(name: '', red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final tempFile = File('./test/test.colors');
    tempFile.writeAsBytesSync(rebellePalette.toBytes());

    final decodedPalette = RebellePalette.fromBytes(tempFile.readAsBytesSync());

    expect(decodedPalette.colors.length, equals(4));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Red'));
    expect(decodedPalette.colors[0].red, equals(255));
    expect(decodedPalette.colors[0].green, equals(0));
    expect(decodedPalette.colors[0].blue, equals(0));

    // Verify second color
    expect(decodedPalette.colors[1].name, equals('Green'));
    expect(decodedPalette.colors[1].red, equals(0));
    expect(decodedPalette.colors[1].green, equals(255));
    expect(decodedPalette.colors[1].blue, equals(0));

    // Verify third color
    expect(decodedPalette.colors[2].name, equals('Blue'));
    expect(decodedPalette.colors[2].red, equals(0));
    expect(decodedPalette.colors[2].green, equals(0));
    expect(decodedPalette.colors[2].blue, equals(255));

    // Verify last color (with empty name)
    expect(decodedPalette.colors[3].name, equals(''));
    expect(decodedPalette.colors[3].red, equals(128));
    expect(decodedPalette.colors[3].green, equals(128));
    expect(decodedPalette.colors[3].blue, equals(128));

    // delete temp file
    tempFile.deleteSync();
  });

  test('round-trip with empty names', () {
    final original = RebellePalette(
      colors: [
        RebellePaletteColor(name: '', red: 0, green: 0, blue: 0),
        RebellePaletteColor(name: '', red: 255, green: 255, blue: 255),
      ],
    );

    final encoded = original.toBytes();
    final decoded = RebellePalette.fromBytes(encoded);

    expect(decoded.colors.length, equals(2));
    expect(decoded.colors[0].name, equals(''));
    expect(decoded.colors[1].name, equals(''));
  });
}
