part of 'acbl.dart';

AdobeColorBookLegacy _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(document, AcblConstants.adobeSwatchbook);

  return AdobeColorBookLegacy(
    version: parseIntAttribute(
      root,
      AcblConstants.versionAttr,
      defaultValue: 1,
    ),
    bookId: parseIntAttribute(root, AcblConstants.bookIdAttr, required: true),
    prefixPostfixPairs: parseElements(
      root,
      AcblConstants.prefixPostfixPairs,
      AcblConstants.prefixPostfixPair,
      _parsePrefixPostfixPair,
    ),
    formats: parseElements(
      root,
      AcblConstants.formats,
      AcblConstants.format,
      _parseFormat,
    ),
    colors: parseElements(
      root,
      AcblConstants.swatches,
      AcblConstants.spotColor,
      _parseColor,
    ),
  );
}

List<double> _parseDoubleList(String text) {
  final trimmedText = text.trim();
  if (trimmedText.isEmpty) return [];

  return trimmedText.split(' ').map((s) {
    final value = double.tryParse(s);
    if (value == null) {
      throw FormatException("Invalid double value '$s'");
    }
    return value;
  }).toList();
}

AdobeColorBookLegacyPrefixPostfix _parsePrefixPostfixPair(XmlElement element) {
  return AdobeColorBookLegacyPrefixPostfix(
    prefix: getAttribute(element, AcblConstants.prefixAttr, required: false),
    postfix: getAttribute(element, AcblConstants.postfixAttr, required: false),
    id: element.getAttribute(AcblConstants.idAttr),
  );
}

AdobeColorBookLegacyFormat _parseFormat(XmlElement element) {
  return AdobeColorBookLegacyFormat(
    colorSpace: getAttribute(
      element,
      AcblConstants.colorSpaceAttr,
      required: false,
      defaultValue: 'CMYK',
    ),
    encoding: getAttribute(
      element,
      AcblConstants.encodingAttr,
      required: false,
      defaultValue: 'Float',
    ),
    channels: parseIntAttribute(
      element,
      AcblConstants.channelsAttr,
      defaultValue: 4,
    ),
    id: getAttribute(
      element,
      AcblConstants.idAttr,
      required: false,
      defaultValue: '0',
    ),
  );
}

AdobeColorBookLegacyColor _parseColor(XmlElement element) {
  final name = getAttribute(element, AcblConstants.nameAttr);
  final colorElement =
      element.findElements(AcblConstants.colorValues).firstOrNull;

  if (colorElement == null) {
    throw FormatException(
      """
Missing required child element <${AcblConstants.colorValues}> for color '$name'""",
    );
  }

  return AdobeColorBookLegacyColor(
    name: name,
    values: _parseDoubleList(colorElement.innerText),
  );
}
