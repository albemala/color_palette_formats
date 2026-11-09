part of 'acf.dart';

const _paletteName = 'ASCII Color Format';
final _whitespace = RegExp(r'\s+');

/// Returns the line at [index], throwing a [FormatException] (rather than
/// leaking [RangeError]) when the file is truncated.
String _lineAt(List<String> lines, int index) {
  if (index < 0 || index >= lines.length) {
    throw const FormatException(
      'Not a valid $_paletteName. Unexpected end of file.',
    );
  }
  return lines[index];
}

/// Expected channel counts per model. HiFi is absent: its entries carry one
/// value per ink, so any length is accepted.
const Map<AcfColorModel, int> _modelChannelCounts = {
  AcfColorModel.rgb: 3,
  AcfColorModel.cmyk: 4,
  AcfColorModel.lab: 3,
};

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

  final version = _lineAt(lines, 0).trim();
  if (!AcfPalette.validVersions.contains(version)) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected version "${AcfPalette.validVersions.join('" or "')}" '
      'but found "$version".',
    );
  }

  final name = _lineAt(lines, 1);
  final libraryVersion = _headerValue(_lineAt(lines, 2), 'LibraryVersion');
  final copyright = _headerValue(_lineAt(lines, 3), 'Copyright');
  final description = _headerValue(_lineAt(lines, 4), 'AboutMessage');
  final namesFormat = _parseNamesFormat(
    _headerValue(_lineAt(lines, 5), 'Names'),
  );
  final rows = int.parse(_headerValue(_lineAt(lines, 6), 'Rows'));
  final columns = int.parse(_headerValue(_lineAt(lines, 7), 'Columns'));
  final entryCount = int.parse(_headerValue(_lineAt(lines, 8), 'Entries'));
  final prefix = _headerValue(_lineAt(lines, 9), 'Prefix');
  final suffix = _headerValue(_lineAt(lines, 10), 'Suffix');
  final type = _parsePaletteType(_headerValue(_lineAt(lines, 11), 'Type'));
  final models =
      _headerValue(
        _lineAt(lines, 12),
        'Models',
      ).split(_whitespace).map(_parseModel).toList();
  final preferredModel = _headerValue(_lineAt(lines, 13), 'PreferredModel');

  var pos = 14;
  final inks = <String>[];
  if (version == AcfPalette.version21) {
    final inkCount = int.parse(_headerValue(_lineAt(lines, pos), 'Inks'));
    pos++;
    for (var i = 0; i < inkCount; i++) {
      inks.add(_lineAt(lines, pos++));
    }
  }
  // Skip the 'Data:' separator line
  if (_lineAt(lines, pos).trim() != AcfPalette.dataSeparator) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected "${AcfPalette.dataSeparator}" '
      'but found "${_lineAt(lines, pos)}".',
    );
  }
  pos++;

  final isMixed = type == AcfPaletteType.mixed;
  final colors = <AcfPaletteColor>[];
  for (var i = 0; i < entryCount; i++) {
    final values = <AcfPaletteColorValue>[];
    for (final model in models) {
      final channels =
          _lineAt(lines, pos++)
              .trim()
              .split(_whitespace)
              .map(int.parse)
              .toList();
      final expectedChannels = _modelChannelCounts[model];
      if (expectedChannels != null && channels.length != expectedChannels) {
        throw FormatException(
          'Not a valid $_paletteName. Expected $expectedChannels values '
          'for model "$model" but found ${channels.length}.',
        );
      }
      values.add(AcfPaletteColorValue(model: model, values: channels));
    }
    String? colorType;
    if (isMixed) {
      colorType = _lineAt(lines, pos++).trim();
    }
    final colorName = _lineAt(lines, pos++);
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
