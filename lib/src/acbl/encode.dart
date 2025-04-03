part of 'acbl.dart';

List<int> _encode(AdobeColorBookLegacy book) {
  return buildXmlDocument(
    rootElementName: AcblConstants.adobeSwatchbook,
    buildContent: (builder) {
      // Attributes for the root element
      builder.attribute(AcblConstants.versionAttr, book.version.toString());
      builder.attribute(AcblConstants.bookIdAttr, book.bookId.toString());

      // Build child element lists using the generic helper
      buildElementList(
        builder,
        book.prefixPostfixPairs,
        AcblConstants.prefixPostfixPairs,
        _buildPrefixPostfixPair,
      );

      buildElementList(
        builder,
        book.formats,
        AcblConstants.formats,
        _buildFormat,
      );

      buildElementList(
        builder,
        book.colors,
        AcblConstants.swatches,
        _buildColor,
      );
    },
  );
}

// Helper to build a PrefixPostfixPair element.
void _buildPrefixPostfixPair(
  XmlBuilder builder,
  AdobeColorBookLegacyPrefixPostfix pair,
) {
  builder.element(
    AcblConstants.prefixPostfixPair,
    nest: () {
      builder.attribute(AcblConstants.prefixAttr, pair.prefix);
      builder.attribute(AcblConstants.postfixAttr, pair.postfix);
      builder.attribute(AcblConstants.idAttr, pair.id);
    },
  );
}

// Helper to build a Format element.
void _buildFormat(XmlBuilder builder, AdobeColorBookLegacyFormat format) {
  builder.element(
    AcblConstants.format,
    nest: () {
      builder.attribute(AcblConstants.colorSpaceAttr, format.colorSpace);
      builder.attribute(AcblConstants.encodingAttr, format.encoding);
      builder.attribute(AcblConstants.channelsAttr, format.channels.toString());
      builder.attribute(AcblConstants.idAttr, format.id);
    },
  );
}

// Helper to build a Spot Color (Sp) element.
void _buildColor(XmlBuilder builder, AdobeColorBookLegacyColor color) {
  builder.element(
    AcblConstants.spotColor,
    nest: () {
      builder.attribute(AcblConstants.nameAttr, color.name);
      builder.element(
        AcblConstants.colorValues,
        nest: color.values.map((v) => v.toString()).join(' '),
      );
    },
  );
}
