import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'paint-dot-net.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Paint.NET Palette (.txt) 
*/

@MappableClass()
class PaintDotNetPaletteColor with PaintDotNetPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Value: [0..255]
  final int alpha;

  PaintDotNetPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255'),
       assert(alpha >= 0 && alpha <= 255, 'alpha must be between 0 and 255');
}

@MappableClass()
class PaintDotNetPalette with PaintDotNetPaletteMappable {
  final List<PaintDotNetPaletteColor> colors;

  PaintDotNetPalette({required this.colors});

  factory PaintDotNetPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _header = '''
; paint.net Palette File
; Lines that start with a semicolon are comments
; Colors are written as 8-digit hexadecimal numbers: aarrggbb
; For example, this would specify green: FF00FF00
; The alpha ('aa') value specifies how transparent a color is. FF is fully opaque, 00 is fully transparent.
''';
