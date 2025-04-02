part of 'acbl.dart';

String _encode(AdobeColorBookLegacy book) {
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');

  builder.element(
    AcblConstants.adobeSwatchbook,
    nest: () {
      // Attributes for the root element
      builder.attribute(AcblConstants.versionAttr, book.version.toString());
      builder.attribute(AcblConstants.bookIdAttr, book.bookId.toString());

      // Build child element lists using the generic helper
      _buildElementList(
        builder,
        book.prefixPostfixPairs,
        AcblConstants.prefixPostfixPairs,
        _buildPrefixPostfixPair,
      );

      _buildElementList(
        builder,
        book.formats,
        AcblConstants.formats,
        _buildFormat,
      );

      _buildElementList(
        builder,
        book.colors,
        AcblConstants.swatches,
        _buildColor,
      );
    },
  );

  // Use pretty: true for readability, matching original behavior.
  return builder.buildDocument().toXmlString(pretty: true);
}

// Generic function to build a list of elements within a container
void _buildElementList<T>(
  XmlBuilder builder,
  List<T> items,
  String containerName,
  void Function(XmlBuilder, T) buildItem,
) {
  if (items.isNotEmpty) {
    builder.element(
      containerName,
      nest: () {
        for (final item in items) {
          buildItem(builder, item);
        }
      },
    );
  }
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
      if (pair.id != null) {
        builder.attribute(AcblConstants.idAttr, pair.id!);
      }
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
