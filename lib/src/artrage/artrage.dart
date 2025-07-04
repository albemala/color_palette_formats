import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'artrage.mapper.dart';
part 'decode.dart';

/*
* ArtRage 6 Color Palette (.col)
*/

@MappableClass()
class Artrage6Color with Artrage6ColorMappable {
  final String name;
  final int red;
  final int green;
  final int blue;
  final int alpha;

  Artrage6Color({
    required this.name,
    required this.red,
    required this.green,
    required this.blue,
    this.alpha = 255,
  }) : assert(red >= 0 && red <= 255, 'Red value must be in range [0..255]'),
       assert(
         green >= 0 && green <= 255,
         'Green value must be in range [0..255]',
       ),
       assert(blue >= 0 && blue <= 255, 'Blue value must be in range [0..255]'),
       assert(
         alpha >= 0 && alpha <= 255,
         'Alpha value must be in range [0..255]',
       );
}

@MappableClass()
class Artrage6Palette with Artrage6PaletteMappable {
  static const validFileSignature = 'AR2 COLOR PRESET';
  static const fileVersionSignature = 'ARSwatchFileVersion-3';

  final String? name;
  final List<Artrage6Color> colors;

  Artrage6Palette({this.name, required this.colors});

  factory Artrage6Palette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  /// Checks if the provided bytes represent a valid ArtRage 6 palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
