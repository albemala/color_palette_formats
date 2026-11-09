import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'afpalette.mapper.dart';
part 'decode.dart';

/*
 * Format name: Affinity Designer Palette
 * Versions: 11, 12
 * File extensions: .afpalette
 * Applications: Affinity Designer
 * Format details: Proprietary binary format. Based on reverse engineering
 *   from community resources.
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
  static const List<int> supportedVersions = [11, 12];

  final String? fileName;
  final List<AffinityDesignerPaletteColor> colors;

  AffinityDesignerPalette({this.fileName, required this.colors});

  factory AffinityDesignerPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  /// Checks if the provided bytes represent a valid Affinity Designer
  /// palette file. Runs a full decode so truncated files and unsupported
  /// color models are rejected (a header-only check would accept them).
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
