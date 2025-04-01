part of 'acbl.dart';

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
