import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'riff.mapper.dart';
part 'decode.dart';
part 'encode.dart';

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

  factory ResourceInterchangeFileFormat.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = 'RIFF';
const _dataType = 'PAL data';
