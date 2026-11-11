import 'dart:convert';

import 'package:color_palette_formats/src/format_utils.dart';
import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'rebelle.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Rebelle Palette
 * File extensions: .txt, .colors
 * Applications: Rebelle - Digital Painting Application
 * Format details: Tab-delimited text file with two columns: `#RRGGBB` hex
 *   color and optional color name (uppercase hex accepted). Every
 *   non-blank line must be a color; malformed lines are rejected, not
 *   skipped. Files with no colors are rejected. CRLF and lone-CR line
 *   endings are supported.
 * References:
 * - Rebelle 7 and 8 manuals
 */

@MappableClass()
class RebellePaletteColor with RebellePaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Color name (can be empty)
  final String name;

  RebellePaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class RebellePalette with RebellePaletteMappable {
  final List<RebellePaletteColor> colors;

  RebellePalette({required this.colors});

  factory RebellePalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Rebelle palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
