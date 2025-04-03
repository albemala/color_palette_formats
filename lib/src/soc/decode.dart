part of 'soc.dart';

StarOfficeColorTable _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = _validateRootElement(document);

  final colors =
      root
          .findElements(SocConstants.drawColor, namespace: SocConstants.drawNs)
          .map(_parseColor)
          .toList();

  return StarOfficeColorTable(colors: colors);
}

XmlElement _validateRootElement(XmlDocument document) {
  return validateRootElement(
    document,
    SocConstants.officeColorTable,
    expectedNamespace: SocConstants.officeNs,
  );
}

StarOfficeColor _parseColor(XmlElement element) {
  final name = getAttribute(
    element,
    SocConstants.drawNameAttr,
    namespace: SocConstants.drawNs,
  );
  final color = getAttribute(
    element,
    SocConstants.drawColorAttr,
    namespace: SocConstants.drawNs,
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
