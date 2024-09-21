import 'dart:io';
import 'dart:typed_data';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a file path as an argument.');
    return;
  }

  final filePath = arguments[0];
  final data = File(filePath).readAsBytesSync();

  var buffer = StringBuffer();
  var cursor = 0;
  final objects = <Uint8List>[];
  dynamic value;

  while (cursor < data.length) {
    buffer.write(String.fromCharCode(data[cursor]));

    if (buffer.toString() == '\x04\x0Bstreamtyped') {
      print('Header found at position $cursor');
      buffer.clear();
    } else if (buffer.toString().endsWith('\x84\x84')) {
      final len = data[cursor + 1];
      objects.add(data.sublist(cursor + 2, cursor + 2 + len));
      print('Object found at position $cursor: ${objects.last}');
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
