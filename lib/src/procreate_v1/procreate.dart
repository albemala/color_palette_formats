import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'procreate.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Procreate v1 (.swatches)
*/

@MappableEnum(mode: ValuesMode.indexed)
enum ProcreateV1ColorSpace { hsb }

@MappableClass()
class ProcreateV1Swatch with ProcreateV1SwatchMappable {
  /// Value: [0..1]
  final double hue;

  /// Value: [0..1]
  final double saturation;

  /// Value: [0..1]
  final double brightness;

  /// Value: [0..1]
  final double alpha;
  final ProcreateV1ColorSpace colorSpace;

  ProcreateV1Swatch({
    required this.hue,
    required this.saturation,
    required this.brightness,
    required this.alpha,
    required this.colorSpace,
  }) : assert(hue >= 0 && hue <= 1, 'hue must be between 0 and 1'),
       assert(
         saturation >= 0 && saturation <= 1,
         'saturation must be between 0 and 1',
       ),
       assert(
         brightness >= 0 && brightness <= 1,
         'brightness must be between 0 and 1',
       ),
       assert(alpha >= 0 && alpha <= 1, 'alpha must be between 0 and 1');
}

@MappableClass()
class ProcreateV1Palette with ProcreateV1PaletteMappable {
  final String name;
  final List<ProcreateV1Swatch> swatches;

  ProcreateV1Palette({this.name = '', required this.swatches});

  List<int> toBytes() {
    return encodeProcreateV1Palette([this]);
  }

  /// Checks if the provided bytes represent a valid Procreate Swatches file.
  static bool isValidFormat(List<int> bytes) {
    try {
      decodeProcreateV1Palettes(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
