part of 'soc.dart';

StarOfficeColorTable _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = _validateRootElement(document);
  final drawNamespace =
      root.name.namespaceUri == SocConstants.officeNs
          ? SocConstants.drawNs
          : SocConstants.drawOasisNs;

  final colors =
      root
          .findElements(SocConstants.drawColor, namespace: drawNamespace)
          .map((element) => _parseColor(element, drawNamespace))
          .toList();

  return StarOfficeColorTable(colors: colors);
}

XmlElement _validateRootElement(XmlDocument document) {
  final root = document.rootElement;
  final isValid =
      root.name.local == SocConstants.officeColorTable &&
      (root.name.namespaceUri == SocConstants.officeNs ||
          root.name.namespaceUri == SocConstants.officeOasisNs ||
          root.name.namespaceUri == null);

  if (!isValid) {
    throw FormatException(
      '''
Expected root element <${SocConstants.officeColorTable}> but found <${root.name.qualified}>''',
    );
  }

  return root;
}

StarOfficeColor _parseColor(XmlElement element, String drawNamespace) {
  final name = getAttribute(
    element,
    SocConstants.drawNameAttr,
    namespace: drawNamespace,
  );
  final color = getAttribute(
    element,
    SocConstants.drawColorAttr,
    namespace: drawNamespace,
  );

  // Basic validation for hex color format
  if (!color.startsWith('#') || (color.length != 7 && color.length != 9)) {
    throw FormatException(
      """
Invalid hex color format '$color' for color '$name' in <${element.name.qualified}>. Expected #RRGGBB or #AARRGGBB.""",
    );
  }

  return StarOfficeColor(name: name, color: color);
}
