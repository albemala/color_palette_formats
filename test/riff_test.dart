import 'dart:io';
import 'dart:typed_data';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/riff/riff1_v3.pal': (16, [0, 0, 0]),
    'test/testdata/riff/riff2_v3.pal': (256, [255, 0, 255]),
  };

  expectedData.forEach((filePath, expected) {
    group('RIFF Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final riffFile = File(filePath);
        bytes = riffFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ResourceInterchangeFileFormat.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final riff = ResourceInterchangeFileFormat.fromBytes(bytes);

        expect(riff.colors.length, equals(expected.$1));

        final firstColor = riff.colors.first;
        expect(firstColor.red, equals(expected.$2[0]));
        expect(firstColor.green, equals(expected.$2[1]));
        expect(firstColor.blue, equals(expected.$2[2]));
      });

      test('round-trips byte-for-byte', () {
        final riff = ResourceInterchangeFileFormat.fromBytes(bytes);
        expect(riff.toBytes(), equals(bytes));
      });
    });
  });

  test('isValidFormat returns false for invalid '
      'ResourceInterchangeFileFormat file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // Example invalid data
    expect(ResourceInterchangeFileFormat.isValidFormat(invalidBytes), isFalse);
  });

  group('validation', () {
    late List<int> valid;

    setUpAll(() {
      valid = File('test/testdata/riff/riff1_v3.pal').readAsBytesSync();
    });

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => ResourceInterchangeFileFormat.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(
        ResourceInterchangeFileFormat.isValidFormat(bytes),
        isFalse,
        reason: label,
      );
    }

    test('truncated input throws FormatException', () {
      for (final bytes in <List<int>>[
        <int>[],
        valid.sublist(0, 4),
        valid.sublist(0, 10),
        valid.sublist(0, valid.length - 2),
      ]) {
        expectRejected('length ${bytes.length}', bytes);
      }
      // Inflated color count reads past the end of the buffer.
      final bigCount = List<int>.from(valid);
      bigCount[22] = 99;
      bigCount[23] = 0;
      expectRejected('inflated count', bigCount);
    });

    test('rejects bad signature, data type, and version', () {
      final badSig = List<int>.from(valid)..[0] = 88;
      expectRejected('bad signature', badSig);

      final badDataType = List<int>.from(valid)..[8] = 88;
      expectRejected('bad data type', badDataType);

      final badVersion = List<int>.from(valid);
      badVersion[20] = 0;
      badVersion[21] = 9;
      expectRejected('bad version', badVersion);
    });

    test('accepts empty palettes and ignores trailing bytes', () {
      final zeroCount = List<int>.from(valid);
      zeroCount[22] = 0;
      zeroCount[23] = 0;
      final empty = ResourceInterchangeFileFormat.fromBytes(zeroCount);
      expect(empty.colors, isEmpty);
      expect(ResourceInterchangeFileFormat.isValidFormat(zeroCount), isTrue);

      final trailing = [...valid, 1, 2, 3, 4, 5];
      final riff = ResourceInterchangeFileFormat.fromBytes(trailing);
      expect(riff.colors.length, equals(16));
      expect(ResourceInterchangeFileFormat.isValidFormat(trailing), isTrue);
    });

    test('ignores size fields and flags on decode', () {
      final zeroSizes = List<int>.from(valid);
      zeroSizes.fillRange(4, 8, 0);
      zeroSizes.fillRange(16, 20, 0);
      final riff = ResourceInterchangeFileFormat.fromBytes(zeroSizes);
      expect(riff.colors.length, equals(16));
      expect(ResourceInterchangeFileFormat.isValidFormat(zeroSizes), isTrue);

      final flagged = List<int>.from(valid)..[27] = 7;
      final flaggedRiff = ResourceInterchangeFileFormat.fromBytes(flagged);
      expect(flaggedRiff.colors.length, equals(16));
    });

    test('encoder writes correct size fields', () {
      final riff = ResourceInterchangeFileFormat(
        colors: [ResourceInterchangeFileFormatColor(red: 1, green: 2, blue: 3)],
      );
      final out = riff.toBytes();
      final view = ByteData.sublistView(Uint8List.fromList(out));
      expect(out.length, equals(28));
      expect(view.getUint32(4, Endian.little), equals(out.length - 8));
      expect(view.getUint32(16, Endian.little), equals(out.length - 20));
    });

    test('encoder rejects out-of-range channels', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      for (final bad in [300, -1]) {
        expect(
          () =>
              ResourceInterchangeFileFormat(
                colors: [
                  ResourceInterchangeFileFormatColor(
                    red: bad,
                    green: 0,
                    blue: 0,
                  ),
                ],
              ).toBytes(),
          throwsA(either),
          reason: 'red = $bad',
        );
      }
    });
  });

  test('write riff file', () {
    final riff = ResourceInterchangeFileFormat(
      colors: [
        ResourceInterchangeFileFormatColor(red: 0, green: 0, blue: 255),
        ResourceInterchangeFileFormatColor(red: 0, green: 255, blue: 0),
        ResourceInterchangeFileFormatColor(red: 255, green: 0, blue: 0),
      ],
    );

    final decodedRiff = ResourceInterchangeFileFormat.fromBytes(riff.toBytes());

    expect(decodedRiff.colors.length, equals(3));

    expect(decodedRiff.colors[0].red, equals(0));
    expect(decodedRiff.colors[0].green, equals(0));
    expect(decodedRiff.colors[0].blue, equals(255));

    expect(decodedRiff.colors[1].red, equals(0));
    expect(decodedRiff.colors[1].green, equals(255));
    expect(decodedRiff.colors[1].blue, equals(0));

    expect(decodedRiff.colors[2].red, equals(255));
    expect(decodedRiff.colors[2].green, equals(0));
    expect(decodedRiff.colors[2].blue, equals(0));
  });
}
