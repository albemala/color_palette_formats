import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'skencil.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Skencil Palette
 * File extensions: .spl
 * Applications: Skencil (formerly Sketch), sK1
 * Format details: Header line `##Sketch RGBPalette 0` followed by one color
 *   per line: three space- or tab-separated floats in 0.0..1.0 (signs and
 *   exponents accepted) and a name running to end of line. Lines that do
 *   not parse as color lines (comments, nameless `r g b` triples) are
 *   skipped; anything that does parse as a color line must carry finite
 *   in-range values. Empty palettes are legal. CRLF and lone-CR endings
 *   supported.
 */

@MappableClass()
class SkencilPaletteColor with SkencilPaletteColorMappable {
  /// Value: [0.0 .. 1.0]
  final double red;

  /// Value: [0.0 .. 1.0]
  final double green;

  /// Value: [0.0 .. 1.0]
  final double blue;
  final String name;

  SkencilPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  }) : assert(red >= 0.0 && red <= 1.0, 'red must be between 0.0 and 1.0'),
       assert(
         green >= 0.0 && green <= 1.0,
         'green must be between 0.0 and 1.0',
       ),
       assert(blue >= 0.0 && blue <= 1.0, 'blue must be between 0.0 and 1.0');
}

@MappableClass()
class SkencilPalette with SkencilPaletteMappable {
  static const validFileSignature = '##Sketch RGBPalette 0';

  final List<SkencilPaletteColor> colors;

  SkencilPalette({required this.colors});

  factory SkencilPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Skencil palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
