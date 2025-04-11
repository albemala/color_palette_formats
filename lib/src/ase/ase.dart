import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:color_palette_formats/src/buffer_write_utils.dart';
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

@MappableEnum()
enum AdobeSwatchExchangeColorModel {
  rgb(value: 'RGB '),
  cmyk(value: 'CMYK'),
  gray(value: 'Gray');

  final String value;

  const AdobeSwatchExchangeColorModel({required this.value});

  static AdobeSwatchExchangeColorModel fromValue(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () {
        throw FormatException('Unsupported color model value: $value');
      },
    );
  }
}

@MappableEnum()
enum AdobeSwatchExchangeColorType {
  global(value: 0),
  spot(value: 1),
  normal(value: 2);

  final int value;

  const AdobeSwatchExchangeColorType({required this.value});

  static AdobeSwatchExchangeColorType fromValue(int value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () {
        throw FormatException('Unsupported color type value: $value');
      },
    );
  }
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
  }) : assert(
         values.every((value) => value >= 0 && value <= 1),
         'Color values must be in the range [0..1]',
       );
}

@MappableClass()
class AdobeSwatchExchange with AdobeSwatchExchangeMappable {
  static const validFileSignature = 'ASEF';
  static const validVersion = '1.0';

  final List<dynamic> groups;
  final List<AdobeSwatchExchangeColor> colors;

  AdobeSwatchExchange({this.groups = const [], required this.colors});

  factory AdobeSwatchExchange.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Adobe Swatch Exchange file.
  static bool isValidFormat(List<int> bytes) {
    try {
      final buffer = ByteDataReader()..add(bytes);
      _validateHeader(buffer);
      _validateVersion(buffer);
      return true;
    } catch (_) {
      return false;
    }
  }
}

const _blockTypeColor = 0x0001;
const _blockTypeGroupStart = 0xc001;
const _blockTypeGroupEnd = 0xc002;
