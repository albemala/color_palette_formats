import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'cxf.mapper.dart';
part 'decode.dart';

/*
* Color Exchange Format (CXF) (.cxf)
* 
* References:
* - Color Exchange Format specification
* - Based on observed format in sample files
*/

@MappableClass()
class CxfColor with CxfColorMappable {
  final String name;
  final double l; // L value (lightness)
  final double a; // A value (green-red)
  final double b; // B value (blue-yellow)

  CxfColor({
    required this.name,
    required this.l,
    required this.a,
    required this.b,
  });
}

@MappableClass()
class CxfPalette with CxfPaletteMappable {
  final List<CxfColor> colors;

  CxfPalette({required this.colors});

  factory CxfPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  /// Checks if the provided bytes represent a valid CXF file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

// XML Element, Attribute, and Namespace Constants
class CxfConstants {
  // Namespace
  static const String cxfNs = 'http://colorexchangeformat.com/CxF3-core';

  // Elements
  static const String cxfRoot = 'CxF';
  static const String resources = 'Resources';
  static const String objectCollection = 'ObjectCollection';
  static const String object = 'Object';
  static const String colorCIELab = 'ColorCIELab';
  static const String lElement = 'L';
  static const String aElement = 'A';
  static const String bElement = 'B';

  // Attributes
  static const String nameAttr = 'Name';

  // Prefix
  static const String ccPrefix = 'cc';
}
