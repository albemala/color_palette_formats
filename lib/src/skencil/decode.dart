part of 'skencil.dart';

SkencilPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split(RegExp(r'\r?\n'));

  _validateHeader(lines.elementAt(0));

  final colors = <SkencilPaletteColor>[];
  // Start from the second line (index 1)
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i).trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    // Regex to capture three float numbers and the rest as the name
    // Allows for space or tab separation between numbers and name
    final regex = RegExp(r'([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+(.*)');
    final match = regex.firstMatch(line);

    if (match != null) {
      final redStr = match.group(1);
      final greenStr = match.group(2);
      final blueStr = match.group(3);
      final colorName = match.group(4)?.trim() ?? '';

      final red = double.tryParse(redStr ?? '') ?? 0;
      final green = double.tryParse(greenStr ?? '') ?? 0;
      final blue = double.tryParse(blueStr ?? '') ?? 0;

      colors.add(
        SkencilPaletteColor(
          red: red,
          green: green,
          blue: blue,
          name: colorName,
        ),
      );
      continue;
    }

    throw FormatException('''
Could not parse line $line''');
  }

  return SkencilPalette(colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw FormatException(
      '''
Not a valid Skencil palette file. Expected header '$_fileSignature' but found '$header'.''',
    );
  }
}
