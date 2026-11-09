part of 'bcs.dart';

String _encodeType(BcsPaletteType type) => switch (type) {
  BcsPaletteType.clf => 'clf',
  BcsPaletteType.atl => 'atl',
  BcsPaletteType.rgb => 'rgb',
};

void _validateBilingualField(String field, String label) {
  if (field.contains(':')) {
    throw FormatException(
      'Not a valid $_paletteName. $label "$field" contains ":".',
    );
  }
}

void _writeBytes(ByteDataWriter buffer, List<int> bytes) {
  for (final byte in bytes) {
    buffer.writeUint8(byte);
  }
}

void _writeColor(ByteDataWriter buffer, BcsPaletteColor color) {
  if (color.lab.length != 3) {
    throw FormatException('Color "${color.name}" must carry 3 Lab values.');
  }
  final nameBytes = utf8.encode(color.name);
  if (nameBytes.length > 255) {
    throw FormatException('Color name "${color.name}" exceeds 255 bytes.');
  }
  // color name
  buffer.writeUint8(nameBytes.length);
  _writeBytes(buffer, nameBytes);
  // raw Lab values
  for (final value in color.lab) {
    buffer.writeFloat32(value);
  }
}

List<int> _encode(BcsPalette palette) {
  _validateBilingualField(palette.system, 'Colour-system text');
  if (palette.germanSystem != null) {
    _validateBilingualField(palette.germanSystem!, 'Colour-system text');
  }
  _validateBilingualField(palette.name, 'Palette name');
  if (palette.germanName != null) {
    _validateBilingualField(palette.germanName!, 'Palette name');
  }

  final systemText =
      'English_${palette.system}:'
      'German_${palette.germanSystem ?? palette.system}:';
  final systemBytes = latin1.encode(systemText);
  if (systemBytes.length > 251) {
    throw FormatException(
      'Colour-system block exceeds ${systemBytes.length} bytes.',
    );
  }
  final nameText =
      'English_${palette.name}:German_${palette.germanName ?? palette.name}:';
  final nameBytes = latin1.encode(nameText);
  if (nameBytes.length > 255) {
    throw FormatException('Palette name "${palette.name}" exceeds 255 bytes.');
  }

  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature + header offsets
  buffer.writeUint8(5 + systemBytes.length - 1);
  _writeBytes(buffer, _encodeType(palette.type).codeUnits);
  buffer.writeUint8(5);
  // colour-system block
  _writeBytes(buffer, systemBytes);
  // colors count
  buffer.writeUint16(palette.colors.length);
  // palette name
  buffer.writeUint8(nameBytes.length);
  _writeBytes(buffer, nameBytes);
  // unknown byte
  buffer.writeUint8(BcsPalette.unknownByte);
  // color entries
  for (final color in palette.colors) {
    _writeColor(buffer, color);
  }
  return buffer.toBytes();
}
