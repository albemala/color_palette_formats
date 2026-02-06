part of 'rebelle.dart';

List<int> _encode(RebellePalette palette) {
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
