import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'psp.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Jasc / Corel Paint Shop Pro
* (.pal, .psppalette) (Paint Shop Pro, Jasc Software, Corel)
*
* Content example:
*

JASC-PAL
0100
256
71 41 45
119 115 142
209 132 31

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
  });
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
}

const _fileSignature = 'JASC-PAL';
