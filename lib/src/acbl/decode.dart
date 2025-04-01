part of 'acbl.dart';

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
