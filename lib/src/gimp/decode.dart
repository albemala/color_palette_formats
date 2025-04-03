part of 'gimp.dart';

GimpPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split(RegExp(r'\r?\n'));

  _validateHeader(lines.elementAt(0));

  final info = <String>[];
  final comments = <String>[];
  final colors = <GimpPaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    final regex = RegExp(r'(\d+)\s+(\d+)\s+(\d+)\s*(.*)');
    final match = regex.firstMatch(line);
    if (match != null) {
      // line is a color
      // the first 3 parts are red, green and blue
      // the rest is the color name
      final red = int.tryParse(match.group(1) ?? '') ?? 0;
      final green = int.tryParse(match.group(2) ?? '') ?? 0;
      final blue = int.tryParse(match.group(3) ?? '') ?? 0;
      final colorName = match.group(4) ?? '';
      colors.add(
        GimpPaletteColor(red: red, green: green, blue: blue, name: colorName),
      );
      continue;
    }

    if (line.startsWith('#')) {
      // line is a comment
      final comment = line.substring(1).trim();
      comments.add(comment);
      continue;
    }

    // line is info
    info.add(line.trim());
  }

  return GimpPalette(info: info, comments: comments, colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw const FormatException('''
Not a valid Gimp palette file''');
  }
}
