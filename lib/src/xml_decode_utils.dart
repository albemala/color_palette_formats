import 'package:xml/xml.dart';

XmlDocument parseXml(String xmlString, {bool trim = true}) {
  try {
    final input = trim ? xmlString.trim() : xmlString;
    return XmlDocument.parse(input);
  } catch (e) {
    throw FormatException('''
Failed to parse XML: $e''');
  }
}

XmlElement validateRootElement(
  XmlDocument document,
  String expectedName, {
  String? expectedNamespace,
}) {
  final root = document.rootElement;
  final isValid =
      expectedNamespace == null
          ? root.name.local == expectedName
          : root.name.local == expectedName &&
              root.name.namespaceUri == expectedNamespace;

  if (!isValid) {
    throw FormatException('''
Expected root element <$expectedName> but found <${root.name.qualified}>''');
  }
  return root;
}

String getAttribute(
  XmlElement element,
  String name, {
  String? namespace,
  bool required = true,
  String? defaultValue,
}) {
  final value = element.getAttribute(name, namespace: namespace);
  if (value == null) {
    if (required && defaultValue == null) {
      throw FormatException("""
Missing required attribute '$name' on element <${element.name.qualified}>""");
    }
    return defaultValue ?? '';
  }
  return value;
}

int parseIntAttribute(
  XmlElement element,
  String name, {
  String? namespace,
  bool required = false,
  int defaultValue = 0,
}) {
  final valueStr = getAttribute(
    element,
    name,
    namespace: namespace,
    required: required,
    defaultValue: defaultValue.toString(),
  );

  final value = int.tryParse(valueStr);
  if (value == null) {
    throw FormatException("""
Invalid integer value '$valueStr' for attribute '$name'""");
  }
  return value;
}

List<T> parseElements<T>(
  XmlElement parent,
  String containerName,
  String elementName,
  T Function(XmlElement) parser,
) {
  final container = parent.findElements(containerName).firstOrNull;
  return container == null
      ? []
      : container.findElements(elementName).map(parser).toList();
}
