import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'coreldraw4.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* CorelDraw 4 Palette (.pal)
* Used by CorelDraw version 4 and potentially earlier versions.
* Format: Text-based, CMYK color values.
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
}
