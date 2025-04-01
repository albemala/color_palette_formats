part of 'sketchpalette.dart';

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
