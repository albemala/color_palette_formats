import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'ase.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
* Adobe Swatch Exchange (ASE) (.ase)
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

const supportedAdobeSwatchExchangeVersion = '1.0';

@MappableEnum()
enum AdobeSwatchExchangeColorModel {
  rgb,
  cmyk,
  gray,
}

@MappableEnum()
enum AdobeSwatchExchangeColorType {
  global,
  spot,
  normal,
}

@MappableClass()
class AdobeSwatchExchangeColor with AdobeSwatchExchangeColorMappable {
  final String name;
  final AdobeSwatchExchangeColorModel model;

  /// Color values are in the range [0..1]
  final List<double> values;
  final AdobeSwatchExchangeColorType type;

  AdobeSwatchExchangeColor({
    required this.name,
    required this.model,
    required this.values,
    this.type = AdobeSwatchExchangeColorType.global,
  });
}

@MappableClass()
class AdobeSwatchExchange with AdobeSwatchExchangeMappable {
  final String version;
  final List<dynamic> groups;
  final List<AdobeSwatchExchangeColor> colors;

  AdobeSwatchExchange({
    required this.version,
    this.groups = const [],
    required this.colors,
  });

  factory AdobeSwatchExchange.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }
}

const _fileSignature = 'ASEF';

const _blockTypeColor = 0x0001;
const _blockTypeGroupStart = 0xc001;
const _blockTypeGroupEnd = 0xc002;

const _colorModelRgb = 'RGB ';
const _colorModelCmyk = 'CMYK';
const _colorModelGrayscale = 'Gray';
const _colorTypeGlobal = 0;
const _colorTypeSpot = 1;
const _colorTypeNormal = 2;

const _readColorType = {
  _colorTypeGlobal: AdobeSwatchExchangeColorType.global,
  _colorTypeSpot: AdobeSwatchExchangeColorType.spot,
  _colorTypeNormal: AdobeSwatchExchangeColorType.normal,
};
const _writeColorType = {
  AdobeSwatchExchangeColorType.global: _colorTypeGlobal,
  AdobeSwatchExchangeColorType.spot: _colorTypeSpot,
  AdobeSwatchExchangeColorType.normal: _colorTypeNormal,
};

const _readColorModel = {
  _colorModelRgb: AdobeSwatchExchangeColorModel.rgb,
  _colorModelCmyk: AdobeSwatchExchangeColorModel.cmyk,
  _colorModelGrayscale: AdobeSwatchExchangeColorModel.gray,
};
const _writeColorModel = {
  AdobeSwatchExchangeColorModel.rgb: _colorModelRgb,
  AdobeSwatchExchangeColorModel.cmyk: _colorModelCmyk,
  AdobeSwatchExchangeColorModel.gray: _colorModelGrayscale,
};
