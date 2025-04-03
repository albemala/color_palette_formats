part of 'coreldraw4.dart';

CorelDraw4Palette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split(RegExp(r'\r?\n'));

  final colors = <CorelDraw4PaletteColor>[];

  // Regex to capture the name in quotes and the four CMYK values
  // Handles potential extra whitespace
  final regex = RegExp(r'^"([^"]+)"\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)');

  for (final line in lines) {
    final trimmedLine = line.trim();
    if (trimmedLine.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = regex.firstMatch(trimmedLine);
    if (match != null) {
      // line is a color
      final name = match.group(1) ?? '';
      final cyan = int.tryParse(match.group(2) ?? '') ?? 0;
      final magenta = int.tryParse(match.group(3) ?? '') ?? 0;
      final yellow = int.tryParse(match.group(4) ?? '') ?? 0;
      final black = int.tryParse(match.group(5) ?? '') ?? 0;

      // Basic validation for CMYK range (0-100)
      if (cyan >= 0 &&
          cyan <= 100 &&
          magenta >= 0 &&
          magenta <= 100 &&
          yellow >= 0 &&
          yellow <= 100 &&
          black >= 0 &&
          black <= 100) {
        colors.add(
          CorelDraw4PaletteColor(
            name: name,
            cyan: cyan,
            magenta: magenta,
            yellow: yellow,
            black: black,
          ),
        );
      } else {
        // Optionally handle invalid CMYK values, e.g., log a warning or throw
        // For now, we'll just skip lines with invalid values
        print('Warning: Skipping line with invalid CMYK values: $line');
      }
    } else {
      // Optionally handle lines that don't match the expected format
      print('Warning: Skipping unrecognized line format: $line');
    }
  }

  // CorelDraw .pal files don't have headers or info/comment sections like GIMP .gpl
  return CorelDraw4Palette(colors: colors);
}
