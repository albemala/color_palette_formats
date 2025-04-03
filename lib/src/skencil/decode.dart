part of 'skencil.dart';

SkencilPalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  validateHeader(lines.elementAt(0), _fileSignature, 'Skencil palette file');

  // Regex to capture three float numbers and the rest as the name
  // Allows for space or tab separation between numbers and name
  final colorMatchRegex = RegExp(r'([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+(.*)');

  final colors = <SkencilPaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i).trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = colorMatchRegex.firstMatch(line);
    if (match != null) {
      // line is a color
      final red = parseDoubleValue(match, 1);
      final green = parseDoubleValue(match, 2);
      final blue = parseDoubleValue(match, 3);
      final colorName = parseStringValue(match, 4);
      colors.add(
        SkencilPaletteColor(
          red: red,
          green: green,
          blue: blue,
          name: colorName,
        ),
      );
    }
  }

  return SkencilPalette(colors: colors);
}
