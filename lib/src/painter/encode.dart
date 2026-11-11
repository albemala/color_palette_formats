part of 'painter.dart';

String _formatVariability(double value) => value.toStringAsFixed(2);

void _validatePalette(PainterPalette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  for (final entry
      in {
        'rows': palette.rows,
        'columns': palette.columns,
        'width': palette.width,
        'height': palette.height,
        'textHeight': palette.textHeight,
        'spacing': palette.spacing,
      }.entries) {
    if (entry.value < 0) {
      throw FormatException(
        'Not a valid $_paletteName. "${entry.key}" must not be negative.',
      );
    }
  }
  if (palette.colors.isEmpty) {
    throw const FormatException(
      'Not a valid $_paletteName: no colors to write.',
    );
  }
  for (final color in palette.colors) {
    validateIntRange(_paletteName, 'red', color.red, 255);
    validateIntRange(_paletteName, 'green', color.green, 255);
    validateIntRange(_paletteName, 'blue', color.blue, 255);
    for (final entry
        in {'HV': color.hv, 'SV': color.sv, 'VV': color.vv}.entries) {
      if (!entry.value.isFinite) {
        throw FormatException(
          'Not a valid $_paletteName. '
          '${entry.key} value "${entry.value}" is not finite.',
        );
      }
    }
    // Line breaks in names cannot round-trip: the decoder treats them
    // as color-line structure.
    if (color.name.contains('\r') || color.name.contains('\n')) {
      throw FormatException(
        'Not a valid $_paletteName. Invalid color name "${color.name}".',
      );
    }
  }
}

List<int> _encode(PainterPalette palette) {
  _validatePalette(palette);

  final lines = <String>[];
  lines.add('ROWS ${palette.rows}');
  lines.add('COLS ${palette.columns}');
  lines.add('WIDTH ${palette.width}');
  lines.add('HEIGHT ${palette.height}');
  lines.add('TEXTHEIGHT ${palette.textHeight}');
  lines.add('SPACING ${palette.spacing}');
  for (final color in palette.colors) {
    lines.add(
      'R:${color.red}, G:${color.green}, B:${color.blue}  '
      'HV:${_formatVariability(color.hv)}, '
      'SV:${_formatVariability(color.sv)}, '
      'VV:${_formatVariability(color.vv)}  '
      '${color.name}',
    );
  }
  return utf8.encode(lines.join('\n'));
}
