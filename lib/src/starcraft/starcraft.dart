import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'starcraft.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: StarCraft Palette
 * File extensions: .pal
 * Applications: StarCraft (Blizzard Entertainment)
 * Format details:
 *   Raw 768-byte palette: 256 entries of 3 bytes (RGB) with no
 *   header. Same wire layout as an Adobe Color Table without the
 *   footer.
 * References:
 * - https://github.com/1j01/anypalette.js/blob/master/src/formats/StarCraft.coffee
 */

@MappableClass()
class StarCraftPaletteColor with StarCraftPaletteColorMappable {
  /// Value [0..255]
  final int red;

  /// Value [0..255]
  final int green;

  /// Value [0..255]
  final int blue;

  StarCraftPaletteColor({
    required this.red,
    required this.green,
    required this.blue,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class StarCraftPalette with StarCraftPaletteMappable {
  static const int colorsCount = 256;
  static const int expectedFileSize = colorsCount * 3;

  final List<StarCraftPaletteColor> colors;

  StarCraftPalette({required this.colors});

  factory StarCraftPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid StarCraft Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
