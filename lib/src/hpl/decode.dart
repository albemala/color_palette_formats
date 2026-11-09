part of 'hpl.dart';

HomesitePalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  const paletteName = 'Homesite Palette';
  validateHeader(
    lines.elementAt(0),
    HomesitePalette.validFileSignature,
    paletteName,
  );
  validateVersion(
    lines.elementAt(1),
    'Version ${HomesitePalette.validVersion}',
    paletteName,
  );

  final colors =
      lines
          // Skip header
          .skip(3)
          // Skip empty lines
          .where((line) => line.isNotEmpty)
          // Parse color values
          .map((line) {
            final values = line.split(' ').map(int.parse).toList();
            return HomesitePaletteColor(
              red: values[0],
              green: values[1],
              blue: values[2],
            );
          })
          .toList();

  return HomesitePalette(colors: colors);
}
