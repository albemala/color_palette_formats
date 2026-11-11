part of 'skencil.dart';

// Matches a color line: three sign-aware floats (with optional exponents)
// followed by a name running to end of line. Anything else is not a color
// line and is skipped. Nameless `r g b` triples also land there:
// without a trailing `\s+name` there is no match.
// `\s+name` there is no match.
// A line starting with a number is a color attempt: it must match the
// strict grammar below instead of being silently skipped.
final _colorAttemptRegex = RegExp(r'^[+-]?[\d.]');

final _colorLineRegex = RegExp(
  r'^([+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)\s+'
  r'([+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)\s+'
  r'([+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)\s+(.*)$',
);

SkencilPalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  validateHeader(
    lines.elementAt(0),
    SkencilPalette.validFileSignature,
    'Skencil palette file',
  );

  final colors = <SkencilPaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i).trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = _colorLineRegex.firstMatch(line);
    if (match == null) {
      // Not a color line (e.g. a comment); skip it. But a line starting
      // with a number is a corrupt color attempt, not a comment: hiding
      // it would silently drop a color.
      if (_colorAttemptRegex.hasMatch(line)) {
        throw FormatException(
          'Not a valid Skencil palette file. Invalid color line "$line".',
        );
      }
      continue;
    }

    final red = _parseChannel(match.group(1), line);
    final green = _parseChannel(match.group(2), line);
    final blue = _parseChannel(match.group(3), line);
    final colorName = parseStringValue(match, 4);
    colors.add(
      SkencilPaletteColor(red: red, green: green, blue: blue, name: colorName),
    );
  }

  return SkencilPalette(colors: colors);
}

double _parseChannel(String? raw, String line) {
  const paletteName = 'Skencil palette file';
  // The regex only matches well-formed numbers, so null means an
  // unparseable literal rather than garbage input.
  final value = double.tryParse(raw ?? '');
  if (value == null) {
    throw FormatException(
      'Not a valid $paletteName. Invalid number "$raw" in line "$line".',
    );
  }
  // NaN passes bare range comparisons, so finiteness is checked
  // explicitly. Overflow (e.g. 1e999) decodes to Infinity.
  if (!value.isFinite) {
    throw FormatException(
      'Not a valid $paletteName. Non-finite value "$raw" in line "$line".',
    );
  }
  // The model constructor asserts this range in debug builds; enforce it
  // here with FormatException for release safety.
  if (value < 0.0 || value > 1.0) {
    throw FormatException(
      'Not a valid $paletteName. Value "$raw" out of range 0.0..1.0 '
      'in line "$line".',
    );
  }
  return value;
}
