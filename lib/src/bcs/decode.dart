part of 'bcs.dart';

const _paletteName = 'RAL BCS';

BcsPaletteType _parseType(String value) => switch (value) {
  'clf' => BcsPaletteType.clf,
  'atl' => BcsPaletteType.atl,
  'rgb' => BcsPaletteType.rgb,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported palette type "$value".',
    ),
};

/// Splits an `English_<en>:German_<de>:` block, stripping the
/// language prefixes. Returns `(text, null)` when the block has
/// no language split (tolerates the CIE workaround files noted
/// in the SwatchBooker reader).
(String, String?) _parseBilingual(
  String text,
  String englishPrefix,
  String germanPrefix,
) {
  final parts = text.split(':');
  if (parts.length < 2) return (text, null);
  var english = parts[0];
  if (english.startsWith(englishPrefix)) {
    english = english.substring(englishPrefix.length);
  }
  var german = parts[1];
  if (german.startsWith(germanPrefix)) {
    german = german.substring(germanPrefix.length);
  }
  if (german == english) return (english, null);
  return (english, german);
}

String _decodeColorName(List<int> bytes) {
  try {
    return utf8.decode(bytes);
  } on FormatException {
    return latin1.decode(bytes);
  }
}

BcsPalette _decode(List<int> bytes) {
  if (bytes.length < 5) {
    throw const FormatException(
      'Not a valid $_paletteName. File is shorter than 5 bytes.',
    );
  }
  final buffer = ByteDataReader(endian: Endian.little)..add(bytes);
  // file signature + header offsets
  final offset1 = buffer.readUint8();
  final sig = String.fromCharCodes(buffer.read(3).toList()).toLowerCase();
  final type = _parseType(sig);
  final offset2 = buffer.readUint8();
  if (offset2 != 5) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid header offset "$offset2".',
    );
  }
  if (offset1 < offset2 || offset1 + 1 > bytes.length) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid header offset "$offset1".',
    );
  }
  // colour-system block
  final systemBytes = buffer.read(offset1 - offset2 + 1).toList();
  final (system, germanSystem) = _parseBilingual(
    latin1.decode(systemBytes),
    'English_',
    'German_',
  );
  // colors count
  final colorCount = buffer.readUint16();
  // palette name
  final nameLength = buffer.readUint8();
  final nameBytes = buffer.read(nameLength).toList();
  final (name, germanName) = _parseBilingual(
    latin1.decode(nameBytes),
    'English_',
    'German_',
  );
  // unknown byte
  final unknown = buffer.readUint8();
  if (unknown != BcsPalette.unknownByte) {
    throw FormatException(
      'Not a valid $_paletteName. Unexpected header byte "$unknown".',
    );
  }
  // color entries
  final colors = <BcsPaletteColor>[];
  for (var i = 0; i < colorCount; i++) {
    colors.add(_readColor(buffer));
  }
  return BcsPalette(
    type: type,
    system: system,
    germanSystem: germanSystem,
    name: name,
    germanName: germanName,
    colors: colors,
  );
}

BcsPaletteColor _readColor(ByteDataReader buffer) {
  final nameLength = buffer.readUint8();
  final name = _decodeColorName(buffer.read(nameLength).toList());
  final lab = <double>[
    buffer.readFloat32(),
    buffer.readFloat32(),
    buffer.readFloat32(),
  ];
  return BcsPaletteColor(name: name, lab: lab);
}
