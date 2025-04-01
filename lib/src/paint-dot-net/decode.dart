part of 'paint-dot-net.dart';

PaintDotNetPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  final colors = <PaintDotNetPaletteColor>[];
  for (var i = 0; i < lines.length; i++) {
    final line = lines.elementAt(i);
    if (line.isEmpty) continue;
    if (line.startsWith(';')) {
      // line is a comment
      // comments are ignored
      continue;
    }
    // line is a color, convert 8-digit hexadecimal numbers (aarrggbb)
    // into red, green, blue, alpha
    final alpha = int.parse(line.substring(0, 2), radix: 16);
    final red = int.parse(line.substring(2, 4), radix: 16);
    final green = int.parse(line.substring(4, 6), radix: 16);
    final blue = int.parse(line.substring(6, 8), radix: 16);
    colors.add(
      PaintDotNetPaletteColor(
        red: red,
        green: green,
        blue: blue,
        alpha: alpha,
      ),
    );
  }

  return PaintDotNetPalette(
    colors: colors,
  );
}
