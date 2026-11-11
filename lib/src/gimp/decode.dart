part of 'gimp.dart';

// Color lines hold three channels and an optional name; anything else is
// info or a comment. Anchored so info text holding numbers is not matched
// mid-line; the optional minus routes negatives into range validation
// instead of silently dropping the sign.
final _colorLineRegex = RegExp(r'^\s*(-?\d+)\s+(-?\d+)\s+(-?\d+)\s*(.*)$');

GimpPalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  validateHeader(
    lines.elementAt(0),
    GimpPalette.validFileSignature,
    'Gimp palette file',
  );

  // the first 3 parts are red, green and blue
  // the rest is the color name
  final info = <String>[];
  final comments = <String>[];
  final colors = <GimpPaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = _colorLineRegex.firstMatch(line);
    if (match != null) {
      // line is a color
      final red = _parseChannel(match, 1);
      final green = _parseChannel(match, 2);
      final blue = _parseChannel(match, 3);
      final colorName = parseStringValue(match, 4);
      colors.add(
        GimpPaletteColor(red: red, green: green, blue: blue, name: colorName),
      );
      continue;
    }

    if (line.startsWith('#')) {
      // line is a comment
      final comment = line.substring(1).trim();
      comments.add(comment);
      continue;
    }

    // line is info
    info.add(line.trim());
  }

  return GimpPalette(info: info, comments: comments, colors: colors);
}

int _parseChannel(RegExpMatch match, int group) {
  // int.tryParse returns null on overflow, which must not silently
  // become 0 via the shared parseIntValue fallback.
  final raw = match.group(group) ?? '';
  final value = int.tryParse(raw);
  if (value == null) {
    throw FormatException(
      'Not a valid Gimp palette file. Invalid channel value "$raw".',
    );
  }
  validateIntRange('Gimp palette file', 'channel', value, 255);
  return value;
}
