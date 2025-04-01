part of 'sketchpalette.dart';

List<int> _encode(SketchPalette sketchPalette) {
  final sketchPaletteAsString = sketchPalette.toJson();
  return utf8.encode(sketchPaletteAsString);
}
