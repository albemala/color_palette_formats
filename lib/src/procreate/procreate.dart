import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'procreate.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Procreate swatches (.swatches) (Procreate)
*
* Content example:
*

[
  {
    "name" : "Retro & Vintage",
    "swatches" : [
      {
        "hue" : 0.096825396825396814,
        "saturation" : 0.41338580203493147,
        "brightness" : 0.99607843160629272,
        "alpha" : 1,
        "colorSpace" : 0
      },
      {
        "hue" : 0.4381720505892564,
        "saturation" : 0.40000000980592509,
        "brightness" : 0.60784316062927246,
        "alpha" : 1,
        "colorSpace" : 0
      }
    ]
  }
]

*
* References:
* - ...
*/

@MappableEnum(mode: ValuesMode.indexed)
enum ProcreateSwatchesColorSpace { hsb }

@MappableClass()
class ProcreateSwatchesSwatch with ProcreateSwatchesSwatchMappable {
  /// Value: [0..1]
  final double hue;

  /// Value: [0..1]
  final double saturation;

  /// Value: [0..1]
  final double brightness;

  /// Value: [0..1]
  final double alpha;
  final ProcreateSwatchesColorSpace colorSpace;

  ProcreateSwatchesSwatch({
    required this.hue,
    required this.saturation,
    required this.brightness,
    required this.alpha,
    required this.colorSpace,
  });
}

@MappableClass()
class ProcreateSwatches with ProcreateSwatchesMappable {
  final String name;
  final List<ProcreateSwatchesSwatch> swatches;

  ProcreateSwatches({this.name = '', required this.swatches});

  List<int> toBytes() {
    return encodeProcreateSwatches([this]);
  }
}
