import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/sk1/Fedora_color_palette.skp': Sk1Palette(
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
          alpha: 1,
          name: 'Fedora Blue',
        ),
      ],
    ),
    'test/testdata/sk1/Lible_Colors.skp': Sk1Palette(
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
          alpha: 1,
          name: 'LibreGreen',
        ),
      ],
    ),
    'test/testdata/sk1/openSUSE_colors.skp': Sk1Palette(
      name: 'openSUSE colors',
      columns: 1,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.9882352941176471, 0.6823529411764706, 0.10588235294117647],
          alpha: 1,
          name: 'Light Orange',
        ),
      ],
    ),
    'test/testdata/sk1/Ubuntu_colors.skp': Sk1Palette(
      name: 'Ubuntu colors',
      columns: 1,
      colors: [
        Sk1Color(
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.8666666666666667, 0.2823529411764706, 0.0784313725490196],
          alpha: 1,
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
      comments: ['Comment 1', "Comment 2 with 'single quote'"],
      columns: 2,
      colors: [
        Sk1Color(
          name: 'Test Red',
          colorSpace: Sk1ColorSpace.rgb,
          values: [1.0, 0.0, 0.0],
          alpha: 1,
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
          alpha: 1,
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

  test('round-trips names containing commas, brackets and quotes', () {
    final palette = Sk1Palette(
      name: 'Tricky names',
      columns: 1,
      colors: [
        Sk1Color(
          name: 'Red, bright',
          colorSpace: Sk1ColorSpace.rgb,
          values: [1.0, 0.0, 0.0],
          alpha: 1,
        ),
        Sk1Color(
          name: 'Blue [dark]',
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.0, 0.0, 1.0],
          alpha: 1,
        ),
        Sk1Color(
          name: "It's green",
          colorSpace: Sk1ColorSpace.rgb,
          values: [0.0, 1.0, 0.0],
          alpha: 1,
        ),
      ],
    );

    final decoded = Sk1Palette.fromBytes(palette.toBytes());
    expect(
      decoded.colors.map((c) => c.name).toList(),
      equals(['Red, bright', 'Blue [dark]', "It's green"]),
    );
  });

  test('rejects malformed color data', () {
    String fileWith(String colorLine) => '''
##sK1 palette
palette()
set_name('N')
set_columns(1)
$colorLine
palette_end()
''';

    // Wrong value count for the color space.
    expect(
      () => Sk1Palette.fromBytes(
        fileWith("color(['RGB', [1.0, 0.0], 1.0, 'X'])").codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
    // Non-finite and out-of-range channel values.
    for (final bad in ['NaN', 'Infinity', '-Infinity', '1.5', '-0.1']) {
      expect(
        () => Sk1Palette.fromBytes(
          fileWith("color(['RGB', [$bad, 0.0, 0.0], 1.0, 'X'])").codeUnits,
        ),
        throwsA(isA<FormatException>()),
        reason: 'value $bad',
      );
    }
    // Out-of-range alpha.
    expect(
      () => Sk1Palette.fromBytes(
        fileWith("color(['RGB', [1.0, 0.0, 0.0], 1.5, 'X'])").codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
    // Unknown color space.
    expect(
      () => Sk1Palette.fromBytes(
        fileWith("color(['LAB', [1.0, 0.0, 0.0], 1.0, 'X'])").codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
    // Negative and non-numeric columns.
    expect(
      () => Sk1Palette.fromBytes(
        '''
##sK1 palette
palette()
set_name('N')
set_columns(-1)
palette_end()
'''.codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => Sk1Palette.fromBytes(
        '''
##sK1 palette
palette()
set_name('N')
set_columns(two)
palette_end()
'''.codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
    // Unknown commands are skipped, so a missing name still reports
    // the missing name rather than the typo.
    expect(
      () => Sk1Palette.fromBytes(
        '''
##sK1 palette
palette()
set_nmae('N')
set_columns(1)
palette_end()
'''.codeUnits,
      ),
      throwsA(isA<FormatException>()),
    );
  });

  test('decodes lone-CR line endings', () {
    final bytes = File('test/testdata/sk1/Ubuntu_colors.skp').readAsBytesSync();
    final crBytes = ascii.decode(bytes).replaceAll('\n', '\r').codeUnits;
    final palette = Sk1Palette.fromBytes(crBytes);
    expect(palette.name, equals('Ubuntu colors'));
    expect(palette.colors.length, equals(9));
    expect(palette.colors.first.name, equals('Ubuntu orange'));
  });

  test('isValidFormat rejects structurally invalid files', () {
    // Missing palette name.
    expect(
      Sk1Palette.isValidFormat(
        '##sK1 palette\npalette()\nset_columns(1)\npalette_end()\n'.codeUnits,
      ),
      isFalse,
    );
    // Corrupt color data.
    expect(
      Sk1Palette.isValidFormat(
        '''
##sK1 palette
palette()
set_name('N')
set_columns(1)
color(['RGB', [1.0], 1.0, 'X'])
palette_end()
'''.codeUnits,
      ),
      isFalse,
    );
    // Invalid UTF-8.
    expect(Sk1Palette.isValidFormat([0xFF, 0xFE, 0xFD]), isFalse);
  });

  test('encoder rejects invalid palettes', () {
    Sk1Palette paletteWith({
      String name = 'N',
      int columns = 1,
      List<Sk1Color>? colors,
    }) => Sk1Palette(
      name: name,
      columns: columns,
      colors:
          colors ??
          [
            Sk1Color(
              name: 'X',
              colorSpace: Sk1ColorSpace.rgb,
              values: [1.0, 0.0, 0.0],
              alpha: 1,
            ),
          ],
    );

    expect(
      () => paletteWith(columns: -1).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => paletteWith(name: 'a\nb').toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () =>
          Sk1Palette(
            name: 'N',
            columns: 1,
            colors: [
              Sk1Color(
                name: 'a\rb',
                colorSpace: Sk1ColorSpace.rgb,
                values: [1.0, 0.0, 0.0],
                alpha: 1,
              ),
            ],
          ).toBytes(),
      throwsA(isA<FormatException>()),
    );
    // Comment and source line breaks are rejected too.
    expect(
      () =>
          Sk1Palette(
            name: 'N',
            columns: 1,
            comments: ['ok', 'a\nb'],
            colors: [],
          ).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () =>
          Sk1Palette(
            name: 'N',
            source: 'a\nb',
            columns: 1,
            colors: [],
          ).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final path in [
      'test/testdata/sk1/Fedora_color_palette.skp',
      'test/testdata/sk1/Lible_Colors.skp',
      'test/testdata/sk1/openSUSE_colors.skp',
      'test/testdata/sk1/Ubuntu_colors.skp',
    ]) {
      final bytes = File(path).readAsBytesSync();
      final once = Sk1Palette.fromBytes(bytes);
      final twice = Sk1Palette.fromBytes(once.toBytes());
      expect(twice.name, equals(once.name), reason: path);
      expect(twice.source, equals(once.source), reason: path);
      expect(twice.comments, equals(once.comments), reason: path);
      expect(twice.columns, equals(once.columns), reason: path);
      expect(twice.colors.length, equals(once.colors.length), reason: path);
      for (var i = 0; i < once.colors.length; i++) {
        expect(twice.colors[i].name, equals(once.colors[i].name));
        expect(twice.colors[i].colorSpace, equals(once.colors[i].colorSpace));
        for (var j = 0; j < once.colors[i].values.length; j++) {
          expect(
            twice.colors[i].values[j],
            closeTo(once.colors[i].values[j], 1e-12),
          );
        }
        expect(twice.colors[i].alpha, closeTo(once.colors[i].alpha, 1e-12));
      }
    }
  });
}
