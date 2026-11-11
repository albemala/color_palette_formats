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
  final rgb = getAttribute(element, ScribusConstants.colorRgbAttr);
  if (!_hexColor.hasMatch(rgb)) {
    throw FormatException(
      'Not a valid Scribus palette. Expected a "#RRGGBB" RGB value '
      'but found "$rgb".',
    );
  }
  return ScribusColor(
    name: getAttribute(element, ScribusConstants.colorNameAttr),
    rgb: rgb,
    spot: _parseFlag(element, ScribusConstants.colorSpotAttr),
    register: _parseFlag(element, ScribusConstants.colorRegisterAttr),
  );
}

final _hexColor = RegExp(r'^#[0-9a-fA-F]{6}$');

String _parseFlag(XmlElement element, String attributeName) {
  final value = getAttribute(
    element,
    attributeName,
    required: false,
    defaultValue: '0',
  );
  if (value != '0' && value != '1') {
    throw FormatException(
      'Not a valid Scribus palette. Expected "$attributeName" to be '
      '"0" or "1" but found "$value".',
    );
  }
  return value;
}
