import 'dart:io';
import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:color_palette_formats/src/utils.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a file path as an argument.');
    return;
  }

  final filePath = arguments[0];
  final data = File(filePath).readAsBytesSync();

  // parseStreamtyped(data);
  parseStreamtyped2(data);
}

// Constants
const int long2Label = 0x81;
const int long4Label = 0x82;
const int realLabel = 0x83;
const int newLabel = 0x84;
const int nullLabel = 0x85;
const int endOfObjectLabel = 0x86;
const int smallestLabel = 0x92;

String getConstantName(int value) {
  return switch (value) {
    0x81 => 'long2Label',
    0x82 => 'long4Label',
    0x83 => 'realLabel',
    0x84 => 'newLabel',
    0x85 => 'nullLabel',
    0x86 => 'endOfObjectLabel',
    0x92 => 'smallestLabel',
    _ => 'unknown',
  };
}

void parseStreamtyped2(Uint8List data) {
  final buffer = ByteDataReader()..add(data.toList());

  final streamerVersion = buffer.readUint8();
  print('Streamer version: $streamerVersion');
  // if (streamerVersion != 4) {
  //   throw Exception('Unsupported streamer version: $streamerVersion');
  // }

  final headerLength = buffer.readUint8();
  final header = readUtf8String(buffer, headerLength);
  print('Header: $header');

  final streamEndian = switch (header) {
    'streamtyped' => Endian.little,
    'typedstream' => Endian.big,
    _ => throw Exception('Invalid header: $header')
  };
  print('Stream endianness: ${streamEndian == Endian.big ? 'BIG' : 'LITTLE'}');

  while (buffer.remainingLength > 0) {
    final type = buffer.readUint8();
    switch (type) {
      case long2Label:
        final value = buffer.readInt16(streamEndian);
        print('long2Label: $value');
      case long4Label:
        final value = buffer.readInt32(streamEndian);
        print('long4Label: $value');
      case realLabel:
        final value = buffer.readFloat32(streamEndian);
        print('realLabel: $value');
      case newLabel:
        final nextToken = buffer.readUint8();
        if (nextToken == long2Label) {
          final stringLength = buffer.readInt16(streamEndian);
          final string = readUtf8String(buffer, stringLength);
          print('newLabel long2Label: $string');
        } else if (nextToken == long4Label) {
          final stringLength = buffer.readInt32(streamEndian);
          final string = readUtf8String(buffer, stringLength);
          print('newLabel long4Label: $string');
        } else if (nextToken == newLabel) {
          print('newLabel newLabel');
          break;
        } else if (nextToken == nullLabel) {
          print('newLabel nullLabel');
          break;
        } else {
          final stringLength = nextToken;
          final string = readUtf8String(buffer, stringLength);
          final constantName = getConstantName(nextToken);
          print('newLabel string: $string');
          if (string.length == 1) {
            switch (string) {
              case 'c' || 'C':
                final char = buffer.readUint8();
                print('char: $char');
              case 's' || 'S':
                final value = buffer.readUint8();
                if (value == long2Label) {
                  final short = buffer.readInt16(streamEndian);
                  print('short long2: $short');
                } else {
                  final short = buffer.readUint8();
                  print('short: $short');
                }
              case 'i' || 'I' || 'l' || 'L':
                final value = buffer.readUint8();
                switch (value) {
                  case long2Label:
                    final int = buffer.readInt16(streamEndian);
                    print('int long2: $int');
                  case long4Label:
                    final int = buffer.readInt32(streamEndian);
                    print('int long4: $int');
                  default:
                    print('int: $value');
                }
              case 'f':
                final float = buffer.readFloat32(streamEndian);
                print('float: $float');
              case 'd':
                final double = buffer.readFloat64(streamEndian);
                print('double: $double');
            }
          }
        }
      case nullLabel:
        print('nullLabel');
      case endOfObjectLabel:
        print('endOfObjectLabel');
      default:
        print('unknown label ${type.toRadixString(16)}');
    }
  }
}

String readString(ByteDataReader buffer) {
  final lengthType = buffer.readUint8();
  final stringLength = switch (lengthType) {
    long2Label => buffer.readInt16(),
    long4Label => buffer.readInt32(),
    _ => throw Exception('Invalid length'),
  };
  return readUtf8String(buffer, stringLength);
}

bool _swap = false; // Assuming little-endian by default

void parseStreamtyped(Uint8List data) {
  var cursor = 0;

  String decodeString() {
    final length = data[cursor];
    final charCodes = data.sublist(cursor + 1, cursor + 1 + length);
    final result = String.fromCharCodes(charCodes);
    cursor += length;
    return result;
  }

  int decodeInt() {
    final charValue = data[cursor];
    int result;
    switch (charValue) {
      case long2Label:
        result = ByteData.sublistView(data, cursor + 1, cursor + 3)
            .getInt16(0, Endian.little);
        cursor += 3;
      case long4Label:
        result = ByteData.sublistView(data, cursor + 1, cursor + 5)
            .getInt32(0, Endian.little);
        cursor += 5;
      default:
        result = charValue;
        cursor += 1;
    }
    return result;
  }

  // Read header
  final streamerVersion = data[cursor];
  print('Streamer version: $streamerVersion');
  if (streamerVersion != 4) {
    throw Exception('Unsupported streamer version: $streamerVersion');
  }
  cursor++;

  final header = decodeString();
  print('Header: $header');

  final systemEndian = Endian.host;
  print('System endianness: ${systemEndian}');
  final streamEndian = switch (header) {
    'streamtyped' => Endian.little,
    'typedstream' => Endian.big,
    _ => throw Exception('Invalid header: $header')
  };
  print('Stream endianness: $streamEndian');
  final _swap = systemEndian != streamEndian;
  print('Swap endianness: $_swap');

  final systemVersion = decodeInt();
  print('System version: $systemVersion');

  return;

  final buffer = StringBuffer();
  final objects = <Uint8List>[];
  dynamic value;

  while (cursor < data.length) {
    buffer.write(String.fromCharCode(data[cursor]));

    if (buffer.toString().endsWith('\x84\x84')) {
      final len = data[cursor + 1];
      final objectData = data.sublist(cursor + 2, cursor + 2 + len);
      objects.add(objectData);
      print('Object found at position $cursor (len: $len): ${objects.last}');
      // parseStreamtyped(objectData); // Recursive call for nested object
      buffer.clear();
      cursor += len + 1;
    } else if (buffer.toString().endsWith('\x85\x84\x01')) {
      print('Value marker found at position $cursor');
      final kind = data[cursor + 1];

      if (kind == 0x2a) {
        print('Number found at position ${cursor + 1}');
        final type = data[cursor + 5];
        print('Number type: $type');

        if (cursor + 7 < data.length && data[cursor + 7] == 0x81) {
          if (cursor + 9 < data.length) {
            value = ByteData.sublistView(data, cursor + 8, cursor + 10)
                .getUint16(0, Endian.little);
          }
        } else if (cursor + 7 < data.length) {
          value = data[cursor + 7];
        }
        print('Number value: $value');
        cursor += 9;
      } else if (kind == 0x2b) {
        print('String found at position ${cursor + 1}');
        if (cursor + 2 < data.length) {
          final len = data[cursor + 2];
          if (cursor + 3 + len <= data.length) {
            value = String.fromCharCodes(
                data.sublist(cursor + 3, cursor + 3 + len));
            print('String value: $value');
            cursor += 3 + len;
          }
        }
      } else if (kind == 0x69) {
        print('Array found at position ${cursor + 1}');
        if (cursor + 5 < data.length) {
          final type = data[cursor + 5];
          print('Array type: $type');
          if (cursor + 6 < data.length) {
            value = data[cursor + 6] != 0 ? [data[cursor + 6]] : [];
            print('Array value: $value');
            if (objects.isNotEmpty) {
              print('${objects.first} -> $value');
            }
          }
          cursor += 7;
        }
      } else {
        print(
            'Unknown kind: ${kind.toRadixString(16)} at position ${cursor + 1}');
        cursor += 2;
      }

      buffer.clear();
    }

    cursor++;
  }

  print('Final cursor position: $cursor');
  print('Final value: $value');
}

//--------

int swappedShort(int value) {
  return _swap ? (value << 8) | ((value >> 8) & 0xFF) : value;
}

int swappedInt(int value) {
  return _swap
      ? ((value & 0xFF) << 24) |
          ((value & 0xFF00) << 8) |
          ((value >> 8) & 0xFF00) |
          ((value >> 24) & 0xFF)
      : value;
}
