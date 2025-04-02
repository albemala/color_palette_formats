part of 'soc.dart';

StarOfficeColorTable _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = _parseXml(xmlString);
  final root = _validateRootElement(document);

  final colors =
      root
          .findElements(SocConstants.drawColor, namespace: SocConstants.drawNs)
          .map(_parseColor)
          .toList();

  return StarOfficeColorTable(colors: colors);
}

XmlDocument _parseXml(String xmlString) {
  try {
    // Trim leading/trailing whitespace which might interfere with parsing
    return XmlDocument.parse(xmlString.trim());
  } catch (e) {
    throw FormatException('Failed to parse SOC XML: $e');
  }
}

XmlElement _validateRootElement(XmlDocument document) {
  final root = document.rootElement;
  // Check both namespace and local name
  if (root.name.local != SocConstants.officeColorTable ||
      root.name.namespaceUri != SocConstants.officeNs) {
    throw FormatException(
      '''
Expected root element <${SocConstants.officePrefix}:${SocConstants.officeColorTable}> with namespace ${SocConstants.officeNs} but found <${root.name.qualified}>''',
    );
  }
  return root;
}

// Helper to get an attribute value, handling namespaces
String _getAttribute(
  XmlElement element,
  String name, {
  String? namespace,
  bool required = true,
  String defaultValue = '',
}) {
  final value = element.getAttribute(name, namespace: namespace);
  if (value == null) {
    if (required) {
      final nsPrefix =
          namespace == SocConstants.drawNs ? '${SocConstants.drawPrefix}:' : '';
      throw FormatException(
        "Missing required attribute '$nsPrefix$name' on element <${element.name.qualified}>",
      );
    }
    return defaultValue;
  }
  return value;
}

// Helper to parse a draw:color element
StarOfficeColor _parseColor(XmlElement element) {
  final name = _getAttribute(
    element,
    SocConstants.drawNameAttr,
    namespace: SocConstants.drawNs,
  );
  final color = _getAttribute(
    element,
    SocConstants.drawColorAttr,
    namespace: SocConstants.drawNs,
  );

  // Basic validation for hex color format
  if (!color.startsWith('#') || (color.length != 7 && color.length != 9)) {
    throw FormatException(
      "Invalid hex color format '$color' for color '$name' in <${element.name.qualified}>. Expected #RRGGBB or #AARRGGBB.",
    );
  }

  return StarOfficeColor(name: name, color: color);
}
