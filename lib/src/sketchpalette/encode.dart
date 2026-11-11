part of 'sketchpalette.dart';

List<int> _encode(SketchPalette sketchPalette) {
  _validateVersion('compatibleVersion', sketchPalette.compatibleVersion);
  _validateVersion('pluginVersion', sketchPalette.pluginVersion);
  for (final color in sketchPalette.colors) {
    _validateColor(color);
  }
  final sketchPaletteAsString = sketchPalette.toJson();
  return utf8.encode(sketchPaletteAsString);
}

void _validateColor(SketchPaletteColor color) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  _checkChannel('red', color.red);
  _checkChannel('green', color.green);
  _checkChannel('blue', color.blue);
  _checkChannel('alpha', color.alpha);
}
