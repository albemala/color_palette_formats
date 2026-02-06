part of 'rebelle.dart';

RebellePalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  final colors = <RebellePaletteColor>[];
  for (var i = 0; i < lines.length; i++) {
    final line = lines.elementAt(i).trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    // Split by tab character
    final parts = line.split('\t');
    if (parts.isEmpty) {
      continue;
    }

    // First part is the hex color
    final hexColor = parts[0].trim();
    if (!hexColor.startsWith('#') || hexColor.length != 7) {
      // Invalid hex format, skip this line
      continue;
    }

    // Parse hex color into RGB components
    final red = int.parse(hexColor.substring(1, 3), radix: 16);
    final green = int.parse(hexColor.substring(3, 5), radix: 16);
    final blue = int.parse(hexColor.substring(5, 7), radix: 16);

    // Second part is the name (optional, can be empty)
    final name = parts.length > 1 ? parts[1] : '';

    colors.add(
      RebellePaletteColor(red: red, green: green, blue: blue, name: name),
    );
  }

  if (colors.isEmpty) {
    throw const FormatException(
      'No valid colors found in Rebelle palette file',
    );
  }

  return RebellePalette(colors: colors);
}
