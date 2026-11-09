part of 'acf.dart';

String _encodeModel(AcfColorModel model) => switch (model) {
  AcfColorModel.rgb => 'RGB',
  AcfColorModel.cmyk => 'CMYK',
  AcfColorModel.lab => 'Lab',
  AcfColorModel.hifi => 'hifi',
};

String _encodeType(AcfPaletteType type) => switch (type) {
  AcfPaletteType.hifi => 'hifi',
  AcfPaletteType.process => 'Process',
  AcfPaletteType.spot => 'Spot',
  AcfPaletteType.mixed => 'Mixed',
};

String _encodeNamesFormat(AcfNamesFormat namesFormat) => switch (namesFormat) {
  AcfNamesFormat.full => 'Full',
  AcfNamesFormat.partial => 'Partial',
};

List<int> _encode(AcfPalette palette) {
  final lines = <String>[];
  lines.add(palette.version);
  lines.add(palette.name);
  lines.add('LibraryVersion: ${palette.libraryVersion}');
  lines.add('Copyright: ${palette.copyright}');
  lines.add('AboutMessage: ${palette.description}');
  lines.add('Names: ${_encodeNamesFormat(palette.namesFormat)}');
  lines.add('Rows: ${palette.rows}');
  lines.add('Columns: ${palette.columns}');
  lines.add('Entries: ${palette.colors.length}');
  lines.add('Prefix: ${palette.prefix}');
  lines.add('Suffix: ${palette.suffix}');
  lines.add('Type: ${_encodeType(palette.type)}');
  lines.add('Models: ${palette.models.map(_encodeModel).join(' ')}');
  lines.add('PreferredModel: ${palette.preferredModel}');
  if (palette.version == AcfPalette.version21) {
    lines.add('Inks: ${palette.inks.length}');
    lines.addAll(palette.inks);
  }
  lines.add(AcfPalette.dataSeparator);
  for (final color in palette.colors) {
    for (final value in color.values) {
      lines.add(value.values.join(' '));
    }
    if (palette.type == AcfPaletteType.mixed) {
      lines.add(color.type ?? '');
    }
    lines.add(color.name);
  }
  return utf8.encode(lines.join('\n'));
}
