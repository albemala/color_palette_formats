part of 'jasc-pal.dart';

JascPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  _validateHeader(lines.elementAt(0));
  _validateVersion(lines.elementAt(1));

  final colors =
      lines
          // skip header and version
          .skip(3)
          // remove empty lines
          .where((line) => line.isNotEmpty)
          .map((line) {
            // split line into 3 values: red, green, blue
            final values = line.split(' ').map(int.parse).toList();
            return JascPaletteColor(
              red: values[0],
              green: values[1],
              blue: values[2],
            );
          })
          .toList();

  return JascPalette(colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw const FormatException('''
Not a valid JASC PAL file''');
  }
}

void _validateVersion(String version) {
  if (version != JascPalette.version) {
    throw FormatException('''
Unsupported version $version. Supported version: ${JascPalette.version}''');
  }
}
