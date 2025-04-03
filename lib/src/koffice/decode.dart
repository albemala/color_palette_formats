part of 'koffice.dart';

KOfficePalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split(RegExp(r'\r?\n'));

  _validateHeader(lines.elementAt(0));

  final colors = <KOfficePaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);

    if (line.isEmpty) {
      // Skip empty lines
      continue;
    }

    final regex = RegExp(r'^(\d+)\s+(\d+)\s+(\d+)\s+(.*)$');
    final match = regex.firstMatch(line);
    if (match != null) {
      // line is a color
      // the first 3 parts are red, green and blue
      // the rest is the color name
      final r = int.tryParse(match.group(1) ?? '') ?? 0;
      final g = int.tryParse(match.group(2) ?? '') ?? 0;
      final b = int.tryParse(match.group(3) ?? '') ?? 0;
      final name = match.group(4)?.trim() ?? '';
      colors.add(KOfficePaletteColor(r: r, g: g, b: b, name: name));
    }
  }

  return KOfficePalette(colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw const FormatException('''
Not a valid KOffice palette file''');
  }
}
