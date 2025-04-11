import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
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
  }) : assert(red >= 0.0 && red <= 1.0, 'red must be between 0.0 and 1.0'),
       assert(
         green >= 0.0 && green <= 1.0,
         'green must be between 0.0 and 1.0',
       ),
       assert(blue >= 0.0 && blue <= 1.0, 'blue must be between 0.0 and 1.0');
}

@MappableClass()
class SkencilPalette with SkencilPaletteMappable {
  static const validFileSignature = '##Sketch RGBPalette 0';

  final List<SkencilPaletteColor> colors;

  SkencilPalette({required this.colors});

  factory SkencilPalette.fromBytes(List<int> bytes) {
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
