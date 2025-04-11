import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/koffice/KDE40.colors': KOfficePalette(
      colors: [KOfficePaletteColor(r: 0, g: 0, b: 0, name: 'Black')],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('KOffice Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final kofficeFile = File(filePath);
        bytes = kofficeFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(KOfficePalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final kofficePalette = KOfficePalette.fromBytes(bytes);

        // Compare colors
        expect(
          kofficePalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (kofficePalette.colors.isNotEmpty) {
          final firstColor = kofficePalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.r,
            equals(expectedFirstColor.r),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.g,
            equals(expectedFirstColor.g),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.b,
            equals(expectedFirstColor.b),
            reason: 'Blue value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid KOfficePalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(KOfficePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write koffice file', () {
    final kofficePalette = KOfficePalette(
      colors: [
        KOfficePaletteColor(r: 255, g: 0, b: 0, name: 'Red'),
        KOfficePaletteColor(r: 0, g: 255, b: 0, name: 'Green'),
        KOfficePaletteColor(r: 0, g: 0, b: 255, name: 'Blue'),
        KOfficePaletteColor(r: 128, g: 128, b: 128, name: 'Gray'),
      ],
    );
    // print(kofficePalette.toJson());

    // write to temp file
    final tempFile = File('./test/test.colors');
    tempFile.writeAsBytesSync(kofficePalette.toBytes());
    // print(tempFile.readAsStringSync());

    final decodedPalette = KOfficePalette.fromBytes(tempFile.readAsBytesSync());
    // print(decodedPalette.toJson());

    expect(decodedPalette.colors.length, equals(4));

    expect(decodedPalette.colors[0].r, equals(255));
    expect(decodedPalette.colors[0].g, equals(0));
    expect(decodedPalette.colors[0].b, equals(0));
    expect(decodedPalette.colors[0].name, equals('Red'));

    expect(decodedPalette.colors[1].r, equals(0));
    expect(decodedPalette.colors[1].g, equals(255));
    expect(decodedPalette.colors[1].b, equals(0));
    expect(decodedPalette.colors[1].name, equals('Green'));

    expect(decodedPalette.colors[2].r, equals(0));
    expect(decodedPalette.colors[2].g, equals(0));
    expect(decodedPalette.colors[2].b, equals(255));
    expect(decodedPalette.colors[2].name, equals('Blue'));

    expect(decodedPalette.colors[3].r, equals(128));
    expect(decodedPalette.colors[3].g, equals(128));
    expect(decodedPalette.colors[3].b, equals(128));
    expect(decodedPalette.colors[3].name, equals('Gray'));

    // delete temp file
    tempFile.deleteSync();
  });
}
