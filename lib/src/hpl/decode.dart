part of 'hpl.dart';

HomesitePalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  final header = lines.elementAt(0);
  if (header != _fileSignature) {
    throw Exception('Not a valid HPL file');
  }

  final version = lines.elementAt(1).split(' ').last;
  if (version != supportedHomesitePaletteVersion) {
    throw Exception('''
Unsupported version $version. Supported version: $supportedHomesitePaletteVersion''');
  }

  final colors = lines //
      // skip header and version
      .skip(3)
      // remove empty lines
      .where((line) => line.isNotEmpty)
      .map((line) {
    // split line into 3 values: red, green, blue
    final values = line.split(' ').map(int.parse).toList();
    return HomesitePaletteColor(
      red: values[0],
      green: values[1],
      blue: values[2],
    );
  }).toList();

  return HomesitePalette(
    version: version,
    colors: colors,
  );
}
