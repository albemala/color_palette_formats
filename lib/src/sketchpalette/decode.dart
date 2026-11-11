part of 'sketchpalette.dart';

SketchPalette _decode(List<int> bytes) {
  try {
    return _decodeUnsafe(bytes);
  } on FormatException {
    rethrow;
  } catch (e) {
    // Cast failures (missing keys, wrong value types) and debug-only
    // assertion failures all surface here; the format contract is
    // FormatException on invalid input, identical in debug and release.
    throw FormatException(
      'Not a valid SketchPalette file. ${e.toString().split('\n').first}',
    );
  }
}

SketchPalette _decodeUnsafe(List<int> bytes) {
  const paletteName = 'SketchPalette file';
  // Throws FormatException on non-UTF-8 input and on malformed JSON
  // (including trailing garbage after the document).
  final fileAsMap = json.decode(utf8.decode(bytes));
  if (fileAsMap is! Map<String, dynamic>) {
    throw const FormatException(
      'Not a valid $paletteName. Expected a JSON object.',
    );
  }

  final compatibleVersion = fileAsMap['compatibleVersion'];
  _validateVersion('compatibleVersion', compatibleVersion);
  final pluginVersion = fileAsMap['pluginVersion'];
  _validateVersion('pluginVersion', pluginVersion);

  final colors = fileAsMap['colors'];
  if (colors is! List<dynamic>) {
    throw FormatException(
      'Not a valid $paletteName. Expected "colors" to be an array '
      'but found "$colors".',
    );
  }

  final paletteColors = <SketchPaletteColor>[];
  for (var i = 0; i < colors.length; i++) {
    final color = colors[i];
    if (color is! Map<String, dynamic>) {
      throw FormatException(
        'Not a valid $paletteName. Expected color #$i to be an object '
        'but found "$color".',
      );
    }
    paletteColors.add(
      SketchPaletteColor(
        red: _parseChannel(color, 'red', i),
        green: _parseChannel(color, 'green', i),
        blue: _parseChannel(color, 'blue', i),
        alpha: _parseChannel(color, 'alpha', i),
      ),
    );
  }

  return SketchPalette(
    compatibleVersion: compatibleVersion as String,
    pluginVersion: pluginVersion as String,
    colors: paletteColors,
  );
}

void _validateVersion(String field, Object? value) {
  const paletteName = 'SketchPalette file';
  // Covers missing keys (null), wrong types, and unsupported versions.
  if (value != SketchPalette.validVersion) {
    throw FormatException(
      'Not a valid $paletteName. Expected "$field" to be '
      '"${SketchPalette.validVersion}" but found "$value".',
    );
  }
}

double _parseChannel(Map<String, dynamic> color, String name, int index) {
  const paletteName = 'SketchPalette file';
  final raw = color[name];
  if (raw is! num) {
    throw FormatException(
      'Not a valid $paletteName. Expected "$name" to be a number '
      'in color #$index but found "$raw".',
    );
  }
  return _checkChannel(name, raw.toDouble(), ' in color #$index');
}

double _checkChannel(String name, double value, [String context = '']) {
  const paletteName = 'SketchPalette file';
  // The model constructor asserts this range in debug builds; enforce it
  // here with FormatException for release safety. NaN passes bare range
  // comparisons, so finiteness is checked explicitly. Overflow literals
  // such as 1e999 decode to Infinity.
  if (!value.isFinite) {
    throw FormatException(
      'Not a valid $paletteName. Non-finite "$name" '
      'value "$value"$context.',
    );
  }
  if (value < 0 || value > 1) {
    throw FormatException(
      'Not a valid $paletteName. "$name" value "$value" '
      'out of range 0..1$context.',
    );
  }
  return value;
}
