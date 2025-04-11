import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'koffice.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* KOffice Palette (.colors)
*/

@MappableClass()
class KOfficePaletteColor with KOfficePaletteColorMappable {
  /// Red component (0-255).
  final int r;

  /// Green component (0-255).
  final int g;

  /// Blue component (0-255).
  final int b;

  /// Name of the color.
  final String name;

  KOfficePaletteColor({
    required this.r,
    required this.g,
    required this.b,
    required this.name,
  }) : assert(r >= 0 && r <= 255, 'r must be between 0 and 255'),
       assert(g >= 0 && g <= 255, 'g must be between 0 and 255'),
       assert(b >= 0 && b <= 255, 'b must be between 0 and 255');
}

@MappableClass()
class KOfficePalette with KOfficePaletteMappable {
  static const validFileSignature = 'KDE RGB Palette';

  final List<KOfficePaletteColor> colors;

  KOfficePalette({required this.colors});

  factory KOfficePalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid KOffice Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
