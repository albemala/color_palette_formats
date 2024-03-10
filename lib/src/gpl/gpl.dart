import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

part 'gpl.mapper.dart';

/*
* Gimp Palette (GPL) (.gpl) (Gimp, Inkscape, Krita, KolourPaint, Scribus, CinePaint, MyPaint)
*
* Content example:
*

GIMP Palette
Name: Oxygen
#
56  37    9	wood brown6
87  64   30	wood brown5
117 81   26	wood brown4
143 107	 50	wood brown3

*
*   References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

@MappableClass()
class GimpPaletteColor with GimpPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;
  final String name;

  GimpPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  });
}

@MappableClass()
class GimpPalette with GimpPaletteMappable {
  final String name;
  final int columns;
  final String comments;
  final List<GimpPaletteColor> colors;

  GimpPalette({
    required this.name,
    this.columns = 1,
    this.comments = '',
    required this.colors,
  });
}

const _fileSignature = 'GIMP Palette';

GimpPalette decodeGimpPalette(File file) {
  final lines = file.readAsLinesSync().map((line) => line.trim());

  final header = lines.elementAt(0);
  if (header != _fileSignature) {
    throw Exception('Not a valid Gimp palette file');
  }

  var name = '';
  var columns = 1;
  final comments = StringBuffer();
  final colors = <GimpPaletteColor>[];
  for (var i = 1; i < lines.length; i++) {
    final line = lines.elementAt(i);
    if (line.startsWith('#')) {
      // line is a comment
      var comment = line.substring(1);
      if (comment.startsWith(' ')) comment = comment.substring(1);
      comments.writeln(comment);
      continue;
    }
    if (line.startsWith('Name:')) {
      // line is the palette name
      name = line.replaceFirst('Name:', '').trim();
      continue;
    }
    if (line.startsWith('Columns:')) {
      // line is the number of columns
      columns = int.tryParse(line.replaceFirst('Columns:', '').trim()) ?? 0;
      continue;
    }
    // line is a color
    // the first 3 parts are red, green and blue
    // the rest is the color name
    final regex = RegExp(r'(\d+)\s+(\d+)\s+(\d+)\s*(.*)');
    final match = regex.firstMatch(line);
    final red = int.tryParse(match?.group(1) ?? '') ?? 0;
    final green = int.tryParse(match?.group(2) ?? '') ?? 0;
    final blue = int.tryParse(match?.group(3) ?? '') ?? 0;
    final colorName = match?.group(4) ?? '';
    colors.add(
      GimpPaletteColor(
        red: red,
        green: green,
        blue: blue,
        name: colorName,
      ),
    );
  }

  return GimpPalette(
    name: name,
    columns: columns,
    comments: comments.toString(),
    colors: colors,
  );
}

void encodeGimpPalette(GimpPalette gimpPalette, File file) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);
  buffer.writeln('Name: ${gimpPalette.name}');
  buffer.writeln('Columns: ${gimpPalette.columns}');
  gimpPalette.comments //
      .split('\n')
      .forEach((line) => buffer.writeln('# $line'));
  for (final color in gimpPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue} ${color.name}');
  }
  file.writeAsStringSync(buffer.toString());
}
