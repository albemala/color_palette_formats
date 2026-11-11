import 'dart:convert';

import 'package:color_palette_formats/src/format_utils.dart';
import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'qcl.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: QuarkXPress Color Library
 * Acronym: QCL
 * File extensions: .qcl
 * Applications: QuarkXPress 7
 * Format details:
 *   XML adaptation of CGATS.17. A dynamic `data_format` table maps 1-based
 *   column positions to field names (SAMPLE_ID, NAME_FORMAT_ID, RGB_R/G/B,
 *   CMYK_C/M/Y/K, LAB_L/A/B, PC6_1..6), so column order varies per file and
 *   a single color row can carry several color models at once. Display names
 *   are resolved from `name_field_info` long forms via the `%n` placeholder
 *   (1-based ids; a NAME_FORMAT_ID of 0 means no name format).
 *   Values are stored in wire units (RGB 0-255, CMYK/hexachrome percent,
 *   Lab decimals) without normalization. CMYK and hexachrome values are
 *   percents (0..100, enforced); Lab values are range-free but must be
 *   finite, as must CMYK/hexachrome values. Empty color tables are
 *   rejected. The companion `.cui` UI-spec file
 *   (sidecar referenced by `uiSpec`) is a separate codec, `QuarkXPressCui`.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://developer.quark.com/quarkxpress/Documentation/QXP/Overviews/ColorLibrary.htm
 * - https://developer.quark.com/quarkxpress/Documentation/QXP/Overviews/DTD_QCL.htm
 * - https://developer.quark.com/quarkxpress/Documentation/QXP/Overviews/DTD_CUI.htm
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/quark_qcl.py
 */

@MappableClass()
class QuarkXPressNameFormat with QuarkXPressNameFormatMappable {
  /// 1-based identifier referenced by a color row's NAME_FORMAT_ID value.
  final int formatId;

  /// Display-name template with a `%n` placeholder for the sample id.
  final String longForm;

  /// Short display name template with a `%n` placeholder.
  final String shortForm;

  QuarkXPressNameFormat({
    required this.formatId,
    required this.longForm,
    required this.shortForm,
  });
}

@MappableClass()
class QuarkXPressPaletteColor with QuarkXPressPaletteColorMappable {
  /// Raw sample id as stored in the SAMPLE_ID column.
  final String sampleId;

  /// 1-based name-format id from the NAME_FORMAT_ID column, if present.
  final int? nameFormatId;

  /// Display name resolved from the matching long form (`%n` placeholder).
  final String name;

  /// RGB values in wire units. Value: [0..255]
  final List<int>? rgb;

  /// CMYK values in wire units (percent). Value: [0..100]
  final List<double>? cmyk;

  /// CIE Lab values in wire units (decimals).
  final List<double>? lab;

  /// Hexachrome values in wire units (percent). Value: [0..100]
  final List<double>? hexachrome;

  QuarkXPressPaletteColor({
    required this.sampleId,
    this.nameFormatId,
    required this.name,
    this.rgb,
    this.cmyk,
    this.lab,
    this.hexachrome,
  }) : assert(rgb == null || rgb.length == 3, 'rgb must have 3 values'),
       assert(
         rgb == null || rgb.every((v) => v >= 0 && v <= 255),
         'rgb values must be between 0 and 255',
       ),
       assert(cmyk == null || cmyk.length == 4, 'cmyk must have 4 values'),
       assert(lab == null || lab.length == 3, 'lab must have 3 values'),
       assert(
         hexachrome == null || hexachrome.length == 6,
         'hexachrome must have 6 values',
       );
}

@MappableClass()
class QuarkXPressPalette with QuarkXPressPaletteMappable {
  static const String documentType =
      "<!DOCTYPE cgats17 SYSTEM 'cgats_data.dtd'>";

  final String stdVersion;
  final String dtdVersion;
  final String standard;
  final String originator;
  final String fileDescriptor;
  final String createdDate;
  final String createdText;
  final String manufacturer;

  /// Display-layout comment from the data section header. Can be empty.
  final String headerComment;
  final List<QuarkXPressNameFormat> nameFormats;

  /// Four-character code for the primary color space of the library.
  final String libraryIdentifier;

  /// Default color space recommendation (e.g. `6CLR`, `QCMK`, `QLAB`, `QRGB`).
  final String defaultColorSpace;

  /// Default color-usage recommendation. Values `4` and `5` mean spot.
  final String colorUsageRecommendation;

  /// File name of the companion `.cui` UI-spec sidecar. Can be empty.
  final String uiSpec;

  final List<QuarkXPressPaletteColor> colors;

  QuarkXPressPalette({
    required this.stdVersion,
    required this.dtdVersion,
    required this.standard,
    required this.originator,
    required this.fileDescriptor,
    required this.createdDate,
    required this.createdText,
    required this.manufacturer,
    required this.headerComment,
    required this.nameFormats,
    required this.libraryIdentifier,
    required this.defaultColorSpace,
    required this.colorUsageRecommendation,
    required this.uiSpec,
    required this.colors,
  });

  factory QuarkXPressPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid QuarkXPress library.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

// XML Element and Attribute Constants
class QclConstants {
  static const String cgats17 = 'cgats17';
  static const String stdVersionAttr = 'std_version';
  static const String dtdVersionAttr = 'dtd_version';

  static const String preamble = 'cgats17.preamble';
  static const String standard = 'standard';
  static const String originator = 'originator';
  static const String fileDescriptor = 'file_descriptor';
  static const String created = 'created';
  static const String dateAttr = 'date';

  static const String dataSection = 'cgats17.data_section';
  static const String dataSectionHeader = 'cgats17.data_section_header';
  static const String manufacturer = 'manufacturer';
  static const String comment = 'comment';
  static const String quarkFormat = 'quark_format';
  static const String nameFormat = 'name_format';
  static const String nameFieldInfo = 'name_field_info';
  static const String formatIdAttr = 'format_id';
  static const String longFormAttr = 'long_form';
  static const String shortFormAttr = 'short_form';
  static const String libraryIdentifier = 'library_identifier';
  static const String defaultColorSpace = 'default_color_space';
  static const String colorUsageRecommendation = 'color_usage_recommendation';
  static const String uiSpec = 'ui_spec';

  static const String dataSectionData = 'cgats17.data_section_data';
  static const String numberOfFields = 'number_of_fields';
  static const String dataFormat = 'data_format';
  static const String fieldInfo = 'field_info';
  static const String posAttr = 'pos';
  static const String nameAttr = 'name';
  static const String numberOfSets = 'number_of_sets';
  static const String table = 'table';
  static const String tr = 'tr';
  static const String td = 'td';

  static const String sampleId = 'SAMPLE_ID';
  static const String nameFormatId = 'NAME_FORMAT_ID';
  static const String rgbR = 'RGB_R';
  static const String rgbG = 'RGB_G';
  static const String rgbB = 'RGB_B';
  static const String cmykC = 'CMYK_C';
  static const String cmykM = 'CMYK_M';
  static const String cmykY = 'CMYK_Y';
  static const String cmykK = 'CMYK_K';
  static const String labL = 'LAB_L';
  static const String labA = 'LAB_A';
  static const String labB = 'LAB_B';
  static const String pc6Prefix = 'PC6_';
}
