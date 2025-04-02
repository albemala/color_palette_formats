part of 'soc.dart';

List<int> _encode(StarOfficeColorTable table) {
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');

  builder.element(
    SocConstants.officeColorTable,
    namespace: SocConstants.officeNs,
    // Define all required namespaces on the root element
    namespaces: {
      SocConstants.officeNs: SocConstants.officePrefix,
      SocConstants.styleNs: SocConstants.stylePrefix,
      SocConstants.textNs: SocConstants.textPrefix,
      SocConstants.tableNs: SocConstants.tablePrefix,
      SocConstants.drawNs: SocConstants.drawPrefix,
      SocConstants.foNs: SocConstants.foPrefix,
      SocConstants.xlinkNs: SocConstants.xlinkPrefix,
      SocConstants.dcNs: SocConstants.dcPrefix,
      SocConstants.metaNs: SocConstants.metaPrefix,
      SocConstants.numberNs: SocConstants.numberPrefix,
      SocConstants.svgNs: SocConstants.svgPrefix,
      SocConstants.chartNs: SocConstants.chartPrefix,
      SocConstants.dr3dNs: SocConstants.dr3dPrefix,
      SocConstants.mathNs: SocConstants.mathPrefix,
      SocConstants.formNs: SocConstants.formPrefix,
      SocConstants.scriptNs: SocConstants.scriptPrefix,
    },
    nest: () {
      // Build color elements
      for (final color in table.colors) {
        _buildColor(builder, color);
      }
    },
  );

  // Use pretty: true for readability, similar to the example file.
  return utf8.encode(builder.buildDocument().toXmlString(pretty: true));
}

// Helper to build a draw:color element.
void _buildColor(XmlBuilder builder, StarOfficeColor color) {
  builder.element(
    SocConstants.drawColor,
    namespace: SocConstants.drawNs,
    nest: () {
      builder.attribute(
        SocConstants.drawNameAttr,
        color.name,
        namespace: SocConstants.drawNs,
      );
      builder.attribute(
        SocConstants.drawColorAttr,
        color.color,
        namespace: SocConstants.drawNs,
      );
    },
  );
}
