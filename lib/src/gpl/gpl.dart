import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'gpl.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Gimp Palette (GPL)
* (.gpl) (Gimp, Inkscape, Krita, KolourPaint, Scribus, CinePaint, MyPaint)
*
* Content example:
*

GIMP Palette
Name: Oxygen
#
56  37    9	wood brown6
87  64   30	wood brown5
117 81   26	wood brown4
143 107	 50	wood brown3

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
  });
}

@MappableClass()
class GimpPalette with GimpPaletteMappable {
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
}

const _fileSignature = 'GIMP Palette';
