import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'sketchpalette.mapper.dart';

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

SketchPalette _decode(List<int> bytes) {
  // read file and convert to json
  final fileAsString = utf8.decode(bytes);
  final fileAsMap = json.decode(fileAsString) as Map<String, dynamic>;

  final compatibleVersion = fileAsMap['compatibleVersion'] as String;
  final pluginVersion = fileAsMap['pluginVersion'] as String;
  final colors = fileAsMap['colors'] as List<dynamic>;

  final paletteColors = <SketchPaletteColor>[];
  for (var i = 0; i < colors.length; i++) {
    final color = colors[i] as Map<String, dynamic>;
    final red = color['red'] as num;
    final green = color['green'] as num;
    final blue = color['blue'] as num;
    final alpha = color['alpha'] as num;
    paletteColors.add(
      SketchPaletteColor(
        red: red.toDouble(),
        green: green.toDouble(),
        blue: blue.toDouble(),
        alpha: alpha.toDouble(),
      ),
    );
  }

  return SketchPalette(
    compatibleVersion: compatibleVersion,
    pluginVersion: pluginVersion,
    colors: paletteColors,
  );
}

List<int> _encode(SketchPalette sketchPalette) {
  final sketchPaletteAsString = sketchPalette.toJson();
  return utf8.encode(sketchPaletteAsString);
}
