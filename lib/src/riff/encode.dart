part of 'riff.dart';

List<int> _encode(ResourceInterchangeFileFormat riff) {
  const paletteName = 'Resource Interchange File Format';
  for (final color in riff.colors) {
    // The model constructor asserts these ranges in debug builds; enforce
    // them here with FormatException for release safety.
    validateIntRange(paletteName, 'red', color.red, 255);
    validateIntRange(paletteName, 'green', color.green, 255);
    validateIntRange(paletteName, 'blue', color.blue, 255);
  }
  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  writeUtf8String(buffer, ResourceInterchangeFileFormat.validFileSignature);
  // data size: everything after this field (file length - 8)
  buffer.writeUint32(16 + riff.colors.length * 4);
  // data type
  writeUtf8String(buffer, _dataType);
  // chunk size: everything after this field (version + count + colors)
  buffer.writeUint32(4 + riff.colors.length * 4);
  // version
  buffer.writeUint16(ResourceInterchangeFileFormat.validVersion, Endian.big);
  // colors count
  buffer.writeUint16(riff.colors.length);
  // colors
  for (var i = 0; i < riff.colors.length; i++) {
    final color = riff.colors[i];
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
    // flags
    buffer.writeUint8(0);
  }
  return buffer.toBytes();
}
