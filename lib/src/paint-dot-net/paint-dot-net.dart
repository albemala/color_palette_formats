import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

part 'paint-dot-net.mapper.dart';

/*
* Paint.NET Palette (.txt) (Paint.NET)
*
* Content example:
*

; paint.net Palette File
; Lines that start with a semicolon are comments
; Colors are written as 8-digit hexadecimal numbers: aarrggbb
; For example, this would specify green: FF00FF00
; The alpha ('aa') value specifies how transparent a color is.
; FF is fully opaque, 00 is fully transparent.
FF000000
FF404040
FFFF0000
FFFF6A00
FFFFD800
FFB6FF00

*
* References:
* - ...
*/

@MappableClass()
class PaintDotNetPaletteColor with PaintDotNetPaletteColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Value: [0..255]
  final int alpha;

  PaintDotNetPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  });
}

@MappableClass()
class PaintDotNetPalette with PaintDotNetPaletteMappable {
  final List<PaintDotNetPaletteColor> colors;

  PaintDotNetPalette({
    required this.colors,
  });
}

const _header = '''
; paint.net Palette File
; Lines that start with a semicolon are comments
; Colors are written as 8-digit hexadecimal numbers: aarrggbb
; For example, this would specify green: FF00FF00
; The alpha ('aa') value specifies how transparent a color is. FF is fully opaque, 00 is fully transparent.
''';

PaintDotNetPalette decodePaintDotNetPalette(File file) {
  final lines = file.readAsLinesSync().map((line) => line.trim());

  final colors = <PaintDotNetPaletteColor>[];
  for (var i = 0; i < lines.length; i++) {
    final line = lines.elementAt(i);
    if (line.isEmpty) continue;
    if (line.startsWith(';')) {
      // line is a comment
      // comments are ignored
      continue;
    }
    // line is a color, convert 8-digit hexadecimal numbers (aarrggbb)
    // into red, green, blue, alpha
    final alpha = int.parse(line.substring(0, 2), radix: 16);
    final red = int.parse(line.substring(2, 4), radix: 16);
    final green = int.parse(line.substring(4, 6), radix: 16);
    final blue = int.parse(line.substring(6, 8), radix: 16);
    colors.add(
      PaintDotNetPaletteColor(
        red: red,
        green: green,
        blue: blue,
        alpha: alpha,
      ),
    );
  }

  return PaintDotNetPalette(
    colors: colors,
  );
}

void encodePaintDotNetPalette(PaintDotNetPalette palette, File file) {
  final buffer = StringBuffer();

  buffer.write(_header);
  for (final color in palette.colors) {
    buffer.write(color.alpha.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.red.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.green.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write(color.blue.toRadixString(16).padLeft(2, '0').toUpperCase());
    buffer.write('\n');
  }

  file.writeAsStringSync(buffer.toString());
}
