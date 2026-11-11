part of 'coreldraw4.dart';

void _validatePalette(CorelDraw4Palette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  if (palette.colors.isEmpty) {
    throw const FormatException(
      'Not a valid $_paletteName: no colors to write.',
    );
  }
  for (final color in palette.colors) {
    // Quotes and line breaks in names cannot round-trip: the decoder
    // treats them as line structure.
    if (color.name.isEmpty ||
        color.name.contains('"') ||
        color.name.contains('\r') ||
        color.name.contains('\n')) {
      throw FormatException(
        'Not a valid $_paletteName. Invalid color name "${color.name}".',
      );
    }
    for (final entry
        in {
          'cyan': color.cyan,
          'magenta': color.magenta,
          'yellow': color.yellow,
          'black': color.black,
        }.entries) {
      if (entry.value < 0 || entry.value > 100) {
        throw FormatException(
          'Not a valid $_paletteName. '
          '${entry.key} "${entry.value}" out of range 0..100.',
        );
      }
    }
  }
}

List<int> _encode(CorelDraw4Palette palette) {
  _validatePalette(palette);

  final buffer = StringBuffer();

  for (final color in palette.colors) {
    final c = color.cyan;
    final m = color.magenta;
    final y = color.yellow;
    final k = color.black;
    // Format: "Name" C M Y K
    // Pad values with spaces for alignment, similar to the example file.
    // This might not be strictly necessary but mimics the example.
    // A simple approach is just space separation.
    buffer.writeln('"${color.name}"    $c    $m    $y    $k');
  }

  // Return the UTF-8 encoded bytes.
  return utf8.encode(buffer.toString());
}
