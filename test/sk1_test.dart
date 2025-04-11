import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/sk1/Fedora_color_palette.skp': Sk1Palette(
      name: 'Fedora color palette',
      columns: 2,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [
            0.23529411764705882,
            0.43137254901960786,
            0.7058823529411765,
          ],
          alpha: 1.0,
          name: 'Fedora Blue',
        ),
      ],
    ),
    './assets/sk1/Lible_Colors.skp': Sk1Palette(
      name: 'Lible Colors',
      columns: 4,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [
            0.09411764705882353,
            0.6392156862745098,
            0.011764705882352941,
          ],
          alpha: 1.0,
          name: 'LibreGreen',
        ),
      ],
    ),
    './assets/sk1/openSUSE_colors.skp': Sk1Palette(
      name: 'openSUSE colors',
      columns: 1,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.9882352941176471, 0.6823529411764706, 0.10588235294117647],
          alpha: 1.0,
          name: 'Light Orange',
        ),
      ],
    ),
    './assets/sk1/Ubuntu_colors.skp': Sk1Palette(
      name: 'Ubuntu colors',
      columns: 1,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.8666666666666667, 0.2823529411764706, 0.0784313725490196],
          alpha: 1.0,
          name: 'Ubuntu orange',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('sK1 Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final sk1File = File(filePath);
        bytes = sk1File.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(Sk1Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = Sk1Palette.fromBytes(bytes);

        // Verify palette metadata (name and columns are required)
        expect(
          palette.name,
          equals(expectedPalette.name),
          reason: 'Palette name mismatch',
        );
        expect(
          palette.columns,
          equals(expectedPalette.columns),
          reason: 'Columns mismatch',
        );
        // Source and comments are optional, so we don't compare them strictly

        // Compare colors
        expect(
          palette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (palette.colors.isNotEmpty) {
          final firstColor = palette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.colorSpace,
            equals(expectedFirstColor.colorSpace),
            reason: 'ColorSpace mismatch for the first color',
          );
          // Compare values list
          expect(
            firstColor.values.length,
            equals(expectedFirstColor.values.length),
            reason: 'Values length mismatch for the first color',
          );
          for (var i = 0; i < firstColor.values.length; i++) {
            expect(
              firstColor.values[i],
              closeTo(expectedFirstColor.values[i], 1e-9),
              reason: 'Value mismatch at index $i for the first color',
            );
          }
          expect(
            firstColor.alpha,
            closeTo(expectedFirstColor.alpha, 1e-9),
            reason: 'Alpha value mismatch for the first color',
          );
        }
      });
    });
  });

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

  test('write sk1 file', () {
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
