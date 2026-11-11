part of 'qcl.dart';

const _paletteName = 'QuarkXPress Color Library';

String _requiredText(XmlElement parent, String elementName) {
  final element = parent.findElements(elementName).firstOrNull;
  if (element == null) {
    throw FormatException('Not a valid $_paletteName. Missing <$elementName>.');
  }
  return element.innerText;
}

String _optionalText(XmlElement parent, String elementName) {
  return parent.findElements(elementName).firstOrNull?.innerText ?? '';
}

int _parseFormatId(XmlElement element) {
  final raw = element.getAttribute(QclConstants.formatIdAttr);
  // A missing attribute keeps the historical lenient 0; a present but
  // non-numeric one is malformed input, not a silent default.
  if (raw == null) return 0;
  final value = int.tryParse(raw);
  if (value == null) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid format_id "$raw".',
    );
  }
  return value;
}

XmlElement _requiredChild(XmlElement parent, String elementName) {
  final element = parent.findElements(elementName).firstOrNull;
  if (element == null) {
    throw FormatException('Not a valid $_paletteName. Missing <$elementName>.');
  }
  return element;
}

int _fieldPos(Map<String, int> fieldPositions, String fieldName, String row) {
  final pos = fieldPositions[fieldName];
  if (pos == null) {
    throw FormatException(
      'Not a valid $_paletteName. Missing "$fieldName" column for row "$row".',
    );
  }
  return pos;
}

String _cell(List<XmlElement> cells, int pos, String row) {
  if (pos < 1 || pos > cells.length) {
    throw FormatException(
      'Not a valid $_paletteName. Row "$row" has ${cells.length} cells, '
      'no column $pos.',
    );
  }
  return cells[pos - 1].innerText.trim();
}

int _parseIntCell(List<XmlElement> cells, int pos, String row) {
  final text = _cell(cells, pos, row);
  final value = int.tryParse(text);
  if (value == null) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid integer "$text" in row "$row".',
    );
  }
  return value;
}

double _parseDoubleCell(List<XmlElement> cells, int pos, String row) {
  final text = _cell(cells, pos, row);
  final value = double.tryParse(text);
  if (value == null) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid number "$text" in row "$row".',
    );
  }
  return value;
}

List<double>? _parseGroup(
  Map<String, int> fieldPositions,
  List<String> fieldNames,
  List<XmlElement> cells,
  String row, {
  double? max,
}) {
  final present = fieldNames.map(fieldPositions.containsKey).toList();
  if (present.every((p) => !p)) return null;
  if (present.any((p) => !p)) {
    throw FormatException(
      'Not a valid $_paletteName. Incomplete "${fieldNames.first}" group '
      'in row "$row".',
    );
  }
  final values = [
    for (final name in fieldNames)
      _parseDoubleCell(cells, fieldPositions[name]!, row),
  ];
  for (final value in values) {
    // NaN passes bare range comparisons, so finiteness is checked
    // explicitly. Overflow (e.g. 1e999) can still decode to Infinity.
    if (!value.isFinite) {
      throw FormatException(
        'Not a valid $_paletteName. Non-finite "${fieldNames.first}" '
        'value "$value" in row "$row".',
      );
    }
    if (max != null && (value < 0 || value > max)) {
      throw FormatException(
        'Not a valid $_paletteName. "${fieldNames.first}" value "$value" '
        'out of range 0..$max in row "$row".',
      );
    }
  }
  return values;
}

String _resolveName(
  String sampleId,
  int? nameFormatId,
  List<QuarkXPressNameFormat> nameFormats,
) {
  if (nameFormatId == null) return sampleId;
  final format =
      nameFormats.where((f) => f.formatId == nameFormatId).firstOrNull;
  if (format == null) {
    throw FormatException(
      'Not a valid $_paletteName. Unknown name format "$nameFormatId" '
      'for "$sampleId".',
    );
  }
  final parts = format.longForm.split('%n');
  if (parts.length != 2) return '${format.longForm}$sampleId';
  return '${parts[0]}$sampleId${parts[1]}';
}

QuarkXPressPalette _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(document, QclConstants.cgats17);

  final preamble = _requiredChild(root, QclConstants.preamble);
  final created = preamble.findElements(QclConstants.created).firstOrNull;

  final dataSection = _requiredChild(root, QclConstants.dataSection);
  final header = _requiredChild(dataSection, QclConstants.dataSectionHeader);
  final quarkFormat = _requiredChild(header, QclConstants.quarkFormat);

  final nameFormats =
      quarkFormat
          .findElements(QclConstants.nameFormat)
          .firstOrNull
          ?.findElements(QclConstants.nameFieldInfo)
          .map(
            (e) => QuarkXPressNameFormat(
              formatId: _parseFormatId(e),
              longForm: e.getAttribute(QclConstants.longFormAttr) ?? '',
              shortForm: e.getAttribute(QclConstants.shortFormAttr) ?? '',
            ),
          )
          .toList() ??
      [];

  final data = _requiredChild(dataSection, QclConstants.dataSectionData);
  final fieldPositions = <String, int>{};
  final formatElement = data.findElements(QclConstants.dataFormat).firstOrNull;
  final fieldElements =
      formatElement?.findElements(QclConstants.fieldInfo).toList() ??
      <XmlElement>[];
  for (final field in fieldElements) {
    final pos = int.tryParse(field.getAttribute(QclConstants.posAttr) ?? '');
    final name = field.getAttribute(QclConstants.nameAttr);
    if (pos == null || name == null || name.isEmpty) {
      throw const FormatException(
        'Not a valid $_paletteName. Invalid <${QclConstants.fieldInfo}>.',
      );
    }
    fieldPositions[name] = pos;
  }

  final table = data.findElements(QclConstants.table).firstOrNull;
  final rows = table?.findElements(QclConstants.tr).toList() ?? [];
  final colors = <QuarkXPressPaletteColor>[];
  for (final row in rows) {
    final cells = row.findElements(QclConstants.td).toList();
    if (cells.isEmpty) continue;
    final sampleId = _cell(
      cells,
      _fieldPos(fieldPositions, QclConstants.sampleId, row.innerText),
      row.innerText,
    );
    // NAME_FORMAT_ID values are 1-based; 0 means the color uses no format.
    final rawFormatId =
        fieldPositions.containsKey(QclConstants.nameFormatId)
            ? _parseIntCell(
              cells,
              fieldPositions[QclConstants.nameFormatId]!,
              sampleId,
            )
            : 0;
    final nameFormatId = rawFormatId == 0 ? null : rawFormatId;
    final rgbPositions =
        [
          QclConstants.rgbR,
          QclConstants.rgbG,
          QclConstants.rgbB,
        ].map(fieldPositions.containsKey).toList();
    List<int>? rgb;
    if (rgbPositions.every((p) => p)) {
      rgb = [
        _parseIntCell(cells, fieldPositions[QclConstants.rgbR]!, sampleId),
        _parseIntCell(cells, fieldPositions[QclConstants.rgbG]!, sampleId),
        _parseIntCell(cells, fieldPositions[QclConstants.rgbB]!, sampleId),
      ];
      if (rgb.any((v) => v < 0 || v > 255)) {
        throw FormatException(
          'Not a valid $_paletteName. RGB values out of range '
          'in row "$sampleId".',
        );
      }
    } else if (rgbPositions.any((p) => p)) {
      throw FormatException(
        'Not a valid $_paletteName. Incomplete "RGB_R" group '
        'in row "$sampleId".',
      );
    }
    colors.add(
      QuarkXPressPaletteColor(
        sampleId: sampleId,
        nameFormatId: nameFormatId,
        name: _resolveName(sampleId, nameFormatId, nameFormats),
        rgb: rgb,
        cmyk: _parseGroup(
          fieldPositions,
          [
            QclConstants.cmykC,
            QclConstants.cmykM,
            QclConstants.cmykY,
            QclConstants.cmykK,
          ],
          cells,
          sampleId,
          max: 100,
        ),
        lab: _parseGroup(
          fieldPositions,
          [QclConstants.labL, QclConstants.labA, QclConstants.labB],
          cells,
          sampleId,
        ),
        hexachrome: _parseGroup(
          fieldPositions,
          [for (var i = 1; i <= 6; i++) '${QclConstants.pc6Prefix}$i'],
          cells,
          sampleId,
          max: 100,
        ),
      ),
    );
  }
  if (colors.isEmpty) {
    throw const FormatException('Not a valid $_paletteName. No colors found.');
  }

  return QuarkXPressPalette(
    stdVersion: getAttribute(
      root,
      QclConstants.stdVersionAttr,
      required: false,
      defaultValue: '1.0',
    ),
    dtdVersion: getAttribute(
      root,
      QclConstants.dtdVersionAttr,
      required: false,
      defaultValue: '1.0',
    ),
    standard: _requiredText(preamble, QclConstants.standard),
    originator: _requiredText(preamble, QclConstants.originator),
    fileDescriptor: _requiredText(preamble, QclConstants.fileDescriptor),
    createdDate: created?.getAttribute(QclConstants.dateAttr) ?? '',
    createdText: created?.innerText ?? '',
    manufacturer: _optionalText(header, QclConstants.manufacturer),
    headerComment: _optionalText(header, QclConstants.comment),
    nameFormats: nameFormats,
    libraryIdentifier: _optionalText(
      quarkFormat,
      QclConstants.libraryIdentifier,
    ),
    defaultColorSpace: _optionalText(
      quarkFormat,
      QclConstants.defaultColorSpace,
    ),
    colorUsageRecommendation: _optionalText(
      quarkFormat,
      QclConstants.colorUsageRecommendation,
    ),
    uiSpec: _optionalText(quarkFormat, QclConstants.uiSpec),
    colors: colors,
  );
}
