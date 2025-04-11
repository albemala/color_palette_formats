part of 'ase.dart';

AdobeSwatchExchange _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  _validateHeader(buffer);
  _validateVersion(buffer);

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
        // throw FormatException('Unknown block type: $blockType');
        // print('Unknown block type: $blockType');
        // read the block data and ignore it
        buffer.read(blockLength);
    }
  }

  return AdobeSwatchExchange(groups: groups, colors: colors);
}

void _validateHeader(ByteDataReader buffer) {
  final header = readUtf8String(buffer, 4);
  if (header != AdobeSwatchExchange.validFileSignature) {
    throw const FormatException('''
Not a valid Adobe Swatch Exchange file''');
  }
}

void _validateVersion(ByteDataReader buffer) {
  final version = [buffer.readInt16(), buffer.readInt16()].join('.');
  if (version != AdobeSwatchExchange.validVersion) {
    throw UnsupportedError(
      '''
Unsupported version $version. Supported version: ${AdobeSwatchExchange.validVersion}''',
    );
  }
}

AdobeSwatchExchangeColor _decodeColor(ByteDataReader buffer) {
  final colorName = _decodeName(buffer);

  final colorModelString = readUtf8String(buffer, 4);
  final colorModel = AdobeSwatchExchangeColorModel.fromValue(colorModelString);

  final colorValues = <double>[];
  switch (colorModel) {
    case AdobeSwatchExchangeColorModel.cmyk:
      colorValues.add(buffer.readFloat32()); // cyan
      colorValues.add(buffer.readFloat32()); // magenta
      colorValues.add(buffer.readFloat32()); // yellow
      colorValues.add(buffer.readFloat32()); // key
    case AdobeSwatchExchangeColorModel.rgb:
      colorValues.add(buffer.readFloat32()); // red
      colorValues.add(buffer.readFloat32()); // green
      colorValues.add(buffer.readFloat32()); // blue
    case AdobeSwatchExchangeColorModel.gray:
      colorValues.add(buffer.readFloat32()); // gray
  }

  final colorTypeRawValue = buffer.readInt16();
  final colorType = AdobeSwatchExchangeColorType.fromValue(colorTypeRawValue);

  return AdobeSwatchExchangeColor(
    name: colorName,
    model: colorModel,
    values: colorValues,
    type: colorType,
  );
}

String _decodeName(ByteDataReader buffer) {
  final nameLengthIncludingTerminator = buffer.readInt16();
  return readUtf16String(
    buffer,
    nameLengthIncludingTerminator,
    includingTerminator: true,
  );
}
