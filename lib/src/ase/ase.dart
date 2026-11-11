import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/buffer_read_utils.dart';
import 'package:color_palette_formats/src/buffer_write_utils.dart';
import 'package:color_palette_formats/src/format_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'ase.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Adobe Swatch Exchange
 * Acronym: ASE
 * Versions: 1.0
 * File extensions: .ase
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 */

@MappableEnum()
enum AdobeSwatchExchangeColorModel {
  rgb(value: 'RGB '),
  cmyk(value: 'CMYK'),
  gray(value: 'Gray'),
  lab(value: 'LAB ');

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

  /// Color values depend on the color model (stored as big-endian float32):
  /// - RGB: [0..1, 0..1, 0..1]
  /// - CMYK: [0..1, 0..1, 0..1, 0..1]
  /// - Gray: [0..1]
  /// - LAB: L [0..1] (fraction of 100), a/b [-128..127]
  final List<double> values;
  final AdobeSwatchExchangeColorType type;

  AdobeSwatchExchangeColor({
    required this.name,
    required this.model,
    required this.values,
    this.type = AdobeSwatchExchangeColorType.global,
  }) : assert(
         _areValidValues(model, values),
         'Color values out of range for model $model: $values',
       );

  /// Checks value count and ranges for [model]. LAB stores L as a fraction
  /// of 100 with raw a/b components.
  static bool _areValidValues(
    AdobeSwatchExchangeColorModel model,
    List<double> values,
  ) {
    bool inUnitRange(double value) => value >= 0 && value <= 1;
    return switch (model) {
      AdobeSwatchExchangeColorModel.rgb =>
        values.length == 3 && values.every(inUnitRange),
      AdobeSwatchExchangeColorModel.cmyk =>
        values.length == 4 && values.every(inUnitRange),
      AdobeSwatchExchangeColorModel.gray =>
        values.length == 1 && values.every(inUnitRange),
      AdobeSwatchExchangeColorModel.lab =>
        values.length == 3 &&
            values[0] >= 0 &&
            values[0] <= 1 &&
            values[1] >= -128 &&
            values[1] <= 127 &&
            values[2] >= -128 &&
            values[2] <= 127,
    };
  }
}

@MappableClass()
class AdobeSwatchExchange with AdobeSwatchExchangeMappable {
  static const validFileSignature = 'ASEF';
  static const validVersion = '1.0';

  /// Group names are not preserved: group start/end blocks are skipped and
  /// their colors are decoded into [colors] in file order. The encoder
  /// likewise writes colors without group blocks.
  final List<dynamic> groups;
  final List<AdobeSwatchExchangeColor> colors;

  AdobeSwatchExchange({this.groups = const [], required this.colors});

  factory AdobeSwatchExchange.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Adobe Swatch Exchange
  /// file. Runs a full decode so truncated files are rejected (a
  /// header-only check would accept them).
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

const _blockTypeColor = 0x0001;
const _blockTypeGroupStart = 0xc001;
const _blockTypeGroupEnd = 0xc002;
