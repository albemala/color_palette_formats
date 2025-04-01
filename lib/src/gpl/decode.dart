part of 'gpl.dart';

GimpPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  final header = lines.elementAt(0);
  if (header != _fileSignature) {
    throw Exception('Not a valid Gimp palette file');
  }

  var name = '';
  var columns = 1;
  final comments = StringBuffer();
  final colors = <GimpPaletteColor>[];
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);
    // skip empty lines
    if (line.isEmpty) continue;
    if (line.startsWith('#')) {
      // line is a comment
      var comment = line.substring(1);
      if (comment.startsWith(' ')) comment = comment.substring(1);
      comments.writeln(comment);
      continue;
    }
    if (line.startsWith('Name:')) {
      // line is the palette name
      name = line.replaceFirst('Name:', '').trim();
      continue;
    }
    if (line.startsWith('Columns:')) {
      // line is the number of columns
      columns = int.tryParse(line.replaceFirst('Columns:', '').trim()) ?? 0;
      continue;
    }
    // line is a color
    // the first 3 parts are red, green and blue
    // the rest is the color name
    final regex = RegExp(r'(\d+)\s+(\d+)\s+(\d+)\s*(.*)');
    final match = regex.firstMatch(line);
    final red = int.tryParse(match?.group(1) ?? '') ?? 0;
    final green = int.tryParse(match?.group(2) ?? '') ?? 0;
    final blue = int.tryParse(match?.group(3) ?? '') ?? 0;
    final colorName = match?.group(4) ?? '';
    colors.add(
      GimpPaletteColor(
        red: red,
        green: green,
        blue: blue,
        name: colorName,
      ),
    );
  }

  return GimpPalette(
    name: name,
    columns: columns,
    comments: comments.toString(),
    colors: colors,
  );
}
