import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'afpalette.mapper.dart';
part 'decode.dart';

/*
* Affinity Designer Palette (.afpalette)
*
* A proprietary binary format used by Affinity Designer.
* Based on reverse engineering from community resources.
*
* References:
* - https://github.com/Balakov/GrdToAfpalette
* - https://github.com/illumincrotty/cracking-afpalette
*/

@MappableClass()
class AffinityDesignerPaletteColor with AffinityDesignerPaletteColorMappable {
  final String name;

  /// Red value in range [0..1]
  final double red;

  /// Green value in range [0..1]
  final double green;

  /// Blue value in range [0..1]
  final double blue;

  /// Alpha value in range [0..1]
  final double alpha;

  AffinityDesignerPaletteColor({
    required this.name,
    required this.red,
    required this.green,
    required this.blue,
    this.alpha = 1.0,
  }) : assert(red >= 0 && red <= 1, 'red must be between 0 and 1'),
       assert(green >= 0 && green <= 1, 'green must be between 0 and 1'),
       assert(blue >= 0 && blue <= 1, 'blue must be between 0 and 1'),
       assert(alpha >= 0 && alpha <= 1, 'alpha must be between 0 and 1');
}

@MappableClass()
class AffinityDesignerPalette with AffinityDesignerPaletteMappable {
  static const int magicNumber = 0x414BFF00;
  static const int version = 11;

  final String? fileName;
  final List<AffinityDesignerPaletteColor> colors;

  AffinityDesignerPalette({this.fileName, required this.colors});

  factory AffinityDesignerPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  /// Checks if the provided bytes represent a valid Affinity Designer
  /// palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      if (bytes.length < 8) return false;
      // Read magic number and version in little-endian
      final magic =
          bytes[0] | (bytes[1] << 8) | (bytes[2] << 16) | (bytes[3] << 24);
      final ver =
          bytes[4] | (bytes[5] << 8) | (bytes[6] << 16) | (bytes[7] << 24);
      return magic == magicNumber && ver == version;
    } catch (_) {
      return false;
    }
  }
}
