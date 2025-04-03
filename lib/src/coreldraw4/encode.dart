part of 'coreldraw4.dart';

List<int> _encode(CorelDraw4Palette palette) {
  final buffer = StringBuffer();

  // CorelDraw .pal files don't have headers or info/comment sections.
  // Just write the color lines directly.

  for (final color in palette.colors) {
    // Format: "Name" C M Y K
    // Ensure values are within the valid 0-100 range, although the class constructor should handle this.
    final c = color.cyan.clamp(0, 100);
    final m = color.magenta.clamp(0, 100);
    final y = color.yellow.clamp(0, 100);
    final k = color.black.clamp(0, 100);

    // Pad values with spaces for alignment, similar to the example file.
    // This might not be strictly necessary but mimics the example.
    // A simple approach is just space separation.
    buffer.writeln('"${color.name}"    $c    $m    $y    $k');
  }

  // Return the UTF-8 encoded bytes.
  return utf8.encode(buffer.toString());
}
