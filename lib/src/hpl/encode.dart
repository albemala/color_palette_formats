part of 'hpl.dart';

List<int> _encode(HomesitePalette palette) {
  _validatePalette(palette);
  final lines = <String>[];
  lines.add(HomesitePalette.validFileSignature);
  lines.add('Version ${HomesitePalette.validVersion}');
  lines.add('');
  lines.addAll(
    palette.colors.map((color) => '${color.red} ${color.green} ${color.blue}'),
  );
  final contents = lines.join('\n');
  return utf8.encode(contents);
}

void _validatePalette(HomesitePalette palette) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  const paletteName = 'Homesite Palette';
  for (final color in palette.colors) {
    validateIntRange(paletteName, 'red', color.red, 255);
    validateIntRange(paletteName, 'green', color.green, 255);
    validateIntRange(paletteName, 'blue', color.blue, 255);
  }
}
