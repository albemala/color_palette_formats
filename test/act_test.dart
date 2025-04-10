import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validActFiles = [
    './assets/act/act1.act',
    './assets/act/act2.act',
    './assets/act/act3.act',
  ];

  for (final filePath in validActFiles) {
    test('isValidFormat returns true for valid ACT file: $filePath', () {
      final actFile = File(filePath);
      final bytes = actFile.readAsBytesSync();
      expect(AdobeColorTable.isValidFormat(bytes), isTrue);
    });

    test('read act file: $filePath', () {
      final actFile = File(filePath);
      final act = AdobeColorTable.fromBytes(actFile.readAsBytesSync());
      expect(act.colors.length, equals(adobeColorTableColorsCount));
    });
  }

  test('isValidFormat returns false for invalid ACT file', () {
    final invalidBytes = [1, 1, 1, 1, 1, 1]; // Example invalid data
    expect(AdobeColorTable.isValidFormat(invalidBytes), isFalse);
  });

  test('write act file', () async {
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
