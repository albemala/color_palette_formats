part of 'jasc-pal.dart';

JascPalette _decode(List<int> bytes) {
  final lines = utf8.decode(bytes).split('\n');

  final header = lines.elementAt(0);
  if (header != _fileSignature) {
    throw Exception('Not a valid JASC PAL file');
  }

  final version = lines.elementAt(1);
  if (version != supportedJascPaletteVersion) {
    throw Exception('''
Unsupported version $version. Supported version: $supportedJascPaletteVersion''');
  }

  // ignore: unused_local_variable
  final colorsCount = lines.elementAt(2);

  final colors = lines
      // skip header
      .skip(3)
      // remove empty lines
      .where((line) => line.isNotEmpty)
      .map((line) {
    // split line int 3 values: red, green, blue
    final values = line.split(' ').map(int.parse).toList();
    return JascPaletteColor(
      red: values[0],
      green: values[1],
      blue: values[2],
    );
  }).toList();

  return JascPalette(
    version: version,
    colors: colors,
  );
}
