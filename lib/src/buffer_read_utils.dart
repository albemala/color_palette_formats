import 'package:buffer/buffer.dart';

/// Reads a Pascal-style UTF-16 string (length-prefixed)
String readPascalUtf16String(ByteDataReader buffer) {
  final length = buffer.readUint32();
  return readUtf16String(buffer, length);
}

String readUtf16String(
  ByteDataReader buffer,
  int length, {
  bool includingTerminator = false,
}) {
  var finalLength = length;
  if (includingTerminator) finalLength -= 1;

  // Handle edge case where length is 0 (empty name with no terminator)
  if (finalLength < 0) {
    finalLength = 0;
  }

  final string = StringBuffer();
  for (var i = 0; i < finalLength; i++) {
    string.writeCharCode(buffer.readUint16());
  }
  if (includingTerminator && length > 0) {
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
