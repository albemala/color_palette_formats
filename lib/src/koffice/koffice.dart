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
  });
}

@MappableClass()
class KOfficePalette with KOfficePaletteMappable {
  final List<KOfficePaletteColor> colors;

  KOfficePalette({required this.colors});

  factory KOfficePalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

// Signature found at the beginning of .colors files
const _fileSignature = 'KDE RGB Palette';
