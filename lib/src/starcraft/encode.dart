part of 'starcraft.dart';

List<int> _encode(StarCraftPalette palette) {
  final buffer = ByteDataWriter();
  for (final color in palette.colors) {
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
  }
  return buffer.toBytes();
}
