import 'dart:convert';

import 'package:color_palette_formats/src/format_utils.dart';
import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'coreldraw4.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: CorelDraw 4 Palette
 * File extensions: .pal
 * Applications: CorelDraw 4 and potentially earlier versions
 * Format details: Text-based, no header or signature. One color per
 *   line: "Name" C M Y K with CMYK values in 0..100. Blank lines and
 *   lines that are not color definitions (including DOS Ctrl-Z
 *   end-of-file markers) are skipped.
 */

@MappableClass()
class CorelDraw4PaletteColor with CorelDraw4PaletteColorMappable {
  /// Value: [0..100]
  final int cyan;

  /// Value: [0..100]
  final int magenta;

  /// Value: [0..100]
  final int yellow;

  /// Value: [0..100]
  final int black;

  final String name;

  CorelDraw4PaletteColor({
    required this.cyan,
    required this.magenta,
    required this.yellow,
    required this.black,
    required this.name,
  }) : assert(cyan >= 0 && cyan <= 100, 'cyan must be between 0 and 100'),
       assert(
         magenta >= 0 && magenta <= 100,
         'magenta must be between 0 and 100',
       ),
       assert(yellow >= 0 && yellow <= 100, 'yellow must be between 0 and 100'),
       assert(black >= 0 && black <= 100, 'black must be between 0 and 100');
}

@MappableClass()
class CorelDraw4Palette with CorelDraw4PaletteMappable {
  final List<CorelDraw4PaletteColor> colors;

  CorelDraw4Palette({required this.colors});

  factory CorelDraw4Palette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid CorelDraw 4 Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      final decoded = _decode(bytes);
      return decoded.colors.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
