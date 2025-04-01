part of 'aco.dart';

AdobeColorSwatch _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  final version = buffer.readUint16();
  if (version != supportedAdobeColorSwatchVersion) {
    throw Exception('''
Unsupported version: $version. Supported version: $supportedAdobeColorSwatchVersion''');
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
      throw Exception('Unsupported color space: $colorSpace');
    }

    final values = <double>[];
    switch (colorSpaceAsEnum) {
      case AdobeColorSwatchColorSpace.rgb:
        values.addAll([
          w / _maxUInt16 * 255, // r
          x / _maxUInt16 * 255, // g
          y / _maxUInt16 * 255, // b
        ]);
      case AdobeColorSwatchColorSpace.hsb:
        values.addAll([
          w / _maxUInt16 * 360, // h
          x / _maxUInt16 * 100, // s
          y / _maxUInt16 * 100, // b
        ]);
      case AdobeColorSwatchColorSpace.cmyk:
        values.addAll([
          100 - w / _maxUInt16 * 100, // c
          100 - x / _maxUInt16 * 100, // m
          100 - y / _maxUInt16 * 100, // y
          100 - z / _maxUInt16 * 100, // k
        ]);
      case AdobeColorSwatchColorSpace.lab:
        values.addAll([
          w / 100, // l
          if (x > 12700) (x - _maxUInt16) / 100 else x / 100, // a
          if (y > 12700) (y - _maxUInt16) / 100 else y / 100, // b
        ]);
      case AdobeColorSwatchColorSpace.grayscale:
        values.addAll([
          w / 10000 * 100, // gray
        ]);
      case AdobeColorSwatchColorSpace.wideCmyk:
        values.addAll([
          w / 10000 * 100, // c
          x / 10000 * 100, // m
          y / 10000 * 100, // y
          z / 10000 * 100, // k
        ]);
    }
    colors.add(
      AdobeColorSwatchColor(
        colorSpace: colorSpaceAsEnum,
        values: values.map((value) => value.round()).toList(),
      ),
    );
  }

  return AdobeColorSwatch(
    version: version,
    colors: colors,
  );
}
