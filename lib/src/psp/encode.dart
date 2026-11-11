part of 'psp.dart';

List<int> _encode(PaintShopProPalette pspPalette) {
  const paletteName = 'Paint Shop Pro palette';
  for (final color in pspPalette.colors) {
    // The model constructor asserts these ranges in debug builds; enforce
    // them here with FormatException for release safety.
    validateIntRange(paletteName, 'red', color.red, 255);
    validateIntRange(paletteName, 'green', color.green, 255);
    validateIntRange(paletteName, 'blue', color.blue, 255);
  }
  final buffer = StringBuffer();
  buffer.writeln(PaintShopProPalette.validFileSignature);
  buffer.writeln(PaintShopProPalette.validVersion);
  buffer.writeln(pspPalette.colors.length);
  for (final color in pspPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue}');
  }
  return utf8.encode(buffer.toString());
}
