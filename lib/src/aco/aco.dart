import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'aco.mapper.dart';
part 'decode.dart';
part 'encode.dart';

// References are in the header comment below.

/*
 * Format name: Adobe Color Swatch
 * Acronym: ACO
 * Versions: 1, 2
 * File extensions: .aco
 * Format details: Version 1 section followed by version 2 section with
 *   color names. Version 2 entries add a Unicode string (32-bit length
 *   including the null terminator + UTF-16BE) after the 10-byte color.
 *   Standalone version 2 files are also accepted.
 * References:
 * - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1055819
 * - http://www.nomodes.com/aco.html
 * - https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/aco-to-colors.js
 */

const _maxUInt16 = 65535;

@MappableEnum()
enum AdobeColorSwatchColorSpace {
  rgb(value: 0),
  hsb(value: 1),
  cmyk(value: 2),
  lab(value: 7),
  grayscale(value: 8),
  wideCmyk(value: 9);

  final int value;

  const AdobeColorSwatchColorSpace({required this.value});

  static AdobeColorSwatchColorSpace fromValue(int value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () {
        throw FormatException('Unsupported color space value: $value');
      },
    );
  }
}

@MappableClass()
class AdobeColorSwatchColor with AdobeColorSwatchColorMappable {
  final AdobeColorSwatchColorSpace colorSpace;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - HSB: [0..359, 0..100, 0..100]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  /// - Grayscale: [0..255]
  /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
  final List<int> values;

  /// Color name from the version 2 section. Null when the file only
  /// contains a version 1 section.
  final String? name;

  AdobeColorSwatchColor({
    required this.colorSpace,
    required this.values,
    this.name,
  });
}

@MappableClass()
class AdobeColorSwatch with AdobeColorSwatchMappable {
  static const validVersion = 1;
  static const version1 = 1;
  static const version2 = 2;
  static const List<int> validVersions = [version1, version2];

  final List<AdobeColorSwatchColor> colors;

  AdobeColorSwatch({required this.colors});

  factory AdobeColorSwatch.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Adobe Color Swatch file.
  static bool isValidFormat(List<int> bytes) {
    try {
      final buffer = ByteDataReader()..add(bytes);
      _validateVersion(buffer);
      return true;
    } catch (_) {
      return false;
    }
  }
}
