part of 'qcl.dart';

String _formatNumber(double value) =>
    value == value.roundToDouble() ? value.toInt().toString() : '$value';

List<String> _encodeFields(QuarkXPressPalette palette) {
  final fields = <String>[QclConstants.sampleId];
  if (palette.colors.any((c) => c.nameFormatId != null)) {
    fields.add(QclConstants.nameFormatId);
  }
  if (palette.colors.any((c) => c.rgb != null)) {
    fields.addAll([QclConstants.rgbR, QclConstants.rgbG, QclConstants.rgbB]);
  }
  if (palette.colors.any((c) => c.cmyk != null)) {
    fields.addAll([
      QclConstants.cmykC,
      QclConstants.cmykM,
      QclConstants.cmykY,
      QclConstants.cmykK,
    ]);
  }
  if (palette.colors.any((c) => c.lab != null)) {
    fields.addAll([QclConstants.labL, QclConstants.labA, QclConstants.labB]);
  }
  if (palette.colors.any((c) => c.hexachrome != null)) {
    fields.addAll([for (var i = 1; i <= 6; i++) '${QclConstants.pc6Prefix}$i']);
  }
  return fields;
}

String _encodeCell(QuarkXPressPaletteColor color, String field) {
  return switch (field) {
    QclConstants.sampleId => color.sampleId,
    QclConstants.nameFormatId => '${color.nameFormatId ?? 0}',
    QclConstants.rgbR => '${color.rgb?[0] ?? 0}',
    QclConstants.rgbG => '${color.rgb?[1] ?? 0}',
    QclConstants.rgbB => '${color.rgb?[2] ?? 0}',
    QclConstants.cmykC => _formatNumber(color.cmyk?[0] ?? 0),
    QclConstants.cmykM => _formatNumber(color.cmyk?[1] ?? 0),
    QclConstants.cmykY => _formatNumber(color.cmyk?[2] ?? 0),
    QclConstants.cmykK => _formatNumber(color.cmyk?[3] ?? 0),
    QclConstants.labL => _formatNumber(color.lab?[0] ?? 0),
    QclConstants.labA => _formatNumber(color.lab?[1] ?? 0),
    QclConstants.labB => _formatNumber(color.lab?[2] ?? 0),
    _ when field.startsWith(QclConstants.pc6Prefix) => _formatNumber(
      color.hexachrome?[int.parse(field.substring(4)) - 1] ?? 0,
    ),
    _ => '',
  };
}

List<int> _encode(QuarkXPressPalette palette) {
  final fields = _encodeFields(palette);
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0" encoding="UTF-8"');
  builder.element(
    QclConstants.cgats17,
    nest: () {
      builder.attribute(QclConstants.stdVersionAttr, palette.stdVersion);
      builder.attribute(QclConstants.dtdVersionAttr, palette.dtdVersion);
      builder.element(
        QclConstants.preamble,
        nest: () {
          builder.element(QclConstants.standard, nest: palette.standard);
          builder.element(QclConstants.originator, nest: palette.originator);
          builder.element(
            QclConstants.fileDescriptor,
            nest: palette.fileDescriptor,
          );
          builder.element(
            QclConstants.created,
            nest: () {
              builder.attribute(QclConstants.dateAttr, palette.createdDate);
              builder.text(palette.createdText);
            },
          );
        },
      );
      builder.element(
        QclConstants.dataSection,
        nest: () {
          builder.element(
            QclConstants.dataSectionHeader,
            nest: () {
              builder.element(
                QclConstants.manufacturer,
                nest: palette.manufacturer,
              );
              if (palette.headerComment.isNotEmpty) {
                builder.element(
                  QclConstants.comment,
                  nest: palette.headerComment,
                );
              }
              builder.element(
                QclConstants.quarkFormat,
                nest: () {
                  if (palette.nameFormats.isNotEmpty) {
                    builder.element(
                      QclConstants.nameFormat,
                      nest: () {
                        for (final format in palette.nameFormats) {
                          builder.element(
                            QclConstants.nameFieldInfo,
                            nest: () {
                              builder.attribute(
                                QclConstants.formatIdAttr,
                                '${format.formatId}',
                              );
                              builder.attribute(
                                QclConstants.longFormAttr,
                                format.longForm,
                              );
                              builder.attribute(
                                QclConstants.shortFormAttr,
                                format.shortForm,
                              );
                            },
                          );
                        }
                      },
                    );
                  }
                  builder.element(
                    QclConstants.libraryIdentifier,
                    nest: palette.libraryIdentifier,
                  );
                  builder.element(
                    QclConstants.defaultColorSpace,
                    nest: palette.defaultColorSpace,
                  );
                  builder.element(
                    QclConstants.colorUsageRecommendation,
                    nest: palette.colorUsageRecommendation,
                  );
                  builder.element(QclConstants.uiSpec, nest: palette.uiSpec);
                },
              );
            },
          );
          builder.element(
            QclConstants.dataSectionData,
            nest: () {
              builder.element(
                QclConstants.numberOfFields,
                nest: '${fields.length}',
              );
              builder.element(
                QclConstants.dataFormat,
                nest: () {
                  for (var i = 0; i < fields.length; i++) {
                    builder.element(
                      QclConstants.fieldInfo,
                      nest: () {
                        builder.attribute(QclConstants.posAttr, '${i + 1}');
                        builder.attribute(QclConstants.nameAttr, fields[i]);
                      },
                    );
                  }
                },
              );
              builder.element(
                QclConstants.numberOfSets,
                nest: '${palette.colors.length}',
              );
              builder.element(
                QclConstants.table,
                nest: () {
                  for (final color in palette.colors) {
                    builder.element(
                      QclConstants.tr,
                      nest: () {
                        for (final field in fields) {
                          builder.element(
                            QclConstants.td,
                            nest: _encodeCell(color, field),
                          );
                        }
                      },
                    );
                  }
                },
              );
            },
          );
        },
      );
    },
  );
  final documentString = builder.buildDocument().toXmlString(pretty: true);
  // Real-world files carry the document type after the XML declaration.
  final declarationEnd = documentString.indexOf('\n');
  final xmlString =
      '${documentString.substring(0, declarationEnd)}\n'
      '${QuarkXPressPalette.documentType}\n'
      '${documentString.substring(declarationEnd + 1)}';
  return utf8.encode(xmlString);
}
