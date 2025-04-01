part of 'riff.dart';

ResourceInterchangeFileFormat _decode(List<int> bytes) {
  final buffer = ByteDataReader(
    endian: Endian.little,
  )..add(bytes);

  final header = readUtf8String(buffer, 4);
  if (header != _fileSignature) {
    throw Exception('Not a valid Resource Interchange File Format file');
  }

  // ignore: unused_local_variable
  final dataSize = buffer.readUint32();

  final dataType = readUtf8String(buffer, 8);
  if (dataType != _dataType) {
    throw Exception('Not a valid Resource Interchange File Format file');
  }

  // ignore: unused_local_variable
  final chunkSize = buffer.readUint32();

  final version = buffer.readUint16(Endian.big);
  if (version != supportedResourceInterchangeFileFormatVersion) {
    throw Exception('''
Unsupported version $version. Supported version: $supportedResourceInterchangeFileFormatVersion''');
  }

  final colorsCount = buffer.readUint16();

  final colors = <ResourceInterchangeFileFormatColor>[];
  for (var i = 0; i < colorsCount; i++) {
    final values = [
      buffer.readUint8(),
      buffer.readUint8(),
      buffer.readUint8(),
    ];

    // ignore: unused_local_variable
    final flags = buffer.readUint8();

    colors.add(
      ResourceInterchangeFileFormatColor(
        red: values[0],
        green: values[1],
        blue: values[2],
      ),
    );
  }

  return ResourceInterchangeFileFormat(
    version: version,
    colors: colors,
  );
}
