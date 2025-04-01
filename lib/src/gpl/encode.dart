part of 'gpl.dart';

List<int> _encode(GimpPalette gimpPalette) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);
  buffer.writeln('Name: ${gimpPalette.name}');
  buffer.writeln('Columns: ${gimpPalette.columns}');
  gimpPalette.comments //
      .split('\n')
      .forEach((line) => buffer.writeln('# $line'));
  for (final color in gimpPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue} ${color.name}');
  }
  return utf8.encode(buffer.toString());
}
