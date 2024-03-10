import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

part 'jasc-pal.mapper.dart';

/*
* Jasc Palette (JASC PAL) (.pal, .psppalette) (Paint Shop Pro, Jasc Software, Corel)
*
* Content example:
*

JASC-PAL
0100
256
71 41 45
119 115 142
209 132 31

*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

const supportedJascPaletteVersion = '0100';

@MappableClass()
class JascPaletteColor with JascPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  JascPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}

@MappableClass()
class JascPalette with JascPaletteMappable {
  final String version;
  final List<JascPaletteColor> colors;

  JascPalette({
    required this.version,
    required this.colors,
  });
}

const _fileSignature = 'JASC-PAL';

JascPalette decodeJascPalette(File file) {
  final lines = file.readAsLinesSync().map((line) => line.trim());

  final header = lines.elementAt(0);
  if (header != _fileSignature) {
    throw Exception('Not a valid JASC PAL file');
  }

  final version = lines.elementAt(1);
  if (version != supportedJascPaletteVersion) {
    throw Exception(
      'Unsupported version $version. Supported version: $supportedJascPaletteVersion',
    );
  }

  final colorsCount = lines.elementAt(2);

  final colors = lines
      // skip header
      .skip(3)
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

void encodeJascPalette(JascPalette jascPalette, File file) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);
  buffer.writeln(jascPalette.version);
  buffer.writeln(jascPalette.colors.length);
  for (final color in jascPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue}');
  }
  file.writeAsStringSync(buffer.toString());
}
