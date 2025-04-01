part of 'act.dart';

List<int> _encode(AdobeColorTable colorTable) {
  final buffer = ByteDataWriter();
  for (final color in colorTable.colors) {
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
  }
  return buffer.toBytes();
}
