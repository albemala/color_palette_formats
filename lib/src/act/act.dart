import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'act.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Adobe Color Table
 * Acronym: ACT
 * File extensions: .act
 * References:
 * - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1070626
 */

/// Number of colors in an Adobe Color Table: 256 entries of 3 bytes (RGB).
/// Files are 768 bytes long, or 772 with a 4-byte footer (color count +
/// transparency index, see the Photoshop spec). Larger files exist in the
/// wild (e.g. Fireworks); extra bytes are ignored on decode.
const adobeColorTableColorsCount = 256;

@MappableClass()
class AdobeColorTableColor with AdobeColorTableColorMappable {
  /// Value [0..255]
  final int red;

  /// Value [0..255]
  final int green;

  /// Value [0..255]
  final int blue;

  AdobeColorTableColor({
    required this.red,
    required this.green,
    required this.blue,
  }) : assert(red >= 0 && red <= 255, 'red must be between 0 and 255'),
       assert(green >= 0 && green <= 255, 'green must be between 0 and 255'),
       assert(blue >= 0 && blue <= 255, 'blue must be between 0 and 255');
}

@MappableClass()
class AdobeColorTable with AdobeColorTableMappable {
  final List<AdobeColorTableColor> colors;

  AdobeColorTable({required this.colors});

  factory AdobeColorTable.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Adobe Color Table file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
