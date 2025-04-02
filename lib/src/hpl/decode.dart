part of 'hpl.dart';

HomesitePalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  _validateHeader(lines.elementAt(0));
  _validateVersion(lines.elementAt(1));

  final colors =
      lines //
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
          })
          .toList();

  return HomesitePalette(colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw const FormatException('''
Not a valid HPL file''');
  }
}

void _validateVersion(String versionLine) {
  if (versionLine != 'Version ${HomesitePalette.version}') {
    throw FormatException(
      '''
Unsupported version. Expected Version ${HomesitePalette.version}, got $versionLine''',
    );
  }
}
