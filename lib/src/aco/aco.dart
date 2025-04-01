import 'package:buffer/buffer.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'aco.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Adobe Color Swatch (ACO) (.aco)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1055819
* - http://www.nomodes.com/aco.html
*/

// TODO implement v2 specs: https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/aco-to-colors.js

const supportedAdobeColorSwatchVersion = 1;

@MappableEnum()
enum AdobeColorSwatchColorSpace {
  rgb,
  hsb,
  cmyk,
  lab,
  grayscale,
  wideCmyk,
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

  AdobeColorSwatchColor({
    required this.colorSpace,
    required this.values,
  });
}

@MappableClass()
class AdobeColorSwatch with AdobeColorSwatchMappable {
  final int version;
  final List<AdobeColorSwatchColor> colors;

  AdobeColorSwatch({
    required this.version,
    required this.colors,
  });

  factory AdobeColorSwatch.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _maxUInt16 = 65535;

const _colorSpaceRgb = 0;
const _colorSpaceHsb = 1;
const _colorSpaceCmyk = 2;
const _colorSpaceLab = 7;
const _colorSpaceGrayscale = 8;
const _colorSpaceWideCmyk = 9;

const _readColorSpace = {
  _colorSpaceRgb: AdobeColorSwatchColorSpace.rgb,
  _colorSpaceHsb: AdobeColorSwatchColorSpace.hsb,
  _colorSpaceCmyk: AdobeColorSwatchColorSpace.cmyk,
  _colorSpaceLab: AdobeColorSwatchColorSpace.lab,
  _colorSpaceGrayscale: AdobeColorSwatchColorSpace.grayscale,
  _colorSpaceWideCmyk: AdobeColorSwatchColorSpace.wideCmyk,
};
const _writeColorSpace = {
  AdobeColorSwatchColorSpace.rgb: _colorSpaceRgb,
  AdobeColorSwatchColorSpace.hsb: _colorSpaceHsb,
  AdobeColorSwatchColorSpace.cmyk: _colorSpaceCmyk,
  AdobeColorSwatchColorSpace.lab: _colorSpaceLab,
  AdobeColorSwatchColorSpace.grayscale: _colorSpaceGrayscale,
  AdobeColorSwatchColorSpace.wideCmyk: _colorSpaceWideCmyk,
};
