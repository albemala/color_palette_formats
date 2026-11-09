import 'dart:convert';

import 'package:color_palette_formats/src/text_parse_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'acf.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* ASCII Color Format (ACF) (.acf)
* Aldus/Adobe PageMaker, Aldus/Macromedia/Adobe Freehand, Adobe FrameMaker
*
* References:
* - https://www.selapa.net/swatches/colors/fileformats.php
*/

@MappableEnum()
enum AcfColorModel { rgb, cmyk, lab, hifi }

@MappableEnum()
enum AcfPaletteType { hifi, process, spot, mixed }

@MappableEnum()
enum AcfNamesFormat { full, partial }

@MappableClass()
class AcfPaletteColorValue with AcfPaletteColorValueMappable {
  final AcfColorModel model;
  final List<int> values;

  AcfPaletteColorValue({required this.model, required this.values})
    : assert(values.isNotEmpty, 'values must not be empty'),
      assert(
        model != AcfColorModel.rgb || values.length == 3,
        'RGB values must have 3 channels',
      ),
      assert(
        model != AcfColorModel.cmyk || values.length == 4,
        'CMYK values must have 4 channels',
      ),
      assert(
        model != AcfColorModel.lab || values.length == 3,
        'Lab values must have 3 channels',
      );
}

@MappableClass()
class AcfPaletteColor with AcfPaletteColorMappable {
  /// Raw color name as stored in the file (without prefix/suffix).
  final String name;

  /// One entry per model listed in the palette header, in the same order.
  final List<AcfPaletteColorValue> values;

  /// Per-color type line, only present when the palette type is Mixed.
  final String? type;

  AcfPaletteColor({required this.name, required this.values, this.type})
    : assert(values.isNotEmpty, 'values must not be empty');
}

@MappableClass()
class AcfPalette with AcfPaletteMappable {
  static const version1 = 'ACF 1.0';
  static const version21 = 'ACF 2.1';
  static const List<String> validVersions = [version1, version21];
  static const dataSeparator = 'Data:';

  /// File version: 'ACF 1.0' or 'ACF 2.1'.
  final String version;

  /// Library name.
  final String name;

  /// Library version.
  final String libraryVersion;

  final String copyright;

  /// About message.
  final String description;

  final AcfNamesFormat namesFormat;
  final int rows;
  final int columns;
  final String prefix;
  final String suffix;
  final AcfPaletteType type;
  final List<AcfColorModel> models;
  final String preferredModel;

  /// Ink names, only present in version 'ACF 2.1'.
  final List<String> inks;

  final List<AcfPaletteColor> colors;

  AcfPalette({
    required this.version,
    required this.name,
    required this.libraryVersion,
    required this.copyright,
    required this.description,
    required this.namesFormat,
    required this.rows,
    required this.columns,
    required this.prefix,
    required this.suffix,
    required this.type,
    required this.models,
    required this.preferredModel,
    this.inks = const [],
    required this.colors,
  }) : assert(
         validVersions.contains(version),
         'version must be one of $validVersions',
       ),
       assert(models.isNotEmpty, 'models must not be empty');

  factory AcfPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid ASCII Color Format file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
