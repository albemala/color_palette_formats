part of 'ase.dart';

AdobeSwatchExchange _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  try {
    return _decodeBody(buffer);
  } catch (e) {
    // Reads past the end of truncated input surface as RangeError or
    // StateError from the byte buffer; report them as malformed files
    // instead. Other errors (FormatException, UnsupportedError) pass
    // through untouched.
    if (e is RangeError || e is StateError) {
      throw const FormatException(
        'Not a valid Adobe Swatch Exchange file: truncated input.',
      );
    }
    rethrow;
  }
}

AdobeSwatchExchange _decodeBody(ByteDataReader buffer) {
  _validateHeader(buffer);
  _validateVersion(buffer);

  final groups = <dynamic>[];
  final colors = <AdobeSwatchExchangeColor>[];

  final blocksCount = buffer.readInt32();
  if (blocksCount < 0) {
    throw FormatException(
      'Not a valid Adobe Swatch Exchange file. '
      'Invalid blocks count: $blocksCount.',
    );
  }
  for (var i = 0; i < blocksCount; i++) {
    final blockType = buffer.readInt16();
    // Block lengths are deliberately ignored for known block types:
    // records are parsed sequentially instead. Some files in the wild
    // state bogus lengths (e.g. blue.ase states 128 for every color
    // block); honoring them would misalign the parse.
    // ignore: unused_local_variable
    final blockLength = buffer.readInt32();
    switch (blockType) {
      case _blockTypeColor:
        final color = _decodeColor(buffer);
        colors.add(color);
      case _blockTypeGroupStart:
        // Group names are skipped; grouped colors decode into [colors].
        // ignore: unused_local_variable
        final name = _decodeName(buffer);
      case _blockTypeGroupEnd:
        break;
      default:
        // Unknown block type: skip its data for forward compatibility.
        buffer.read(blockLength);
    }
  }

  return AdobeSwatchExchange(groups: groups, colors: colors);
}

void _validateHeader(ByteDataReader buffer) {
  final header = readUtf8String(buffer, 4);
  if (header != AdobeSwatchExchange.validFileSignature) {
    throw const FormatException('Not a valid Adobe Swatch Exchange file');
  }
}

void _validateVersion(ByteDataReader buffer) {
  final version = [buffer.readInt16(), buffer.readInt16()].join('.');
  if (version != AdobeSwatchExchange.validVersion) {
    throw UnsupportedError(
      'Unsupported version $version. '
      'Supported version: ${AdobeSwatchExchange.validVersion}',
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
    case AdobeSwatchExchangeColorModel.lab:
      colorValues.add(buffer.readFloat32()); // L
      colorValues.add(buffer.readFloat32()); // A
      colorValues.add(buffer.readFloat32()); // B
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
