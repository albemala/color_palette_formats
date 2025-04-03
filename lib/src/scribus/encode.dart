part of 'scribus.dart';

List<int> _encode(ScribusPalette palette) {
  return buildXmlDocument(
    rootElementName: ScribusConstants.scribusColors,
    buildContent: (builder) {
      // Attribute for the root element
      builder.attribute(ScribusConstants.nameAttr, palette.name);

      // Build COLOR elements using the generic helper
      for (final color in palette.colors) {
        _buildColorElement(builder, color);
      }
    },
  );
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
