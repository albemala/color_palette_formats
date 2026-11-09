part of 'autocad_acb.dart';

const _paletteName = 'AutoCAD Color Book';

String _requiredText(XmlElement parent, String elementName) {
  final element = parent.findElements(elementName).firstOrNull;
  if (element == null) {
    throw FormatException('Not a valid $_paletteName. Missing <$elementName>.');
  }
  return element.innerText.trim();
}

int? _optionalVersion(XmlElement root, String elementName) {
  final element = root.findElements(elementName).firstOrNull;
  if (element == null) return null;
  final value = int.tryParse(element.innerText.trim());
  if (value == null) {
    throw FormatException('Not a valid $_paletteName. Invalid <$elementName>.');
  }
  return value;
}

int _parseChannel(XmlElement parent, String elementName) {
  final value = int.tryParse(_requiredText(parent, elementName));
  if (value == null) {
    throw FormatException('Not a valid $_paletteName. Invalid <$elementName>.');
  }
  if (value < 0 || value > 255) {
    throw FormatException(
      'Not a valid $_paletteName. <$elementName> out of range.',
    );
  }
  return value;
}

List<int> _parseRgb8(XmlElement parent) {
  final rgb8 = parent.findElements(AutoCadAcbConstants.rgb8).firstOrNull;
  if (rgb8 == null) {
    throw const FormatException(
      'Not a valid $_paletteName. Missing <${AutoCadAcbConstants.rgb8}>.',
    );
  }
  return [
    _parseChannel(rgb8, AutoCadAcbConstants.red),
    _parseChannel(rgb8, AutoCadAcbConstants.green),
    _parseChannel(rgb8, AutoCadAcbConstants.blue),
  ];
}

List<String> _parseRgb8Encrypt(XmlElement parent) {
  final encrypted =
      parent.findElements(AutoCadAcbConstants.rgb8Encrypt).firstOrNull;
  if (encrypted == null) {
    throw const FormatException(
      'Not a valid $_paletteName. '
      'Missing <${AutoCadAcbConstants.rgb8Encrypt}>.',
    );
  }
  final codes = [
    _requiredText(encrypted, AutoCadAcbConstants.redEncrypt),
    _requiredText(encrypted, AutoCadAcbConstants.greenEncrypt),
    _requiredText(encrypted, AutoCadAcbConstants.blueEncrypt),
  ];
  if (codes.any((c) => c.isEmpty)) {
    throw const FormatException(
      'Not a valid $_paletteName. Empty encrypted code.',
    );
  }
  return codes;
}

AutoCadColorBookPageColor _parsePageColor(XmlElement page) {
  final element = page.findElements(AutoCadAcbConstants.pageColor).firstOrNull;
  if (element == null) {
    throw const FormatException(
      'Not a valid $_paletteName. '
      'Missing <${AutoCadAcbConstants.pageColor}>.',
    );
  }
  // Plain values win when both shapes are present.
  if (element.findElements(AutoCadAcbConstants.rgb8).isNotEmpty) {
    return AutoCadColorBookPageColor(rgb: _parseRgb8(element));
  }
  return AutoCadColorBookPageColor(encryptedRgb: _parseRgb8Encrypt(element));
}

AutoCadColorBookColor _parseColorEntry(XmlElement element) {
  final name = _requiredText(element, AutoCadAcbConstants.colorName);
  // Plain values win when both shapes are present.
  if (element.findElements(AutoCadAcbConstants.rgb8).isNotEmpty) {
    return AutoCadColorBookColor(name: name, rgb: _parseRgb8(element));
  }
  if (element.findElements(AutoCadAcbConstants.rgb8Encrypt).isNotEmpty) {
    return AutoCadColorBookColor(
      name: name,
      encryptedRgb: _parseRgb8Encrypt(element),
    );
  }
  throw FormatException(
    'Not a valid $_paletteName. Color "$name" has no RGB values.',
  );
}

AutoCadColorBook _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(document, AutoCadAcbConstants.colorBook);

  final pages = root.findElements(AutoCadAcbConstants.colorPage).toList();
  if (pages.isEmpty) {
    throw const FormatException(
      'Not a valid $_paletteName. '
      'Missing <${AutoCadAcbConstants.colorPage}>.',
    );
  }

  final colors = <AutoCadColorBookColor>[];
  for (final page in pages) {
    for (final entry in page.findElements(AutoCadAcbConstants.colorEntry)) {
      colors.add(_parseColorEntry(entry));
    }
  }
  if (colors.isEmpty) {
    throw const FormatException('Not a valid $_paletteName. No colors found.');
  }

  return AutoCadColorBook(
    bookName: _requiredText(root, AutoCadAcbConstants.bookName),
    majorVersion: _optionalVersion(root, AutoCadAcbConstants.majorVersion),
    minorVersion: _optionalVersion(root, AutoCadAcbConstants.minorVersion),
    pageColor: _parsePageColor(pages.first),
    colors: colors,
  );
}
