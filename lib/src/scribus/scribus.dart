import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:color_palette_formats/src/xml_encode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'scribus.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Scribus Swatch (.xml)
*/

@MappableClass()
class ScribusColor with ScribusColorMappable {
  static const defaultSpot = '0';
  static const defaultRegister = '0';

  final String name;
  final String rgb; // Store as hex string like "#RRGGBB"
  // Other attributes from the example, potentially with defaults
  final String spot;
  final String register;

  ScribusColor({
    required this.name,
    required this.rgb,
    required this.spot,
    required this.register,
  });
}

@MappableClass()
class ScribusPalette with ScribusPaletteMappable {
  final String name;
  final List<ScribusColor> colors;

  ScribusPalette({required this.name, required this.colors});

  factory ScribusPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Scribus Palette file.
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
class ScribusConstants {
  static const String scribusColors = 'SCRIBUSCOLORS';
  static const String nameAttr = 'Name'; // Palette name attribute on root

  static const String colorElement = 'COLOR';
  static const String colorNameAttr = 'NAME'; // Color name attribute
  static const String colorRgbAttr = 'RGB'; // Color RGB hex attribute
  static const String colorSpotAttr = 'Spot'; // Spot attribute
  static const String colorRegisterAttr = 'Register'; // Register attribute
}
