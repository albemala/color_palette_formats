import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'colorschemer.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* ColorSchemer Studio (CS) (.cs)
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
* - https://github.com/1j01/anypalette.js/blob/master/src/formats/ColorSchemer.coffee
*/

@MappableClass()
class ColorSchemerColor with ColorSchemerColorMappable {
  /// Color name (may be empty)
  final String name;

  /// Red value [0..255]
  final int red;

  /// Green value [0..255]
  final int green;

  /// Blue value [0..255]
  final int blue;

  /// Hex color string (6 characters, e.g., "FF0000")
  final String hexValue;

  /// Whether this color is developed in the color list when opened
  final bool developed;

  ColorSchemerColor({
    required this.name,
    required this.red,
    required this.green,
    required this.blue,
    required this.hexValue,
    this.developed = false,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255'),
       assert(hexValue.length == 6, 'hexValue must be 6 characters');
}

@MappableClass()
class ColorSchemerPalette with ColorSchemerPaletteMappable {
  static const validVersion = 3;

  /// Version number (typically 3)
  final int version;

  /// Base color RGB values [0..255]
  final List<int> baseColor;

  /// List of colors in the palette
  final List<ColorSchemerColor> colors;

  ColorSchemerPalette({
    required this.version,
    required this.baseColor,
    required this.colors,
  }) : assert(baseColor.length == 3, 'baseColor must have 3 values');

  factory ColorSchemerPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid ColorSchemer file.
  static bool isValidFormat(List<int> bytes) {
    try {
      if (bytes.length < 8) return false;
      final byteData = ByteData.sublistView(Uint8List.fromList(bytes));
      final version = byteData.getUint16(0, Endian.little);
      return version == validVersion;
    } catch (_) {
      return false;
    }
  }
}
