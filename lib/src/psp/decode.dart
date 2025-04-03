part of 'psp.dart';

PaintShopProPalette _decode(List<int> bytes) {
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
            return PaintShopProPaletteColor(
              red: values[0],
              green: values[1],
              blue: values[2],
            );
          })
          .toList();

  return PaintShopProPalette(colors: colors);
}

void _validateHeader(String header) {
  if (header != _fileSignature) {
    throw const FormatException('''
Not a valid Paint Shop Pro file''');
  }
}

void _validateVersion(String version) {
  if (version != PaintShopProPalette.version) {
    throw FormatException(
      '''
Unsupported version $version. Supported version: ${PaintShopProPalette.version}''',
    );
  }
}
