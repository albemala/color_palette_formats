part of 'aco.dart';

AdobeColorSwatch _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  _validateVersion(buffer);

  final colorsCount = buffer.readUint16();
  final colors = <AdobeColorSwatchColor>[];
  for (var i = 0; i < colorsCount; i++) {
    final colorSpaceValue = buffer.readUint16();
    final w = buffer.readUint16();
    final x = buffer.readUint16();
    final y = buffer.readUint16();
    final z = buffer.readUint16();

    final AdobeColorSwatchColorSpace colorSpace;
    try {
      colorSpace = AdobeColorSwatchColorSpace.fromValue(colorSpaceValue);
    } catch (e) {
      throw FormatException('Unsupported color space value: $colorSpaceValue');
    }

    final colorValues = switch (colorSpace) {
      AdobeColorSwatchColorSpace.rgb => _readRgbColor(w, x, y),
      AdobeColorSwatchColorSpace.hsb => _readHsbColor(w, x, y),
      AdobeColorSwatchColorSpace.cmyk => _readCmykColor(w, x, y, z),
      AdobeColorSwatchColorSpace.lab => _readLabColor(w, x, y),
      AdobeColorSwatchColorSpace.grayscale => _readGrayscaleColor(w),
      AdobeColorSwatchColorSpace.wideCmyk => _readWideCmykColor(w, x, y, z),
    };
    colors.add(
      AdobeColorSwatchColor(colorSpace: colorSpace, values: colorValues),
    );
  }

  return AdobeColorSwatch(colors: colors);
}

void _validateVersion(ByteDataReader buffer) {
  final version = buffer.readUint16();
  if (version != AdobeColorSwatch.validVersion) {
    throw FormatException(
      '''
Unsupported version: $version. Supported version: ${AdobeColorSwatch.validVersion}''',
    );
  }
}

List<int> _readRgbColor(int r, int g, int b) {
  return [
    (r / _maxUInt16 * 255).round(),
    (g / _maxUInt16 * 255).round(),
    (b / _maxUInt16 * 255).round(),
  ];
}

List<int> _readHsbColor(int h, int s, int b) {
  return [
    (h / _maxUInt16 * 360).round(),
    (s / _maxUInt16 * 100).round(),
    (b / _maxUInt16 * 100).round(),
  ];
}

List<int> _readCmykColor(int c, int m, int y, int k) {
  return [
    (100 - c / _maxUInt16 * 100).round(),
    (100 - m / _maxUInt16 * 100).round(),
    (100 - y / _maxUInt16 * 100).round(),
    (100 - k / _maxUInt16 * 100).round(),
  ];
}

List<int> _readLabColor(int l, int aVal, int bVal) {
  final aValCalc = aVal > 12700 ? (aVal - _maxUInt16) / 100 : aVal / 100;
  final bValCalc = bVal > 12700 ? (bVal - _maxUInt16) / 100 : bVal / 100;

  return [(l / 100).round(), aValCalc.round(), bValCalc.round()];
}

List<int> _readGrayscaleColor(int gray) {
  return [(gray / 10000 * 100).round()];
}

List<int> _readWideCmykColor(int c, int m, int y, int k) {
  return [
    (c / 10000 * 100).round(),
    (m / 10000 * 100).round(),
    (y / 10000 * 100).round(),
    (k / 10000 * 100).round(),
  ];
}
