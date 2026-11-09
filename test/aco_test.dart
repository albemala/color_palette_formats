import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/aco/aco1_v1.aco': (
      count: 52,
      first: AdobeColorSwatchColor(
        colorSpace: AdobeColorSwatchColorSpace.rgb,
        values: [124, 124, 124],
        name: 'Swatch 1',
      ),
    ),
    'test/testdata/aco/aco2_v1.aco': (
      count: 256,
      first: AdobeColorSwatchColor(
        colorSpace: AdobeColorSwatchColorSpace.rgb,
        values: [255, 255, 255],
      ),
    ),
    'test/testdata/aco/NES.aco': (
      count: 52,
      first: AdobeColorSwatchColor(
        colorSpace: AdobeColorSwatchColorSpace.rgb,
        values: [124, 124, 124],
        name: 'Swatch 1',
      ),
    ),
    'test/testdata/aco/VisiBone2.aco': (
      count: 256,
      first: AdobeColorSwatchColor(
        colorSpace: AdobeColorSwatchColorSpace.rgb,
        values: [255, 255, 255],
      ),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('ACO File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final acoFile = File(filePath);
        bytes = acoFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorSwatch.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final aco = AdobeColorSwatch.fromBytes(bytes);

        expect(
          aco.colors.length,
          equals(expected.count),
          reason: 'Color count mismatch',
        );
        expect(aco.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        final firstColor = aco.colors.first;
        expect(
          firstColor.colorSpace,
          equals(expected.first.colorSpace),
          reason: 'Color space mismatch for the first color',
        );
        expect(
          listEquals(firstColor.values, expected.first.values),
          isTrue,
          reason: 'Color values mismatch for the first color',
        );
        expect(
          firstColor.name,
          equals(expected.first.name),
          reason: 'Color name mismatch for the first color',
        );
      });
    });
  });

  test('isValidFormat returns false for invalid ACO file', () {
    final invalidBytes = [1, 1, 1, 1, 1, 1]; // Example invalid data
    expect(AdobeColorSwatch.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat accepts version 2', () {
    final bytes = File('test/testdata/aco/aco1_v1.aco').readAsBytesSync();
    // v1 section is 4 + 52 * 10 bytes; the rest is the v2 section.
    final v2Bytes = bytes.sublist(4 + 52 * 10);
    expect(AdobeColorSwatch.isValidFormat(v2Bytes), isTrue);
    final v2 = AdobeColorSwatch.fromBytes(v2Bytes);
    expect(v2.colors.length, equals(52));
    expect(v2.colors.first.name, equals('Swatch 1'));
  });

  test('v2 section names are decoded', () {
    final bytes = File('test/testdata/aco/aco1_v1.aco').readAsBytesSync();
    final aco = AdobeColorSwatch.fromBytes(bytes);
    expect(
      aco.colors.every((c) => c.name != null && c.name!.isNotEmpty),
      isTrue,
      reason: 'All v2 colors should have names',
    );
    expect(aco.colors[9].name, equals('Swatch 10'));
  });

  test('v1-only files decode with null names', () {
    final bytes = File('test/testdata/aco/aco2_v1.aco').readAsBytesSync();
    final aco = AdobeColorSwatch.fromBytes(bytes);
    expect(
      aco.colors.every((c) => c.name == null),
      isTrue,
      reason: 'v1-only colors should have null names',
    );
  });

  test('round-trip preserves v2 names', () {
    final bytes = File('test/testdata/aco/aco1_v1.aco').readAsBytesSync();
    final aco = AdobeColorSwatch.fromBytes(bytes);
    final decoded = AdobeColorSwatch.fromBytes(aco.toBytes());
    expect(decoded.colors.length, equals(aco.colors.length));
    for (var i = 0; i < decoded.colors.length; i++) {
      expect(decoded.colors[i].name, equals(aco.colors[i].name));
      expect(
        listEquals(decoded.colors[i].values, aco.colors[i].values),
        isTrue,
      );
    }
  });

  test('write aco file', () async {
    final aco = AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [64, 128, 255],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.hsb,
          values: [300, 50, 50],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.cmyk,
          values: [10, 20, 30, 40],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.grayscale,
          values: [50],
        ),
      ],
    );

    // write to temp file
    final acoFile = File('./test/test.aco');
    acoFile.writeAsBytesSync(aco.toBytes());

    final decodedAco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
    // print(decodedAco.toJson());

    expect(decodedAco.colors.length, equals(4));
    for (var i = 0; i < decodedAco.colors.length; i++) {
      expect(decodedAco.colors[i].colorSpace, equals(aco.colors[i].colorSpace));
      expect(
        listEquals(decodedAco.colors[i].values, aco.colors[i].values),
        true,
      );
      expect(decodedAco.colors[i].name, isNull);
    }

    // delete temp file
    acoFile.deleteSync();
  });

  test('write aco file with names adds a v2 section', () async {
    final aco = AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [64, 128, 255],
          name: 'Blue',
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.rgb,
          values: [255, 0, 0],
          name: 'Red',
        ),
      ],
    );

    final acoFile = File('./test/test_v2.aco');
    acoFile.writeAsBytesSync(aco.toBytes());

    final decodedAco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
    expect(decodedAco.colors.length, equals(2));
    expect(decodedAco.colors[0].name, equals('Blue'));
    expect(decodedAco.colors[1].name, equals('Red'));
    expect(listEquals(decodedAco.colors[0].values, [64, 128, 255]), isTrue);

    acoFile.deleteSync();
  });

  test('isValidFormat returns false for truncated ACO file', () {
    final bytes = File('test/testdata/aco/aco1_v1.aco').readAsBytesSync();
    expect(AdobeColorSwatch.isValidFormat(bytes.sublist(0, 10)), isFalse);
    expect(
      AdobeColorSwatch.isValidFormat(bytes.sublist(0, bytes.length ~/ 2)),
      isFalse,
    );
  });

  test('cmyk colors round-trip including 0', () {
    // Regression test: the encoder computed `100 - v / 100 * 65535`
    // instead of `(100 - v) / 100 * 65535`, corrupting 0 into 100.
    final aco = AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.cmyk,
          values: [0, 0, 0, 0],
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.cmyk,
          values: [0, 50, 100, 20],
          name: 'cmyk mixed',
        ),
      ],
    );

    final decoded = AdobeColorSwatch.fromBytes(aco.toBytes());
    expect(decoded.colors.length, equals(2));
    expect(listEquals(decoded.colors[0].values, [0, 0, 0, 0]), isTrue);
    expect(listEquals(decoded.colors[1].values, [0, 50, 100, 20]), isTrue);
    expect(decoded.colors[1].name, equals('cmyk mixed'));
  });

  test('lab colors with negative a/b round-trip', () {
    final aco = AdobeColorSwatch(
      colors: [
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.lab,
          values: [50, -20, -30],
          name: 'Lab negative',
        ),
        AdobeColorSwatchColor(
          colorSpace: AdobeColorSwatchColorSpace.lab,
          values: [75, 40, -10],
          name: 'Lab mixed',
        ),
      ],
    );

    final decoded = AdobeColorSwatch.fromBytes(aco.toBytes());
    expect(decoded.colors.length, equals(2));
    expect(listEquals(decoded.colors[0].values, [50, -20, -30]), isTrue);
    expect(listEquals(decoded.colors[1].values, [75, 40, -10]), isTrue);
    expect(decoded.colors[0].name, equals('Lab negative'));
  });
}
