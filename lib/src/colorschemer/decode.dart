part of 'colorschemer.dart';

ColorSchemerPalette _decode(List<int> bytes) {
  // Create a ByteData view with little-endian byte order
  final byteData = ByteData.sublistView(Uint8List.fromList(bytes));
  var offset = 0;

  // Read header (little-endian)
  final version = byteData.getUint16(offset, Endian.little);
  offset += 2;
  final colorCount = byteData.getUint16(offset, Endian.little);
  offset += 2;

  // Base color (3 bytes RGB)
  final baseR = byteData.getUint8(offset);
  offset += 1;
  final baseG = byteData.getUint8(offset);
  offset += 1;
  final baseB = byteData.getUint8(offset);
  offset += 1;

  // 1 byte padding before color entries
  offset += 1;

  final colors = <ColorSchemerColor>[];

  for (var i = 0; i < colorCount; i++) {
    final color = _decodeColor(byteData, offset);
    colors.add(color.color);
    offset = color.newOffset;
  }

  return ColorSchemerPalette(
    version: version,
    baseColor: [baseR, baseG, baseB],
    colors: colors,
  );
}

({ColorSchemerColor color, int newOffset}) _decodeColor(
  ByteData byteData,
  int offset,
) {
  // Use a local variable since we need to modify it
  var currentOffset = offset;

  // Color values: 3*uint8 (RGB)
  final r = byteData.getUint8(currentOffset);
  currentOffset += 1;
  final g = byteData.getUint8(currentOffset);
  currentOffset += 1;
  final b = byteData.getUint8(currentOffset);
  currentOffset += 1;

  // 1 byte padding after RGB
  currentOffset += 1;

  // Color name: string of length (int32 little-endian) characters
  // The length INCLUDES the null terminator
  final nameLength = byteData.getInt32(currentOffset, Endian.little);
  currentOffset += 4;

  // Read name bytes (nameLength includes the null terminator)
  final nameBytes = <int>[];
  for (var i = 0; i < nameLength; i++) {
    nameBytes.add(byteData.getUint8(currentOffset + i));
  }
  currentOffset += nameLength;

  // Remove the null terminator from the name
  final name = String.fromCharCodes(nameBytes.where((byte) => byte != 0));

  // RGB values repeated (3 bytes) - same as the color values above
  currentOffset += 3;

  // Hex string length (1 byte) - should be 6
  final hexLength = byteData.getUint8(currentOffset);
  currentOffset += 1;

  // Hex color value: 6*char string (e.g., "331100")
  final hexBytes = <int>[];
  for (var i = 0; i < hexLength; i++) {
    hexBytes.add(byteData.getUint8(currentOffset + i));
  }
  currentOffset += hexLength;
  final hexValue = String.fromCharCodes(hexBytes);

  // Developed: int8 (1 if that color is developed)
  final developed = byteData.getUint8(currentOffset) == 1;
  currentOffset += 1;

  return (
    color: ColorSchemerColor(
      name: name,
      red: r,
      green: g,
      blue: b,
      hexValue: hexValue,
      developed: developed,
    ),
    newOffset: currentOffset,
  );
}
