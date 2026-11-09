import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:color_palette_formats/src/xml_encode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'cui.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: QuarkXPress UI Specs
 * Acronym: CUI
 * File extensions: .cui
 * Applications: QuarkXPress 7
 * Format details:
 *   Display-layout sidecar for a QuarkXPress Color Library (`.qcl`),
 *   referenced by its `ui_spec` element. Carries rows per page, color-name
 *   prefix/suffix for the UI, and column-break indices into the color list.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://developer.quark.com/quarkxpress/Documentation/QXP/Overviews/ColorLibrary.htm
 * - https://developer.quark.com/quarkxpress/Documentation/QXP/Overviews/DTD_CUI.htm
 */

@MappableClass()
class QuarkXPressCui with QuarkXPressCuiMappable {
  /// Number of rows per page displayed in the UI.
  final int rowsPerPage;

  /// Prefix used in the UI where the swatch name appears.
  final String prefix;

  /// Suffix used in the UI where the swatch name appears. Can be empty.
  final String suffix;

  /// Column-break indices into the library color list. Can be empty.
  final List<int> columnBreaks;

  QuarkXPressCui({
    required this.rowsPerPage,
    required this.prefix,
    required this.suffix,
    required this.columnBreaks,
  }) : assert(rowsPerPage >= 0, 'rowsPerPage must not be negative');

  factory QuarkXPressCui.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid QuarkXPress UI spec.
  static bool isValidFormat(List<int> bytes) {
    try {
      final xmlString = utf8.decode(bytes);
      final document = parseXml(xmlString);
      validateRootElement(document, CuiConstants.libraryUISpecs);
      return true;
    } catch (_) {
      return false;
    }
  }
}

// XML Element Constants
class CuiConstants {
  static const String libraryUISpecs = 'LibraryUISpecs';
  static const String editDialogData = 'edit_dialog_data';
  static const String rowsPerPage = 'rows_per_page';
  static const String colorUiPrefix = 'color_ui_prefix';
  static const String colorUiSuffix = 'color_ui_suffix';
  static const String columnData = 'column_data';
  static const String columnBreak = 'column_break';
}
