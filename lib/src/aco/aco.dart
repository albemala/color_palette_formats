import 'dart:io';

import 'package:buffer/buffer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aco.freezed.dart';
part 'aco.g.dart';

/*
* Adobe Color Swatch (ACO) (.aco)
*
* References:
* - https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1055819
* - http://www.nomodes.com/aco.html
*/

// TODO implement v2 specs: https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/aco-to-colors.js

const supportedAdobeColorSwatchVersion = 1;

enum AdobeColorSwatchColorSpace {
  rgb,
  hsb,
  cmyk,
  lab,
  grayscale,
  wideCmyk,
}

@freezed
class AdobeColorSwatchColor with _$AdobeColorSwatchColor {
  const factory AdobeColorSwatchColor({
    required AdobeColorSwatchColorSpace colorSpace,

    /// Color values depend on color space:
    /// - RGB: [0..255, 0..255, 0..255]
    /// - HSB: [0..359, 0..100, 0..100]
    /// - CMYK: [0..100, 0..100, 0..100, 0..100]
    /// - LAB: [0..100, -128..127, -128..127]
    /// - Grayscale: [0..255]
    /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
    required List<double> values,
  }) = _AdobeColorSwatchColor;

  factory AdobeColorSwatchColor.fromJson(Map<String, dynamic> json) =>
      _$AdobeColorSwatchColorFromJson(json);
}

@freezed
class AdobeColorSwatch with _$AdobeColorSwatch {
  const factory AdobeColorSwatch({
    required int version,
    required List<AdobeColorSwatchColor> colors,
  }) = _AdobeColorSwatch;

  factory AdobeColorSwatch.fromJson(Map<String, dynamic> json) =>
      _$AdobeColorSwatchFromJson(json);
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

AdobeColorSwatch decodeAdobeColorSwatch(File file) {
  final bytes = file.readAsBytesSync();
  final buffer = ByteDataReader()..add(bytes);

  final version = buffer.readUint16();
  if (version != supportedAdobeColorSwatchVersion) {
    throw StateError(
      'Unsupported version: $version. Supported version: $supportedAdobeColorSwatchVersion',
    );
  }

  final colorsCount = buffer.readUint16();
  final colors = <AdobeColorSwatchColor>[];
  for (var i = 0; i < colorsCount; i++) {
    final colorSpace = buffer.readUint16();
    final w = buffer.readUint16();
    final x = buffer.readUint16();
    final y = buffer.readUint16();
    final z = buffer.readUint16();

    final colorSpaceAsEnum = _readColorSpace[colorSpace];
    if (colorSpaceAsEnum == null) {
      throw StateError('Unsupported color space: $colorSpace');
    }

    final values = <double>[];
    switch (colorSpaceAsEnum) {
      case AdobeColorSwatchColorSpace.rgb:
        values.addAll([
          w / _maxUInt16 * 255, // r
          x / _maxUInt16 * 255, // g
          y / _maxUInt16 * 255, // b
        ]);
        break;
      case AdobeColorSwatchColorSpace.hsb:
        values.addAll([
          w / _maxUInt16 * 360, // h
          x / _maxUInt16 * 100, // s
          y / _maxUInt16 * 100, // b
        ]);
        break;
      case AdobeColorSwatchColorSpace.cmyk:
        values.addAll([
          100 - w / _maxUInt16 * 100, // c
          100 - x / _maxUInt16 * 100, // m
          100 - y / _maxUInt16 * 100, // y
          100 - z / _maxUInt16 * 100, // k
        ]);
        break;
      case AdobeColorSwatchColorSpace.lab:
        values.addAll([
          w / 100, // l
          if (x > 12700) (x - _maxUInt16) / 100 else x / 100, // a
          if (y > 12700) (y - _maxUInt16) / 100 else y / 100, // b
        ]);
        break;
      case AdobeColorSwatchColorSpace.grayscale:
        values.addAll([
          w / 10000 * 100, // gray
        ]);
        break;
      case AdobeColorSwatchColorSpace.wideCmyk:
        values.addAll([
          w / 10000 * 100, // c
          x / 10000 * 100, // m
          y / 10000 * 100, // y
          z / 10000 * 100, // k
        ]);
        break;
    }
    colors.add(
      AdobeColorSwatchColor(
        colorSpace: colorSpaceAsEnum,
        values: values,
      ),
    );
  }

  return AdobeColorSwatch(
    version: version,
    colors: colors,
  );
}

void encodeAdobeColorSwatch(AdobeColorSwatch swatch, File file) {
  final buffer = ByteDataWriter();
  // version
  buffer.writeUint16(swatch.version);
  // colors length
  buffer.writeUint16(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
    // color space
    final colorSpace = _writeColorSpace[color.colorSpace];
    if (colorSpace == null) {
      throw StateError('Unsupported color space: ${color.colorSpace}');
    }
    buffer.writeUint16(colorSpace);
    // color values
    switch (color.colorSpace) {
      case AdobeColorSwatchColorSpace.rgb:
        buffer.writeUint16((color.values[0] / 255 * _maxUInt16).round()); // w
        buffer.writeUint16((color.values[1] / 255 * _maxUInt16).round()); // x
        buffer.writeUint16((color.values[2] / 255 * _maxUInt16).round()); // y
        buffer.writeUint16(0); // z
        break;
      case AdobeColorSwatchColorSpace.hsb:
        buffer.writeUint16((color.values[0] / 360 * _maxUInt16).round()); // w
        buffer.writeUint16((color.values[1] / 100 * _maxUInt16).round()); // x
        buffer.writeUint16((color.values[2] / 100 * _maxUInt16).round()); // y
        buffer.writeUint16(0); // z
        break;
      case AdobeColorSwatchColorSpace.cmyk:
        buffer.writeUint16(
          (100 - color.values[0] / 100 * _maxUInt16).round(),
        ); // w
        buffer.writeUint16(
          (100 - color.values[1] / 100 * _maxUInt16).round(),
        ); // x
        buffer.writeUint16(
          (100 - color.values[2] / 100 * _maxUInt16).round(),
        ); // y
        buffer.writeUint16(
          (100 - color.values[3] / 100 * _maxUInt16).round(),
        ); // z
        break;
      case AdobeColorSwatchColorSpace.lab:
        buffer.writeUint16((color.values[0] * 100).round()); // w
        buffer.writeUint16((color.values[1] * 100).round()); // x
        buffer.writeUint16((color.values[2] * 100).round()); // y
        buffer.writeUint16(0); // z
        break;
      case AdobeColorSwatchColorSpace.grayscale:
        buffer.writeUint16((color.values[0] / 100 * 10000).round()); // w
        buffer.writeUint16(0); // x
        buffer.writeUint16(0); // y
        buffer.writeUint16(0); // z
        break;
      case AdobeColorSwatchColorSpace.wideCmyk:
        buffer.writeUint16((color.values[0] / 100 * 10000).round()); // w
        buffer.writeUint16((color.values[1] / 100 * 10000).round()); // x
        buffer.writeUint16((color.values[2] / 100 * 10000).round()); // y
        buffer.writeUint16((color.values[3] / 100 * 10000).round()); // z
        break;
    }
    // write file
    final bytes = buffer.toBytes();
    file.writeAsBytesSync(bytes);
  }
}
