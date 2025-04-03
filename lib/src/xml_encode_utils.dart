import 'dart:convert';
import 'package:xml/xml.dart';

/// Creates an XML document with standard XML declaration and UTF-8 encoding.
/// Takes a function that builds the root element and its content.
/// Returns the document as UTF-8 encoded bytes.
List<int> buildXmlDocument({
  required String rootElementName,
  required void Function(XmlBuilder) buildContent,
  String? namespace,
  Map<String, String> namespaces = const {},
}) {
  final builder = XmlBuilder();

  // Standard XML declaration
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');

  // Build the root element with optional namespace
  builder.element(
    rootElementName,
    namespace: namespace,
    namespaces: namespaces,
    nest: () => buildContent(builder),
  );

  // Return pretty-printed XML as UTF-8 bytes
  final xmlString = builder.buildDocument().toXmlString(pretty: true);
  return utf8.encode(xmlString);
}

/// Encodes an XML document to UTF-8 bytes with consistent pretty-printing.
List<int> encodeXmlToPrettyUtf8(XmlDocument document) {
  return utf8.encode(document.toXmlString(pretty: true));
}

/// Generic function to build a list of elements within a container.
/// Only creates the container element if the items list is non-empty.
void buildElementList<T>(
  XmlBuilder builder,
  List<T> items,
  String containerName,
  void Function(XmlBuilder, T) buildItem, {
  String? namespace,
}) {
  if (items.isNotEmpty) {
    builder.element(
      containerName,
      namespace: namespace,
      nest: () {
        for (final item in items) {
          buildItem(builder, item);
        }
      },
    );
  }
}
