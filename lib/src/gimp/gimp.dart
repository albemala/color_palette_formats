import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'gimp.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Gimp Palette (GPL) (.gpl, .gimp) 
* Gimp, Inkscape, Krita, KolourPaint, Scribus, CinePaint, MyPaint
*
*   References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

@MappableClass()
class GimpPaletteColor with GimpPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;
  final String name;

  GimpPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class GimpPalette with GimpPaletteMappable {
  static const validFileSignature = 'GIMP Palette';

  final List<String> info;
  final List<String> comments;
  final List<GimpPaletteColor> colors;

  GimpPalette({
    required this.colors,
    this.info = const [],
    this.comments = const [],
  });

  factory GimpPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Gimp Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
