part of 'starcraft.dart';

StarCraftPalette _decode(List<int> bytes) {
  // Raw table of 256 colors x 3 bytes RGB with no header or footer;
  // the size must match exactly.
  if (bytes.length != StarCraftPalette.expectedFileSize) {
    throw FormatException(
      'Not a valid StarCraft Palette file. '
      'Expected ${StarCraftPalette.expectedFileSize} bytes '
      'but found ${bytes.length}.',
    );
  }

  final buffer = ByteDataReader()..add(bytes);

  final colors = <StarCraftPaletteColor>[];
  for (var i = 0; i < StarCraftPalette.colorsCount; i++) {
    final r = buffer.readUint8();
    final g = buffer.readUint8();
    final b = buffer.readUint8();
    colors.add(StarCraftPaletteColor(red: r, green: g, blue: b));
  }

  return StarCraftPalette(colors: colors);
}
