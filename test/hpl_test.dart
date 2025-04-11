import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/hpl/hpl1_v4.0.hpl': HomesitePalette(
      colors: [HomesitePaletteColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/hpl/hpl2_v4.0.hpl': HomesitePalette(
      colors: [HomesitePaletteColor(red: 0, green: 0, blue: 0)],
    ),
  };

  expectedData.forEach((filePath, expectedHpl) {
    group('HPL File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final hplFile = File(filePath);
        bytes = hplFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(HomesitePalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final hpl = HomesitePalette.fromBytes(bytes);

        // Compare colors
        expect(hpl.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (hpl.colors.isNotEmpty) {
          final firstColor = hpl.colors.first;
          final expectedFirstColor = expectedHpl.colors.first;

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

  test('isValidFormat returns false for invalid HPL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(HomesitePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write hpl file', () {
    final hpl = HomesitePalette(
      colors: [
        HomesitePaletteColor(red: 255, green: 0, blue: 0),
        HomesitePaletteColor(red: 0, green: 255, blue: 255),
        HomesitePaletteColor(red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final hplFile = File('./test/test.hpl');
    hplFile.writeAsBytesSync(hpl.toBytes());
    // print(hplFile.readAsStringSync());

    final decodedHpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());
    // print(decodedHpl.toJson());

    expect(decodedHpl.colors.length, equals(3));

    expect(decodedHpl.colors[0].red, equals(255));
    expect(decodedHpl.colors[0].green, equals(0));
    expect(decodedHpl.colors[0].blue, equals(0));

    expect(decodedHpl.colors[1].red, equals(0));
    expect(decodedHpl.colors[1].green, equals(255));
    expect(decodedHpl.colors[1].blue, equals(255));

    expect(decodedHpl.colors[2].red, equals(128));
    expect(decodedHpl.colors[2].green, equals(128));
    expect(decodedHpl.colors[2].blue, equals(128));

    // delete temp file
    hplFile.deleteSync();
  });
}
