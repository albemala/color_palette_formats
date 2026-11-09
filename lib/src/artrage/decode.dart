part of 'artrage.dart';

Artrage6Palette _decode(List<int> bytes) {
  final buffer = ByteDataReader(endian: Endian.little)..add(bytes);

  _validateHeader(buffer);

  buffer.readInt32();
  buffer.readInt32();
  buffer.readInt32(); // palette size, in bytes
  buffer.readInt32(); // always 0

  final colorCount = buffer.readInt32();
  if (colorCount < 0) {
    throw FormatException(
      'Not a valid ArtRage 6 palette file. '
      'Invalid color count: $colorCount.',
    );
  }
  // Colors are 4 bytes each (BGRA), followed by the version signature.
  final minRemaining =
      colorCount * 4 + Artrage6Palette.fileVersionSignature.length * 2 + 2;
  if (buffer.remainingLength < minRemaining) {
    throw FormatException(
      'Not a valid ArtRage 6 palette file. '
      'Expected at least $minRemaining bytes for $colorCount colors '
      'but found ${buffer.remainingLength}.',
    );
  }

  final colorValues = <List<int>>[];
  for (var i = 0; i < colorCount; i++) {
    final b = buffer.readUint8();
    final g = buffer.readUint8();
    final r = buffer.readUint8();
    final a = buffer.readUint8();
    colorValues.add([b, g, r, a]);
  }

  final fileVersionSignature = readUtf16String(
    buffer,
    Artrage6Palette.fileVersionSignature.length,
  );
  if (fileVersionSignature != Artrage6Palette.fileVersionSignature) {
    throw FormatException(
      'Unsupported ArtRage palette version: $fileVersionSignature. '
      'Expected ${Artrage6Palette.fileVersionSignature}.',
    );
  }

  buffer.readInt16(); // 0

  final colorNames = <String>[];
  final stringBuffer = StringBuffer();
  while (buffer.remainingLength > 0) {
    final value = buffer.readInt16();
    if (value == 0) {
      final name = stringBuffer.toString().trim();
      colorNames.add(name);
      stringBuffer.clear();
    } else {
      stringBuffer.writeCharCode(value);
    }
  }

  if (colorNames.length != colorValues.length) {
    throw FormatException(
      'Not a valid ArtRage 6 palette file. '
      'Found ${colorNames.length} names for ${colorValues.length} colors.',
    );
  }

  final colors = <Artrage6Color>[];
  for (var i = 0; i < colorCount; i++) {
    final name = colorNames[i];
    final color = colorValues[i];
    colors.add(
      Artrage6Color(
        name: name,
        red: color[2],
        green: color[1],
        blue: color[0],
        alpha: color[3],
      ),
    );
  }

  // The format stores no palette name, so a fixed display name is used.
  return Artrage6Palette(name: 'ArtRage 6 Palette', colors: colors);
}

void _validateHeader(ByteDataReader buffer) {
  if (buffer.remainingLength < Artrage6Palette.validFileSignature.length * 2) {
    throw const FormatException('Not a valid ArtRage 6 palette file');
  }
  final header = readUtf16String(
    buffer,
    Artrage6Palette.validFileSignature.length,
  );
  if (header != Artrage6Palette.validFileSignature) {
    throw const FormatException('Not a valid ArtRage 6 palette file');
  }
}
