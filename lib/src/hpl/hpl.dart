import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'hpl.mapper.dart';

/*
* Homesite Palette (HPL) (.hpl) (Allaire Homesite, Macromedia ColdFusion)
*
* Content example:
*

Palette
Version 4.0

0 0 0
255 255 255
204 204 204
153 153 153
102 102 102
51 51 51
0 0 0

*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

const supportedHomesitePaletteVersion = '4.0';

@MappableClass()
class HomesitePaletteColor with HomesitePaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  HomesitePaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}

@MappableClass()
class HomesitePalette with HomesitePaletteMappable {
  final String version;
  final List<HomesitePaletteColor> colors;

  HomesitePalette({
    required this.version,
    required this.colors,
  });

  factory HomesitePalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

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

List<int> _encode(HomesitePalette palette) {
  final lines = <String>[];
  lines.add(_fileSignature);
  lines.add('Version ${palette.version}');
  lines.add('');
  lines.addAll(
    palette.colors.map(
      (color) => '${color.red} ${color.green} ${color.blue}',
    ),
  );
  final contents = lines.join('\n');
  return utf8.encode(contents);
}

const _fileSignature = 'Palette';
