part of 'cpl.dart';

(int, int) _encodeVersion(CplVersion version) => switch (version) {
  CplVersion.ccbc => (0xCC, 0xBC),
  CplVersion.ccdc => (0xCC, 0xDC),
  CplVersion.cdbc => (0xCD, 0xBC),
  CplVersion.cddc => (0xCD, 0xDC),
  CplVersion.dddc => (0xDD, 0xDC),
  CplVersion.cddd => (0xCD, 0xDD),
  CplVersion.dcdc => (0xDC, 0xDC),
};

void _writeName(ByteDataWriter buffer, String name, bool singleByte) {
  if (name.length > 255) {
    throw FormatException('Palette name "$name" exceeds 255 characters.');
  }
  buffer.writeUint8(name.length);
  if (singleByte) {
    for (var i = 0; i < name.length; i++) {
      final code = name.codeUnitAt(i);
      if (code > 255) {
        throw FormatException(
          'Palette name "$name" is not encodable as single-byte.',
        );
      }
      buffer.writeUint8(code);
    }
  } else {
    for (var i = 0; i < name.length; i++) {
      buffer.writeUint16(name.codeUnitAt(i));
    }
  }
}

void _writeColor(
  ByteDataWriter buffer,
  CplPaletteColor color, {
  required bool singleByte,
  required bool long,
  required bool positioned,
}) {
  if ((color.id != null) != long) {
    throw FormatException(
      'Color "${color.name}" must ${long ? 'have' : 'not have'} an id.',
    );
  }
  if ((color.secondValues != null) != long) {
    throw FormatException(
      'Color "${color.name}" must ${long ? 'have' : 'not have'} '
      'second values.',
    );
  }
  if (color.values.length != 8 || (long && color.secondValues!.length != 8)) {
    throw FormatException(
      'Color "${color.name}" must carry 8 raw value bytes.',
    );
  }
  if ((color.row != null) != positioned ||
      (color.column != null) != positioned ||
      (color.unknown != null) != positioned) {
    throw FormatException(
      'Color "${color.name}" must ${positioned ? 'have' : 'not have'} '
      'a position.',
    );
  }

  if (long) buffer.writeUint32(color.id!);
  buffer.writeUint16(color.model);
  buffer.writeUint16(color.type);
  for (final byte in color.values) {
    buffer.writeUint8(byte);
  }
  if (long) {
    buffer.writeUint16(color.secondModel!);
    buffer.writeUint16(color.secondType!);
    for (final byte in color.secondValues!) {
      buffer.writeUint8(byte);
    }
  }
  _writeName(buffer, color.name, singleByte);
  if (positioned) {
    buffer.writeUint32(color.row!);
    buffer.writeUint32(color.column!);
    buffer.writeUint32(color.unknown!);
  }
}

void _requireBare(CplPalette palette, String family) {
  if (palette.name.isNotEmpty ||
      palette.type != 0 ||
      palette.specialInks.isNotEmpty ||
      palette.uiColorModels.isNotEmpty ||
      palette.displayColumns != null) {
    throw FormatException(
      'Version ${palette.version} ($family) stores no palette metadata.',
    );
  }
}

List<int> _encode(CplPalette palette) {
  return switch (palette.version) {
    CplVersion.dcdc => _encodeCustom(palette),
    CplVersion.ccbc || CplVersion.ccdc => _encodeSimple(palette),
    _ => _encodeHeadered(palette),
  };
}

List<int> _encodeSimple(CplPalette palette) {
  _requireBare(palette, '5-8');
  final singleByte = palette.version == CplVersion.ccdc;
  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  final (first, second) = _encodeVersion(palette.version);
  buffer.writeUint8(first);
  buffer.writeUint8(second);
  // colors count
  buffer.writeUint16(palette.colors.length);
  // color entries
  for (final color in palette.colors) {
    _writeColor(
      buffer,
      color,
      singleByte: singleByte,
      long: false,
      positioned: false,
    );
  }
  return buffer.toBytes();
}

List<int> _encodeCustom(CplPalette palette) {
  if (palette.type != 0 ||
      palette.specialInks.isNotEmpty ||
      palette.uiColorModels.isNotEmpty ||
      palette.displayColumns != null) {
    throw FormatException(
      'Version ${palette.version} (custom) stores no palette type '
      'or UI metadata.',
    );
  }
  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  final (first, second) = _encodeVersion(palette.version);
  buffer.writeUint8(first);
  buffer.writeUint8(second);
  // palette name
  _writeName(buffer, palette.name, true);
  // colors count
  buffer.writeUint16(palette.colors.length);
  // color entries
  for (final color in palette.colors) {
    _writeColor(
      buffer,
      color,
      singleByte: true,
      long: false,
      positioned: false,
    );
  }
  return buffer.toBytes();
}

List<int> _encodeHeadered(CplPalette palette) {
  if (palette.uiColorModels.isNotEmpty && palette.uiColorModels.length != 2) {
    throw const FormatException('UI color models must have 2 entries.');
  }
  final hasLayout =
      palette.displayColumns != null ||
      palette.displayRows != null ||
      palette.totalColumns != null ||
      palette.totalRows != null;
  if (hasLayout &&
      (palette.displayColumns == null ||
          palette.displayRows == null ||
          palette.totalColumns == null ||
          palette.totalRows == null)) {
    throw const FormatException('UI layout columns and rows must all be set.');
  }

  final singleByte = _usesSingleByteNames(palette.version, palette.type);
  final long = _usesLongEntries(palette.version, palette.type);
  final positioned = palette.version == CplVersion.cddd;

  // data blocks
  final nameBlock = ByteDataWriter(endian: Endian.little);
  // palette name (single-byte only for cddc)
  _writeName(nameBlock, palette.name, palette.version == CplVersion.cddc);
  final typeBlock = ByteDataWriter(endian: Endian.little);
  // palette type
  typeBlock.writeUint16(palette.type);
  final colorsBlock = ByteDataWriter(endian: Endian.little);
  // colors count
  colorsBlock.writeUint16(palette.colors.length);
  // color entries
  for (final color in palette.colors) {
    _writeColor(
      colorsBlock,
      color,
      singleByte: singleByte,
      long: long,
      positioned: positioned,
    );
  }
  final blocks = <int, List<int>>{
    0: nameBlock.toBytes(),
    1: typeBlock.toBytes(),
    2: colorsBlock.toBytes(),
  };
  if (palette.specialInks.isNotEmpty) {
    final inksBlock = ByteDataWriter(endian: Endian.little);
    // custom inks count + positions
    inksBlock.writeUint16(palette.specialInks.length);
    for (final ink in palette.specialInks) {
      inksBlock.writeUint16(ink);
    }
    blocks[3] = inksBlock.toBytes();
  }
  if (palette.uiColorModels.isNotEmpty) {
    blocks[4] = List.of(palette.uiColorModels);
  }
  if (hasLayout) {
    final layoutBlock = ByteDataWriter(endian: Endian.little);
    // displayed + total columns and rows
    layoutBlock.writeUint16(palette.displayColumns!);
    layoutBlock.writeUint16(palette.displayRows!);
    layoutBlock.writeUint16(palette.totalColumns!);
    layoutBlock.writeUint16(palette.totalRows!);
    blocks[5] = layoutBlock.toBytes();
  }

  // header table with absolute offsets (ascending id order)
  final ids = blocks.keys.toList()..sort();
  var offset = 2 + 4 + ids.length * 8;
  final offsets = <int, int>{};
  for (final id in ids) {
    offsets[id] = offset;
    offset += blocks[id]!.length;
  }

  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  final (first, second) = _encodeVersion(palette.version);
  buffer.writeUint8(first);
  buffer.writeUint8(second);
  // header blocks count
  buffer.writeUint32(ids.length);
  // header table
  for (final id in ids) {
    buffer.writeUint32(id);
    buffer.writeUint32(offsets[id]!);
  }
  // data blocks
  for (final id in ids) {
    for (final byte in blocks[id]!) {
      buffer.writeUint8(byte);
    }
  }
  return buffer.toBytes();
}
