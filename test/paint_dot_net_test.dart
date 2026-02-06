import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/paint-dot-net/paint-dot-net1.txt': PaintDotNetPalette(
      colors: [PaintDotNetPaletteColor(red: 0, green: 0, blue: 0, alpha: 255)],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Paint.NET Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final paintDotNetFile = File(filePath);
        bytes = paintDotNetFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(PaintDotNetPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final paintDotNet = PaintDotNetPalette.fromBytes(bytes);

        // Compare colors
        expect(
          paintDotNet.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (paintDotNet.colors.isNotEmpty) {
          final firstColor = paintDotNet.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

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
          expect(
            firstColor.alpha,
            equals(expectedFirstColor.alpha),
            reason: 'Alpha value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid PaintDotNetPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PaintDotNetPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write paint-dot-net file', () {
    final paintDotNet = PaintDotNetPalette(
      colors: [
        PaintDotNetPaletteColor(red: 255, green: 0, blue: 0, alpha: 255),
        PaintDotNetPaletteColor(red: 0, green: 255, blue: 255, alpha: 255),
        PaintDotNetPaletteColor(red: 128, green: 128, blue: 128, alpha: 255),
      ],
    );

    // write to temp file
    final paintDotNetFile = File('./test/test.txt');
    paintDotNetFile.writeAsBytesSync(paintDotNet.toBytes());
    // print(paintDotNetFile.readAsStringSync());

    final decodedPaintDotNet = PaintDotNetPalette.fromBytes(
      paintDotNetFile.readAsBytesSync(),
    );
    // print(decodedPaintDotNet.toJson());

    expect(decodedPaintDotNet.colors.length, equals(3));

    expect(decodedPaintDotNet.colors[0].red, equals(255));
    expect(decodedPaintDotNet.colors[0].green, equals(0));
    expect(decodedPaintDotNet.colors[0].blue, equals(0));
    expect(decodedPaintDotNet.colors[0].alpha, equals(255));

    expect(decodedPaintDotNet.colors[1].red, equals(0));
    expect(decodedPaintDotNet.colors[1].green, equals(255));
    expect(decodedPaintDotNet.colors[1].blue, equals(255));
    expect(decodedPaintDotNet.colors[1].alpha, equals(255));

    expect(decodedPaintDotNet.colors[2].red, equals(128));
    expect(decodedPaintDotNet.colors[2].green, equals(128));
    expect(decodedPaintDotNet.colors[2].blue, equals(128));
    expect(decodedPaintDotNet.colors[2].alpha, equals(255));

    // delete temp file
    paintDotNetFile.deleteSync();
  });
}
