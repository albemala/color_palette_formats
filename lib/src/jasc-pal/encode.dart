part of 'jasc-pal.dart';

List<int> _encode(JascPalette jascPalette) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);
  buffer.writeln(jascPalette.version);
  buffer.writeln(jascPalette.colors.length);
  for (final color in jascPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue}');
  }
  return utf8.encode(buffer.toString());
}
