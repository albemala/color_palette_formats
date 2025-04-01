import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'sketchpalette.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Sketch Palette (.sketchpalette) (Sketch)
*
* Content example:
*

{
  "compatibleVersion": "1.4",
  "pluginVersion": "1.4",
  "colors": [
    {
      "red": 0.28,
      "green": 0.16,
      "blue": 0.18,
      "alpha": 1
    },
    {
      "red": 0.47,
      "green": 0.45,
      "blue": 0.56,
      "alpha": 1
    }
  ]
}

*
* References:
* - ...
*/

const supportedSketchPaletteVersion = '1.4';

@MappableClass()
class SketchPaletteColor with SketchPaletteColorMappable {
  /// Value: [0..1]
  final double red;

  /// Value: [0..1]
  final double green;

  /// Value: [0..1]
  final double blue;

  /// Value: [0..1]
  final double alpha;

  SketchPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  });
}

@MappableClass()
class SketchPalette with SketchPaletteMappable {
  final String compatibleVersion;
  final String pluginVersion;
  final List<SketchPaletteColor> colors;

  SketchPalette({
    required this.compatibleVersion,
    required this.pluginVersion,
    required this.colors,
  });

  factory SketchPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}
