part of 'koffice.dart';

// Color lines hold three channels and an optional name; anything else is
// skipped like an info line (same leniency as GIMP). The optional minus
// routes negatives into range validation instead of silently dropping
// the line, and the optional name keeps bare "r g b" lines decoding
// with an empty name.
final _colorLineRegex = RegExp(r'^\s*(-?\d+)\s+(-?\d+)\s+(-?\d+)(?:\s+(.*))?$');

KOfficePalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  validateHeader(
    lines.elementAt(0),
    KOfficePalette.validFileSignature,
    'KOffice palette file',
  );

  // the first 3 parts are red, green and blue
  // the rest is the color name
  final colors = <KOfficePaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);

    if (line.isEmpty) {
      // Skip empty lines
      continue;
    }

    final match = _colorLineRegex.firstMatch(line);
    if (match != null) {
      // line is a color
      final r = _parseChannel(match, 1);
      final g = _parseChannel(match, 2);
      final b = _parseChannel(match, 3);
      final name = match.group(4)?.trim() ?? '';
      colors.add(KOfficePaletteColor(r: r, g: g, b: b, name: name));
    }
  }

  return KOfficePalette(colors: colors);
}

int _parseChannel(RegExpMatch match, int group) {
  // int.tryParse returns null on overflow, which must not silently
  // become 0 via the shared parseIntValue fallback.
  final raw = match.group(group) ?? '';
  final value = int.tryParse(raw);
  if (value == null) {
    throw FormatException(
      'Not a valid KOffice palette file. Invalid channel value "$raw".',
    );
  }
  validateIntRange('KOffice palette file', 'channel', value, 255);
  return value;
}
