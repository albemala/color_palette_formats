import 'dart:io';

import 'package:buffer/buffer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';

part 'act.freezed.dart';
part 'act.g.dart';

/*
* Adobe Color Table (ACT) (.act)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1070626
*/

const adobeColorTableColorsCount = 255;

@freezed
class AdobeColorTableColor with _$AdobeColorTableColor {
  const factory AdobeColorTableColor({
    /// Value [0..255]
    required int green,

    /// Value [0..255]
    required int blue,

    /// Value [0..255]
    required int red,
  }) = _AdobeColorTableColor;

  factory AdobeColorTableColor.fromJson(Map<String, dynamic> json) =>
      _$AdobeColorTableColorFromJson(json);
}

@freezed
class AdobeColorTable with _$AdobeColorTable {
  const factory AdobeColorTable({
    required List<AdobeColorTableColor> colors,
  }) = _AdobeColorTable;

  factory AdobeColorTable.fromJson(Map<String, dynamic> json) =>
      _$AdobeColorTableFromJson(json);
}

AdobeColorTable decodeAdobeColorTable(File file) {
  final fileExtension = extension(file.path);
  final bytes = file.readAsBytesSync();
  // if extension is 'act', skip this check
  if (fileExtension != '.act') {
    // should be 768 or 772 bytes long
    if (bytes.length != 768 && bytes.length != 772) {
      throw Exception('Not a valid Adobe Color Table file');
    }
  }

  final buffer = ByteDataReader()..add(bytes);

  final colors = <AdobeColorTableColor>[];
  for (var i = 0; i < adobeColorTableColorsCount; i++) {
    final r = buffer.readUint8();
    final g = buffer.readUint8();
    final b = buffer.readUint8();
    colors.add(
      AdobeColorTableColor(
        red: r,
        green: g,
        blue: b,
      ),
    );
  }

  return AdobeColorTable(
    colors: colors,
  );
}

void encodeAdobeColorTable(AdobeColorTable colorTable, File file) {
  final buffer = ByteDataWriter();
  for (final color in colorTable.colors) {
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
  }
  // write file
  final bytes = buffer.toBytes();
  file.writeAsBytesSync(bytes);
}
