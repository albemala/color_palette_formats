import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'acb.mapper.dart';

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

AdobeColorBook _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  final header = readUtf8String(buffer, 4);
  if (header != _fileSignature) {
    throw Exception('Not a valid Adobe Color Book file');
  }

  final version = buffer.readUint16();
  if (version != supportedAdobeColorBookVersion) {
    throw Exception('''
Unsupported version $version, Supported version: $supportedAdobeColorBookVersion''');
  }

  final identifier = buffer.readUint16();

  final titleLength = buffer.readUint32();
  final title = readUtf16String(buffer, titleLength);

  final prefixLength = buffer.readUint32();
  final prefix = readUtf16String(buffer, prefixLength);

  final suffixLength = buffer.readUint32();
  final suffix = readUtf16String(buffer, suffixLength);

  final descriptionLength = buffer.readUint32();
  final description = readUtf16String(buffer, descriptionLength);

  final colorCount = buffer.readUint16();

  final pageSize = buffer.readUint16();

  final pageSelectorOffset = buffer.readUint16();

  final colorSpace = buffer.readUint16();

  final channels = _getChannels(colorSpace);

  final colors = <AdobeColorBookColor>[];
  for (var i = 0; i < colorCount; i++) {
    final colorNameLength = buffer.readUint32();
    final colorName = readUtf16String(buffer, colorNameLength);

    final colorCode = readUtf8String(buffer, 6);

    final rawValues = buffer.read(channels);
    final values = <int>[];
    switch (colorSpace) {
      case _colorSpaceRgb:
        values.addAll(rawValues);
      case _colorSpaceHsb:
        break;
      case _colorSpaceCmyk:
        values.addAll([
          ((255 - rawValues[0]) / 2.55 + 0.5).round(),
          ((255 - rawValues[1]) / 2.55 + 0.5).round(),
          ((255 - rawValues[2]) / 2.55 + 0.5).round(),
          ((255 - rawValues[3]) / 2.55 + 0.5).round(),
        ]);
      case _colorSpacePantone:
        break;
      case _colorSpaceFocoltone:
        break;
      case _colorSpaceTrumatch:
        break;
      case _colorSpaceToyo:
        break;
      case _colorSpaceLab:
        values.addAll([
          (rawValues[0] / 2.55 + 0.5).round(),
          rawValues[1] - 128,
          rawValues[2] - 128,
        ]);
      case _colorSpaceGrayscale:
        break;
      case _colorSpaceHks:
        break;
    }

    colors.add(
      AdobeColorBookColor(
        name: colorName,
        code: colorCode,
        values: values,
      ),
    );
  }

  final colorSpaceAsEnum = _readColorSpace[colorSpace];
  if (colorSpaceAsEnum == null) {
    throw Exception('Unsupported color space $colorSpace');
  }
  return AdobeColorBook(
    version: version,
    identifier: identifier,
    title: title,
    description: description,
    colorNamePrefix: prefix,
    colorNameSuffix: suffix,
    colorCount: colorCount,
    pageSize: pageSize,
    pageSelectorOffset: pageSelectorOffset,
    colorSpace: colorSpaceAsEnum,
    colors: colors,
  );
}

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
// ignore: unused_element
const _writeColorSpace = {
  AdobeColorBookColorSpace.rgb: _colorSpaceRgb,
  AdobeColorBookColorSpace.hsb: _colorSpaceHsb,
  AdobeColorBookColorSpace.cmyk: _colorSpaceCmyk,
  AdobeColorBookColorSpace.pantone: _colorSpacePantone,
  AdobeColorBookColorSpace.focoltone: _colorSpaceFocoltone,
  AdobeColorBookColorSpace.trumatch: _colorSpaceTrumatch,
  AdobeColorBookColorSpace.toyo: _colorSpaceToyo,
  AdobeColorBookColorSpace.lab: _colorSpaceLab,
  AdobeColorBookColorSpace.grayscale: _colorSpaceGrayscale,
  AdobeColorBookColorSpace.hks: _colorSpaceHks,
};

// TODO encode
