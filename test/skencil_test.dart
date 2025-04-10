import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validSkencilFiles = [
    './assets/skencil/mini.spl',
    './assets/skencil/www.spl',
  ];

  for (final filePath in validSkencilFiles) {
    test(
      'isValidFormat returns true for valid SkencilPalette file: $filePath',
      () {
        final skencilFile = File(filePath);
        final bytes = skencilFile.readAsBytesSync();
        expect(SkencilPalette.isValidFormat(bytes), isTrue);
      },
    );

    test('read skencil file: $filePath', () {
      final skencilFile = File(filePath);
      final skencilPalette = SkencilPalette.fromBytes(
        skencilFile.readAsBytesSync(),
      );
      // print(skencilPalette.toJson()); // Optional: for debugging

      if (filePath == './assets/skencil/mini.spl') {
        // Based on the content of assets/skencil/mini.spl
        expect(skencilPalette.colors.length, equals(23));

        // Check first color (Black)
        expect(skencilPalette.colors[0].name, equals('Black'));
        expect(skencilPalette.colors[0].red, closeTo(0.0, 0.000001));
        expect(skencilPalette.colors[0].green, closeTo(0.0, 0.000001));
        expect(skencilPalette.colors[0].blue, closeTo(0.0, 0.000001));

        // Check last color (Dark Yellow)
        expect(skencilPalette.colors[22].name, equals('Dark Yellow'));
        expect(skencilPalette.colors[22].red, closeTo(0.5, 0.000001));
        expect(skencilPalette.colors[22].green, closeTo(0.5, 0.000001));
        expect(skencilPalette.colors[22].blue, closeTo(0.0, 0.000001));
      } else if (filePath == './assets/skencil/www.spl') {
        // Based on the content of assets/skencil/www.spl
        expect(skencilPalette.colors.length, equals(216)); // 6x6x6 color cube

        // Check first color (#000000)
        expect(skencilPalette.colors[0].name, equals('#000000'));
        expect(skencilPalette.colors[0].red, closeTo(0.0, 0.000001));
        expect(skencilPalette.colors[0].green, closeTo(0.0, 0.000001));
        expect(skencilPalette.colors[0].blue, closeTo(0.0, 0.000001));

        // Check last color (#ffffff)
        expect(skencilPalette.colors[215].name, equals('#ffffff'));
        expect(skencilPalette.colors[215].red, closeTo(1.0, 0.000001));
        expect(skencilPalette.colors[215].green, closeTo(1.0, 0.000001));
        expect(skencilPalette.colors[215].blue, closeTo(1.0, 0.000001));
      }
    });
  }

  test('isValidFormat returns false for invalid SkencilPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SkencilPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write skencil file', () async {
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
