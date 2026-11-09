part of 'sketchpreset.dart';

/// Encodes the pre-54 JSON shape (`{root: {colorAssets: [...]}}`), the only
/// documented writable preset layout.
List<int> _encode(SketchPreset preset) {
  final colorAssets =
      preset.colors.map((color) {
        return {
          'name': color.name,
          'color': {
            'red': color.red,
            'green': color.green,
            'blue': color.blue,
            'alpha': color.alpha,
          },
        };
      }).toList();
  return utf8.encode(
    json.encode({
      'root': {'colorAssets': colorAssets},
    }),
  );
}
