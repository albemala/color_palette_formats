part of 'paint-dot-net.dart';

List<int> _encode(PaintDotNetPalette palette) {
  final buffer = StringBuffer();
  buffer.write(_header);
  for (final color in palette.colors) {
    buffer.write(_colorToHex(color.alpha));
    buffer.write(_colorToHex(color.red));
    buffer.write(_colorToHex(color.green));
    buffer.write(_colorToHex(color.blue));
    buffer.write('\n');
  }
  return utf8.encode(buffer.toString());
}

String _colorToHex(int colorValue) {
  return colorValue.toRadixString(16).padLeft(2, '0').toUpperCase();
}
