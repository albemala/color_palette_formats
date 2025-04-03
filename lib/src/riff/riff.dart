import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:color_palette_formats/src/buffer_write_utils.dart';
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
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class ResourceInterchangeFileFormat with ResourceInterchangeFileFormatMappable {
  static const version = 3;

  final List<ResourceInterchangeFileFormatColor> colors;

  ResourceInterchangeFileFormat({required this.colors});

  factory ResourceInterchangeFileFormat.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = 'RIFF';
const _dataType = 'PAL data';
