part of 'psp.dart';

List<int> _encode(PaintShopProPalette pspPalette) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);
  buffer.writeln(PaintShopProPalette.version);
  buffer.writeln(pspPalette.colors.length);
  for (final color in pspPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue}');
  }
  return utf8.encode(buffer.toString());
}
