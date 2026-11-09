part of 'aco.dart';

List<int> _encode(AdobeColorSwatch swatch) {
  final buffer = ByteDataWriter();
  // version 1 section
  buffer.writeUint16(AdobeColorSwatch.version1);
  // colors length
  buffer.writeUint16(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
    _writeColor(buffer, color);
  }
  // version 2 section with names, only when at least one name exists.
  // Photoshop writes v1 followed by v2; standalone v1 files stay v1-only
  // so they re-encode byte-for-byte.
  if (swatch.colors.any((color) => color.name != null)) {
    buffer.writeUint16(AdobeColorSwatch.version2);
    buffer.writeUint16(swatch.colors.length);
    for (final color in swatch.colors) {
      _writeColor(buffer, color);
      _writeUnicodeString(buffer, color.name ?? '');
    }
  }
  return buffer.toBytes();
}

void _writeColor(ByteDataWriter buffer, AdobeColorSwatchColor color) {
  // color space
  buffer.writeUint16(color.colorSpace.value);
  // color values
  switch (color.colorSpace) {
    case AdobeColorSwatchColorSpace.rgb:
      _writeRgbColor(buffer, color.values);
    case AdobeColorSwatchColorSpace.hsb:
      _writeHsbColor(buffer, color.values);
    case AdobeColorSwatchColorSpace.cmyk:
      _writeCmykColor(buffer, color.values);
    case AdobeColorSwatchColorSpace.lab:
      _writeLabColor(buffer, color.values);
    case AdobeColorSwatchColorSpace.grayscale:
      _writeGrayscaleColor(buffer, color.values);
    case AdobeColorSwatchColorSpace.wideCmyk:
      _writeWideCmykColor(buffer, color.values);
  }
}

/// Writes a version 2 color name: 32-bit length (UTF-16 code units,
/// including the null terminator) followed by UTF-16BE + null.
void _writeUnicodeString(ByteDataWriter buffer, String name) {
  buffer.writeUint32(name.length + 1);
  for (var i = 0; i < name.length; i++) {
    buffer.writeUint16(name.codeUnitAt(i));
  }
  buffer.writeUint16(0);
}

void _writeRgbColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16((values[0] / 255 * _maxUInt16).round()); // w
  buffer.writeUint16((values[1] / 255 * _maxUInt16).round()); // x
  buffer.writeUint16((values[2] / 255 * _maxUInt16).round()); // y
  buffer.writeUint16(0); // z
}

void _writeHsbColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16((values[0] / 360 * _maxUInt16).round()); // w
  buffer.writeUint16((values[1] / 100 * _maxUInt16).round()); // x
  buffer.writeUint16((values[2] / 100 * _maxUInt16).round()); // y
  buffer.writeUint16(0); // z
}

void _writeCmykColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16(((100 - values[0]) / 100 * _maxUInt16).round()); // w
  buffer.writeUint16(((100 - values[1]) / 100 * _maxUInt16).round()); // x
  buffer.writeUint16(((100 - values[2]) / 100 * _maxUInt16).round()); // y
  buffer.writeUint16(((100 - values[3]) / 100 * _maxUInt16).round()); // z
}

void _writeLabColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16(values[0] * 100); // w
  buffer.writeUint16(_signedToUInt16(values[1] * 100)); // x
  buffer.writeUint16(_signedToUInt16(values[2] * 100)); // y
  buffer.writeUint16(0); // z
}

/// Maps a signed 16-bit value to its unsigned representation, inverse of
/// the `_maxUInt16` offset applied in `_readLabColor` for values > 12700.
int _signedToUInt16(int value) {
  if (value < 0) {
    return value + _maxUInt16;
  }
  return value;
}

void _writeGrayscaleColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16((values[0] / 100 * 10000).round()); // w
  buffer.writeUint16(0); // x
  buffer.writeUint16(0); // y
  buffer.writeUint16(0); // z
}

void _writeWideCmykColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16((values[0] / 100 * 10000).round()); // w
  buffer.writeUint16((values[1] / 100 * 10000).round()); // x
  buffer.writeUint16((values[2] / 100 * 10000).round()); // y
  buffer.writeUint16((values[3] / 100 * 10000).round()); // z
}
