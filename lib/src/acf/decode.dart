part of 'acf.dart';

const _paletteName = 'ASCII Color Format';
final _whitespace = RegExp(r'\s+');

String _headerValue(String line, String label) {
  final separatorIndex = line.indexOf(':');
  if (separatorIndex < 0 || line.substring(0, separatorIndex).trim() != label) {
    throw FormatException(
      'Not a valid $_paletteName. Expected "$label: ..." but found "$line".',
    );
  }
  return line.substring(separatorIndex + 1).trim();
}

AcfColorModel _parseModel(String name) => switch (name.toLowerCase()) {
  'rgb' => AcfColorModel.rgb,
  'cmyk' => AcfColorModel.cmyk,
  'lab' => AcfColorModel.lab,
  'hifi' => AcfColorModel.hifi,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported color model "$name".',
    ),
};

AcfPaletteType _parsePaletteType(String name) => switch (name.toLowerCase()) {
  'hifi' => AcfPaletteType.hifi,
  'process' => AcfPaletteType.process,
  'spot' => AcfPaletteType.spot,
  'mixed' => AcfPaletteType.mixed,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported palette type "$name".',
    ),
};

AcfNamesFormat _parseNamesFormat(String name) => switch (name.toLowerCase()) {
  'full' => AcfNamesFormat.full,
  'partial' => AcfNamesFormat.partial,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected "Names: Full" or "Names: Partial" but found "$name".',
    ),
};

AcfPalette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  final version = lines.elementAt(0).trim();
  if (!AcfPalette.validVersions.contains(version)) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected version "${AcfPalette.validVersions.join('" or "')}" '
      'but found "$version".',
    );
  }

  final name = lines.elementAt(1);
  final libraryVersion = _headerValue(lines.elementAt(2), 'LibraryVersion');
  final copyright = _headerValue(lines.elementAt(3), 'Copyright');
  final description = _headerValue(lines.elementAt(4), 'AboutMessage');
  final namesFormat = _parseNamesFormat(
    _headerValue(lines.elementAt(5), 'Names'),
  );
  final rows = int.parse(_headerValue(lines.elementAt(6), 'Rows'));
  final columns = int.parse(_headerValue(lines.elementAt(7), 'Columns'));
  final entryCount = int.parse(_headerValue(lines.elementAt(8), 'Entries'));
  final prefix = _headerValue(lines.elementAt(9), 'Prefix');
  final suffix = _headerValue(lines.elementAt(10), 'Suffix');
  final type = _parsePaletteType(_headerValue(lines.elementAt(11), 'Type'));
  final models =
      _headerValue(
        lines.elementAt(12),
        'Models',
      ).split(_whitespace).map(_parseModel).toList();
  final preferredModel = _headerValue(lines.elementAt(13), 'PreferredModel');

  var pos = 14;
  final inks = <String>[];
  if (version == AcfPalette.version21) {
    final inkCount = int.parse(_headerValue(lines.elementAt(pos), 'Inks'));
    pos++;
    for (var i = 0; i < inkCount; i++) {
      inks.add(lines.elementAt(pos++));
    }
  }
  // Skip the 'Data:' separator line
  if (lines.elementAt(pos).trim() != AcfPalette.dataSeparator) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected "${AcfPalette.dataSeparator}" '
      'but found "${lines.elementAt(pos)}".',
    );
  }
  pos++;

  final isMixed = type == AcfPaletteType.mixed;
  final colors = <AcfPaletteColor>[];
  for (var i = 0; i < entryCount; i++) {
    final values = <AcfPaletteColorValue>[];
    for (final model in models) {
      final channels =
          lines
              .elementAt(pos++)
              .trim()
              .split(_whitespace)
              .map(int.parse)
              .toList();
      if (channels.isEmpty) {
        throw const FormatException(
          'Not a valid $_paletteName. Missing color values.',
        );
      }
      values.add(AcfPaletteColorValue(model: model, values: channels));
    }
    String? colorType;
    if (isMixed) {
      colorType = lines.elementAt(pos++).trim();
    }
    final colorName = lines.elementAt(pos++);
    colors.add(
      AcfPaletteColor(name: colorName, values: values, type: colorType),
    );
  }

  return AcfPalette(
    version: version,
    name: name,
    libraryVersion: libraryVersion,
    copyright: copyright,
    description: description,
    namesFormat: namesFormat,
    rows: rows,
    columns: columns,
    prefix: prefix,
    suffix: suffix,
    type: type,
    models: models,
    preferredModel: preferredModel,
    inks: inks,
    colors: colors,
  );
}
