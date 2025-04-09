part of 'act.dart';

AdobeColorTable _decode(List<int> bytes) {
  // should be 768 or 772 bytes long
  // if (bytes.length != 768 && bytes.length != 772) {
  //   throw FormatException('Not a valid Adobe Color Table file');
  // }

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
