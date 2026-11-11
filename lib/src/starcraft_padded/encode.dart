part of 'starcraft_padded.dart';

List<int> _encode(StarCraftPaddedPalette palette) {
  final buffer = ByteDataWriter();
  for (final color in palette.colors) {
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
    buffer.writeUint8(0); // padding
  }
  return buffer.toBytes();
}
