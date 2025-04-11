import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'procreate.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Procreate v5 (.swatches)
*/

// Removed the ProcreateV5ColorSpace enum as the format uses integers.

@MappableClass()
class ProcreateV5Swatch with ProcreateV5SwatchMappable {
  static const defaultVersion = '5.0';

  final double alpha;
  final int origin;
  final int colorSpace;
  final int colorModel;
  final double brightness;
  final List<double> components;
  final String version;
  final String colorProfile;
  final double saturation;
  final double hue;

  ProcreateV5Swatch({
    required this.alpha,
    required this.origin,
    required this.colorSpace,
    required this.colorModel,
    required this.brightness,
    required this.components,
    this.version = defaultVersion,
    required this.colorProfile,
    required this.saturation,
    required this.hue,
  }) : assert(alpha >= 0 && alpha <= 1, 'alpha must be between 0 and 1'),
       assert(
         brightness >= 0 && brightness <= 1,
         'brightness must be between 0 and 1',
       ),
       assert(
         saturation >= 0 && saturation <= 1,
         'saturation must be between 0 and 1',
       ),
       assert(hue >= 0 && hue <= 1, 'hue must be between 0 and 1'),
       assert(components.isNotEmpty, 'components list cannot be empty');
  // TODO Add more assertions based on format specifics if known (e.g., origin values)
}

@MappableClass()
class ProcreateV5ColorProfile with ProcreateV5ColorProfileMappable {
  final int colorSpace;
  final String hash;
  final String iccData;
  final String iccName;

  ProcreateV5ColorProfile({
    required this.colorSpace,
    required this.hash,
    required this.iccData,
    required this.iccName,
  });
}

@MappableClass()
class ProcreateV5Palette with ProcreateV5PaletteMappable {
  final String name;
  final List<ProcreateV5Swatch?> swatches; // Allow null swatches
  final List<ProcreateV5ColorProfile> colorProfiles;

  ProcreateV5Palette({
    required this.name,
    required this.swatches,
    required this.colorProfiles,
  });

  factory ProcreateV5Palette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Procreate Swatches file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
