part of 'scribus.dart';

ScribusPalette _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = _parseXml(xmlString);
  final root = _validateRootElement(document);

  return ScribusPalette(
    name: _getAttribute(root, ScribusConstants.nameAttr),
    colors:
        root
            .findElements(ScribusConstants.colorElement)
            .map(_parseColor)
            .toList() ??
        [], // Use null-aware operator for safety
  );
}

XmlDocument _parseXml(String xmlString) {
  try {
    // Trim potential whitespace/BOM before parsing
    return XmlDocument.parse(xmlString.trim());
  } catch (e) {
    throw FormatException('Failed to parse Scribus XML: $e');
  }
}

XmlElement _validateRootElement(XmlDocument document) {
  final root = document.rootElement;
  if (root.name.local != ScribusConstants.scribusColors) {
    throw FormatException(
      '''
Expected root element <${ScribusConstants.scribusColors}> but found <${root.name.local}>''',
    );
  }
  return root;
}

// Helper to get an attribute value
String _getAttribute(
  XmlElement element,
  String name, {
  bool required = true,
  String? defaultValue, // Allow null default
}) {
  final value = element.getAttribute(name);
  if (value == null) {
    if (required && defaultValue == null) {
      // Only throw if required and no default is provided
      throw FormatException(
        "Missing required attribute '$name' on element <${element.name.local}>",
      );
    }
    return defaultValue ?? ''; // Return default or empty string if not required
  }
  return value;
}

// Helper to parse a COLOR element
ScribusColor _parseColor(XmlElement element) {
  return ScribusColor(
    name: _getAttribute(element, ScribusConstants.colorNameAttr),
    rgb: _getAttribute(element, ScribusConstants.colorRgbAttr),
    spot: _getAttribute(
      element,
      ScribusConstants.colorSpotAttr,
      required: false,
      defaultValue: "0", // Provide default based on ScribusColor class
    ),
    register: _getAttribute(
      element,
      ScribusConstants.colorRegisterAttr,
      required: false,
      defaultValue: "0", // Provide default based on ScribusColor class
    ),
  );
}
