import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final assetsDir = Directory('./assets/sk1');
  final sk1Files =
      assetsDir
          .listSync()
          .where((item) => item.path.endsWith('.skp'))
          .map((item) => File(item.path))
          .toList();

  test('isValidFormat returns true for all valid sK1 Palette files', () {
    expect(
      sk1Files.isNotEmpty,
      isTrue,
      reason: 'No .skp files found in assets/sk1/',
    );
    for (final file in sk1Files) {
      final bytes = file.readAsBytesSync();
      expect(
        Sk1Palette.isValidFormat(bytes),
        isTrue,
        reason: 'Failed for ${file.path}',
      );
    }
  });

  test('isValidFormat returns false for invalid sK1 Palette data', () {
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

  test('read all sk1 files from assets', () {
    expect(
      sk1Files.isNotEmpty,
      isTrue,
      reason: 'No .skp files found in assets/sk1/',
    );
    for (final file in sk1Files) {
      // print('Testing file: ${file.path}'); // Optional: for debugging
      final bytes = file.readAsBytesSync();
      final palette = Sk1Palette.fromBytes(bytes);

      // Basic verification for each file based on the new structure
      expect(
        palette.name,
        isNotEmpty,
        reason: 'Missing name (from set_name) in ${file.path}',
      );
      // Source and comments are optional, so we don't strictly check isNotEmpty
      expect(
        palette.columns,
        isPositive, // Columns should be a positive integer
        reason: 'Missing or invalid columns (from set_columns) in ${file.path}',
      );
      expect(
        palette.colors,
        isNotEmpty,
        reason: 'No colors found in ${file.path}',
      );

      // Verify first color has all required properties
      final firstColor = palette.colors.first;
      expect(
        firstColor.name,
        isNotEmpty, // Name should not be empty
        reason: 'First color missing name in ${file.path}',
      );
      expect(
        firstColor.colorSpace,
        isNotNull, // Enum should be set
        reason: 'First color missing colorSpace in ${file.path}',
      );
      expect(
        firstColor.values,
        isNotEmpty, // Should have at least one value
        reason: 'First color missing values in ${file.path}',
      );
      expect(
        firstColor.alpha,
        isNotNull, // Alpha should be present
        reason: 'First color missing alpha in ${file.path}',
      );
      // Check value ranges (0.0 to 1.0)
      expect(
        firstColor.values.every((v) => v >= 0.0 && v <= 1.0),
        isTrue,
        reason:
            'First color has values out of range [0.0, 1.0] in ${file.path}',
      );
      expect(
        firstColor.alpha >= 0.0 && firstColor.alpha <= 1.0,
        isTrue,
        reason: 'First color has alpha out of range [0.0, 1.0] in ${file.path}',
      );
    }
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
