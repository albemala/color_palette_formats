import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'acbl.mapper.dart';

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

AdobeColorBookLegacy _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);

  final document = XmlDocument.parse(xmlString);
  final root = document.rootElement;

  final version = int.parse(root.getAttribute('Version') ?? '1');
  final bookId = int.parse(root.getAttribute('BookID') ?? '0');

  // Parse prefix/postfix pairs
  final prefixPostfixPairs = root
      .findAllElements('PrefixPostfixPair')
      .map(
        (e) => AdobeColorBookLegacyPrefixPostfix(
          prefix: e.getAttribute('Prefix') ?? '',
          postfix: e.getAttribute('Postfix') ?? '',
          id: e.getAttribute('ID'),
        ),
      )
      .toList();

  // Parse formats
  final formats = root
      .findAllElements('Format')
      .map(
        (e) => AdobeColorBookLegacyFormat(
          colorSpace: e.getAttribute('ColorSpace') ?? 'CMYK',
          encoding: e.getAttribute('Encoding') ?? 'Float',
          channels: int.parse(e.getAttribute('Channels') ?? '4'),
          id: e.getAttribute('ID') ?? '0',
        ),
      )
      .toList();

  // Parse colors
  final colors = root
      .findAllElements('Sp')
      .map(
        (e) => AdobeColorBookLegacyColor(
          name: e.getAttribute('N') ?? '',
          values: e
              .findElements('C')
              .first
              .text
              .split(' ')
              .map(double.parse)
              .toList(),
        ),
      )
      .toList();

  return AdobeColorBookLegacy(
    version: version,
    bookId: bookId,
    prefixPostfixPairs: prefixPostfixPairs,
    formats: formats,
    colors: colors,
  );
}

String _encode(AdobeColorBookLegacy book) {
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');

  builder.element(
    'AdobeSwatchbook',
    nest: () {
      builder.attribute('Version', book.version.toString());
      builder.attribute('BookID', book.bookId.toString());

      builder.element(
        'PrefixPostfixPairs',
        nest: () {
          for (final pair in book.prefixPostfixPairs) {
            builder.element(
              'PrefixPostfixPair',
              nest: () {
                builder.attribute('Prefix', pair.prefix);
                builder.attribute('Postfix', pair.postfix);
                if (pair.id != null) {
                  builder.attribute('ID', pair.id!);
                }
              },
            );
          }
        },
      );

      builder.element(
        'Formats',
        nest: () {
          for (final format in book.formats) {
            builder.element(
              'Format',
              nest: () {
                builder.attribute('ColorSpace', format.colorSpace);
                builder.attribute('Encoding', format.encoding);
                builder.attribute('Channels', format.channels.toString());
                builder.attribute('ID', format.id);
              },
            );
          }
        },
      );

      builder.element(
        'Swatches',
        nest: () {
          for (final color in book.colors) {
            builder.element(
              'Sp',
              nest: () {
                builder.attribute('N', color.name);
                builder.element(
                  'C',
                  nest: color.values.map((v) => v.toString()).join(' '),
                );
              },
            );
          }
        },
      );
    },
  );

  return builder.buildDocument().toXmlString(pretty: true);
}
