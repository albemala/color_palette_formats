import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'sketchpalette.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Sketch Palette (.sketchpalette)
*/

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
  }) : assert(red >= 0 && red <= 1, 'red must be between 0 and 1'),
       assert(green >= 0 && green <= 1, 'green must be between 0 and 1'),
       assert(blue >= 0 && blue <= 1, 'blue must be between 0 and 1'),
       assert(alpha >= 0 && alpha <= 1, 'alpha must be between 0 and 1');
}

@MappableClass()
class SketchPalette with SketchPaletteMappable {
  static const validVersion = '1.4';

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

  /// Checks if the provided bytes represent a valid SketchPalette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
