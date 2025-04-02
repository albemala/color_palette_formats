import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:color_palette_formats/src/buffer_write_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'acb.mapper.dart';
part 'decode.dart';

typedef ColorValueConverter = List<int> Function(List<int> rawValues);

/*
* Adobe Color Book (ACB) (.acb)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1066780
* - https://magnetiq.ca/pages/acb-spec/
*/

@MappableEnum(defaultValue: AdobeColorBookColorSpace.rgb)
enum AdobeColorBookColorSpace {
  rgb(value: 0, channels: 3, convertColorValues: _convertRgbValues),
  hsb(value: 1, channels: 3, convertColorValues: _convertHsbValues),
  cmyk(value: 2, channels: 4, convertColorValues: _convertCmykValues),
  pantone(value: 3, channels: 3, convertColorValues: _unsupportedConversion),
  focoltone(value: 4, channels: 3, convertColorValues: _unsupportedConversion),
  trumatch(value: 5, channels: 3, convertColorValues: _unsupportedConversion),
  toyo(value: 6, channels: 3, convertColorValues: _unsupportedConversion),
  lab(value: 7, channels: 3, convertColorValues: _convertLabValues),
  grayscale(value: 8, channels: 1, convertColorValues: _unsupportedConversion),
  hks(value: 10, channels: 3, convertColorValues: _unsupportedConversion);

  final int value;
  final int channels;
  final ColorValueConverter convertColorValues;

  const AdobeColorBookColorSpace({
    required this.value,
    required this.channels,
    required this.convertColorValues,
  });

  static AdobeColorBookColorSpace fromValue(int value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () {
        throw FormatException('Unsupported color space value: $value');
      },
    );
  }
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
  static const fileSignature = '8BCB';
  static const version = 1;

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

/// Represents the metadata of an Adobe Color Book
class _AcbMetadata {
  final String title;
  final String prefix;
  final String suffix;
  final String description;

  _AcbMetadata({
    required this.title,
    required this.prefix,
    required this.suffix,
    required this.description,
  });
}

/// Represents the properties of an Adobe Color Book
class _AcbProperties {
  final int colorCount;
  final int pageSize;
  final int pageSelectorOffset;
  final AdobeColorBookColorSpace colorSpace;

  _AcbProperties({
    required this.colorCount,
    required this.pageSize,
    required this.pageSelectorOffset,
    required this.colorSpace,
  });
}

// TODO encode
