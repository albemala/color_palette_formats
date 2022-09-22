import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sketchpalette.freezed.dart';
part 'sketchpalette.g.dart';

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

@freezed
class SketchPaletteColor with _$SketchPaletteColor {
  const factory SketchPaletteColor({
    /// Value: [0..1]
    required double red,

    /// Value: [0..1]
    required double green,

    /// Value: [0..1]
    required double blue,

    /// Value: [0..1]
    required double alpha,
  }) = _SketchPaletteColor;

  factory SketchPaletteColor.fromJson(Map<String, dynamic> json) =>
      _$SketchPaletteColorFromJson(json);
}

@freezed
class SketchPalette with _$SketchPalette {
  const factory SketchPalette({
    required String compatibleVersion,
    required String pluginVersion,
    required List<SketchPaletteColor> colors,
  }) = _SketchPalette;

  factory SketchPalette.fromJson(Map<String, dynamic> json) =>
      _$SketchPaletteFromJson(json);
}

SketchPalette decodeSketchPalette(File file) {
  // read file and convert to json
  final fileAsString = file.readAsStringSync();
  final fileAsJson = json.decode(fileAsString) as Map<String, dynamic>;

  final compatibleVersion = fileAsJson['compatibleVersion'] as String;
  final pluginVersion = fileAsJson['pluginVersion'] as String;
  final colors = fileAsJson['colors'] as List<dynamic>;

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

void encodeSketchPalette(SketchPalette sketchPalette, File file) {
  final sketchPaletteAsJson = sketchPalette.toJson();
  final sketchPaletteAsString = json.encode(sketchPaletteAsJson);
  file.writeAsStringSync(sketchPaletteAsString);
}
