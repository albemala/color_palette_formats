part of 'painter.dart';

String _formatVariability(double value) => value.toStringAsFixed(2);

List<int> _encode(PainterPalette palette) {
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
