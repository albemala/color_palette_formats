part of 'acbl.dart';

AdobeColorBookLegacy _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = _parseXml(xmlString);
  final root = _validateRootElement(document);

  return AdobeColorBookLegacy(
    version: _parseIntAttribute(
      root,
      AcblConstants.versionAttr,
      defaultValue: 1,
    ),
    bookId: _parseIntAttribute(root, AcblConstants.bookIdAttr),
    prefixPostfixPairs: _parseElements(
      root,
      AcblConstants.prefixPostfixPairs,
      AcblConstants.prefixPostfixPair,
      _parsePrefixPostfixPair,
    ),
    formats: _parseElements(
      root,
      AcblConstants.formats,
      AcblConstants.format,
      _parseFormat,
    ),
    colors: _parseElements(
      root,
      AcblConstants.swatches,
      AcblConstants.spotColor,
      _parseColor,
    ),
  );
}

XmlDocument _parseXml(String xmlString) {
  try {
    return XmlDocument.parse(xmlString);
  } catch (e) {
    throw FormatException('Failed to parse ACBL XML: $e');
  }
}

XmlElement _validateRootElement(XmlDocument document) {
  final root = document.rootElement;
  if (root.name.local != AcblConstants.adobeSwatchbook) {
    throw FormatException(
      '''
Expected root element <${AcblConstants.adobeSwatchbook}> but found <${root.name.local}>''',
    );
  }
  return root;
}

// Generic function to parse elements with the same pattern
List<T> _parseElements<T>(
  XmlElement parent,
  String containerName,
  String elementName,
  T Function(XmlElement) parser,
) {
  final container = parent.findElements(containerName).firstOrNull;
  return container?.findElements(elementName).map(parser).toList() ?? [];
}

// Helper to get an attribute value
String _getAttribute(
  XmlElement element,
  String name, {
  bool required = true,
  String defaultValue = '',
}) {
  final value = element.getAttribute(name);
  if (value == null) {
    if (required) {
      throw FormatException(
        "Missing required attribute '$name' on element <${element.name.local}>",
      );
    }
    return defaultValue;
  }
  return value;
}

// Helper to get and parse an integer attribute
int _parseIntAttribute(
  XmlElement element,
  String name, {
  bool required = false,
  int defaultValue = 0,
}) {
  final valueStr = _getAttribute(
    element,
    name,
    required: required,
    defaultValue: defaultValue.toString(),
  );

  final value = int.tryParse(valueStr);
  if (value == null) {
    throw FormatException(
      """
Invalid integer value '$valueStr' for attribute '$name' on element <${element.name.local}>""",
    );
  }
  return value;
}

// Helper to parse a space-separated list of doubles
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

// Helper to parse a PrefixPostfixPair element
AdobeColorBookLegacyPrefixPostfix _parsePrefixPostfixPair(XmlElement element) {
  return AdobeColorBookLegacyPrefixPostfix(
    prefix: _getAttribute(element, AcblConstants.prefixAttr, required: false),
    postfix: _getAttribute(element, AcblConstants.postfixAttr, required: false),
    id: element.getAttribute(AcblConstants.idAttr),
  );
}

// Helper to parse a Format element
AdobeColorBookLegacyFormat _parseFormat(XmlElement element) {
  return AdobeColorBookLegacyFormat(
    colorSpace: _getAttribute(
      element,
      AcblConstants.colorSpaceAttr,
      required: false,
      defaultValue: 'CMYK',
    ),
    encoding: _getAttribute(
      element,
      AcblConstants.encodingAttr,
      required: false,
      defaultValue: 'Float',
    ),
    channels: _parseIntAttribute(
      element,
      AcblConstants.channelsAttr,
      defaultValue: 4,
    ),
    id: _getAttribute(
      element,
      AcblConstants.idAttr,
      required: false,
      defaultValue: '0',
    ),
  );
}

// Helper to parse a Spot Color (Sp) element
AdobeColorBookLegacyColor _parseColor(XmlElement element) {
  final name = _getAttribute(element, AcblConstants.nameAttr);
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
    values: _parseDoubleList(colorElement.text),
  );
}
