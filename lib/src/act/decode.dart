part of 'act.dart';

AdobeColorTable _decode(List<int> bytes) {
  // Bare tables are 768 bytes (256 colors x 3 bytes RGB); Photoshop CS2+
  // appends a 4-byte footer (color count + transparency index) making 772.
  // Larger files exist; only the first 256 colors are decoded and the
  // rest is ignored.
  if (bytes.length < adobeColorTableColorsCount * 3) {
    throw FormatException(
      'Not a valid Adobe Color Table file. '
      'Expected at least ${adobeColorTableColorsCount * 3} bytes '
      'but found ${bytes.length}.',
    );
  }

  final buffer = ByteDataReader()..add(bytes);

  final colors = <AdobeColorTableColor>[];
  for (var i = 0; i < adobeColorTableColorsCount; i++) {
    final r = buffer.readUint8();
    final g = buffer.readUint8();
    final b = buffer.readUint8();
    colors.add(AdobeColorTableColor(red: r, green: g, blue: b));
  }

  return AdobeColorTable(colors: colors);
}
