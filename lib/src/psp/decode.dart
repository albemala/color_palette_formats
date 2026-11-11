part of 'psp.dart';

PaintShopProPalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  const paletteName = 'Paint Shop Pro palette';
  // splitLinesUniversal always yields at least one line; a file with fewer
  // than 3 lines is missing the version or color-count line, which must be
  // a FormatException, never a RangeError from elementAt.
  if (lines.length < 3) {
    throw const FormatException(
      'Not a valid Paint Shop Pro palette. '
      'Missing version or color-count line.',
    );
  }
  validateHeader(
    lines.elementAt(0),
    PaintShopProPalette.validFileSignature,
    paletteName,
  );
  validateVersion(
    lines.elementAt(1),
    PaintShopProPalette.validVersion,
    paletteName,
  );

  // The third line declares the color count. It must be a non-negative
  // integer; mismatches with the actual color lines are tolerated.
  final declaredCount = int.tryParse(lines.elementAt(2).trim());
  if (declaredCount == null || declaredCount < 0) {
    throw FormatException(
      'Not a valid $paletteName. Expected a non-negative color count '
      'but found "${lines.elementAt(2)}".',
    );
  }

  final colors = <PaintShopProPaletteColor>[];
  // Skip header, version, and color-count lines.
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
    colors.add(PaintShopProPaletteColor(red: red, green: green, blue: blue));
  }

  return PaintShopProPalette(colors: colors);
}
