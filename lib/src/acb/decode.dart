part of 'acb.dart';

/// Decodes an Adobe Color Book from a byte array
AdobeColorBook _decode(List<int> bytes) {
  final buffer = ByteDataReader()..add(bytes);

  _validateHeader(buffer);
  _validateVersion(buffer);
  final identifier = buffer.readUint16();

  final metadata = _readMetadata(buffer);
  final properties = _readProperties(buffer);

  final colors = _readColors(
    buffer,
    properties.colorCount,
    properties.colorSpace,
    properties.colorSpace.channels,
  );

  return AdobeColorBook(
    identifier: identifier,
    title: metadata.title,
    description: metadata.description,
    colorNamePrefix: metadata.prefix,
    colorNameSuffix: metadata.suffix,
    colorCount: properties.colorCount,
    pageSize: properties.pageSize,
    pageSelectorOffset: properties.pageSelectorOffset,
    colorSpace: properties.colorSpace,
    colors: colors,
  );
}

/// Validates the file header to ensure it's a valid Adobe Color Book file
void _validateHeader(ByteDataReader buffer) {
  final header = readUtf8String(buffer, 4);
  if (header != AdobeColorBook.fileSignature) {
    throw FormatException(
      '''
Not a valid Adobe Color Book file: expected ${AdobeColorBook.fileSignature} but got $header''',
    );
  }
}

/// Reads and validates the version of the Adobe Color Book
void _validateVersion(ByteDataReader buffer) {
  final version = buffer.readUint16();
  if (version != AdobeColorBook.version) {
    throw UnsupportedError('''
Unsupported version $version. Supported version: ${AdobeColorBook.version}''');
  }
}

/// Reads the metadata of an Adobe Color Book
_AcbMetadata _readMetadata(ByteDataReader buffer) {
  final title = readPascalUtf16String(buffer);
  final prefix = readPascalUtf16String(buffer);
  final suffix = readPascalUtf16String(buffer);
  final description = readPascalUtf16String(buffer);

  return _AcbMetadata(
    title: title,
    prefix: prefix,
    suffix: suffix,
    description: description,
  );
}

/// Reads the properties of an Adobe Color Book
_AcbProperties _readProperties(ByteDataReader buffer) {
  final colorCount = buffer.readUint16();
  final pageSize = buffer.readUint16();
  final pageSelectorOffset = buffer.readUint16();
  final colorSpaceValue = buffer.readUint16();
  final colorSpace = AdobeColorBookColorSpace.fromValue(colorSpaceValue);

  return _AcbProperties(
    colorCount: colorCount,
    pageSize: pageSize,
    pageSelectorOffset: pageSelectorOffset,
    colorSpace: colorSpace,
  );
}

/// Reads all colors from the Adobe Color Book
List<AdobeColorBookColor> _readColors(
  ByteDataReader buffer,
  int colorCount,
  AdobeColorBookColorSpace colorSpace,
  int channels,
) {
  return List.generate(
    colorCount,
    (i) => _readSingleColor(buffer, colorSpace, channels),
  );
}

/// Reads a single color from the Adobe Color Book
AdobeColorBookColor _readSingleColor(
  ByteDataReader buffer,
  AdobeColorBookColorSpace colorSpace,
  int channels,
) {
  final colorName = readPascalUtf16String(buffer);
  final colorCode = readUtf8String(buffer, 6);

  final rawValues = buffer.read(channels);
  // Use the converter function attached to the enum instance
  final values = colorSpace.convertColorValues(rawValues);

  return AdobeColorBookColor(name: colorName, code: colorCode, values: values);
}

// --- Color Value Conversion Functions ---

/// Default converter for unsupported/unhandled color spaces.
List<int> _unsupportedConversion(List<int> rawValues) {
  // For now, return an empty list for unsupported types.
  // Consider logging a warning or throwing an error based on desired behavior.
  return [];
}

/// Converts RGB values (no conversion needed, returns a copy).
List<int> _convertRgbValues(List<int> rawValues) {
  return List<int>.from(rawValues);
}

/// Converts HSB values (currently unsupported).
List<int> _convertHsbValues(List<int> rawValues) {
  // HSB values seem to be stored differently or require specific conversion.
  return _unsupportedConversion(rawValues); // Delegate to unsupported handler
}

/// Converts CMYK values from Adobe's format to standard 0-100 range.
List<int> _convertCmykValues(List<int> rawValues) {
  const cmykConversionFactor = 2.55; // 255 / 100

  // Adobe stores CMYK as 0-255 (inverted), convert to 0-100.
  return [
    ((255 - rawValues[0]) / cmykConversionFactor + 0.5).round(), // C
    ((255 - rawValues[1]) / cmykConversionFactor + 0.5).round(), // M
    ((255 - rawValues[2]) / cmykConversionFactor + 0.5).round(), // Y
    ((255 - rawValues[3]) / cmykConversionFactor + 0.5).round(), // K
  ];
}

/// Converts LAB values from Adobe's format to standard LAB ranges.
List<int> _convertLabValues(List<int> rawValues) {
  const labLightnessConversionFactor = 2.55; // 255 / 100
  const labComponentOffset = 128; // Offset for a* and b* components

  // Adobe stores L as 0-255, a* and b* as 0-255 (offset by 128).
  // Convert L to 0-100, a* and b* to -128 to 127.
  return [
    (rawValues[0] / labLightnessConversionFactor + 0.5).round(), // L* (0-100)
    rawValues[1] - labComponentOffset, // a* (-128 to 127)
    rawValues[2] - labComponentOffset, // b* (-128 to 127)
  ];
}
