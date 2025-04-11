import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/riff/riff1_v3.pal': ResourceInterchangeFileFormat(
      colors: [ResourceInterchangeFileFormatColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/riff/riff2_v3.pal': ResourceInterchangeFileFormat(
      colors: [
        ResourceInterchangeFileFormatColor(red: 255, green: 0, blue: 255),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedRiff) {
    group('RIFF Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final riffFile = File(filePath);
        bytes = riffFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ResourceInterchangeFileFormat.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final riff = ResourceInterchangeFileFormat.fromBytes(bytes);

        // Compare colors
        expect(riff.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (riff.colors.isNotEmpty) {
          final firstColor = riff.colors.first;
          final expectedFirstColor = expectedRiff.colors.first;

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

  test(
    'isValidFormat returns false for invalid ResourceInterchangeFileFormat file',
    () {
      final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // Example invalid data
      expect(
        ResourceInterchangeFileFormat.isValidFormat(invalidBytes),
        isFalse,
      );
    },
  );

  test('write riff file', () {
    final riff = ResourceInterchangeFileFormat(
      colors: [
        ResourceInterchangeFileFormatColor(red: 0, green: 0, blue: 255),
        ResourceInterchangeFileFormatColor(red: 0, green: 255, blue: 0),
        ResourceInterchangeFileFormatColor(red: 255, green: 0, blue: 0),
      ],
    );

    // write to temp file
    final riffFile = File('./test/test.pal');
    riffFile.writeAsBytesSync(riff.toBytes());

    final decodedRiff = ResourceInterchangeFileFormat.fromBytes(
      riffFile.readAsBytesSync(),
    );
    // print(decodedRiff.toJson());

    expect(decodedRiff.colors.length, equals(3));

    expect(decodedRiff.colors[0].red, equals(0));
    expect(decodedRiff.colors[0].green, equals(0));
    expect(decodedRiff.colors[0].blue, equals(255));

    expect(decodedRiff.colors[1].red, equals(0));
    expect(decodedRiff.colors[1].green, equals(255));
    expect(decodedRiff.colors[1].blue, equals(0));

    expect(decodedRiff.colors[2].red, equals(255));
    expect(decodedRiff.colors[2].green, equals(0));
    expect(decodedRiff.colors[2].blue, equals(0));

    // delete temp file
    riffFile.deleteSync();
  });
}
