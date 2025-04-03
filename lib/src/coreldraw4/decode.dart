part of 'coreldraw4.dart';

CorelDraw4Palette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  // Regex to capture the name in quotes and the four CMYK values
  // Handles potential extra whitespace
  final colorMatchRegex = RegExp(r'^"([^"]+)"\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)');

  final colors = <CorelDraw4PaletteColor>[];
  for (final line in lines) {
    final trimmedLine = line.trim();

    if (trimmedLine.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = colorMatchRegex.firstMatch(trimmedLine);
    if (match != null) {
      // line is a color
      final name = parseStringValue(match, 1);
      final cyan = parseIntValue(match, 2);
      final magenta = parseIntValue(match, 3);
      final yellow = parseIntValue(match, 4);
      final black = parseIntValue(match, 5);

      colors.add(
        CorelDraw4PaletteColor(
          name: name,
          cyan: cyan,
          magenta: magenta,
          yellow: yellow,
          black: black,
        ),
      );
    }
  }

  return CorelDraw4Palette(colors: colors);
}
