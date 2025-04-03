part of 'psp.dart';

PaintShopProPalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  const paletteName = 'Paint Shop Pro palette';
  validateHeader(lines.elementAt(0), _fileSignature, paletteName);
  validateVersion(lines.elementAt(1), PaintShopProPalette.version, paletteName);

  final colors =
      lines
          // Skip header
          .skip(3)
          // Skip empty lines
          .where((line) => line.isNotEmpty)
          // Parse color values
          .map((line) {
            final values = line.split(' ').map(int.parse).toList();
            return PaintShopProPaletteColor(
              red: values[0],
              green: values[1],
              blue: values[2],
            );
          })
          .toList();

  return PaintShopProPalette(colors: colors);
}
