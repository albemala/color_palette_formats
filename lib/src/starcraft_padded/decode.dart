part of 'starcraft_padded.dart';

StarCraftPaddedPalette _decode(List<int> bytes) {
  // Raw table of 256 colors x 4 bytes (RGB + padding byte) with no
  // header or footer; the size must match exactly. Padding bytes are
  // skipped without validating their value.
  if (bytes.length != StarCraftPaddedPalette.expectedFileSize) {
    throw FormatException(
      'Not a valid StarCraft Padded Palette file. '
      'Expected ${StarCraftPaddedPalette.expectedFileSize} bytes '
      'but found ${bytes.length}.',
    );
  }

  final buffer = ByteDataReader()..add(bytes);

  final colors = <StarCraftPaddedPaletteColor>[];
  for (var i = 0; i < StarCraftPaddedPalette.colorsCount; i++) {
    final r = buffer.readUint8();
    final g = buffer.readUint8();
    final b = buffer.readUint8();
    buffer.readUint8(); // padding
    colors.add(StarCraftPaddedPaletteColor(red: r, green: g, blue: b));
  }

  return StarCraftPaddedPalette(colors: colors);
}
