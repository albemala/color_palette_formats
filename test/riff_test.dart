import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read riff file', () {
    final riffFile1 = File('./assets/riff1_v3.pal');
    final riff1 = decodeResourceInterchangeFileFormat(riffFile1);
    // print(riff1.toJson());

    expect(
      riff1.version,
      equals(supportedResourceInterchangeFileFormatVersion),
    );
    expect(riff1.colors.length, equals(16));

    final riffFile2 = File('./assets/riff2_v3.pal');
    final riff2 = decodeResourceInterchangeFileFormat(riffFile2);
    // print(riff2.toJson());

    expect(
      riff2.version,
      equals(supportedResourceInterchangeFileFormatVersion),
    );
    expect(riff2.colors.length, equals(256));
  });

  test('write riff file', () async {
    const riff = ResourceInterchangeFileFormat(
      version: supportedResourceInterchangeFileFormatVersion,
      colors: [
        ResourceInterchangeFileFormatColor(
          red: 0,
          green: 0,
          blue: 255,
        ),
        ResourceInterchangeFileFormatColor(
          red: 0,
          green: 255,
          blue: 0,
        ),
        ResourceInterchangeFileFormatColor(
          red: 255,
          green: 0,
          blue: 0,
        ),
      ],
    );

    // write to temp file
    final riffFile = File('./test/test.pal');
    encodeResourceInterchangeFileFormat(riff, riffFile);

    final decodedRiff = decodeResourceInterchangeFileFormat(riffFile);
    // print(decodedRiff.toJson());

    expect(
      decodedRiff.version,
      equals(supportedResourceInterchangeFileFormatVersion),
    );

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