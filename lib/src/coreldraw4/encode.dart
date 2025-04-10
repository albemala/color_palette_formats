part of 'coreldraw4.dart';

List<int> _encode(CorelDraw4Palette palette) {
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

  // Add a newline at the end.
  buffer.writeln();

  // Return the UTF-8 encoded bytes.
  return utf8.encode(buffer.toString());
}
