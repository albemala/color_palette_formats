import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'sketchpalette.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Sketch Palette (.sketchpalette)
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
