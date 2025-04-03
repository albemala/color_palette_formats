import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'acbl.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Adobe Color Book Legacy (ACBL) (.acbl)
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php#adobe_acbl
*/

@MappableClass()
class AdobeColorBookLegacyPrefixPostfix
    with AdobeColorBookLegacyPrefixPostfixMappable {
  final String prefix;
  final String postfix;
  final String? id;

  AdobeColorBookLegacyPrefixPostfix({
    required this.prefix,
    required this.postfix,
    this.id,
  });
}

@MappableClass()
class AdobeColorBookLegacyFormat with AdobeColorBookLegacyFormatMappable {
  final String colorSpace;
  final String encoding;
  final int channels;
  final String id;

  AdobeColorBookLegacyFormat({
    required this.colorSpace,
    required this.encoding,
    required this.channels,
    required this.id,
  });
}

@MappableClass()
class AdobeColorBookLegacyColor with AdobeColorBookLegacyColorMappable {
  final String name;
  final List<double> values;

  AdobeColorBookLegacyColor({required this.name, required this.values});
}

@MappableClass()
class AdobeColorBookLegacy with AdobeColorBookLegacyMappable {
  final int version;
  final int bookId;
  final List<AdobeColorBookLegacyPrefixPostfix> prefixPostfixPairs;
  final List<AdobeColorBookLegacyFormat> formats;
  final List<AdobeColorBookLegacyColor> colors;

  AdobeColorBookLegacy({
    required this.version,
    required this.bookId,
    required this.prefixPostfixPairs,
    required this.formats,
    required this.colors,
  });

  factory AdobeColorBookLegacy.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

// XML Element and Attribute Constants
class AcblConstants {
  static const String adobeSwatchbook = 'AdobeSwatchbook';
  static const String versionAttr = 'Version';
  static const String bookIdAttr = 'BookID';

  static const String prefixPostfixPairs = 'PrefixPostfixPairs';
  static const String prefixPostfixPair = 'PrefixPostfixPair';
  static const String prefixAttr = 'Prefix';
  static const String postfixAttr = 'Postfix';
  static const String idAttr = 'ID'; // Used in multiple places

  static const String formats = 'Formats';
  static const String format = 'Format';
  static const String colorSpaceAttr = 'ColorSpace';
  static const String encodingAttr = 'Encoding';
  static const String channelsAttr = 'Channels';

  static const String swatches = 'Swatches';
  static const String spotColor = 'Sp'; // Spot Color element
  static const String nameAttr = 'N'; // Name attribute for Spot Color
  static const String colorValues = 'C'; // Color values element
}
