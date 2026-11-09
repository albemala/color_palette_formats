import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // First and last color of each fixture, verified against the raw bytes.
  // VisiBone.act and DHogue_color_wheel.act match the upstream files in
  // 1j01/palettes (oversized Fireworks-style tables).
  final expectedData = {
    'test/testdata/act/VisiBone.act': (
      first: AdobeColorTableColor(red: 255, green: 255, blue: 255),
      last: AdobeColorTableColor(red: 102, green: 0, blue: 255),
    ),
    'test/testdata/act/DHogue_color_wheel.act': (
      first: AdobeColorTableColor(red: 0, green: 0, blue: 0),
      last: AdobeColorTableColor(red: 0, green: 149, blue: 208),
    ),
    'test/testdata/act/Grayscale.act': (
      first: AdobeColorTableColor(red: 0, green: 0, blue: 0),
      last: AdobeColorTableColor(red: 255, green: 255, blue: 255),
    ),
    'test/testdata/act/Black & White.act': (
      first: AdobeColorTableColor(red: 0, green: 0, blue: 0),
      last: AdobeColorTableColor(red: 255, green: 255, blue: 255),
    ),
    'test/testdata/act/Windows.act': (
      first: AdobeColorTableColor(red: 0, green: 0, blue: 0),
      last: AdobeColorTableColor(red: 255, green: 255, blue: 255),
    ),
    'test/testdata/act/Mac OS.act': (
      first: AdobeColorTableColor(red: 255, green: 255, blue: 255),
      last: AdobeColorTableColor(red: 0, green: 0, blue: 0),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('ACT File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final actFile = File(filePath);
        bytes = actFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorTable.isValidFormat(bytes), isTrue);
      });

      test('parses all 256 colors', () {
        final act = AdobeColorTable.fromBytes(bytes);

        expect(
          act.colors.length,
          equals(adobeColorTableColorsCount),
          reason: 'Expected 256 colors',
        );

        final firstColor = act.colors.first;
        expect(firstColor.red, equals(expected.first.red));
        expect(firstColor.green, equals(expected.first.green));
        expect(firstColor.blue, equals(expected.first.blue));

        final lastColor = act.colors.last;
        expect(lastColor.red, equals(expected.last.red));
        expect(lastColor.green, equals(expected.last.green));
        expect(lastColor.blue, equals(expected.last.blue));
      });
    });
  });

  test('isValidFormat returns false for truncated ACT file', () {
    final bytes = File('test/testdata/act/Windows.act').readAsBytesSync();
    // 768-byte file cut short, plus the 6-byte input from the old test.
    for (final truncated in [
      bytes.sublist(0, 100),
      bytes.sublist(0, 767),
      [1, 1, 1, 1, 1, 1],
    ]) {
      expect(AdobeColorTable.isValidFormat(truncated), isFalse);
      expect(
        () => AdobeColorTable.fromBytes(truncated),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('oversized Fireworks-style file decodes first 256 colors', () {
    final bytes = File('test/testdata/act/VisiBone.act').readAsBytesSync();
    expect(bytes.length, greaterThan(768));
    final act = AdobeColorTable.fromBytes(bytes);
    expect(act.colors.length, equals(adobeColorTableColorsCount));
  });

  test('round-trips 768-byte file byte-for-byte', () {
    final bytes = File('test/testdata/act/Mac OS.act').readAsBytesSync();
    expect(bytes.length, equals(768));
    final act = AdobeColorTable.fromBytes(bytes);
    expect(act.toBytes(), equals(bytes));
  });

  test('write act file', () {
    final act = AdobeColorTable(
      colors:
          List.generate(
            adobeColorTableColorsCount,
            (index) =>
                AdobeColorTableColor(green: index, blue: index, red: index),
          ).toList(),
    );

    // write to temp file
    final actFile = File('./test/test.act');
    actFile.writeAsBytesSync(act.toBytes());

    final decodedAct = AdobeColorTable.fromBytes(actFile.readAsBytesSync());
    // print(decodedAct.toJson());

    expect(decodedAct.colors.length, equals(adobeColorTableColorsCount));
    for (var i = 0; i < adobeColorTableColorsCount; i++) {
      expect(decodedAct.colors[i].red, equals(i));
      expect(decodedAct.colors[i].green, equals(i));
      expect(decodedAct.colors[i].blue, equals(i));
    }

    // delete temp file
    actFile.deleteSync();
  });
}
