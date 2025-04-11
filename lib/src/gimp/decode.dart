part of 'gimp.dart';

GimpPalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  validateHeader(
    lines.elementAt(0),
    GimpPalette.validFileSignature,
    'Gimp palette file',
  );

  // the first 3 parts are red, green and blue
  // the rest is the color name
  final colorMatchRegex = RegExp(r'(\d+)\s+(\d+)\s+(\d+)\s*(.*)');

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

    final match = colorMatchRegex.firstMatch(line);
    if (match != null) {
      // line is a color
      final red = parseIntValue(match, 1);
      final green = parseIntValue(match, 2);
      final blue = parseIntValue(match, 3);
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
