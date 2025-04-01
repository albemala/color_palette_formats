part of 'ase.dart';

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
