part of 'aco.dart';

List<int> _encode(AdobeColorSwatch swatch) {
  final buffer = ByteDataWriter();
  // version
  buffer.writeUint16(AdobeColorSwatch.version);
  // colors length
  buffer.writeUint16(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
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
  return buffer.toBytes();
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
  buffer.writeUint16((100 - values[0] / 100 * _maxUInt16).round()); // w
  buffer.writeUint16((100 - values[1] / 100 * _maxUInt16).round()); // x
  buffer.writeUint16((100 - values[2] / 100 * _maxUInt16).round()); // y
  buffer.writeUint16((100 - values[3] / 100 * _maxUInt16).round()); // z
}

void _writeLabColor(ByteDataWriter buffer, List<int> values) {
  buffer.writeUint16(values[0] * 100); // w
  buffer.writeUint16(values[1] * 100); // x
  buffer.writeUint16(values[2] * 100); // y
  buffer.writeUint16(0); // z
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
