part of 'cxf.dart';

CxfPalette _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(
    document,
    CxfConstants.cxfRoot,
    expectedNamespace: CxfConstants.cxfNs,
  );

  // Navigate to Resources/ObjectCollection (with namespace)
  final resources =
      root
          .findElements(CxfConstants.resources, namespace: CxfConstants.cxfNs)
          .firstOrNull;
  if (resources == null) {
    throw FormatException('Missing Resources element in CXF file');
  }

  final objectCollection =
      resources
          .findElements(
            CxfConstants.objectCollection,
            namespace: CxfConstants.cxfNs,
          )
          .firstOrNull;
  if (objectCollection == null) {
    throw FormatException('Missing ObjectCollection element in CXF file');
  }

  // Parse all Object elements
  final colors =
      objectCollection
          .findElements(CxfConstants.object, namespace: CxfConstants.cxfNs)
          .map(_parseColor)
          .toList();

  return CxfPalette(colors: colors);
}

CxfColor _parseColor(XmlElement element) {
  final name = getAttribute(element, CxfConstants.nameAttr);

  // Find ColorCIELab element (with namespace)
  final colorValues =
      element
          .findElements('ColorValues', namespace: CxfConstants.cxfNs)
          .firstOrNull;
  if (colorValues == null) {
    throw FormatException('Missing ColorValues element for color: $name');
  }

  final colorCIELab =
      colorValues
          .findElements(CxfConstants.colorCIELab, namespace: CxfConstants.cxfNs)
          .firstOrNull;
  if (colorCIELab == null) {
    throw FormatException('Missing ColorCIELab element for color: $name');
  }

  // Extract L, A, B values (with namespace)
  final lElement =
      colorCIELab
          .findElements(CxfConstants.lElement, namespace: CxfConstants.cxfNs)
          .firstOrNull;
  final aElement =
      colorCIELab
          .findElements(CxfConstants.aElement, namespace: CxfConstants.cxfNs)
          .firstOrNull;
  final bElement =
      colorCIELab
          .findElements(CxfConstants.bElement, namespace: CxfConstants.cxfNs)
          .firstOrNull;

  if (lElement == null || aElement == null || bElement == null) {
    throw FormatException('Missing L, A, or B element for color: $name');
  }

  final l = double.tryParse(lElement.innerText.trim());
  final a = double.tryParse(aElement.innerText.trim());
  final b = double.tryParse(bElement.innerText.trim());

  if (l == null || a == null || b == null) {
    throw FormatException('Invalid L, A, or B value for color: $name');
  }

  return CxfColor(name: name, l: l, a: a, b: b);
}
