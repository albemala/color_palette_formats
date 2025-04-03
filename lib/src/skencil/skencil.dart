import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'skencil.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Skencil Palette (.spl)
* Skencil (formerly Sketch), sK1
*
* References:
*  - Based on observed format in example files.
*/

@MappableClass()
class SkencilPaletteColor with SkencilPaletteColorMappable {
  /// Value: [0.0 .. 1.0]
  final double red;

  /// Value: [0.0 .. 1.0]
  final double green;

  /// Value: [0.0 .. 1.0]
  final double blue;
  final String name;

  SkencilPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  });
}

@MappableClass()
class SkencilPalette with SkencilPaletteMappable {
  final List<SkencilPaletteColor> colors;

  SkencilPalette({required this.colors});

  factory SkencilPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = '##Sketch RGBPalette 0';
