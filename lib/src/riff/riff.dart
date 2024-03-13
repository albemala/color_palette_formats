import 'dart:io';
import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'riff.mapper.dart';

/*
* Resource Interchange File Format (RIFF) (.pal)
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

const supportedResourceInterchangeFileFormatVersion = 3;

@MappableClass()
class ResourceInterchangeFileFormatColor
    with ResourceInterchangeFileFormatColorMappable {
  /// Value: [0..255]
  final int red;

  /// Value: [0..255]
  final int green;

  /// Value: [0..255]
  final int blue;

  ResourceInterchangeFileFormatColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}

@MappableClass()
class ResourceInterchangeFileFormat with ResourceInterchangeFileFormatMappable {
  final int version;
  final List<ResourceInterchangeFileFormatColor> colors;

  ResourceInterchangeFileFormat({
    required this.version,
    required this.colors,
  });
}

const _fileSignature = 'RIFF';
const _dataType = 'PAL data';

ResourceInterchangeFileFormat decodeResourceInterchangeFileFormat(File file) {
  final bytes = file.readAsBytesSync();
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

void encodeResourceInterchangeFileFormat(
  ResourceInterchangeFileFormat riff,
  File file,
) {
  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  writeUtf8String(buffer, _fileSignature);
  // data size
  buffer.writeUint32(
    _dataType.length * 8 + // data type
        32 + // chunk size
        16 + // version
        16 + // colors count
        riff.colors.length * 8 * 4, // colors
  );
  // data type
  writeUtf8String(buffer, _dataType);
  // chunk size
  buffer.writeUint32(
    16 + // version
        16 + // colors count
        riff.colors.length * 8 * 4, // colors
  );
  // version
  buffer.writeUint16(riff.version, Endian.big);
  // colors count
  buffer.writeUint16(riff.colors.length);
  // colors
  for (var i = 0; i < riff.colors.length; i++) {
    final color = riff.colors[i];
    buffer.writeUint8(color.red);
    buffer.writeUint8(color.green);
    buffer.writeUint8(color.blue);
    // flags
    buffer.writeUint8(0);
  }
  // write file
  final bytes = buffer.toBytes();
  file.writeAsBytesSync(bytes);
}
