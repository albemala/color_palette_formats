import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'acb.mapper.dart';
part 'decode.dart';

/*
* Adobe Color Book (ACB) (.acb)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1066780
* - https://magnetiq.ca/pages/acb-spec/
*/

const supportedAdobeColorBookVersion = 1;

@MappableEnum()
enum AdobeColorBookColorSpace {
  rgb,
  hsb,
  cmyk,
  pantone,
  focoltone,
  trumatch,
  toyo,
  lab,
  grayscale,
  hks,
}

@MappableClass()
class AdobeColorBookColor with AdobeColorBookColorMappable {
  final String name;
  final String code;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  final List<int> values;

  AdobeColorBookColor({
    required this.name,
    required this.code,
    required this.values,
  });
}

@MappableClass()
class AdobeColorBook with AdobeColorBookMappable {
  final int version;
  final int identifier;
  final String title;
  final String description;
  final String colorNamePrefix;
  final String colorNameSuffix;
  final int colorCount;
  final int pageSize;
  final int pageSelectorOffset;
  final AdobeColorBookColorSpace colorSpace;
  final List<AdobeColorBookColor> colors;

  AdobeColorBook({
    required this.version,
    required this.identifier,
    required this.title,
    required this.description,
    required this.colorNamePrefix,
    required this.colorNameSuffix,
    required this.colorCount,
    required this.pageSize,
    required this.pageSelectorOffset,
    required this.colorSpace,
    required this.colors,
  });

  factory AdobeColorBook.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }
}

// TODO encode

const _fileSignature = '8BCB';

const _colorSpaceRgb = 0;
const _colorSpaceHsb = 1;
const _colorSpaceCmyk = 2;
const _colorSpacePantone = 3;
const _colorSpaceFocoltone = 4;
const _colorSpaceTrumatch = 5;
const _colorSpaceToyo = 6;
const _colorSpaceLab = 7;
const _colorSpaceGrayscale = 8;
const _colorSpaceHks = 10;

int _getChannels(int colorSpace) {
  switch (colorSpace) {
    case _colorSpaceCmyk:
      return 4;
    case _colorSpaceGrayscale:
      return 1;
    default:
      return 3;
  }
}

const _readColorSpace = {
  _colorSpaceRgb: AdobeColorBookColorSpace.rgb,
  _colorSpaceHsb: AdobeColorBookColorSpace.hsb,
  _colorSpaceCmyk: AdobeColorBookColorSpace.cmyk,
  _colorSpacePantone: AdobeColorBookColorSpace.pantone,
  _colorSpaceFocoltone: AdobeColorBookColorSpace.focoltone,
  _colorSpaceTrumatch: AdobeColorBookColorSpace.trumatch,
  _colorSpaceToyo: AdobeColorBookColorSpace.toyo,
  _colorSpaceLab: AdobeColorBookColorSpace.lab,
  _colorSpaceGrayscale: AdobeColorBookColorSpace.grayscale,
  _colorSpaceHks: AdobeColorBookColorSpace.hks,
};
