part of 'clf.dart';

const _paletteName = 'CLF Lab colors file';

double? _parseComponent(String value) {
  return double.tryParse(value.replaceAll(',', '.').trim());
}

ClfPalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  // Loose like the ColorPaletteCodable reader: skip blank and
  // malformed lines, accept comma decimal separators.
  final colors = <ClfPaletteColor>[];
  for (final line in lines) {
    final fields = line.split(ClfPalette.fieldSeparator);
    if (fields.length != 4) {
      continue;
    }
    final l = _parseComponent(fields[1]);
    final a = _parseComponent(fields[2]);
    final b = _parseComponent(fields[3]);
    if (l == null || a == null || b == null) {
      continue;
    }
    colors.add(ClfPaletteColor(name: fields[0], lab: [l, a, b]));
  }

  if (colors.isEmpty) {
    throw const FormatException('Not a valid $_paletteName. No colors found.');
  }

  return ClfPalette(colors: colors);
}
