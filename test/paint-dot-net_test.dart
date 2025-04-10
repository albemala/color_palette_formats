import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validPaintDotNetFiles = ['./assets/paint-dot-net/paint-dot-net1.txt'];

  for (final filePath in validPaintDotNetFiles) {
    test(
      'isValidFormat returns true for valid PaintDotNetPalette file: $filePath',
      () {
        final paintDotNetFile = File(filePath);
        final bytes = paintDotNetFile.readAsBytesSync();
        expect(PaintDotNetPalette.isValidFormat(bytes), isTrue);
      },
    );

    test('read paint-dot-net file: $filePath', () {
      final paintDotNetFile = File(filePath);
      final paintDotNet = PaintDotNetPalette.fromBytes(
        paintDotNetFile.readAsBytesSync(),
      );

      if (filePath == './assets/paint-dot-net/paint-dot-net1.txt') {
        expect(paintDotNet.colors.length, equals(96));
      }
    });
  }

  test('isValidFormat returns false for invalid PaintDotNetPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PaintDotNetPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write paint-dot-net file', () async {
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
