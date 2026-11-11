part of 'colorschemer.dart';

void _validateChannel(String label, int value) {
  if (value < 0 || value > 255) {
    throw FormatException(
      'Not a valid $_paletteName. $label "$value" out of range 0..255.',
    );
  }
}

void _validateWireBytes(String label, String value) {
  if (value.codeUnits.any((byte) => byte > 0xFF)) {
    throw FormatException(
      'Not a valid $_paletteName. $label "$value" '
      'contains non-Latin1 characters.',
    );
  }
}

void _validatePalette(ColorSchemerPalette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException because the byte writer silently masks
  // out-of-range values in release.
  if (palette.version != ColorSchemerPalette.validVersion) {
    throw FormatException(
      'Not a valid $_paletteName. Unsupported version "${palette.version}".',
    );
  }
  if (palette.colors.length > 0xFFFF) {
    throw const FormatException(
      'Not a valid $_paletteName. Too many colors to write.',
    );
  }
  if (palette.baseColor.length != 3) {
    throw const FormatException(
      'Not a valid $_paletteName. Base color must have 3 values.',
    );
  }
  for (final channel in palette.baseColor) {
    _validateChannel('base color channel', channel);
  }
  for (final color in palette.colors) {
    _validateChannel('red', color.red);
    _validateChannel('green', color.green);
    _validateChannel('blue', color.blue);
    _validateWireBytes('color name', color.name);
    if (color.hexValue.length != 6) {
      throw FormatException(
        'Not a valid $_paletteName. '
        'Hex value "${color.hexValue}" must be 6 characters.',
      );
    }
    _validateWireBytes('hex value', color.hexValue);
  }
}

List<int> _encode(ColorSchemerPalette palette) {
  _validatePalette(palette);

  // Calculate total size
  var totalSize = 8; // Header: 2 + 2 + 3 + 1
  for (final color in palette.colors) {
    totalSize += 3; // RGB
    totalSize += 1; // padding after RGB
    totalSize += 4; // name length
    totalSize += color.name.length; // name (no null terminator)
    totalSize += 3; // RGB repeated
    totalSize += 1; // hex length
    totalSize += 6; // hex value
    totalSize += 1; // developed flag
  }

  final byteData = ByteData(totalSize);
  var offset = 0;

  // Write header (little-endian)
  byteData.setUint16(offset, palette.version, Endian.little);
  offset += 2;
  byteData.setUint16(offset, palette.colors.length, Endian.little);
  offset += 2;

  // Base color (3 bytes RGB)
  byteData.setUint8(offset, palette.baseColor[0]);
  offset += 1;
  byteData.setUint8(offset, palette.baseColor[1]);
  offset += 1;
  byteData.setUint8(offset, palette.baseColor[2]);
  offset += 1;

  // 1 byte padding
  byteData.setUint8(offset, 0);
  offset += 1;

  // Write color entries
  for (final color in palette.colors) {
    offset = _encodeColor(byteData, offset, color);
  }

  return byteData.buffer.asUint8List();
}

int _encodeColor(ByteData byteData, int offset, ColorSchemerColor color) {
  var currentOffset = offset;

  // Color values: 3*uint8 (RGB)
  byteData.setUint8(currentOffset, color.red);
  currentOffset += 1;
  byteData.setUint8(currentOffset, color.green);
  currentOffset += 1;
  byteData.setUint8(currentOffset, color.blue);
  currentOffset += 1;

  // 1 byte padding after RGB
  byteData.setUint8(currentOffset, 0);
  currentOffset += 1;

  // Color name: string of length (int32 little-endian) characters
  final nameBytes = color.name.codeUnits;
  byteData.setInt32(currentOffset, nameBytes.length, Endian.little);
  currentOffset += 4;

  for (var i = 0; i < nameBytes.length; i++) {
    byteData.setUint8(currentOffset + i, nameBytes[i]);
  }
  currentOffset += nameBytes.length;

  // RGB values repeated (3 bytes) - same as the color values above
  byteData.setUint8(currentOffset, color.red);
  currentOffset += 1;
  byteData.setUint8(currentOffset, color.green);
  currentOffset += 1;
  byteData.setUint8(currentOffset, color.blue);
  currentOffset += 1;

  // Hex string length (1 byte) - should be 6
  byteData.setUint8(currentOffset, 6);
  currentOffset += 1;

  // Hex color value: 6*char string
  for (var i = 0; i < 6; i++) {
    byteData.setUint8(currentOffset + i, color.hexValue.codeUnitAt(i));
  }
  currentOffset += 6;

  // Developed: int8 (1 if that color is developed)
  byteData.setUint8(currentOffset, color.developed ? 1 : 0);
  // ignore: join_return_with_assignment
  currentOffset += 1;

  return currentOffset;
}
