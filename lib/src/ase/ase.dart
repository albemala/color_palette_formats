import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'ase.mapper.dart';

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

AdobeSwatchExchange _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  final header = readUtf8String(buffer, 4);
  if (header != _fileSignature) {
    throw Exception('Not a valid Adobe Swatch Exchange file');
  }
  // print('Header: $header');

  final version = [
    buffer.readInt16(),
    buffer.readInt16(),
  ].join('.');
  if (version != supportedAdobeSwatchExchangeVersion) {
    throw Exception('''
Unsupported version $version. Supported version: $supportedAdobeSwatchExchangeVersion''');
  }
  // print('Version: $version');

  final groups = <dynamic>[];
  final colors = <AdobeSwatchExchangeColor>[];

  final blocksCount = buffer.readInt32();
  // print('Blocks count: $blocksCount');
  for (var i = 0; i < blocksCount; i++) {
    final blockType = buffer.readInt16();
    // print('Block type: $blockType');
    // ignore: unused_local_variable
    final blockLength = buffer.readInt32();
    // print('Block length: $blockLength');
    switch (blockType) {
      case _blockTypeColor:
        final color = _decodeColor(buffer);
        // print('Color: $color');
        colors.add(color);
      case _blockTypeGroupStart:
        // ignore: unused_local_variable
        final name = _decodeName(buffer);
      // print('Group name: $name');
      case _blockTypeGroupEnd:
        break;
      default:
        // throw Exception('Unknown block type: $blockType');
        // print('Unknown block type: $blockType');
        // read the block data and ignore it
        buffer.read(blockLength);
    }
  }

  return AdobeSwatchExchange(
    version: version,
    groups: groups,
    colors: colors,
  );
}

AdobeSwatchExchangeColor _decodeColor(ByteDataReader buffer) {
  final name = _decodeName(buffer);
  final model = readUtf8String(buffer, 4);
  final values = <double>[];
  switch (model) {
    case _colorModelCmyk:
      values.add(buffer.readFloat32()); // cyan
      values.add(buffer.readFloat32()); // magenta
      values.add(buffer.readFloat32()); // yellow
      values.add(buffer.readFloat32()); // key
    case _colorModelRgb:
      values.add(buffer.readFloat32()); // red
      values.add(buffer.readFloat32()); // green
      values.add(buffer.readFloat32()); // blue
    case _colorModelGrayscale:
      values.add(buffer.readFloat32()); // gray
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
  final color = AdobeSwatchExchangeColor(
    name: name,
    model: modelAsEnum,
    values: values,
    type: typeAsEnum,
  );
  return color;
}

String _decodeName(ByteDataReader buffer) {
  final nameLengthIncludingTerminator = buffer.readInt16();
  return readUtf16String(
    buffer,
    nameLengthIncludingTerminator,
    includingTerminator: true,
  );
}

List<int> _encode(AdobeSwatchExchange swatch) {
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
      case AdobeSwatchExchangeColorModel.rgb:
        colorBuffer.writeFloat32(color.values[0]); // red
        colorBuffer.writeFloat32(color.values[1]); // green
        colorBuffer.writeFloat32(color.values[2]); // blue
      case AdobeSwatchExchangeColorModel.gray:
        colorBuffer.writeFloat32(color.values[0]); // gray
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
  return buffer.toBytes();
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
