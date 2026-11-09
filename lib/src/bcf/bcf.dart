import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'bcf.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Binary Color Format
 * Acronym: BCF
 * Versions: ACF 1.0, ACF 2.1, BCF 2.0
 * File extensions: .bcf
 * Applications: Aldus/Adobe PageMaker, Aldus/Macromedia/Adobe Freehand,
 *   Adobe FrameMaker
 * Format details:
 *   Big-endian binary twin of the ASCII Color Format. Fixed-size
 *   MacRoman strings, raw 16-bit XYZ/CMYK/RGB groups, signed Lab group,
 *   optional extender/ink-description header blocks in 2.x, and an
 *   8-slot HiFi block per color when the palette type is Mixed/HiFi.
 *   The 24 reserved bytes after the Lab flag are skipped (always 0
 *   except trailing bytes in HiFi files); the encoder writes zeros.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/adobe_bcf.py
 */

@MappableEnum()
enum BcfColorModel { xyz, cmyk, rgb, lab, hifi }

@MappableEnum()
enum BcfPaletteType { spot, process, mixed, hifi }

@MappableEnum()
enum BcfNamesFormat { full, partial }

@MappableClass()
class BcfHiFiInk with BcfHiFiInkMappable {
  final String angle;
  final String frequency;

  /// Ink density. Value: [0..65535]
  final int density;
  final String name;

  BcfHiFiInk({
    required this.angle,
    required this.frequency,
    required this.density,
    required this.name,
  }) : assert(
         density >= 0 && density <= 65535,
         'density must be between 0 and 65535',
       );
}

@MappableClass()
class BcfPaletteColorValue with BcfPaletteColorValueMappable {
  final BcfColorModel model;

  /// Raw values as stored: unsigned 16-bit for XYZ/CMYK/RGB, signed
  /// 16-bit for Lab. HiFi holds flat ink id/value pairs.
  final List<int> values;

  BcfPaletteColorValue({required this.model, required this.values})
    : assert(values.isNotEmpty, 'values must not be empty'),
      assert(
        model != BcfColorModel.xyz || values.length == 3,
        'XYZ values must have 3 channels',
      ),
      assert(
        model != BcfColorModel.cmyk || values.length == 4,
        'CMYK values must have 4 channels',
      ),
      assert(
        model != BcfColorModel.rgb || values.length == 3,
        'RGB values must have 3 channels',
      ),
      assert(
        model != BcfColorModel.lab || values.length == 3,
        'Lab values must have 3 channels',
      ),
      assert(
        model != BcfColorModel.hifi || values.length.isEven,
        'HiFi values must hold ink id/value pairs',
      );
}

@MappableClass()
class BcfPaletteColor with BcfPaletteColorMappable {
  /// Raw color name as stored in the file (without prefix/suffix).
  final String name;

  /// One entry per model listed in the palette header, in the same
  /// order. HiFi entries come last and only exist for Mixed/HiFi
  /// palettes.
  final List<BcfPaletteColorValue> values;

  /// Raw per-color type as stored (1 means spot).
  final int type;

  /// Per-color preferred model, only present for Mixed/HiFi palettes.
  final String? preferredModel;

  BcfPaletteColor({
    required this.name,
    required this.values,
    required this.type,
    this.preferredModel,
  }) : assert(values.isNotEmpty, 'values must not be empty');
}

@MappableClass()
class BcfPalette with BcfPaletteMappable {
  static const version10 = 'ACF 1.0';
  static const version21 = 'ACF 2.1';
  static const version20 = 'BCF 2.0';
  static const List<String> validVersions = [version10, version21, version20];

  /// File version: 'ACF 1.0', 'ACF 2.1' or 'BCF 2.0'.
  final String version;

  /// Library name.
  final String name;

  /// Library version.
  final String libraryVersion;

  final String copyright;

  /// About message (2.x extender text appended when present).
  final String description;

  final BcfNamesFormat namesFormat;
  final int rows;
  final int columns;

  /// Library prefix (trailing space appended when non-empty).
  final String prefix;

  /// Library suffix (leading space prepended when non-empty).
  final String suffix;

  final BcfPaletteType type;

  /// Value groups stored per color, in order (HiFi last when present).
  final List<BcfColorModel> models;

  /// Preferred model: 'RGB', 'CMYK', 'hifi' or 'Mixed'.
  final String preferredModel;

  /// Ink descriptions, only present in version 'ACF 2.1'/'BCF 2.0'.
  final List<BcfHiFiInk> inks;

  final List<BcfPaletteColor> colors;

  BcfPalette({
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

  factory BcfPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Binary Color
  /// Format file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
