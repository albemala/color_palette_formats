part of 'rebelle.dart';

List<int> _encode(RebellePalette palette) {
  const paletteName = 'Rebelle palette';
  for (final color in palette.colors) {
    // The model constructor asserts these ranges in debug builds; enforce
    // them here with FormatException for release safety.
    validateIntRange(paletteName, 'red', color.red, 255);
    validateIntRange(paletteName, 'green', color.green, 255);
    validateIntRange(paletteName, 'blue', color.blue, 255);
    // Names are written raw into a tab-separated line; tabs and line
    // breaks would split rows or columns (or inject phantom colors) when
    // the file is read back.
    if (color.name.contains(RegExp(r'[\r\n\t]'))) {
      throw FormatException(
        'Not a valid $paletteName. Color name "${color.name}" '
        'must not contain tabs or line breaks.',
      );
    }
  }

  final buffer = StringBuffer();

  for (final color in palette.colors) {
    // Write hex color
    buffer.write('#');
    buffer.write(_colorToHex(color.red));
    buffer.write(_colorToHex(color.green));
    buffer.write(_colorToHex(color.blue));

    // Write tab separator
    buffer.write('\t');

    // Write name (can be empty)
    buffer.write(color.name);

    buffer.write('\n');
  }

  return utf8.encode(buffer.toString());
}

String _colorToHex(int colorValue) {
  return colorValue.toRadixString(16).padLeft(2, '0').toLowerCase();
}
