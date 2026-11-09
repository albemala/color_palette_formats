part of 'autocad_acb.dart';

void _buildRgb8(XmlBuilder builder, List<int> rgb) {
  builder.element(
    AutoCadAcbConstants.rgb8,
    nest: () {
      builder.element(AutoCadAcbConstants.red, nest: '${rgb[0]}');
      builder.element(AutoCadAcbConstants.green, nest: '${rgb[1]}');
      builder.element(AutoCadAcbConstants.blue, nest: '${rgb[2]}');
    },
  );
}

void _buildRgb8Encrypt(XmlBuilder builder, List<String> codes) {
  builder.element(
    AutoCadAcbConstants.rgb8Encrypt,
    nest: () {
      builder.element(AutoCadAcbConstants.redEncrypt, nest: codes[0]);
      builder.element(AutoCadAcbConstants.greenEncrypt, nest: codes[1]);
      builder.element(AutoCadAcbConstants.blueEncrypt, nest: codes[2]);
    },
  );
}

// Plain values win when both shapes are present.
void _buildRgbValue(
  XmlBuilder builder,
  List<int>? rgb,
  List<String>? encryptedRgb,
) {
  if (rgb != null) {
    if (rgb.length != 3) {
      throw StateError(
        'Cannot encode AutoCAD Color Book color: rgb must have 3 values.',
      );
    }
    _buildRgb8(builder, rgb);
  } else if (encryptedRgb != null) {
    if (encryptedRgb.length != 3) {
      throw StateError(
        'Cannot encode AutoCAD Color Book color: '
        'encryptedRgb must have 3 values.',
      );
    }
    _buildRgb8Encrypt(builder, encryptedRgb);
  } else {
    throw StateError(
      'Cannot encode AutoCAD Color Book color: '
      'either rgb or encryptedRgb must be set.',
    );
  }
}

List<int> _encode(AutoCadColorBook book) {
  return buildXmlDocument(
    rootElementName: AutoCadAcbConstants.colorBook,
    buildContent: (builder) {
      builder.element(AutoCadAcbConstants.bookName, nest: book.bookName);
      if (book.majorVersion != null) {
        builder.element(
          AutoCadAcbConstants.majorVersion,
          nest: '${book.majorVersion}',
        );
      }
      if (book.minorVersion != null) {
        builder.element(
          AutoCadAcbConstants.minorVersion,
          nest: '${book.minorVersion}',
        );
      }
      builder.element(
        AutoCadAcbConstants.colorPage,
        nest: () {
          builder.element(
            AutoCadAcbConstants.pageColor,
            nest: () {
              _buildRgbValue(
                builder,
                book.pageColor.rgb,
                book.pageColor.encryptedRgb,
              );
            },
          );
          for (final color in book.colors) {
            builder.element(
              AutoCadAcbConstants.colorEntry,
              nest: () {
                builder.element(
                  AutoCadAcbConstants.colorName,
                  nest: color.name,
                );
                _buildRgbValue(builder, color.rgb, color.encryptedRgb);
              },
            );
          }
        },
      );
    },
  );
}
