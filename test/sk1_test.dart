import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validSk1Files = [
    './assets/sk1/Fedora_color_palette.skp',
    './assets/sk1/Lible_Colors.skp',
    './assets/sk1/openSUSE_colors.skp',
    './assets/sk1/Ubuntu_colors.skp',
  ];

  for (final filePath in validSk1Files) {
    test(
      'isValidFormat returns true for valid sK1 Palette file: $filePath',
      () {
        final sk1File = File(filePath);
        final bytes = sk1File.readAsBytesSync();
        expect(Sk1Palette.isValidFormat(bytes), isTrue);
      },
    );

    test('read sk1 file: $filePath', () {
      final sk1File = File(filePath);
      final palette = Sk1Palette.fromBytes(sk1File.readAsBytesSync());

      // Basic verification for each file based on the new structure
      expect(
        palette.name,
        isNotEmpty,
        reason: 'Missing name (from set_name) in $filePath',
      );
      // Source and comments are optional, so we don't strictly check isNotEmpty
      expect(
        palette.columns,
        isPositive, // Columns should be a positive integer
        reason: 'Missing or invalid columns (from set_columns) in $filePath',
      );
      expect(
        palette.colors,
        isNotEmpty,
        reason: 'No colors found in $filePath',
      );

      // Verify first color has all required properties
      final firstColor = palette.colors.first;
      expect(
        firstColor.name,
        isNotEmpty, // Name should not be empty
        reason: 'First color missing name in $filePath',
      );
      expect(
        firstColor.colorSpace,
        isNotNull, // Enum should be set
        reason: 'First color missing colorSpace in $filePath',
      );
      expect(
        firstColor.values,
        isNotEmpty, // Should have at least one value
        reason: 'First color missing values in $filePath',
      );
      expect(
        firstColor.alpha,
        isNotNull, // Alpha should be present
        reason: 'First color missing alpha in $filePath',
      );
      // Check value ranges (0.0 to 1.0)
      expect(
        firstColor.values.every((v) => v >= 0.0 && v <= 1.0),
        isTrue,
        reason: 'First color has values out of range [0.0, 1.0] in $filePath',
      );
      expect(
        firstColor.alpha >= 0.0 && firstColor.alpha <= 1.0,
        isTrue,
        reason: 'First color has alpha out of range [0.0, 1.0] in $filePath',
      );
    });
  }

  test('isValidFormat returns false for invalid sK1 Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(Sk1Palette.isValidFormat(invalidBytes), isFalse);
    // Test with incorrect signature
    expect(
      Sk1Palette.isValidFormat(utf8.encode('##Invalid Sig\npalette()')),
      isFalse,
    );
    // Test with missing palette() command
    expect(
      Sk1Palette.isValidFormat(utf8.encode('##sK1 palette\nno command')),
      isFalse,
    );
    // Test with random text
    expect(Sk1Palette.isValidFormat(utf8.encode('this is just text')), isFalse);
  });

  test('write sk1 file', () async {
    final palette = Sk1Palette(
      name: 'Test SK1 Palette',
      source: 'Unit Test',
      comments: ['Comment 1', 'Comment 2 with \'single quote\''],
      columns: 2,
      colors: [
        Sk1Color(
          name: 'Test Red',
          colorSpace: Sk1ColorSpace.rgb,
          values: [1.0, 0.0, 0.0],
          alpha: 1.0,
        ),
        Sk1Color(
          name: 'Test Green',
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.0, 1.0, 0.0],
          alpha: 0.8,
        ),
        Sk1Color(
          name: 'Test Blue',
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.0, 0.0, 1.0],
          alpha: 1.0,
        ),
      ],
    );

    // Write to temp file
    final tempFile = File('./test/test_sk1.skp');
    tempFile.writeAsBytesSync(palette.toBytes());

    // Read back and verify
    final decodedPalette = Sk1Palette.fromBytes(tempFile.readAsBytesSync());

    // Verify palette metadata
    expect(decodedPalette.name, equals(palette.name));
    expect(decodedPalette.source, equals(palette.source));
    expect(decodedPalette.comments, equals(palette.comments));
    expect(decodedPalette.columns, equals(palette.columns));

    // Verify number of colors
    expect(decodedPalette.colors.length, equals(palette.colors.length));

    // Verify first color details
    expect(decodedPalette.colors[0].name, equals(palette.colors[0].name));
    expect(
      decodedPalette.colors[0].colorSpace,
      equals(palette.colors[0].colorSpace),
    );
    expect(decodedPalette.colors[0].values, equals(palette.colors[0].values));
    expect(decodedPalette.colors[0].alpha, equals(palette.colors[0].alpha));

    // Verify second color details
    expect(decodedPalette.colors[1].name, equals(palette.colors[1].name));
    expect(
      decodedPalette.colors[1].colorSpace,
      equals(palette.colors[1].colorSpace),
    );
    expect(decodedPalette.colors[1].values, equals(palette.colors[1].values));
    expect(decodedPalette.colors[1].alpha, equals(palette.colors[1].alpha));

    // Verify third color details
    expect(decodedPalette.colors[2].name, equals(palette.colors[2].name));
    expect(
      decodedPalette.colors[2].colorSpace,
      equals(palette.colors[2].colorSpace),
    );
    expect(decodedPalette.colors[2].values, equals(palette.colors[2].values));
    expect(decodedPalette.colors[2].alpha, equals(palette.colors[2].alpha));

    // Delete temp file
    tempFile.deleteSync();
  });
}
