part of 'scribus.dart';

ScribusPalette _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(document, ScribusConstants.scribusColors);

  return ScribusPalette(
    name: getAttribute(root, ScribusConstants.nameAttr),
    colors:
        root
            .findElements(ScribusConstants.colorElement)
            .map(_parseColor)
            .toList(),
  );
}

ScribusColor _parseColor(XmlElement element) {
  return ScribusColor(
    name: getAttribute(element, ScribusConstants.colorNameAttr),
    rgb: getAttribute(element, ScribusConstants.colorRgbAttr),
    spot: getAttribute(
      element,
      ScribusConstants.colorSpotAttr,
      required: false,
      defaultValue: '0',
    ),
    register: getAttribute(
      element,
      ScribusConstants.colorRegisterAttr,
      required: false,
      defaultValue: '0',
    ),
  );
}
