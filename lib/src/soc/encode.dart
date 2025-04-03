part of 'soc.dart';

List<int> _encode(StarOfficeColorTable table) {
  return buildXmlDocument(
    rootElementName: SocConstants.officeColorTable,
    namespace: SocConstants.officeNs,
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
    buildContent: (builder) {
      // Build color elements using the generic helper
      for (final color in table.colors) {
        _buildColor(builder, color);
      }
    },
  );
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
