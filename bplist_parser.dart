import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';

// part 'acb.mapper.dart';

// @MappableClass()
class SimplePalette /*with SimplePaletteMappable*/ {
  final int version;
  final String name;
  final List<SimpleColor> colors;

  SimplePalette({
    required this.version,
    required this.name,
    required this.colors,
  });

  @override
  String toString() {
    return 'SimplePalette{version: $version, name: $name, colors: $colors}';
  }
}

// @MappableClass()
class SimpleColor /*with SimpleColorMappable*/ {
  final String name;
  final List<double> values;
  final int colorSpace;

  SimpleColor({
    required this.name,
    required this.values,
    required this.colorSpace,
  });

  @override
  String toString() {
    return 'SimpleColor{name: $name, values: $values, colorSpace: $colorSpace}';
  }
}

const _colorSpaceRgb = 1;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a file path as an argument.');
    return;
  }

  final filePath = arguments[0];

  final data = File(filePath).readAsBytesSync();
  final result = parseBinaryPlist(data);

  final map = Map<String, dynamic>.from(result as Map<dynamic, dynamic>);

  final palette = _extractSimplePalette(filePath, map);
  print(palette);
}

SimplePalette _extractSimplePalette(
  String filePath,
  Map<String, dynamic> map,
) {
  final version = _extractVersion(map);
  final paletteName = basenameWithoutExtension(filePath);
  final objects = _extractObjects(map);
  final extractedStrings = _extractStrings(objects);
  final extractedMaps = _extractMaps(objects);
  final colors = _extractColors(extractedMaps);

  final colorNames = extractedStrings;
  final colorValues = colors;
  if (colorNames.length != colorValues.length) {
    throw Exception('Mismatch between color names and color values');
  }

  final simpleColors = List<SimpleColor>.generate(
    colorNames.length,
    (index) => SimpleColor(
      name: colorNames[index],
      values: colorValues[index],
      colorSpace: _colorSpaceRgb,
    ),
  );

  return SimplePalette(
    version: version,
    name: paletteName,
    colors: simpleColors,
  );
}

int _extractVersion(Map<String, dynamic> map) {
  if (!map.containsKey(r'$version')) {
    throw Exception('Unable to extract version from the plist');
  }
  return map[r'$version'] as int;
}

List<dynamic> _extractObjects(Map<String, dynamic> map) {
  if (!map.containsKey(r'$objects')) {
    throw Exception('Unable to extract objects from the plist');
  }
  final objects = map[r'$objects'];
  if (objects is! List<dynamic>) {
    throw Exception('Objects in the plist are not in the expected format');
  }
  return objects;
}

List<String> _extractStrings(List<dynamic> objects) {
  return objects
      .whereType<String>()
      .where((str) => str != r'$null' && str.isNotEmpty)
      .toList();
}

List<Map<String, dynamic>> _extractMaps(List<dynamic> objects) {
  return objects
      .whereType<Map<dynamic, dynamic>>()
      .map(Map<String, dynamic>.from)
      .toList();
}

List<List<double>> _extractColors(List<Map<String, dynamic>> extractedMaps) {
  double parseDouble(String string) {
    return double.tryParse(string) ?? int.tryParse(string)?.toDouble() ?? 0;
  }

  final colors = <List<double>>[];
  for (final map in extractedMaps) {
    if (map.containsKey('NSComponents')) {
      final nsComponentsChars = map['NSComponents'];
      if (nsComponentsChars is List<int>) {
        final nsComponents = String.fromCharCodes(nsComponentsChars);
        final values = nsComponents.split(' ').map(parseDouble).toList();
        colors.add(values);
      }
    }
  }
  return colors;
}

dynamic parseBinaryPlist(Uint8List dataBytes) {
  // Only bplist00 format is supported
  if (String.fromCharCodes(dataBytes.getRange(0, 8)) != 'bplist00') {
    throw UnimplementedError('Invalid binary plist format');
  }

  // Extract trailer information from the last 32 bytes
  final trailerBytes = dataBytes.buffer.asByteData(dataBytes.length - 32);

  // Parse trailer information
  final offsetTableOffsetSize = trailerBytes.getUint8(6);
  final objectRefSize = trailerBytes.getUint8(7);
  final offsetTableStartPos = trailerBytes.getUint64(24);
  final startPos = trailerBytes.getUint64(16);

  // Create a _BinaryData object with parsed information
  final binaryData = _BinaryData(
    bytes: dataBytes,
    offsetTableOffsetSize: offsetTableOffsetSize,
    offsetTableStartPos: offsetTableStartPos,
    objectRefSize: objectRefSize,
  );

  // Get the starting position of the object
  final objectStartPos = _getObjectStartPosition(binaryData, startPos);

  // Handle the binary data starting from the object's position
  return _parseBinaryObject(binaryData, objectStartPos);
}

dynamic _parseBinaryObject(_BinaryData binary, int pos) {
  final byte = binary.bytes[pos];
  return switch (byte & 0xF0) {
    0x00 => _parseBoolObject(byte),
    0x10 => _parseIntegerObject(binary, byte, pos),
    0x20 => _parseRealObject(binary, byte, pos),
    0x30 => _parseDateObject(binary, pos),
    0x40 => _parseDataObject(binary, byte, pos),
    0x50 => _parseStringObject(binary, byte, pos),
    0x60 => _parseUnicodeObject(binary, byte, pos),
    0xA0 => _parseArrayObject(binary, byte, pos),
    0xD0 => _parseDictionaryObject(binary, byte, pos),
    _ => null,
  };
}

bool? _parseBoolObject(int byte) {
  return switch (byte) {
    0x08 => false,
    0x09 => true,
    _ => null,
  };
}

int _parseIntegerObject(_BinaryData binary, int byte, int pos) {
  final length = 1 << (byte & 0xf);
  return _convertBytesToInt(
    binary.bytes.buffer.asByteData(pos + 1, length),
    length,
    signed64Bit: true,
  );
}

double _parseRealObject(_BinaryData binary, int byte, int pos) {
  final length = 1 << (byte & 0xf);
  return _convertBytesToDouble(
    binary.bytes.buffer.asByteData(pos + 1, length),
    length,
  );
}

DateTime _parseDateObject(_BinaryData binary, int pos) {
  // Extract 8 bytes of data starting from pos + 1
  final data = binary.bytes.buffer.asByteData(pos + 1, 8);
  // Convert the bytes to a double representing seconds
  final secondsSince2001 = _convertBytesToDouble(data, 8);
  // Convert to microseconds and adjust for Unix epoch (1970-01-01)
  final microsecondsSinceEpoch =
      ((secondsSince2001 + 978307200) * 1000000).toInt();
  // Create and return a UTC DateTime object
  return DateTime.fromMicrosecondsSinceEpoch(
    microsecondsSinceEpoch,
    isUtc: true,
  );
}

Uint8List _parseDataObject(_BinaryData binary, int byte, int pos) {
  final byteData = _getObjectDataBytes(
    binary.bytes,
    byte,
    pos,
  );
  return Uint8List.view(
    binary.bytes.buffer,
    byteData.offsetInBytes,
    byteData.lengthInBytes,
  );
}

String _parseStringObject(_BinaryData binary, int byte, int pos) {
  final byteData = _getObjectDataBytes(
    binary.bytes,
    byte,
    pos,
  );
  final charCodes = Uint8List.view(
    byteData.buffer,
    byteData.offsetInBytes,
    byteData.lengthInBytes,
  );
  return String.fromCharCodes(charCodes);
}

String _parseUnicodeObject(_BinaryData binary, int byte, int pos) {
  final byteData = _getObjectDataBytes(
    binary.bytes,
    byte,
    pos,
    unitByte: 2,
  );
  final charCodes = Uint16List.view(
    byteData.buffer,
    byteData.offsetInBytes,
    byteData.lengthInBytes ~/ 2,
  );
  return String.fromCharCodes(charCodes);
}

List<dynamic> _parseArrayObject(_BinaryData binary, int byte, int pos) {
  // Get the byte data for the array
  final byteData = _getObjectDataBytes(
    binary.bytes,
    byte,
    pos,
    unitByte: binary.objectRefSize,
  );
  // Calculate the number of items in the array
  final itemCount = byteData.lengthInBytes ~/ binary.objectRefSize;
  // Generate a list of parsed objects
  return List.generate(itemCount, (index) {
    // Calculate the position of the current item
    final itemOffset = index * binary.objectRefSize;
    final itemRef =
        _convertBytesToInt(byteData, binary.objectRefSize, offset: itemOffset);
    final itemPos = _getObjectStartPosition(binary, itemRef);
    // Parse and return the item
    return _parseBinaryObject(binary, itemPos);
  });
}

Map<dynamic, dynamic> _parseDictionaryObject(
  _BinaryData binary,
  int byte,
  int pos,
) {
  // Get the byte data for the dictionary
  final byteData = _getObjectDataBytes(
    binary.bytes,
    byte,
    pos,
    unitByte: binary.objectRefSize,
    sizeScale: 2,
  );
  // Calculate the number of key-value pairs
  final pairCount = byteData.lengthInBytes ~/ (2 * binary.objectRefSize);
  // Create a map to store the key-value pairs
  final map = <dynamic, dynamic>{};
  // Iterate through each key-value pair
  for (var i = 0; i < pairCount; i++) {
    // Calculate offsets for key and value
    final keyOffset = i * binary.objectRefSize;
    final valueOffset = (i + pairCount) * binary.objectRefSize;
    // Get positions for key and value
    final keyPos = _getObjectStartPosition(
      binary,
      _convertBytesToInt(byteData, binary.objectRefSize, offset: keyOffset),
    );
    final valuePos = _getObjectStartPosition(
      binary,
      _convertBytesToInt(byteData, binary.objectRefSize, offset: valueOffset),
    );
    // Parse key and value
    final key = _parseBinaryObject(binary, keyPos);
    final value = _parseBinaryObject(binary, valuePos);
    // Add key-value pair to the map
    map[key] = value;
  }
  return map;
}

int _getObjectStartPosition(_BinaryData binary, int offset) {
  final keyRefPos =
      (binary.offsetTableStartPos) + (binary.offsetTableOffsetSize * offset);
  return _convertBytesToInt(
    binary.bytes.buffer.asByteData(keyRefPos, binary.offsetTableOffsetSize),
    binary.offsetTableOffsetSize,
  );
}

ByteData _getObjectDataBytes(
  Uint8List bytes,
  int byte,
  int pos, {
  int unitByte = 1,
  int sizeScale = 1,
}) {
  var localPos = pos;
  var length = byte & 0xF;

  if (length == 0xF) {
    // Extended length encoding
    localPos++;
    final exponentBits = bytes[localPos] & 0xF;
    final size = 1 << exponentBits; // Equivalent to 2^exponentBits

    localPos++;
    length = _convertBytesToInt(bytes.buffer.asByteData(localPos, size), size) *
        unitByte *
        sizeScale;

    localPos += size;
  } else {
    // Simple length encoding
    length *= unitByte * sizeScale;
    localPos++;
  }

  return bytes.buffer.asByteData(localPos, length);
}

int _convertBytesToInt(
  ByteData byteData,
  int byteSize, {
  int offset = 0,
  bool signed64Bit = false,
}) {
  return switch (byteSize) {
    1 => byteData.getUint8(offset),
    2 => byteData.getUint16(offset),
    4 => byteData.getUint32(offset),
    8 => signed64Bit ? byteData.getInt64(offset) : byteData.getUint64(offset),
    _ => throw Exception('Undefined ByteSize: $byteSize'),
  };
}

double _convertBytesToDouble(
  ByteData byteData,
  int byteSize,
) {
  return switch (byteSize) {
    4 => byteData.getFloat32(0),
    8 => byteData.getFloat64(0),
    _ => throw Exception('Undefined ByteSize: $byteSize'),
  };
}

class _BinaryData {
  Uint8List bytes = Uint8List(0);
  int offsetTableStartPos = 0;
  int offsetTableOffsetSize = 0;
  int objectRefSize = 0;

  _BinaryData({
    required this.bytes,
    required this.offsetTableStartPos,
    required this.offsetTableOffsetSize,
    required this.objectRefSize,
  });

  @override
  String toString() {
    return '''
_BinaryData{bytes.length: ${bytes.length}, offsetTableStartPos: $offsetTableStartPos, offsetTableOffsetSize: $offsetTableOffsetSize, objectRefSize: $objectRefSize}''';
  }
}
