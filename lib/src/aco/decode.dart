part of 'aco.dart';

AdobeColorSwatch _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  final version = buffer.readUint16();
  if (!AdobeColorSwatch.validVersions.contains(version)) {
    throw FormatException(
      '''
Unsupported version: $version. Supported versions: ${AdobeColorSwatch.validVersions}''',
    );
  }

  // Standalone version 2 file.
  if (version == AdobeColorSwatch.version2) {
    final colorsCount = buffer.readUint16();
    final colors = _readV2Colors(buffer, colorsCount);
    return AdobeColorSwatch(colors: colors);
  }

  // Version 1 section.
  final v1Count = buffer.readUint16();
  final v1Colors = _readV1Colors(buffer, v1Count);

  // Version 1 files are followed by the version 2 section with names.
  if (buffer.remainingLength >= 4) {
    final v2Version = buffer.readUint16();
    if (v2Version == AdobeColorSwatch.version2) {
      final v2Count = buffer.readUint16();
      final v2Colors = _readV2Colors(buffer, v2Count);
      return AdobeColorSwatch(colors: v2Colors);
    }
    throw FormatException(
      'Invalid trailing section version: $v2Version. Expected version 2.',
    );
  }

  return AdobeColorSwatch(colors: v1Colors);
}

void _validateVersion(ByteDataReader buffer) {
  final version = buffer.readUint16();
  if (!AdobeColorSwatch.validVersions.contains(version)) {
    throw FormatException(
      '''
Unsupported version: $version. Supported versions: ${AdobeColorSwatch.validVersions}''',
    );
  }
}

List<AdobeColorSwatchColor> _readV1Colors(
  ByteDataReader buffer,
  int colorsCount,
) {
  final colors = <AdobeColorSwatchColor>[];
  for (var i = 0; i < colorsCount; i++) {
    colors.add(_readV1Color(buffer));
  }
  return colors;
}

AdobeColorSwatchColor _readV1Color(ByteDataReader buffer) {
  final colorSpaceValue = buffer.readUint16();
  final w = buffer.readUint16();
  final x = buffer.readUint16();
  final y = buffer.readUint16();
  final z = buffer.readUint16();

  final colorSpace = _parseColorSpace(colorSpaceValue);
  final colorValues = _parseColorValues(colorSpace, w, x, y, z);
  return AdobeColorSwatchColor(colorSpace: colorSpace, values: colorValues);
}

List<AdobeColorSwatchColor> _readV2Colors(
  ByteDataReader buffer,
  int colorsCount,
) {
  final colors = <AdobeColorSwatchColor>[];
  for (var i = 0; i < colorsCount; i++) {
    final colorSpaceValue = buffer.readUint16();
    final w = buffer.readUint16();
    final x = buffer.readUint16();
    final y = buffer.readUint16();
    final z = buffer.readUint16();
    final name = _readUnicodeString(buffer);

    final colorSpace = _parseColorSpace(colorSpaceValue);
    final colorValues = _parseColorValues(colorSpace, w, x, y, z);
    colors.add(
      AdobeColorSwatchColor(
        colorSpace: colorSpace,
        values: colorValues,
        name: name,
      ),
    );
  }
  return colors;
}

AdobeColorSwatchColorSpace _parseColorSpace(int colorSpaceValue) {
  try {
    return AdobeColorSwatchColorSpace.fromValue(colorSpaceValue);
  } catch (_) {
    throw FormatException('Unsupported color space value: $colorSpaceValue');
  }
}

List<int> _parseColorValues(
  AdobeColorSwatchColorSpace colorSpace,
  int w,
  int x,
  int y,
  int z,
) {
  return switch (colorSpace) {
    AdobeColorSwatchColorSpace.rgb => _readRgbColor(w, x, y),
    AdobeColorSwatchColorSpace.hsb => _readHsbColor(w, x, y),
    AdobeColorSwatchColorSpace.cmyk => _readCmykColor(w, x, y, z),
    AdobeColorSwatchColorSpace.lab => _readLabColor(w, x, y),
    AdobeColorSwatchColorSpace.grayscale => _readGrayscaleColor(w),
    AdobeColorSwatchColorSpace.wideCmyk => _readWideCmykColor(w, x, y, z),
  };
}

/// Reads a version 2 color name: 32-bit length (UTF-16 code units,
/// including the null terminator) followed by UTF-16BE.
String _readUnicodeString(ByteDataReader buffer) {
  final length = buffer.readUint32();
  if (length == 0) {
    return '';
  }
  final codeUnits = List<int>.generate(length, (_) => buffer.readUint16());
  // Strip the null terminator.
  if (codeUnits.isNotEmpty && codeUnits.last == 0) {
    codeUnits.removeLast();
  }
  return String.fromCharCodes(codeUnits);
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
