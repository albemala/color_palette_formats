import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'act.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Adobe Color Table (ACT) (.act)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1070626
*/

const adobeColorTableColorsCount = 255;

@MappableClass()
class AdobeColorTableColor with AdobeColorTableColorMappable {
  /// Value [0..255]
  final int green;

  /// Value [0..255]
  final int blue;

  /// Value [0..255]
  final int red;

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
