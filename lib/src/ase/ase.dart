import 'dart:io';

import 'package:buffer/buffer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palettes/src/utils.dart';

part 'ase.freezed.dart';
part 'ase.g.dart';

/*
* Adobe Swatch Exchange (ASE) (.ase)
*
* References:
* - http://www.selapa.net/swatches/colors/fileformats.php
*/

const supportedAdobeSwatchExchangeVersion = '1.0';

enum AdobeSwatchExchangeColorModel {
  rgb,
  cmyk,
  gray,
}

enum AdobeSwatchExchangeColorType {
  global,
  spot,
  normal,
}

@freezed
class AdobeSwatchExchangeColor with _$AdobeSwatchExchangeColor {
  const factory AdobeSwatchExchangeColor({
    @Default('') //
        String name,
    required AdobeSwatchExchangeColorModel model,

    /// Color values are in the range [0..1]
    required List<double> values,
    @Default(AdobeSwatchExchangeColorType.global) //
        AdobeSwatchExchangeColorType type,
  }) = _AdobeSwatchExchangeColor;

  factory AdobeSwatchExchangeColor.fromJson(Map<String, dynamic> json) =>
      _$AdobeSwatchExchangeColorFromJson(json);
}

@freezed
class AdobeSwatchExchange with _$AdobeSwatchExchange {
  const factory AdobeSwatchExchange({
    required String version,
    @Default([]) //
        List<dynamic> groups,
    required List<AdobeSwatchExchangeColor> colors,
  }) = _AdobeSwatchExchange;

  factory AdobeSwatchExchange.fromJson(Map<String, dynamic> json) =>
      _$AdobeSwatchExchangeFromJson(json);
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

AdobeSwatchExchange decodeAdobeSwatchExchange(File file) {
  final bytes = file.readAsBytesSync();
  final buffer = ByteDataReader()..add(bytes);

  final header = readUtf8String(buffer, 4);
  if (header != _fileSignature) {
    throw Exception('Not a valid Adobe Swatch Exchange file');
  }

  final version = [
    buffer.readInt16(),
    buffer.readInt16(),
  ].join('.');
  if (version != supportedAdobeSwatchExchangeVersion) {
    throw Exception(
      'Unsupported version $version. Supported version: $supportedAdobeSwatchExchangeVersion',
    );
  }

  final groups = <dynamic>[];
  final colors = <AdobeSwatchExchangeColor>[];

  final blocksCount = buffer.readInt32();
  for (var i = 0; i < blocksCount; i++) {
    final blockType = buffer.readInt16();
    final blockLength = buffer.readInt32();
    switch (blockType) {
      case _blockTypeColor:
        final nameLengthIncludingTerminator = buffer.readInt16();
        final name = readUtf16String(
          buffer,
          nameLengthIncludingTerminator,
          includingTerminator: true,
        );
        final model = readUtf8String(buffer, 4);
        final values = <double>[];
        switch (model) {
          case _colorModelCmyk:
            values.add(buffer.readFloat32()); // cyan
            values.add(buffer.readFloat32()); // magenta
            values.add(buffer.readFloat32()); // yellow
            values.add(buffer.readFloat32()); // key
            break;
          case _colorModelRgb:
            values.add(buffer.readFloat32()); // red
            values.add(buffer.readFloat32()); // green
            values.add(buffer.readFloat32()); // blue
            break;
          case _colorModelGrayscale:
            values.add(buffer.readFloat32()); // gray
            break;
          default:
            throw Exception('Unknown color model: $model');
        }
        final type = buffer.readInt16();

        final modelAsEnum = _readColorModel[model];
        if (modelAsEnum == null) {
          throw Exception('Unknown color model: $model');
        }
        final typeAsEnum = _readColorType[type];
        if (typeAsEnum == null) {
          throw Exception('Unknown color type: $type');
        }
        colors.add(
          AdobeSwatchExchangeColor(
            name: name,
            model: modelAsEnum,
            values: values,
            type: typeAsEnum,
          ),
        );
        break;
      case _blockTypeGroupStart:
        final nameLengthIncludingTerminator = buffer.readInt16();
        final name = readUtf16String(
          buffer,
          nameLengthIncludingTerminator,
          includingTerminator: true,
        );
        break;
      case _blockTypeGroupEnd:
        break;
      default:
        throw Exception('Unknown block type: $blockType');
    }
  }

  return AdobeSwatchExchange(
    version: version,
    groups: groups,
    colors: colors,
  );
}

void encodeAdobeSwatchExchange(AdobeSwatchExchange swatch, File file) {
  final buffer = ByteDataWriter();
  // file signature
  writeUtf8String(buffer, _fileSignature);
  // version
  supportedAdobeSwatchExchangeVersion.split('.').forEach((part) {
    buffer.writeUint16(int.parse(part));
  });
  // colors length
  buffer.writeInt32(swatch.colors.length);
  // colors
  for (final color in swatch.colors) {
    // start color block
    buffer.writeInt16(_blockTypeColor);
    // use separate buffer, so we know the length
    final colorBuffer = ByteDataWriter();
    // color name length including terminator
    colorBuffer.writeInt16(color.name.length + 1);
    // color name
    writeUtf16String(colorBuffer, color.name, includeTerminator: true);
    // color model
    final model = _writeColorModel[color.model];
    if (model == null) {
      throw Exception('Unknown color model: ${color.model}');
    }
    writeUtf8String(colorBuffer, model);
    // color values
    switch (color.model) {
      case AdobeSwatchExchangeColorModel.cmyk:
        colorBuffer.writeFloat32(color.values[0]); // cyan
        colorBuffer.writeFloat32(color.values[1]); // magenta
        colorBuffer.writeFloat32(color.values[2]); // yellow
        colorBuffer.writeFloat32(color.values[3]); // key
        break;
      case AdobeSwatchExchangeColorModel.rgb:
        colorBuffer.writeFloat32(color.values[0]); // red
        colorBuffer.writeFloat32(color.values[1]); // green
        colorBuffer.writeFloat32(color.values[2]); // blue
        break;
      case AdobeSwatchExchangeColorModel.gray:
        colorBuffer.writeFloat32(color.values[0]); // gray
        break;
    }
    // color type
    final type = _writeColorType[color.type];
    if (type == null) {
      throw Exception('Unknown color type: ${color.type}');
    }
    colorBuffer.writeInt16(type);
    // block length
    buffer.writeInt32(colorBuffer.bufferLength);
    // block data
    buffer.write(colorBuffer.toBytes());
  }
  // write file
  final bytes = buffer.toBytes();
  file.writeAsBytesSync(bytes);
}
