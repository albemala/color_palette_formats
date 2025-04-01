import 'dart:convert';

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

  AdobeColorBookLegacyColor({
    required this.name,
    required this.values,
  });
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

  String toBytes() {
    return _encode(this);
  }
}
