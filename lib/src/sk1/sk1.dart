import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'sk1.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* sK1 Palette (.skp)
* Format used by sK1 vector graphics editor.
*
* References:
*  - https://sk1project.net/
*  - Based on observed format in example files like Ubuntu_colors.skp.
*/

@MappableEnum()
enum Sk1ColorSpace { rgb, cmyk, gray } // Assuming possible color spaces

@MappableClass()
class Sk1Color with Sk1ColorMappable {
  final Sk1ColorSpace colorSpace;
  final List<double> values; // RGB (0-1), CMYK (0-1), or Gray (0-1)
  final double alpha; // Typically 1.0 in examples
  final String name;

  Sk1Color({
    required this.colorSpace,
    required this.values,
    required this.alpha,
    required this.name,
  }) : assert(
         (colorSpace == Sk1ColorSpace.rgb && values.length == 3) ||
             (colorSpace == Sk1ColorSpace.cmyk && values.length == 4) ||
             (colorSpace == Sk1ColorSpace.gray && values.length == 1),
         'Incorrect number of values for color space',
       ),
       assert(
         values.every((v) => v >= 0.0 && v <= 1.0),
         'Color values must be between 0.0 and 1.0',
       ),
       assert(
         alpha >= 0.0 && alpha <= 1.0,
         'Alpha must be between 0.0 and 1.0',
       );
}

@MappableClass()
class Sk1Palette with Sk1PaletteMappable {
  final String name;
  final String? source;
  final List<String> comments;
  final int columns; // Number of columns for display hint
  final List<Sk1Color> colors;

  Sk1Palette({
    required this.name,
    this.source,
    this.comments = const [],
    required this.columns,
    required this.colors,
  });

  factory Sk1Palette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid sK1 Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      // Basic check for the signature and structure start
      final content = utf8.decode(bytes, allowMalformed: true);
      return content.startsWith(_fileSignature) &&
          content.contains('palette()');
    } catch (_) {
      return false;
    }
  }
}

// Constants for sK1 text format parsing
const _fileSignature = '##sK1 palette';
