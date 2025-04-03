import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'psp.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Jasc / Corel Paint Shop Pro (.pal, .psppalette)
* Paint Shop Pro, Jasc Software, Corel
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

@MappableClass()
class PaintShopProPaletteColor with PaintShopProPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  PaintShopProPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class PaintShopProPalette with PaintShopProPaletteMappable {
  static const version = '0100';

  final List<PaintShopProPaletteColor> colors;

  PaintShopProPalette({required this.colors});

  factory PaintShopProPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Adobe Color Book file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

const _fileSignature = 'JASC-PAL';
