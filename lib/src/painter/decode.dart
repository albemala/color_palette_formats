part of 'painter.dart';

const _paletteName = 'Corel Painter Palette';
final _whitespace = RegExp(r'\s+');
final _colorLine = RegExp(
  r'^R:\s*(\d+)\s*,\s*G:\s*(\d+)\s*,\s*B:\s*(\d+)\s+HV:\s*(\S+)\s*,\s*SV:\s*(\S+)\s*,\s*VV:\s*(\S+)\s*(.*)$',
);

int _headerInt(String line, String label) {
  final parts = line.trim().split(_whitespace);
  if (parts.length != 2 || parts[0] != label) {
    throw FormatException(
      'Not a valid $_paletteName. Expected "$label ..." but found "$line".',
    );
  }
  final value = int.parse(parts[1]);
  if (value < 0) {
    throw FormatException(
      'Not a valid $_paletteName. "$label" value must not be negative.',
    );
  }
  return value;
}

PainterPaletteColor _parseColor(String line) {
  final match = _colorLine.firstMatch(line.trim());
  if (match == null) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid color line "$line".',
    );
  }
  // Groups 1-6 are required by the regex; a missing group means a
  // malformed line rather than a valid color.
  final values = <String>[];
  for (var i = 1; i <= 6; i++) {
    final value = match.group(i);
    if (value == null) {
      throw FormatException(
        'Not a valid $_paletteName. Invalid color line "$line".',
      );
    }
    values.add(value);
  }
  final red = int.parse(values[0]);
  final green = int.parse(values[1]);
  final blue = int.parse(values[2]);
  if (red < 0 ||
      red > 255 ||
      green < 0 ||
      green > 255 ||
      blue < 0 ||
      blue > 255) {
    throw FormatException(
      'Not a valid $_paletteName. RGB values out of range in "$line".',
    );
  }
  final hv = double.parse(values[3]);
  final sv = double.parse(values[4]);
  final vv = double.parse(values[5]);
  for (final entry in {'HV': hv, 'SV': sv, 'VV': vv}.entries) {
    if (!entry.value.isFinite) {
      throw FormatException(
        'Not a valid $_paletteName. ${entry.key} value "${entry.value}" '
        'is not finite in "$line".',
      );
    }
  }
  final name = (match.group(7) ?? '').trim();
  return PainterPaletteColor(
    red: red,
    green: green,
    blue: blue,
    hv: hv,
    sv: sv,
    vv: vv,
    name: name,
  );
}

PainterPalette _decode(List<int> bytes) {
  // Lone-CR line endings are accepted (classic Mac files).
  final lines = splitLinesUniversal(bytes);

  if (lines.length < 6) {
    throw const FormatException(
      'Not a valid $_paletteName: missing header lines.',
    );
  }

  final rows = _headerInt(lines.elementAt(0), 'ROWS');
  final columns = _headerInt(lines.elementAt(1), 'COLS');
  final width = _headerInt(lines.elementAt(2), 'WIDTH');
  final height = _headerInt(lines.elementAt(3), 'HEIGHT');
  final textHeight = _headerInt(lines.elementAt(4), 'TEXTHEIGHT');
  final spacing = _headerInt(lines.elementAt(5), 'SPACING');

  final colors = <PainterPaletteColor>[];
  for (final line in lines.skip(6)) {
    if (line.trim().isEmpty) {
      continue;
    }
    colors.add(_parseColor(line));
  }
  if (colors.isEmpty) {
    throw const FormatException('Not a valid $_paletteName. No colors found.');
  }

  return PainterPalette(
    rows: rows,
    columns: columns,
    width: width,
    height: height,
    textHeight: textHeight,
    spacing: spacing,
    colors: colors,
  );
}
