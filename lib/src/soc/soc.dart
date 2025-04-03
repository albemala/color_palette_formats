import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:color_palette_formats/src/xml_encode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'soc.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* StarOffice Colors (SOC) (.soc)
* StarOffice / OpenOffice.org / LibreOffice
*
* References:
* - Based on observed format in example files (e.g., assets/soc/cmyk.soc)
* - OpenOffice XML format structure.
*/

@MappableClass()
class StarOfficeColor with StarOfficeColorMappable {
  final String name;
  final String color; // Hex RGB color string (e.g., "#ffffff")

  StarOfficeColor({required this.name, required this.color});
}

@MappableClass()
class StarOfficeColorTable with StarOfficeColorTableMappable {
  final List<StarOfficeColor> colors;

  StarOfficeColorTable({required this.colors});

  factory StarOfficeColorTable.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

// XML Element, Attribute, and Namespace Constants
class SocConstants {
  // Namespaces (Important for writing)
  static const String officeNs = 'http://openoffice.org/2000/office';
  static const String styleNs = 'http://openoffice.org/2000/style';
  static const String textNs = 'http://openoffice.org/2000/text';
  static const String tableNs = 'http://openoffice.org/2000/table';
  static const String drawNs = 'http://openoffice.org/2000/drawing';
  static const String foNs = 'http://www.w3.org/1999/XSL/Format';
  static const String xlinkNs = 'http://www.w3.org/1999/xlink';
  static const String dcNs = 'http://purl.org/dc/elements/1.1/';
  static const String metaNs = 'http://openoffice.org/2000/meta';
  static const String numberNs = 'http://openoffice.org/2000/datastyle';
  static const String svgNs = 'http://www.w3.org/2000/svg';
  static const String chartNs = 'http://openoffice.org/2000/chart';
  static const String dr3dNs = 'http://openoffice.org/2000/dr3d';
  static const String mathNs = 'http://www.w3.org/1998/Math/MathML';
  static const String formNs = 'http://openoffice.org/2000/form';
  static const String scriptNs = 'http://openoffice.org/2000/script';

  // Elements
  static const String officeColorTable = 'color-table';
  static const String drawColor = 'color';

  // Attributes
  static const String drawNameAttr = 'name';
  static const String drawColorAttr = 'color';

  // Prefixes
  static const String officePrefix = 'office';
  static const String drawPrefix = 'draw';
  // Other prefixes are needed for writing the root element attributes correctly
  static const String stylePrefix = 'style';
  static const String textPrefix = 'text';
  static const String tablePrefix = 'table';
  static const String foPrefix = 'fo';
  static const String xlinkPrefix = 'xlink';
  static const String dcPrefix = 'dc';
  static const String metaPrefix = 'meta';
  static const String numberPrefix = 'number';
  static const String svgPrefix = 'svg';
  static const String chartPrefix = 'chart';
  static const String dr3dPrefix = 'dr3d';
  static const String mathPrefix = 'math';
  static const String formPrefix = 'form';
  static const String scriptPrefix = 'script';
}
