import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/format_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'cpl.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Corel Palette
 * Acronym: CPL
 * Versions: 5-8, 9-X3, X4, custom
 * File extensions: .cpl
 * Applications: CorelDRAW family
 * Format details:
 *   Little-endian binary palette with seven magic versions across
 *   four families: 5-8 (plain count + short entries), 9-X3/X4
 *   (header blocks with absolute offsets for name, type, colors,
 *   special inks, UI models, UI layout), and custom (inline name
 *   + short entries). Entries are short (model + type + raw 8
 *   bytes + name) or long (id + two model slots + name, plus
 *   row/column positions on X4) depending on version and palette
 *   type; raw values and color-type semantics are kept without
 *   normalizing. Name encoding (single-byte latin1 vs. double-
 *   byte UTF-16LE) follows the SwatchBooker reader rules.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/corel_cpl.py
 */
// CMX 8 spec helped decode CPL (via selapa):
// - http://web.archive.org/web/*/ftp.corel.com/CorelSolutionPartners/CMXv8/CMXv800.pdf

@MappableEnum()
enum CplVersion { ccbc, ccdc, cdbc, cddc, dddc, cddd, dcdc }

@MappableClass()
class CplPaletteColor with CplPaletteColorMappable {
  /// Color id (uint32). Only stored for long entries.
  /// Value: [0..4294967295]
  final int? id;

  /// Color model id (e.g. 2/3/17 CMYK, 5 RGB, 6 HSB, 7 HLS,
  /// 9 grayscale, 12/18 Lab, 15 hexachrome).
  /// Value: [0..65535]
  final int model;

  /// Per-color type (wire value kept raw; semantics unpublished).
  /// Value: [0..65535]
  final int type;

  /// Raw 8-byte color values, kept without normalizing.
  final List<int> values;

  /// Second color model id. Only stored for long entries.
  /// Value: [0..65535]
  final int? secondModel;

  /// Second per-color type. Only stored for long entries.
  /// Value: [0..65535]
  final int? secondType;

  /// Raw 8-byte second color values. Only stored for long entries.
  final List<int>? secondValues;

  final String name;

  /// Display row (uint32). Only stored for X4 entries.
  /// Value: [0..4294967295]
  final int? row;

  /// Display column (uint32). Only stored for X4 entries.
  /// Value: [0..4294967295]
  final int? column;

  /// Trailing X4 field (uint32; 1300/1400 observed).
  /// Value: [0..4294967295]
  final int? unknown;

  CplPaletteColor({
    this.id,
    required this.model,
    required this.type,
    required this.values,
    this.secondModel,
    this.secondType,
    this.secondValues,
    required this.name,
    this.row,
    this.column,
    this.unknown,
  }) : assert(id == null || (id >= 0 && id <= 4294967295), 'id out of range'),
       assert(
         model >= 0 && model <= 65535,
         'model must be between 0 and 65535',
       ),
       assert(type >= 0 && type <= 65535, 'type must be between 0 and 65535'),
       assert(values.length == 8, 'values must have 8 entries'),
       assert(
         secondModel == null || (secondModel >= 0 && secondModel <= 65535),
         'secondModel must be between 0 and 65535',
       ),
       assert(
         secondType == null || (secondType >= 0 && secondType <= 65535),
         'secondType must be between 0 and 65535',
       ),
       assert(
         secondValues == null || secondValues.length == 8,
         'secondValues must have 8 entries',
       ),
       assert(
         (secondModel == null) == (secondValues == null),
         'secondModel and secondValues must both be set or both be null',
       ),
       assert(
         row == null || (row >= 0 && row <= 4294967295),
         'row out of range',
       ),
       assert(
         column == null || (column >= 0 && column <= 4294967295),
         'column out of range',
       ),
       assert(
         unknown == null || (unknown >= 0 && unknown <= 4294967295),
         'unknown out of range',
       );
}

@MappableClass()
class CplPalette with CplPaletteMappable {
  final CplVersion version;

  /// Palette name (empty for 5-8 palettes, which store none).
  final String name;

  /// Palette type id (0 for 5-8/custom palettes, which store none).
  final int type;

  final List<CplPaletteColor> colors;

  /// Custom ink positions (header 3; empty when absent).
  final List<int> specialInks;

  /// UI color models (header 4, X4 only; empty when absent).
  final List<int> uiColorModels;

  /// Displayed columns (header 5; null when absent).
  final int? displayColumns;

  /// Displayed rows (header 5; null when absent).
  final int? displayRows;

  /// Total columns (header 5; null when absent).
  final int? totalColumns;

  /// Total rows (header 5; null when absent).
  final int? totalRows;

  CplPalette({
    required this.version,
    required this.name,
    required this.type,
    required this.colors,
    this.specialInks = const [],
    this.uiColorModels = const [],
    this.displayColumns,
    this.displayRows,
    this.totalColumns,
    this.totalRows,
  }) : assert(type >= 0 && type <= 65535, 'type must be between 0 and 65535'),
       assert(
         uiColorModels.isEmpty || uiColorModels.length == 2,
         'uiColorModels must have 2 entries',
       ),
       assert(
         (displayColumns == null) == (displayRows == null) &&
             (displayRows == null) == (totalColumns == null) &&
             (totalColumns == null) == (totalRows == null),
         'display/total columns and rows must all be set or all be null',
       );

  factory CplPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Corel
  /// Palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
