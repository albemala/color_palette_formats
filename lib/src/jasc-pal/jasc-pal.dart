import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'jasc-pal.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Jasc Palette (JASC PAL)
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

const supportedJascPaletteVersion = '0100';

@MappableClass()
class JascPaletteColor with JascPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  JascPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}

@MappableClass()
class JascPalette with JascPaletteMappable {
  final String version;
  final List<JascPaletteColor> colors;

  JascPalette({
    required this.version,
    required this.colors,
  });

  factory JascPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = 'JASC-PAL';
