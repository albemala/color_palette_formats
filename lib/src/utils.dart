import 'package:buffer/buffer.dart';

String readUtf16String(
  ByteDataReader buffer,
  int length, {
  bool includingTerminator = false,
}) {
  var finalLength = length;
  if (includingTerminator) finalLength -= 1;

  final string = StringBuffer();
  for (var i = 0; i < finalLength; i++) {
    string.writeCharCode(buffer.readUint16());
  }
  if (includingTerminator) {
    buffer.readUint16(); // should be 0x0000
  }
  return string.toString();
}

String readUtf8String(ByteDataReader buffer, int length) {
  final string = StringBuffer();
  for (var i = 0; i < length; i++) {
    string.writeCharCode(buffer.readUint8());
  }
  return string.toString();
}

void writeUtf16String(
  ByteDataWriter writer,
  String string, {
  bool includeTerminator = false,
}) {
  for (var i = 0; i < string.length; i++) {
    writer.writeUint16(string.codeUnitAt(i));
  }
  if (includeTerminator) {
    writer.writeUint16(0x0000);
  }
}

void writeUtf8String(ByteDataWriter buffer, String string) {
  for (var i = 0; i < string.length; i++) {
    buffer.writeUint8(string.codeUnitAt(i));
  }
}
