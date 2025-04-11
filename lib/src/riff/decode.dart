part of 'riff.dart';

ResourceInterchangeFileFormat _decode(List<int> bytes) {
  final buffer = ByteDataReader(endian: Endian.little)..add(bytes);

  _validateHeader(buffer);
  // ignore: unused_local_variable
  final dataSize = buffer.readUint32();
  _validateDataType(buffer);
  // ignore: unused_local_variable
  final chunkSize = buffer.readUint32();
  _validateVersion(buffer);

  final colorsCount = buffer.readUint16();

  final colors = <ResourceInterchangeFileFormatColor>[];
  for (var i = 0; i < colorsCount; i++) {
    colors.add(
      ResourceInterchangeFileFormatColor(
        red: buffer.readUint8(),
        green: buffer.readUint8(),
        blue: buffer.readUint8(),
      ),
    );
    // ignore: unused_local_variable
    final flags = buffer.readUint8();
  }

  return ResourceInterchangeFileFormat(colors: colors);
}

void _validateHeader(ByteDataReader buffer) {
  final header = readUtf8String(buffer, 4);
  if (header != ResourceInterchangeFileFormat.validFileSignature) {
    throw const FormatException('''
Not a valid Resource Interchange File Format file: invalid file signature''');
  }
}

void _validateDataType(ByteDataReader buffer) {
  final dataType = readUtf8String(buffer, 8);
  if (dataType != _dataType) {
    throw const FormatException('''
Not a valid Resource Interchange File Format file: invalid data type''');
  }
}

void _validateVersion(ByteDataReader buffer) {
  final version = buffer.readUint16(Endian.big);
  if (version != ResourceInterchangeFileFormat.validVersion) {
    throw FormatException(
      '''
Unsupported version $version. Supported version: ${ResourceInterchangeFileFormat.validVersion}''',
    );
  }
}
