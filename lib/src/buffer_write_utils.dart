import 'package:buffer/buffer.dart';

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
