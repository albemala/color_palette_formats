part of 'paint_dot_net.dart';

List<int> _encode(PaintDotNetPalette palette) {
  _validatePalette(palette);
  final buffer = StringBuffer();
  buffer.write(PaintDotNetPalette.validFileHeader);
  for (final color in palette.colors) {
    buffer.write(_colorToHex(color.alpha));
    buffer.write(_colorToHex(color.red));
    buffer.write(_colorToHex(color.green));
    buffer.write(_colorToHex(color.blue));
    buffer.write('\n');
  }
  return utf8.encode(buffer.toString());
}

void _validatePalette(PaintDotNetPalette palette) {
  // Hex pairs hold exactly two digits, so out-of-range values would emit
  // longer fragments and corrupt the line. The model constructor asserts
  // these ranges in debug builds; enforce them here with FormatException
  // for release safety.
  const paletteName = 'Paint.NET palette file';
  for (final color in palette.colors) {
    validateIntRange(paletteName, 'red', color.red, 255);
    validateIntRange(paletteName, 'green', color.green, 255);
    validateIntRange(paletteName, 'blue', color.blue, 255);
    validateIntRange(paletteName, 'alpha', color.alpha, 255);
  }
}

String _colorToHex(int colorValue) {
  return colorValue.toRadixString(16).padLeft(2, '0').toUpperCase();
}
