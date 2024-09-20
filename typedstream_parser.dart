import 'dart:io';
import 'dart:typed_data';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a file path as an argument.');
    return;
  }

  final filePath = arguments[0];

  final data = File(filePath).readAsBytesSync();
  final result = parseBinaryBytes(data);

  final map = Map<String, dynamic>.from(result as Map<dynamic, dynamic>);

  final colors = extractColors(map);

  final parsedColors = colors.map((key, value) {
    final rgbValues = value
        .split(' ')
        .map((s) => double.tryParse(s) ?? int.tryParse(s)?.toDouble() ?? 0)
        .toList();
    return MapEntry(key, rgbValues);
  });
  print(parsedColors);
}

Map<String, String> extractColors(Map<String, dynamic> map) {
  if (!map.containsKey(r'$objects')) {
    return {};
  }

  final objects = map[r'$objects'];
  if (objects is! List<dynamic>) {
    return {};
  }

  final extractedStrings = objects
      .whereType<String>()
      .where((str) => str != r'$null' && str.isNotEmpty)
      .toList();

  final extractedMaps = objects
      .whereType<Map<dynamic, dynamic>>()
      .map(Map<String, dynamic>.from)
      .toList();

  final nsrgbValues = extractedMaps //
      .where((map) => map.containsKey('NSRGB'))
      .map((map) {
    final nsrgbValue = map['NSRGB'];
    return nsrgbValue is List<int>
        ? String.fromCharCodes(nsrgbValue)
        : nsrgbValue.toString();
  }).toList();

  // Create a map matching color names to NSRGB values
  final colorMap = <String, String>{};
  if (extractedStrings.length == nsrgbValues.length) {
    for (var i = 0; i < extractedStrings.length; i++) {
      colorMap[extractedStrings[i]] = nsrgbValues[i];
    }
  } else {
    print('''
Warning: The number of extracted strings does not match the number of NSRGB values.''');
  }

  return colorMap;
}

dynamic parseBinaryBytes(Uint8List dataBytes) {
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
  final objectStartPos = _getObjectStartPos(binaryData, startPos);

  // Handle the binary data starting from the object's position
  return _handleBinary(binaryData, objectStartPos);
}

dynamic _handleBinary(_BinaryData binary, int pos) {
  final byte = binary.bytes[pos];
  switch (byte & 0xF0) {
    // bool
    // case 0x00:
    //   if (byte == 0x08) {
    //     return false;
    //   } else if (byte == 0x09) {
    //     return true;
    //   }

    // integer
    // case 0x10:
    //   final length = 1 << (byte & 0xf);
    //   // Signed integers are always stored with 8 bytes
    //   return _bytesToInt(
    //     binary.bytes.buffer.asByteData(pos + 1, length),
    //     length,
    //     signed64Bit: true,
    //   );

    // real
    // case 0x20:
    //   final length = 1 << (byte & 0xf);
    //   return _bytesToDouble(
    //     binary.bytes.buffer.asByteData(pos + 1, length),
    //     length,
    //   );

    // date
    // case 0x30:
    //   final seconds =
    //       _bytesToDouble(binary.bytes.buffer.asByteData(pos + 1, 8), 8);
    //   // Convert Apple epoch time (seconds since 2001-01-01) to UTC
    //   return DateTime.fromMicrosecondsSinceEpoch(
    //       ((seconds + 978307200) * 1000000).toInt(),
    //       isUtc: true);

    // data
    case 0x40:
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

    // string
    case 0x50:
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

    // unicode
    case 0x60:
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

    // array
    case 0xA0:
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
            _bytesToInt(byteData, binary.objectRefSize, offset: itemOffset);
        final itemPos = _getObjectStartPos(binary, itemRef);

        // Parse and return the item
        return _handleBinary(binary, itemPos);
      });

    // dictionary
    case 0xD0:
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
        final keyPos = _getObjectStartPos(
          binary,
          _bytesToInt(byteData, binary.objectRefSize, offset: keyOffset),
        );
        final valuePos = _getObjectStartPos(
          binary,
          _bytesToInt(byteData, binary.objectRefSize, offset: valueOffset),
        );

        // Parse key and value
        final key = _handleBinary(binary, keyPos);
        final value = _handleBinary(binary, valuePos);

        // Add key-value pair to the map
        map[key] = value;
      }

      return map;
  }
  return null;
}

int _getObjectStartPos(_BinaryData binary, int offset) {
  final keyRefPos =
      (binary.offsetTableStartPos) + (binary.offsetTableOffsetSize * offset);
  return _bytesToInt(
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
    length = _bytesToInt(bytes.buffer.asByteData(localPos, size), size) *
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

int _bytesToInt(
  ByteData byteData,
  int byteSize, {
  int offset = 0,
  bool signed64Bit = false,
}) {
  if (byteData.lengthInBytes < byteSize) {
    throw Exception('bytes list size is invalid');
  }
  return switch (byteSize) {
    1 => byteData.getUint8(offset),
    2 => byteData.getUint16(offset),
    4 => byteData.getUint32(offset),
    8 => signed64Bit ? byteData.getInt64(offset) : byteData.getUint64(offset),
    _ => throw Exception('Undefined ByteSize: $byteSize'),
  };
}

double _bytesToDouble(ByteData byteData, int byteSize) {
  if (byteData.lengthInBytes == 0) {
    throw Exception('bytes list is empty');
  }
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
    return '_BinaryData{bytes.length: ${bytes.length}, offsetTableStartPos: $offsetTableStartPos, offsetTableOffsetSize: $offsetTableOffsetSize, objectRefSize: $objectRefSize}';
  }
}
