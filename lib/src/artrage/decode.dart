part of 'artrage.dart';

Artrage6Palette _decode(List<int> bytes) {
  final buffer = ByteDataReader(endian: Endian.little)..add(bytes);

  _validateHeader(buffer);

  buffer.readInt32();
  buffer.readInt32();
  buffer.readInt32(); // palette size, in bytes
  buffer.readInt32(); // always 0

  final colorCount = buffer.readInt32();
  // print('Color count: $colorCount');

  final colorValues = <List<int>>[];
  for (var i = 0; i < colorCount; i++) {
    final b = buffer.readUint8();
    final g = buffer.readUint8();
    final r = buffer.readUint8();
    final a = buffer.readUint8();
    // print('Color $i: B=$b, G=$g, R=$r, A=$a');
    colorValues.add([b, g, r, a]);
  }

  final fileVersionSignature = readUtf16String(
    buffer,
    Artrage6Palette.fileVersionSignature.length,
  );
  // print('File Version Signature: $fileVersionSignature');

  buffer.readInt16(); // 0

  final colorNames = <String>[];
  final stringBuffer = StringBuffer();
  while (buffer.remainingLength > 0) {
    final value = buffer.readInt16();
    if (value == 0) {
      final name = stringBuffer.toString().trim();
      // print('String: $name');
      colorNames.add(name);
      stringBuffer.clear();
    } else {
      stringBuffer.writeCharCode(value);
    }
  }

  assert(
    colorNames.length == colorValues.length,
    'Color names and color values count mismatch',
  );

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

  return Artrage6Palette(name: 'ArtRage 6 Palette', colors: colors);
}

void _validateHeader(ByteDataReader buffer) {
  final header = readUtf16String(
    buffer,
    Artrage6Palette.validFileSignature.length,
  );
  if (header != Artrage6Palette.validFileSignature) {
    throw const FormatException('Not a valid ArtRage 6 palette file');
  }
}
