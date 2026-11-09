import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'painter.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Corel Painter Palette
 * File extensions: .txt
 * Applications: MetaCreations Painter, Corel Painter
 * Format details:
 *   Six-line display-layout header (ROWS, COLS, WIDTH, HEIGHT, TEXTHEIGHT,
 *   SPACING) followed by one color per line carrying RGB values, HSV color
 *   variability (HV, SV, VV) and a trailing name, which may contain spaces
 *   or be a hex code. The decoder accepts varying whitespace around the
 *   separators; the encoder writes a canonical spacing.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 */

@MappableClass()
class PainterPaletteColor with PainterPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Hue color variability.
  final double hv;

  /// Saturation color variability.
  final double sv;

  /// Value color variability.
  final double vv;

  /// Color name (may contain spaces) or hex code. Can be empty.
  final String name;

  PainterPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.hv,
    required this.sv,
    required this.vv,
    required this.name,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class PainterPalette with PainterPaletteMappable {
  /// Number of display rows (layout hint, not a color count).
  final int rows;

  /// Number of display columns (layout hint, not a color count).
  final int columns;

  /// Swatch width in pixels.
  final int width;

  /// Swatch height in pixels.
  final int height;

  /// Color name text height in pixels.
  final int textHeight;

  /// Spacing between swatches in pixels.
  final int spacing;

  final List<PainterPaletteColor> colors;

  PainterPalette({
    required this.rows,
    required this.columns,
    required this.width,
    required this.height,
    required this.textHeight,
    required this.spacing,
    required this.colors,
  }) : assert(rows >= 0, 'rows must not be negative'),
       assert(columns >= 0, 'columns must not be negative'),
       assert(width >= 0, 'width must not be negative'),
       assert(height >= 0, 'height must not be negative'),
       assert(textHeight >= 0, 'textHeight must not be negative'),
       assert(spacing >= 0, 'spacing must not be negative');

  factory PainterPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Corel Painter Palette.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
