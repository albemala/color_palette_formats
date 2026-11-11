part of 'hpl.dart';

HomesitePalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  const paletteName = 'Homesite Palette';
  // splitLinesUniversal always yields at least one line; a header-only file
  // has no version line, which must be a FormatException, never a
  // RangeError from elementAt.
  if (lines.length < 2) {
    throw const FormatException(
      'Not a valid Homesite Palette. Missing version line.',
    );
  }
  validateHeader(
    lines.elementAt(0),
    HomesitePalette.validFileSignature,
    paletteName,
  );
  validateVersion(
    lines.elementAt(1),
    'Version ${HomesitePalette.validVersion}',
    paletteName,
  );

  final colors = <HomesitePaletteColor>[];
  // Skip header, version, and the third separator line (empty in some
  // files, e.g. '-----------' in others).
  for (final line in lines.skip(3)) {
    // Skip empty lines
    if (line.trim().isEmpty) {
      continue;
    }
    // Channels are separated by runs of whitespace, not single spaces.
    final parts = line.trim().split(RegExp(r'\s+'));
    // int.parse throws FormatException on non-numeric input and overflow,
    // which is the desired behavior here.
    if (parts.length != 3) {
      throw FormatException(
        'Not a valid $paletteName. Expected 3 channel values '
        'but found ${parts.length} in "$line".',
      );
    }
    final red = int.parse(parts[0]);
    final green = int.parse(parts[1]);
    final blue = int.parse(parts[2]);
    // The model constructor asserts these ranges in debug builds; enforce
    // them here with FormatException for release safety.
    validateIntRange(paletteName, 'red', red, 255);
    validateIntRange(paletteName, 'green', green, 255);
    validateIntRange(paletteName, 'blue', blue, 255);
    colors.add(HomesitePaletteColor(red: red, green: green, blue: blue));
  }

  return HomesitePalette(colors: colors);
}
