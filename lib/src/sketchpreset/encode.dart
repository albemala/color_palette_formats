part of 'sketchpreset.dart';

/// Encodes the pre-54 JSON shape (`{root: {colorAssets: [...]}}`), the only
/// documented writable preset layout.
List<int> _encode(SketchPreset preset) {
  for (final color in preset.colors) {
    _validateColor(color);
  }
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

void _validateColor(SketchPresetColor color) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety. NaN passes bare
  // range comparisons, so finiteness is checked explicitly.
  for (final entry
      in {
        'red': color.red,
        'green': color.green,
        'blue': color.blue,
        'alpha': color.alpha,
      }.entries) {
    if (!entry.value.isFinite) {
      throw FormatException(
        'Invalid Sketch Preset file: non-finite "${entry.key}" '
        'value "${entry.value}".',
      );
    }
    if (entry.value < 0 || entry.value > 1) {
      throw FormatException(
        'Invalid Sketch Preset file: "${entry.key}" value '
        '"${entry.value}" out of range 0..1.',
      );
    }
  }
}
