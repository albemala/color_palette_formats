part of 'paint_dot_net.dart';

// Colors are 8-digit hexadecimal numbers (aarrggbb); int.parse accepts
// both cases, so both are valid here.
final _colorLineRegex = RegExp(r'^[0-9a-fA-F]{8}$');

PaintDotNetPalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  final colors = <PaintDotNetPaletteColor>[];
  for (var i = 0; i < lines.length; i++) {
    final line = lines.elementAt(i).trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    if (line.startsWith(';')) {
      // line is a comment
      // comments are ignored
      continue;
    }

    // line is a color, convert 8-digit hexadecimal numbers (aarrggbb)
    // into red, green, blue, alpha
    if (!_colorLineRegex.hasMatch(line)) {
      throw FormatException(
        'Not a valid Paint.NET palette file. '
        'Expected 8-digit hexadecimal color but found "$line".',
      );
    }
    final alpha = int.parse(line.substring(0, 2), radix: 16);
    final red = int.parse(line.substring(2, 4), radix: 16);
    final green = int.parse(line.substring(4, 6), radix: 16);
    final blue = int.parse(line.substring(6, 8), radix: 16);
    colors.add(
      PaintDotNetPaletteColor(red: red, green: green, blue: blue, alpha: alpha),
    );
  }

  return PaintDotNetPalette(colors: colors);
}
