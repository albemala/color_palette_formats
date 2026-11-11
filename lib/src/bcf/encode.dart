part of 'bcf.dart';

int _encodeNamesFormat(BcfNamesFormat namesFormat) => switch (namesFormat) {
  BcfNamesFormat.full => 1,
  BcfNamesFormat.partial => 2,
};

int _encodePaletteType(BcfPaletteType type) => switch (type) {
  BcfPaletteType.spot => 1,
  BcfPaletteType.process => 2,
  BcfPaletteType.mixed => 8,
  BcfPaletteType.hifi => 16,
};

int _encodePreferredModel(String preferredModel) => switch (preferredModel) {
  'RGB' => 1,
  'CMYK' => 2,
  'hifi' => 8,
  'Mixed' => 16,
  _ => throw FormatException('Unsupported preferred model "$preferredModel".'),
};

List<int> _encodeMacRoman(String value) {
  return [
    for (final char in value.codeUnits)
      if (char < 0x80) char else _macRomanCodeFor(char),
  ];
}

int _macRomanCodeFor(int charCode) {
  final index = _macRomanTable.indexOf(charCode);
  return index < 0 ? 0x3F : index + 0x80;
}

void _writeFixedString(ByteDataWriter buffer, String value, int length) {
  final bytes = _encodeMacRoman(value);
  if (bytes.length > length) {
    throw FormatException('Value "$value" exceeds $length bytes.');
  }
  for (final byte in bytes) {
    buffer.writeUint8(byte);
  }
  for (var i = bytes.length; i < length; i++) {
    buffer.writeUint8(0);
  }
}

void _writeUint16Values(ByteDataWriter buffer, List<int> values) {
  for (final value in values) {
    buffer.writeUint16(value);
  }
}

void _writeInt16Values(ByteDataWriter buffer, List<int> values) {
  for (final value in values) {
    buffer.writeInt16(value);
  }
}

String _encodeAffix(String value, {required bool trailing}) {
  if (trailing && value.endsWith(' ')) {
    return value.substring(0, value.length - 1);
  }
  if (!trailing && value.startsWith(' ')) {
    return value.substring(1);
  }
  return value;
}

BcfPaletteColorValue? _valueFor(BcfPaletteColor color, BcfColorModel model) {
  for (final value in color.values) {
    if (value.model == model) return value;
  }
  return null;
}

List<int> _encode(BcfPalette palette) {
  final isV1 = palette.version == BcfPalette.version10;
  final hasHifiBlock =
      !isV1 &&
      (palette.type == BcfPaletteType.mixed ||
          palette.type == BcfPaletteType.hifi);
  _validatePalette(palette, isV1: isV1, hasHifiBlock: hasHifiBlock);

  final buffer = ByteDataWriter();
  // version
  _writeFixedString(buffer, palette.version, 8);
  // library name
  _writeFixedString(buffer, palette.name, 32);
  // library version
  _writeFixedString(buffer, palette.libraryVersion, 8);
  // copyright
  _writeFixedString(buffer, palette.copyright, 32);
  // about message, with extender overflow when longer than 512
  final descriptionBytes = _encodeMacRoman(palette.description);
  final baseLength =
      descriptionBytes.length > 512 ? 512 : descriptionBytes.length;
  for (var i = 0; i < 512; i++) {
    buffer.writeUint8(i < baseLength ? descriptionBytes[i] : 0);
  }
  // display layout
  buffer.writeUint16(_encodeNamesFormat(palette.namesFormat));
  buffer.writeUint16(palette.rows);
  buffer.writeUint16(palette.columns);
  // color entries count
  buffer.writeUint16(palette.colors.length);
  // affixes
  _writeFixedString(buffer, _encodeAffix(palette.prefix, trailing: true), 12);
  _writeFixedString(buffer, _encodeAffix(palette.suffix, trailing: false), 4);
  // palette type
  buffer.writeUint16(_encodePaletteType(palette.type));
  // available color models
  buffer.writeUint16(palette.models.contains(BcfColorModel.xyz) ? 1 : 0);
  buffer.writeUint16(palette.models.contains(BcfColorModel.cmyk) ? 1 : 0);
  buffer.writeUint16(palette.models.contains(BcfColorModel.rgb) ? 1 : 0);
  // preferred color model
  buffer.writeUint16(_encodePreferredModel(palette.preferredModel));
  if (!isV1) {
    // about message extender
    if (descriptionBytes.length > 512) {
      buffer.writeUint16(1);
      for (var i = 512; i < 612; i++) {
        buffer.writeUint8(
          i < descriptionBytes.length ? descriptionBytes[i] : 0,
        );
      }
    } else {
      buffer.writeUint16(0);
    }
    // hifi inks
    buffer.writeUint16(palette.inks.isNotEmpty ? 1 : 0);
    buffer.writeUint16(palette.inks.length);
    buffer.writeUint16(palette.models.contains(BcfColorModel.lab) ? 1 : 0);
    // reserved
    for (var i = 0; i < 24; i++) {
      buffer.writeUint8(0);
    }
    // ink descriptions
    for (final ink in palette.inks) {
      _writeFixedString(buffer, ink.angle, 10);
      _writeFixedString(buffer, ink.frequency, 10);
      buffer.writeUint16(ink.density);
      _writeFixedString(buffer, ink.name, 32);
    }
  }
  // color entries
  for (final color in palette.colors) {
    _writeColor(buffer, color, palette, hasHifiBlock: hasHifiBlock);
  }
  return buffer.toBytes();
}

void _validatePalette(
  BcfPalette palette, {
  required bool isV1,
  required bool hasHifiBlock,
}) {
  if (!BcfPalette.validVersions.contains(palette.version)) {
    throw FormatException(
      'Not a valid Binary Color Format. '
      'Unsupported version "${palette.version}".',
    );
  }
  if (palette.models.isEmpty) {
    throw const FormatException(
      'Not a valid Binary Color Format. No color models found.',
    );
  }
  if (isV1) {
    if (palette.models.contains(BcfColorModel.lab)) {
      throw const FormatException(
        'Lab values require version "ACF 2.1" or "BCF 2.0".',
      );
    }
    if (palette.models.contains(BcfColorModel.hifi)) {
      throw const FormatException(
        'HiFi values require version "ACF 2.1" or "BCF 2.0".',
      );
    }
    if (palette.inks.isNotEmpty) {
      throw const FormatException(
        'Ink descriptions require version "ACF 2.1" or "BCF 2.0".',
      );
    }
    if (_encodeMacRoman(palette.description).length > 512) {
      throw const FormatException(
        'Description exceeds 512 bytes in version "ACF 1.0".',
      );
    }
  }
  if (_encodeMacRoman(palette.description).length > 612) {
    throw const FormatException('Description exceeds 612 bytes.');
  }
  if (palette.models.contains(BcfColorModel.hifi) != hasHifiBlock) {
    throw const FormatException(
      'HiFi values require a Mixed or HiFi palette type.',
    );
  }
  for (final color in palette.colors) {
    for (final value in color.values) {
      if (!palette.models.contains(value.model)) {
        throw FormatException(
          'Color "${color.name}" holds ${value.model} values '
          'missing from the palette models.',
        );
      }
      _validateChannelCount(color.name, value);
    }
  }
}

void _validateChannelCount(String colorName, BcfPaletteColorValue value) {
  if (value.model == BcfColorModel.hifi) {
    if (value.values.length.isOdd) {
      throw FormatException(
        'Color "$colorName" holds an odd number of HiFi values; '
        'expected ink id/value pairs.',
      );
    }
    return;
  }
  const expectedCounts = {
    BcfColorModel.xyz: 3,
    BcfColorModel.cmyk: 4,
    BcfColorModel.rgb: 3,
    BcfColorModel.lab: 3,
  };
  final expected = expectedCounts[value.model]!;
  if (value.values.length != expected) {
    throw FormatException(
      'Color "$colorName" holds ${value.values.length} ${value.model} '
      'values; expected $expected.',
    );
  }
}

void _writeColor(
  ByteDataWriter buffer,
  BcfPaletteColor color,
  BcfPalette palette, {
  required bool hasHifiBlock,
}) {
  // The wire always carries all three base groups; unflagged groups
  // are zero padding.
  final first =
      _valueFor(color, BcfColorModel.xyz) ??
      _valueFor(color, BcfColorModel.lab);
  if (first == null) {
    for (var i = 0; i < 6; i++) {
      buffer.writeUint8(0);
    }
  } else if (first.model == BcfColorModel.lab) {
    _writeInt16Values(buffer, first.values);
  } else {
    _writeUint16Values(buffer, first.values);
  }
  final cmyk = _valueFor(color, BcfColorModel.cmyk);
  if (cmyk == null) {
    for (var i = 0; i < 8; i++) {
      buffer.writeUint8(0);
    }
  } else {
    _writeUint16Values(buffer, cmyk.values);
  }
  final rgb = _valueFor(color, BcfColorModel.rgb);
  if (rgb == null) {
    for (var i = 0; i < 6; i++) {
      buffer.writeUint8(0);
    }
  } else {
    _writeUint16Values(buffer, rgb.values);
  }
  if (hasHifiBlock) {
    final hifi = _valueFor(color, BcfColorModel.hifi);
    if (hifi == null) {
      throw FormatException('Color "${color.name}" is missing HiFi values.');
    }
    final pairCount = hifi.values.length ~/ 2;
    if (pairCount > 8) {
      throw FormatException('Color "${color.name}" exceeds 8 HiFi slots.');
    }
    buffer.writeUint16(pairCount);
    _writeUint16Values(buffer, hifi.values);
    for (var i = pairCount; i < 8; i++) {
      buffer.writeUint16(0); // ink id
      buffer.writeUint16(0); // ink value
    }
  }
  // color type
  buffer.writeUint16(color.type);
  // per-color preferred model
  if (hasHifiBlock) {
    buffer.writeUint16(
      _encodePreferredModel(color.preferredModel ?? palette.preferredModel),
    );
  }
  // color name
  _writeFixedString(buffer, color.name, 32);
}
