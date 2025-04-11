part of 'ase.dart';

List<int> _encode(AdobeSwatchExchange swatch) {
  final buffer = ByteDataWriter();
  // file signature
  writeUtf8String(buffer, AdobeSwatchExchange.validFileSignature);
  // version
  AdobeSwatchExchange.validVersion.split('.').forEach((part) {
    buffer.writeUint16(int.parse(part));
  });
  // colors length
  buffer.writeInt32(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
    // start color block
    buffer.writeInt16(_blockTypeColor);
    // use separate buffer, so we know the length
    final colorBuffer = ByteDataWriter();
    // color name length including terminator
    colorBuffer.writeInt16(color.name.length + 1);
    // color name
    writeUtf16String(colorBuffer, color.name, includeTerminator: true);
    // color model
    writeUtf8String(colorBuffer, color.model.value);
    // color values
    switch (color.model) {
      case AdobeSwatchExchangeColorModel.cmyk:
        colorBuffer.writeFloat32(color.values[0]); // cyan
        colorBuffer.writeFloat32(color.values[1]); // magenta
        colorBuffer.writeFloat32(color.values[2]); // yellow
        colorBuffer.writeFloat32(color.values[3]); // key
      case AdobeSwatchExchangeColorModel.rgb:
        colorBuffer.writeFloat32(color.values[0]); // red
        colorBuffer.writeFloat32(color.values[1]); // green
        colorBuffer.writeFloat32(color.values[2]); // blue
      case AdobeSwatchExchangeColorModel.gray:
        colorBuffer.writeFloat32(color.values[0]); // gray
    }
    // color type
    colorBuffer.writeInt16(color.type.value);
    // block length
    buffer.writeInt32(colorBuffer.bufferLength);
    // block data
    buffer.write(colorBuffer.toBytes());
  }
  return buffer.toBytes();
}
