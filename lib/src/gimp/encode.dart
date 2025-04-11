part of 'gimp.dart';

List<int> _encode(GimpPalette gimpPalette) {
  final buffer = StringBuffer();
  buffer.writeln(GimpPalette.validFileSignature);
  for (final line in gimpPalette.info) {
    buffer.writeln(line);
  }
  for (final line in gimpPalette.comments) {
    buffer.writeln('# $line');
  }
  for (final color in gimpPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue} ${color.name}');
  }
  return utf8.encode(buffer.toString());
}
