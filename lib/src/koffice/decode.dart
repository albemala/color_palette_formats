part of 'koffice.dart';

KOfficePalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  validateHeader(
    lines.elementAt(0),
    KOfficePalette.validFileSignature,
    'KOffice palette file',
  );

  // the first 3 parts are red, green and blue
  // the rest is the color name
  final colorMatchRegex = RegExp(r'^(\d+)\s+(\d+)\s+(\d+)\s+(.*)$');

  final colors = <KOfficePaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);

    if (line.isEmpty) {
      // Skip empty lines
      continue;
    }

    final match = colorMatchRegex.firstMatch(line);
    if (match != null) {
      // line is a color
      final r = parseIntValue(match, 1);
      final g = parseIntValue(match, 2);
      final b = parseIntValue(match, 3);
      final name = parseStringValue(match, 4);
      colors.add(KOfficePaletteColor(r: r, g: g, b: b, name: name));
    }
  }

  return KOfficePalette(colors: colors);
}
