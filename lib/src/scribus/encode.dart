part of 'scribus.dart';

List<int> _encode(ScribusPalette palette) {
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');

  builder.element(
    ScribusConstants.scribusColors,
    nest: () {
      // Attribute for the root element
      builder.attribute(ScribusConstants.nameAttr, palette.name);

      // Build COLOR elements
      for (final color in palette.colors) {
        _buildColorElement(builder, color);
      }
    },
  );

  // Use pretty: true for readability, similar to the example.
  return utf8.encode(builder.buildDocument().toXmlString(pretty: true));
}

// Helper to build a COLOR element.
void _buildColorElement(XmlBuilder builder, ScribusColor color) {
  builder.element(
    ScribusConstants.colorElement,
    nest: () {
      // Add attributes based on the ScribusColor object
      builder.attribute(ScribusConstants.colorSpotAttr, color.spot);
      builder.attribute(ScribusConstants.colorRgbAttr, color.rgb);
      builder.attribute(ScribusConstants.colorRegisterAttr, color.register);
      builder.attribute(ScribusConstants.colorNameAttr, color.name);
    },
  );
}
