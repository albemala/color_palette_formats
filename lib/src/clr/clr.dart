import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/format_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'clr.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Flash Color Set
 * Acronym: CLR
 * File extensions: .clr
 * Applications: Macromedia/Adobe Flash
 * Format details:
 *   Little-endian binary palette with two sections: solid colors
 *   (raw RGBA + raw 16-bit HSV values) and gradients (base color,
 *   linear/radial type, overflow + linear-RGB attributes, offset
 *   stops with RGBA). Reserved blocks are skipped on decode (same
 *   bytes in every file observed); the encoder writes zeros.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/adobe_clr.py
 */

@MappableEnum()
enum ClrGradientType { linear, radial }

@MappableEnum()
enum ClrGradientOverflow { extend, reflect, repeat }

@MappableClass()
class ClrPaletteColor with ClrPaletteColorMappable {
  /// Per-entry version. Value: 3 or 4
  final int version;

  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Value: [0..255]
  final int alpha;

  /// Raw hue as stored, kept without normalizing.
  /// Value: [0..65535]
  final int hue;

  /// Raw saturation as stored. Value: [0..65535]
  final int saturation;

  /// Raw value as stored. Value: [0..65535]
  final int brightness;

  ClrPaletteColor({
    required this.version,
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
    required this.hue,
    required this.saturation,
    required this.brightness,
  }) : assert(version == 3 || version == 4, 'version must be 3 or 4'),
       assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255'),
       assert(alpha >= 0 && alpha <= 255, 'alpha must be between 0 and 255'),
       assert(hue >= 0 && hue <= 65535, 'hue must be between 0 and 65535'),
       assert(
         saturation >= 0 && saturation <= 65535,
         'saturation must be between 0 and 65535',
       ),
       assert(
         brightness >= 0 && brightness <= 65535,
         'brightness must be between 0 and 65535',
       );
}

@MappableClass()
class ClrGradientStop with ClrGradientStopMappable {
  /// Stop position. Value: [0..255]
  final int offset;

  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  /// Stop opacity. Value: [0..255]
  final int alpha;

  ClrGradientStop({
    required this.offset,
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  }) : assert(offset >= 0 && offset <= 255, 'offset must be between 0 and 255'),
       assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255'),
       assert(alpha >= 0 && alpha <= 255, 'alpha must be between 0 and 255');
}

@MappableClass()
class ClrGradient with ClrGradientMappable {
  /// Per-entry version. Value: 3 or 4
  final int version;

  /// Value: [0..255]
  final int baseRed;

  /// Value: [0..255]
  final int baseGreen;

  /// Value: [0..255]
  final int baseBlue;

  /// Value: [0..255]
  final int baseAlpha;

  final ClrGradientType type;
  final ClrGradientOverflow overflow;

  /// Whether the gradient interpolates in linear RGB (attribute
  /// flag; only stored for version 4).
  final bool linearRgb;

  final List<ClrGradientStop> stops;

  ClrGradient({
    required this.version,
    required this.baseRed,
    required this.baseGreen,
    required this.baseBlue,
    required this.baseAlpha,
    required this.type,
    required this.overflow,
    required this.linearRgb,
    required this.stops,
  }) : assert(version == 3 || version == 4, 'version must be 3 or 4'),
       assert(
         baseRed >= 0 && baseRed <= 255,
         'baseRed must be between 0 and 255',
       ),
       assert(
         baseGreen >= 0 && baseGreen <= 255,
         'baseGreen must be between 0 and 255',
       ),
       assert(
         baseBlue >= 0 && baseBlue <= 255,
         'baseBlue must be between 0 and 255',
       ),
       assert(
         baseAlpha >= 0 && baseAlpha <= 255,
         'baseAlpha must be between 0 and 255',
       ),
       assert(!linearRgb || version == 4, 'linearRgb requires version 4');
}

@MappableClass()
class ClrPalette with ClrPaletteMappable {
  static const colorListName = 'CColorList';
  static const colorDefName = 'CColorDef';

  final List<ClrPaletteColor> colors;
  final List<ClrGradient> gradients;

  ClrPalette({required this.colors, required this.gradients});

  factory ClrPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Flash Color
  /// Set file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
