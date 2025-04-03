import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'hpl.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Homesite Palette (HPL) (.hpl) 
* Allaire Homesite, Macromedia ColdFusion
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

@MappableClass()
class HomesitePaletteColor with HomesitePaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  HomesitePaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}

@MappableClass()
class HomesitePalette with HomesitePaletteMappable {
  static const version = '4.0';

  final List<HomesitePaletteColor> colors;

  HomesitePalette({required this.colors});

  factory HomesitePalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = 'Palette';
