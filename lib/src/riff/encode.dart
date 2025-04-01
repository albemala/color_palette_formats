part of 'riff.dart';

List<int> _encode(ResourceInterchangeFileFormat riff) {
  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  writeUtf8String(buffer, _fileSignature);
  // data size
  buffer.writeUint32(
    _dataType.length * 8 + // data type
        32 + // chunk size
        16 + // version
        16 + // colors count
        riff.colors.length * 8 * 4, // colors
  );
  // data type
  writeUtf8String(buffer, _dataType);
  // chunk size
  buffer.writeUint32(
    16 + // version
        16 + // colors count
        riff.colors.length * 8 * 4, // colors
  );
  // version
  buffer.writeUint16(riff.version, Endian.big);
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
