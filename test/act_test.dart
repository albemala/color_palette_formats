import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/act/act1.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 255, green: 255, blue: 255)],
    ),
    './assets/act/act2.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/act/act3.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/act/Grayscale.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/act/Black & White.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/act/Windows.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 0, green: 0, blue: 0)],
    ),
    './assets/act/Mac OS.act': AdobeColorTable(
      colors: [AdobeColorTableColor(red: 255, green: 255, blue: 255)],
    ),
  };

  expectedData.forEach((filePath, expectedAct) {
    group('ACT File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final actFile = File(filePath);
        bytes = actFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(AdobeColorTable.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final act = AdobeColorTable.fromBytes(bytes);

        // Compare colors
        expect(act.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (act.colors.isNotEmpty) {
          final firstColor = act.colors.first;
          final expectedFirstColor = expectedAct.colors.first;

          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid ACT file', () {
    final invalidBytes = [1, 1, 1, 1, 1, 1]; // Example invalid data
    expect(AdobeColorTable.isValidFormat(invalidBytes), isFalse);
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
