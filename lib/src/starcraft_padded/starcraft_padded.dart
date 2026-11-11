import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'starcraft_padded.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: StarCraft Padded Palette
 * File extensions: .wpe
 * Applications: StarCraft (Blizzard Entertainment)
 * Format details:
 *   Raw 1024-byte terrain palette: 256 entries of 4 bytes (RGB +
 *   padding byte). Same wire layout as a StarCraft Palette with a
 *   padding byte after every color.
 * References:
 * - https://github.com/1j01/anypalette.js/blob/master/src/formats/StarCraftPadded.coffee
 */

@MappableClass()
class StarCraftPaddedPaletteColor with StarCraftPaddedPaletteColorMappable {
  /// Value [0..255]
  final int red;

  /// Value [0..255]
  final int green;

  /// Value [0..255]
  final int blue;

  StarCraftPaddedPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class StarCraftPaddedPalette with StarCraftPaddedPaletteMappable {
  static const int colorsCount = 256;
  static const int bytesPerColor = 4;
  static const int expectedFileSize = colorsCount * bytesPerColor;

  final List<StarCraftPaddedPaletteColor> colors;

  StarCraftPaddedPalette({required this.colors});

  factory StarCraftPaddedPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid StarCraft
  /// Padded Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
