import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/artrage/Colors.col': Artrage6Palette(
      name: 'ArtRage 6 Palette', // Hardcoded in decode.dart
      colors: [
        Artrage6Color(name: 'Lemon Yellow', red: 251, green: 234, blue: 53),
        Artrage6Color(name: 'Bismuth Yellow', red: 253, green: 236, blue: 38),
        Artrage6Color(name: 'Cadmium Lemon', red: 253, green: 236, blue: 38),
        Artrage6Color(name: 'Winsor Lemon', red: 253, green: 236, blue: 38),
        Artrage6Color(
          name: 'Lemon Yellow Deep',
          red: 253,
          green: 236,
          blue: 38,
        ),
        Artrage6Color(name: 'Aureolin', red: 245, green: 212, blue: 27),
        Artrage6Color(
          name: 'Transparent Yellow',
          red: 245,
          green: 212,
          blue: 27,
        ),
        Artrage6Color(
          name: 'Cadmium Yellow Pale',
          red: 249,
          green: 221,
          blue: 35,
        ),
        Artrage6Color(name: "Turner's Yellow", red: 249, green: 221, blue: 35),
        Artrage6Color(name: 'New Gamboge', red: 249, green: 221, blue: 35),
        Artrage6Color(name: 'Cadmium Yellow', red: 241, green: 201, blue: 27),
        Artrage6Color(
          name: 'Winsor Yellow Deep',
          red: 238,
          green: 178,
          blue: 32,
        ),
        Artrage6Color(name: 'Indian Yellow', red: 232, green: 157, blue: 31),
        Artrage6Color(
          name: 'Cadmium Yellow Deep',
          red: 229,
          green: 146,
          blue: 28,
        ),
        Artrage6Color(name: 'Cadmium Orange', red: 215, green: 105, blue: 26),
        Artrage6Color(name: 'Winsor Orange', red: 223, green: 127, blue: 27),
        Artrage6Color(
          name: 'Winsor Orange (Red Shade)',
          red: 206,
          green: 74,
          blue: 38,
        ),
        Artrage6Color(name: 'Cadmium Scarlet', red: 204, green: 51, blue: 39),
        Artrage6Color(name: 'Scarlet Lake', red: 204, green: 51, blue: 39),
        Artrage6Color(name: 'Cadmium Red', red: 203, green: 47, blue: 48),
        Artrage6Color(name: 'Cadmium Red Deep', red: 175, green: 27, blue: 36),
        Artrage6Color(name: 'Winsor Red', red: 195, green: 50, blue: 37),
        Artrage6Color(
          name: 'Permanent Alizarin Crimson',
          red: 163,
          green: 36,
          blue: 39,
        ),
        Artrage6Color(name: 'Alizarin Crimson', red: 151, green: 36, blue: 40),
        Artrage6Color(name: 'Permanent Carmine', red: 185, green: 39, blue: 44),
        Artrage6Color(name: 'Permanent Rose', red: 190, green: 49, blue: 107),
        Artrage6Color(
          name: 'Rose Madder Genuine',
          red: 215,
          green: 118,
          blue: 133,
        ),
        Artrage6Color(name: 'Opera Rose', red: 188, green: 48, blue: 121),
        Artrage6Color(
          name: 'Quinacridone Magenta',
          red: 147,
          green: 44,
          blue: 79,
        ),
        Artrage6Color(
          name: 'Permanent Magenta',
          red: 152,
          green: 68,
          blue: 116,
        ),
        Artrage6Color(name: 'Cobalt Violet', red: 171, green: 109, blue: 165),
        Artrage6Color(name: 'Permanent Mauve', red: 44, green: 26, blue: 79),
        Artrage6Color(
          name: 'Ultramarine Violet',
          red: 97,
          green: 89,
          blue: 157,
        ),
        Artrage6Color(
          name: 'Winsor Violet (Dioxazine)',
          red: 70,
          green: 53,
          blue: 106,
        ),
        Artrage6Color(name: 'Indianthrene Blue', red: 55, green: 79, blue: 141),
        Artrage6Color(name: 'Cobalt Blue Deep', red: 41, green: 104, blue: 179),
        Artrage6Color(
          name: 'French Ultramarine',
          red: 49,
          green: 107,
          blue: 177,
        ),
        Artrage6Color(
          name: 'French Ultramarine (GreenShade)',
          red: 41,
          green: 99,
          blue: 173,
        ),
        Artrage6Color(name: 'Cobalt Blue', red: 59, green: 121, blue: 179),
        Artrage6Color(
          name: 'Winsor Blue (Red Shade)',
          red: 36,
          green: 92,
          blue: 161,
        ),
        Artrage6Color(name: 'Antwerp Blue', red: 27, green: 63, blue: 114),
        Artrage6Color(name: 'Prussian Blue', red: 26, green: 50, blue: 106),
        Artrage6Color(
          name: 'Winsor Blue (Green Shade)',
          red: 44,
          green: 101,
          blue: 170,
        ),
        Artrage6Color(
          name: 'Cerulean Blue (Red Shade)',
          red: 64,
          green: 146,
          blue: 204,
        ),
        Artrage6Color(name: 'Cerulean Blue', red: 75, green: 156, blue: 203),
        Artrage6Color(
          name: 'Manganese Blue Hue',
          red: 80,
          green: 169,
          blue: 219,
        ),
        Artrage6Color(name: 'Phthalo Turquiose', red: 46, green: 98, blue: 117),
        Artrage6Color(
          name: 'Cobalt Turquiose Light',
          red: 89,
          green: 176,
          blue: 185,
        ),
        Artrage6Color(name: 'Cobalt Turquiose', red: 72, green: 150, blue: 142),
        Artrage6Color(name: 'Cobalt Green', red: 158, green: 197, blue: 174),
        Artrage6Color(
          name: 'Winsor Green (Blue Shade)',
          red: 45,
          green: 61,
          blue: 50,
        ),
        Artrage6Color(name: 'Viridian', red: 93, green: 164, blue: 121),
        Artrage6Color(
          name: 'Winsor Green (Yellow Shade)',
          red: 93,
          green: 159,
          blue: 84,
        ),
        Artrage6Color(name: 'Terre Verte', red: 111, green: 155, blue: 98),
        Artrage6Color(name: 'Perylene Green', red: 28, green: 32, blue: 30),
        Artrage6Color(
          name: 'Oxide Of Chromium',
          red: 100,
          green: 123,
          blue: 67,
        ),
        Artrage6Color(name: 'Hookers Green', red: 78, green: 145, blue: 81),
        Artrage6Color(
          name: 'Permanent Sap Green',
          red: 120,
          green: 146,
          blue: 54,
        ),
        Artrage6Color(name: 'Olive Green', red: 138, green: 142, blue: 65),
        Artrage6Color(
          name: 'Terre Verte (Yellow Shade)',
          red: 122,
          green: 109,
          blue: 72,
        ),
        Artrage6Color(name: 'Green Gold', red: 183, green: 159, blue: 54),
        Artrage6Color(name: 'Naples Yellow', red: 242, green: 208, blue: 126),
        Artrage6Color(
          name: 'Naples Yellow Deep',
          red: 237,
          green: 182,
          blue: 63,
        ),
        Artrage6Color(
          name: 'Naples Ochre Light',
          red: 214,
          green: 145,
          blue: 50,
        ),
        Artrage6Color(name: 'Yellow Ochre', red: 206, green: 137, blue: 50),
        Artrage6Color(name: 'Raw Sienna', red: 203, green: 135, blue: 50),
        Artrage6Color(name: 'Gold Ochre', red: 227, green: 143, blue: 49),
        Artrage6Color(
          name: 'Quinacridone Gold',
          red: 195,
          green: 116,
          blue: 30,
        ),
        Artrage6Color(name: 'Brown Ochre', red: 187, green: 98, blue: 49),
        Artrage6Color(name: 'Magnesium Brown', red: 168, green: 81, blue: 44),
        Artrage6Color(name: 'Burnt Sienna', red: 168, green: 73, blue: 47),
        Artrage6Color(name: 'Light Red', red: 184, green: 60, blue: 25),
        Artrage6Color(name: 'Venetian Red', red: 161, green: 63, blue: 42),
        Artrage6Color(name: 'Indian Red', red: 109, green: 42, blue: 33),
        Artrage6Color(name: 'Brown Madder', red: 169, green: 77, blue: 60),
        Artrage6Color(name: 'Potters Pink', red: 154, green: 81, blue: 98),
        Artrage6Color(name: 'Perylene Maroon', red: 157, green: 38, blue: 41),
        Artrage6Color(name: 'Perylene Violet', red: 56, green: 32, blue: 37),
        Artrage6Color(
          name: 'Caput Motuum Violet',
          red: 128,
          green: 74,
          blue: 66,
        ),
        Artrage6Color(name: 'Raw Umber', red: 85, green: 70, blue: 51),
        Artrage6Color(name: 'Vandyke Brown', red: 36, green: 26, blue: 25),
        Artrage6Color(name: 'Sepia', red: 74, green: 61, blue: 48),
        Artrage6Color(name: 'Indigo', red: 17, green: 29, blue: 45),
        Artrage6Color(name: "Payne's Gray", red: 45, green: 65, blue: 79),
        Artrage6Color(name: 'Natural Tint', red: 51, green: 51, blue: 53),
        Artrage6Color(name: 'Ivory Black', red: 53, green: 50, blue: 42),
        Artrage6Color(name: 'Lamp Black', red: 44, green: 42, blue: 43),
        Artrage6Color(name: 'Mars Black', red: 37, green: 34, blue: 31),
        Artrage6Color(name: "Davy's Grey", red: 167, green: 168, blue: 134),
        Artrage6Color(name: 'Chinese White', red: 250, green: 250, blue: 250),
        Artrage6Color(
          name: 'Titanium White (Opaque White)',
          red: 251,
          green: 251,
          blue: 251,
        ),
      ],
    ),
    './assets/artrage/Complementary.col': Artrage6Palette(
      name: 'ArtRage 6 Palette',
      colors: [
        Artrage6Color(name: 'Y-V', red: 250, green: 241, blue: 66),
        Artrage6Color(name: 'V-Y', red: 128, green: 61, blue: 151),
        Artrage6Color(name: 'YO-BV', red: 253, green: 195, blue: 31),
        Artrage6Color(name: 'BV-YO', red: 77, green: 56, blue: 147),
        Artrage6Color(name: 'O-B', red: 252, green: 157, blue: 40),
        Artrage6Color(name: 'B-O', red: 68, green: 99, blue: 173),
        Artrage6Color(name: 'RO-BG', red: 243, green: 92, blue: 43),
        Artrage6Color(name: 'BG-RO', red: 28, green: 151, blue: 208),
        Artrage6Color(name: 'R-G', red: 237, green: 60, blue: 45),
        Artrage6Color(name: 'G-R', red: 107, green: 181, blue: 79),
        Artrage6Color(name: 'RV-YG', red: 168, green: 35, blue: 80),
        Artrage6Color(name: 'YG-RV', red: 212, green: 224, blue: 63),
      ],
    ),
    './assets/artrage/Pastel.col': Artrage6Palette(
      name: 'ArtRage 6 Palette',
      colors: [
        Artrage6Color(name: '%%', red: 255, green: 192, blue: 192),
        Artrage6Color(name: '%%', red: 255, green: 253, blue: 192),
        Artrage6Color(name: '%%', red: 203, green: 255, blue: 192),
        Artrage6Color(name: '%%', red: 193, green: 255, blue: 247),
        Artrage6Color(name: '%%', red: 193, green: 202, blue: 255),
        Artrage6Color(name: '%%', red: 244, green: 192, blue: 255),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('ArtRage 6 File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final file = File(filePath);
        bytes = file.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(Artrage6Palette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = Artrage6Palette.fromBytes(bytes);

        expect(palette.name, equals(expectedPalette.name));
        expect(palette.colors.length, equals(expectedPalette.colors.length));

        if (palette.colors.isNotEmpty) {
          for (var i = 0; i < palette.colors.length; i++) {
            final color = palette.colors[i];
            final expectedColor = expectedPalette.colors[i];

            expect(
              color.name,
              equals(expectedColor.name),
              reason: 'Name mismatch for color $i',
            );
            expect(
              color.red,
              equals(expectedColor.red),
              reason: 'Red mismatch for color $i',
            );
            expect(
              color.green,
              equals(expectedColor.green),
              reason: 'Green mismatch for color $i',
            );
            expect(
              color.blue,
              equals(expectedColor.blue),
              reason: 'Blue mismatch for color $i',
            );
            expect(
              color.alpha,
              equals(expectedColor.alpha),
              reason: 'Alpha mismatch for color $i',
            );
          }
        }
      });
    });
  });

  test('isValidFormat returns false for invalid ArtRage 6 file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(Artrage6Palette.isValidFormat(invalidBytes), isFalse);
  });
}
