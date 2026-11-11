part of 'skencil.dart';

List<int> _encode(SkencilPalette skencilPalette) {
  for (final color in skencilPalette.colors) {
    _validateColor(color);
  }
  final buffer = StringBuffer();
  buffer.writeln(SkencilPalette.validFileSignature);

  for (final color in skencilPalette.colors) {
    // Format floats with sufficient precision, separated by spaces,
    // then a tab, then the name.
    // Using toStringAsFixed(6) to match the precision in the 'mini.spl'
    // example.
    final redStr = color.red.toStringAsFixed(6);
    final greenStr = color.green.toStringAsFixed(6);
    final blueStr = color.blue.toStringAsFixed(6);
    buffer.writeln('$redStr $greenStr $blueStr\t${color.name}');
  }
  return utf8.encode(buffer.toString());
}

void _validateColor(SkencilPaletteColor color) {
  const paletteName = 'Skencil palette file';
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety. NaN passes bare
  // range comparisons, so finiteness is checked explicitly.
  for (final entry
      in {'red': color.red, 'green': color.green, 'blue': color.blue}.entries) {
    if (!entry.value.isFinite) {
      throw FormatException(
        'Not a valid $paletteName. Non-finite ${entry.key} '
        'value "${entry.value}".',
      );
    }
    if (entry.value < 0.0 || entry.value > 1.0) {
      throw FormatException(
        'Not a valid $paletteName. ${entry.key} value "${entry.value}" '
        'out of range 0.0..1.0.',
      );
    }
  }
  // Names are written raw to end of line; line breaks would split rows
  // (or inject phantom colors) when the file is read back. Tabs are safe:
  // the decoder captures the name to end of line.
  if (color.name.contains(RegExp(r'[\r\n]'))) {
    throw FormatException(
      'Not a valid $paletteName. Color name "${color.name}" '
      'must not contain line breaks.',
    );
  }
}
