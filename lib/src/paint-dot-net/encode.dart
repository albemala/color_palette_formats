part of 'paint-dot-net.dart';

List<int> _encode(PaintDotNetPalette palette) {
  final buffer = StringBuffer();
  buffer.write(_header);
  for (final color in palette.colors) {
    buffer.write(color.alpha.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.red.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.green.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.blue.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write('\n');
  }
  return utf8.encode(buffer.toString());
}
