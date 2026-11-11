import 'dart:convert';
import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/format_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'bcs.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: RAL BCS
 * Acronym: BCS
 * Versions: clf, atl, rgb
 * File extensions: .bcs
 * Applications: RAL Digital C1, RAL ColourDesigner,
 *   RAL Digital Colour Atlas
 * Format details:
 *   Little-endian binary palette with offset-based bilingual
 *   headers (English/German colour-system and palette-name
 *   blocks), a 0x01 header byte, and per-color entries holding
 *   a length-prefixed name plus raw 3x float32 Lab values kept
 *   without normalizing. Offsets and counts are re-derived on encode.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/ral_bcs.py
 */

@MappableEnum()
enum BcsPaletteType { clf, atl, rgb }

@MappableClass()
class BcsPaletteColor with BcsPaletteColorMappable {
  final String name;

  /// Raw Lab values as stored (3x little-endian float32),
  /// kept without normalizing.
  final List<double> lab;

  BcsPaletteColor({required this.name, required this.lab})
    : assert(lab.length == 3, 'lab must have 3 values');
}

@MappableClass()
class BcsPalette with BcsPaletteMappable {
  static const unknownByte = 0x01;

  final BcsPaletteType type;

  /// English colour-system text (e.g. `Colour system`).
  final String system;

  /// German colour-system text (null when identical to `system`).
  final String? germanSystem;

  /// English palette title.
  final String name;

  /// German palette title (null when identical to `name`).
  final String? germanName;

  final List<BcsPaletteColor> colors;

  BcsPalette({
    required this.type,
    required this.system,
    this.germanSystem,
    required this.name,
    this.germanName,
    required this.colors,
  });

  factory BcsPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid RAL BCS
  /// file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
