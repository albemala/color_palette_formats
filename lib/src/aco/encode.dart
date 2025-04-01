part of 'aco.dart';

List<int> _encode(AdobeColorSwatch swatch) {
  final buffer = ByteDataWriter();
  // version
  buffer.writeUint16(swatch.version);
  // colors length
  buffer.writeUint16(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
    // color space
    final colorSpace = _writeColorSpace[color.colorSpace];
    if (colorSpace == null) {
      throw Exception('Unsupported color space: ${color.colorSpace}');
    }
    buffer.writeUint16(colorSpace);
    // color values
    switch (color.colorSpace) {
      case AdobeColorSwatchColorSpace.rgb:
        buffer.writeUint16((color.values[0] / 255 * _maxUInt16).round()); // w
        buffer.writeUint16((color.values[1] / 255 * _maxUInt16).round()); // x
        buffer.writeUint16((color.values[2] / 255 * _maxUInt16).round()); // y
        buffer.writeUint16(0); // z
      case AdobeColorSwatchColorSpace.hsb:
        buffer.writeUint16((color.values[0] / 360 * _maxUInt16).round()); // w
        buffer.writeUint16((color.values[1] / 100 * _maxUInt16).round()); // x
        buffer.writeUint16((color.values[2] / 100 * _maxUInt16).round()); // y
        buffer.writeUint16(0); // z
      case AdobeColorSwatchColorSpace.cmyk:
        buffer.writeUint16(
          (100 - color.values[0] / 100 * _maxUInt16).round(),
        ); // w
        buffer.writeUint16(
          (100 - color.values[1] / 100 * _maxUInt16).round(),
        ); // x
        buffer.writeUint16(
          (100 - color.values[2] / 100 * _maxUInt16).round(),
        ); // y
        buffer.writeUint16(
          (100 - color.values[3] / 100 * _maxUInt16).round(),
        ); // z
      case AdobeColorSwatchColorSpace.lab:
        buffer.writeUint16(color.values[0] * 100); // w
        buffer.writeUint16(color.values[1] * 100); // x
        buffer.writeUint16(color.values[2] * 100); // y
        buffer.writeUint16(0); // z
      case AdobeColorSwatchColorSpace.grayscale:
        buffer.writeUint16((color.values[0] / 100 * 10000).round()); // w
        buffer.writeUint16(0); // x
        buffer.writeUint16(0); // y
        buffer.writeUint16(0); // z
      case AdobeColorSwatchColorSpace.wideCmyk:
        buffer.writeUint16((color.values[0] / 100 * 10000).round()); // w
        buffer.writeUint16((color.values[1] / 100 * 10000).round()); // x
        buffer.writeUint16((color.values[2] / 100 * 10000).round()); // y
        buffer.writeUint16((color.values[3] / 100 * 10000).round()); // z
    }
  }
  return buffer.toBytes();
}
