part of 'acb.dart';

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
        // HSB values seem to be stored differently or require specific conversion
        // For now, we skip adding values for HSB
        break;
      case _colorSpaceCmyk:
        values.addAll([
          ((255 - rawValues[0]) / 2.55 + 0.5).round(),
          ((255 - rawValues[1]) / 2.55 + 0.5).round(),
          ((255 - rawValues[2]) / 2.55 + 0.5).round(),
          ((255 - rawValues[3]) / 2.55 + 0.5).round(),
        ]);
      case _colorSpacePantone:
      case _colorSpaceFocoltone:
      case _colorSpaceTrumatch:
      case _colorSpaceToyo:
      case _colorSpaceGrayscale:
      case _colorSpaceHks:
        // Values for these color spaces might need specific handling
        // For now, we skip adding values
        break;
      case _colorSpaceLab:
        values.addAll([
          (rawValues[0] / 2.55 + 0.5).round(),
          rawValues[1] - 128,
          rawValues[2] - 128,
        ]);
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
