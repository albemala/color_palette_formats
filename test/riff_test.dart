import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test(
    'isValidFormat returns true for valid ResourceInterchangeFileFormat file',
    () {
      final riffFile = File('./assets/riff/riff1_v3.pal');
      final bytes = riffFile.readAsBytesSync();
      expect(ResourceInterchangeFileFormat.isValidFormat(bytes), isTrue);
    },
  );

  test(
    'isValidFormat returns false for invalid ResourceInterchangeFileFormat file',
    () {
      final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // Example invalid data
      expect(
        ResourceInterchangeFileFormat.isValidFormat(invalidBytes),
        isFalse,
      );
    },
  );

  test('read riff file', () {
    final riffFile1 = File('./assets/riff/riff1_v3.pal');
    final riff1 = ResourceInterchangeFileFormat.fromBytes(
      riffFile1.readAsBytesSync(),
    );
    // print(riff1.toJson());

    expect(riff1.colors.length, equals(16));

    final riffFile2 = File('./assets/riff/riff2_v3.pal');
    final riff2 = ResourceInterchangeFileFormat.fromBytes(
      riffFile2.readAsBytesSync(),
    );
    // print(riff2.toJson());

    expect(riff2.colors.length, equals(256));
  });

  test('write riff file', () async {
    final riff = ResourceInterchangeFileFormat(
      colors: [
        ResourceInterchangeFileFormatColor(red: 0, green: 0, blue: 255),
        ResourceInterchangeFileFormatColor(red: 0, green: 255, blue: 0),
        ResourceInterchangeFileFormatColor(red: 255, green: 0, blue: 0),
      ],
    );

    // write to temp file
    final riffFile = File('./test/test.pal');
    riffFile.writeAsBytesSync(riff.toBytes());

    final decodedRiff = ResourceInterchangeFileFormat.fromBytes(
      riffFile.readAsBytesSync(),
    );
    // print(decodedRiff.toJson());

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

    // delete temp file
    riffFile.deleteSync();
  });
}
