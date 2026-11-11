import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:color_palette_formats/src/buffer_write_utils.dart';
import 'package:color_palette_formats/src/format_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'riff.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Resource Interchange File Format
 * Acronym: RIFF
 * Versions: 3
 * File extensions: .pal
 * Format details: Little-endian RIFF container holding a `PAL data` chunk:
 *   `RIFF` signature, data size (`file length - 8`), `PAL data` type tag,
 *   chunk size, big-endian version (3), little-endian color count, then
 *   count RGB triples each followed by a flags byte. `dataSize`/`chunkSize`
 *   are trusted for skipping nothing and ignored on decode; the encoder
 *   always writes correct values. The flags byte is read and discarded on
 *   decode and written as 0 on encode. Empty (0-color) palettes are legal,
 *   and trailing bytes after the last color are ignored.
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
  static const validFileSignature = 'RIFF';
  static const validVersion = 3;

  final List<ResourceInterchangeFileFormatColor> colors;

  ResourceInterchangeFileFormat({required this.colors});

  factory ResourceInterchangeFileFormat.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid RIFF palette file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

const _dataType = 'PAL data';
