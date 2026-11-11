part of 'bcf.dart';

const _paletteName = 'Binary Color Format';

// MacRoman decoding table for bytes 0x80-0xFF (below that, MacRoman
// matches ASCII).
const _macRomanTable = <int>[
  0x00C4, 0x00C5, 0x00C7, 0x00C9,
  0x00D1, 0x00D6, 0x00DC, 0x00E1,
  0x00E0, 0x00E2, 0x00E4, 0x00E3,
  0x00E5, 0x00E7, 0x00E9, 0x00E8, // 0x80-0x8F
  0x00EA, 0x00EB, 0x00ED, 0x00EC,
  0x00EE, 0x00EF, 0x00F1, 0x00F3,
  0x00F2, 0x00F4, 0x00F6, 0x00F5,
  0x00FA, 0x00F9, 0x00FB, 0x00FC, // 0x90-0x9F
  0x2020, 0x00B0, 0x00A2, 0x00A3,
  0x00A7, 0x2022, 0x00B6, 0x00DF,
  0x00AE, 0x00A9, 0x2122, 0x00B4,
  0x00A8, 0x2260, 0x00C6, 0x00D8, // 0xA0-0xAF
  0x221E, 0x00B1, 0x2264, 0x2265,
  0x00A5, 0x00B5, 0x2202, 0x2211,
  0x220F, 0x03C0, 0x222B, 0x00AA,
  0x00BA, 0x03A9, 0x00E6, 0x00F8, // 0xB0-0xBF
  0x00BF, 0x00A1, 0x00AC, 0x221A,
  0x0192, 0x2248, 0x2206, 0x00AB,
  0x00BB, 0x2026, 0x00A0, 0x00C0,
  0x00C3, 0x00D5, 0x0152, 0x0153, // 0xC0-0xCF
  0x2013, 0x2014, 0x201C, 0x201D,
  0x2018, 0x2019, 0x00F7, 0x25CA,
  0x00FF, 0x0178, 0x2044, 0x00A4,
  0x2039, 0x203A, 0xFB01, 0xFB02, // 0xD0-0xDF
  0x2021, 0x00B7, 0x201A, 0x201E,
  0x2030, 0x00C2, 0x00CA, 0x00C1,
  0x00CB, 0x00C8, 0x00CD, 0x00CE,
  0x00CF, 0x00CC, 0x00D3, 0x00D4, // 0xE0-0xEF
  0xF8FF, 0x00D2, 0x00DA, 0x00DB,
  0x00D9, 0x0131, 0x02C6, 0x02DC,
  0x00AF, 0x02D8, 0x02D9, 0x02DA,
  0x00B8, 0x02DD, 0x02DB, 0x02C7, // 0xF0-0xFF
];

String _decodeMacRoman(List<int> bytes) {
  final text = StringBuffer();
  for (final byte in bytes) {
    text.writeCharCode(byte < 0x80 ? byte : _macRomanTable[byte - 0x80]);
  }
  return text.toString();
}

String _readFixedString(ByteDataReader buffer, int length) {
  final bytes = buffer.read(length).toList();
  final end = bytes.indexOf(0);
  return _decodeMacRoman(end < 0 ? bytes : bytes.sublist(0, end));
}

List<int> _readUint16Values(ByteDataReader buffer, int count) {
  return [for (var i = 0; i < count; i++) buffer.readUint16()];
}

List<int> _readInt16Values(ByteDataReader buffer, int count) {
  return [for (var i = 0; i < count; i++) buffer.readInt16()];
}

String _parseAffix(String raw, {required bool trailing}) {
  if (raw.isEmpty) return raw;
  return trailing ? '$raw ' : ' $raw';
}

BcfNamesFormat _parseNamesFormat(int value) => switch (value) {
  1 => BcfNamesFormat.full,
  2 => BcfNamesFormat.partial,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported names format "$value".',
    ),
};

BcfPaletteType _parsePaletteType(int value) => switch (value) {
  1 => BcfPaletteType.spot,
  2 => BcfPaletteType.process,
  8 => BcfPaletteType.mixed,
  16 => BcfPaletteType.hifi,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported palette type "$value".',
    ),
};

String _parsePreferredModel(int value) => switch (value) {
  1 => 'RGB',
  2 => 'CMYK',
  8 => 'hifi',
  16 => 'Mixed',
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported preferred model "$value".',
    ),
};

BcfPalette _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  try {
    return _decodeBody(buffer);
  } catch (e) {
    // Reads past the end of truncated input surface as RangeError or
    // StateError from the byte buffer; report them as malformed files
    // instead. Other errors (FormatException) pass through untouched.
    if (e is RangeError || e is StateError) {
      throw const FormatException(
        'Not a valid $_paletteName: truncated input.',
      );
    }
    rethrow;
  }
}

BcfPalette _decodeBody(ByteDataReader buffer) {
  final version = _readFixedString(buffer, 8);
  if (!BcfPalette.validVersions.contains(version)) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected version "${BcfPalette.validVersions.join('" or "')}" '
      'but found "$version".',
    );
  }

  final name = _readFixedString(buffer, 32);
  final libraryVersion = _readFixedString(buffer, 8);
  final copyright = _readFixedString(buffer, 32);
  final description = _readFixedString(buffer, 512);
  final namesFormat = _parseNamesFormat(buffer.readUint16());
  final rows = buffer.readUint16();
  final columns = buffer.readUint16();
  final entryCount = buffer.readUint16();
  final prefix = _parseAffix(_readFixedString(buffer, 12), trailing: true);
  final suffix = _parseAffix(_readFixedString(buffer, 4), trailing: false);
  final type = _parsePaletteType(buffer.readUint16());
  final hasXyz = buffer.readUint16() == 1;
  final hasCmyk = buffer.readUint16() == 1;
  final hasRgb = buffer.readUint16() == 1;
  final preferredModel = _parsePreferredModel(buffer.readUint16());

  var fullDescription = description;
  final inks = <BcfHiFiInk>[];
  var labAvailable = false;
  if (version != BcfPalette.version10) {
    final extender = buffer.readUint16();
    if (extender == 1) {
      fullDescription += _readFixedString(buffer, 100);
    }
    final hasInks = buffer.readUint16() == 1;
    final inkCount = buffer.readUint16();
    labAvailable = buffer.readUint16() == 1;
    buffer.read(24); // reserved
    if (hasInks) {
      for (var i = 0; i < inkCount; i++) {
        inks.add(
          BcfHiFiInk(
            angle: _readFixedString(buffer, 10),
            frequency: _readFixedString(buffer, 10),
            density: buffer.readUint16(),
            name: _readFixedString(buffer, 32),
          ),
        );
      }
    }
  }

  final hasHifiBlock =
      version != BcfPalette.version10 &&
      (type == BcfPaletteType.mixed || type == BcfPaletteType.hifi);
  final BcfColorModel? firstModel;
  if (hasXyz) {
    firstModel = BcfColorModel.xyz;
  } else if (labAvailable) {
    firstModel = BcfColorModel.lab;
  } else {
    firstModel = null;
  }
  final models = <BcfColorModel>[
    if (firstModel != null) firstModel,
    if (hasCmyk) BcfColorModel.cmyk,
    if (hasRgb) BcfColorModel.rgb,
    if (hasHifiBlock) BcfColorModel.hifi,
  ];
  if (models.isEmpty) {
    throw const FormatException(
      'Not a valid Binary Color Format. No color models found.',
    );
  }

  final colors = <BcfPaletteColor>[];
  for (var i = 0; i < entryCount; i++) {
    colors.add(_readColor(buffer, firstModel, hasCmyk, hasRgb, hasHifiBlock));
  }

  return BcfPalette(
    version: version,
    name: name,
    libraryVersion: libraryVersion,
    copyright: copyright,
    description: fullDescription,
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

BcfPaletteColor _readColor(
  ByteDataReader buffer,
  BcfColorModel? firstModel,
  bool hasCmyk,
  bool hasRgb,
  bool hasHifiBlock,
) {
  final values = <BcfPaletteColorValue>[];
  // The wire always carries all three base groups; unflagged groups
  // are padding.
  if (firstModel == BcfColorModel.xyz) {
    values.add(
      BcfPaletteColorValue(
        model: BcfColorModel.xyz,
        values: _readUint16Values(buffer, 3),
      ),
    );
  } else if (firstModel == BcfColorModel.lab) {
    values.add(
      BcfPaletteColorValue(
        model: BcfColorModel.lab,
        values: _readInt16Values(buffer, 3),
      ),
    );
  } else {
    buffer.read(6);
  }
  if (hasCmyk) {
    values.add(
      BcfPaletteColorValue(
        model: BcfColorModel.cmyk,
        values: _readUint16Values(buffer, 4),
      ),
    );
  } else {
    buffer.read(8);
  }
  if (hasRgb) {
    values.add(
      BcfPaletteColorValue(
        model: BcfColorModel.rgb,
        values: _readUint16Values(buffer, 3),
      ),
    );
  } else {
    buffer.read(6);
  }
  if (hasHifiBlock) {
    final pairCount = buffer.readUint16();
    if (pairCount > 8) {
      throw FormatException(
        'Not a valid $_paletteName. '
        'HiFi ink count "$pairCount" exceeds 8 slots.',
      );
    }
    final pairs = <int>[];
    for (var i = 0; i < pairCount; i++) {
      pairs.add(buffer.readUint16()); // ink id
      pairs.add(buffer.readUint16()); // ink value
    }
    buffer.read((8 - pairCount) * 4); // unused slots
    values.add(BcfPaletteColorValue(model: BcfColorModel.hifi, values: pairs));
  }

  final colorType = buffer.readUint16();
  String? colorPreferredModel;
  if (hasHifiBlock) {
    colorPreferredModel = _parsePreferredModel(buffer.readUint16());
  }
  final colorName = _readFixedString(buffer, 32);

  return BcfPaletteColor(
    name: colorName,
    values: values,
    type: colorType,
    preferredModel: colorPreferredModel,
  );
}
