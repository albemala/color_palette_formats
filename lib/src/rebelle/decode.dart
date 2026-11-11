part of 'rebelle.dart';

RebellePalette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  const paletteName = 'Rebelle palette';
  final colors = <RebellePaletteColor>[];
  for (final rawLine in lines) {
    final line = rawLine.trim();

    if (line.isEmpty) {
      // skip empty lines
      continue;
    }

    // Two tab-separated columns: hex color and optional name.
    final parts = line.split('\t');
    if (parts.length > 2) {
      throw FormatException(
        'Not a valid $paletteName. Expected at most 2 tab-separated '
        'columns but found ${parts.length} in "$line".',
      );
    }

    // First part is the hex color
    final hexColor = parts[0].trim();
    if (!hexColor.startsWith('#') || hexColor.length != 7) {
      throw FormatException(
        'Not a valid $paletteName. Expected a "#RRGGBB" color '
        'but found "$hexColor".',
      );
    }

    // Parse hex color into RGB components. int.parse throws
    // FormatException on non-hex digits, which is the desired behavior
    // here. Two hex digits always land in 0..255, so no range check is
    // needed.
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
      'Not a valid $paletteName file. No colors found.',
    );
  }

  return RebellePalette(colors: colors);
}
