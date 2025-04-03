import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid ACT file', () {
    final actFile = File('./assets/act/act1.act');
    final bytes = actFile.readAsBytesSync();
    expect(AdobeColorTable.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid ACT file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(AdobeColorTable.isValidFormat(invalidBytes), isFalse);
  });

  test('read act file', () {
    final actFile1 = File('./assets/act/act1.act');
    final act1 = AdobeColorTable.fromBytes(actFile1.readAsBytesSync());
    // print(act1.toJson());

    expect(act1.colors.length, equals(adobeColorTableColorsCount));

    final actFile2 = File('./assets/act/act2.act');
    final act2 = AdobeColorTable.fromBytes(actFile2.readAsBytesSync());
    // print(act2.toJson());

    expect(act2.colors.length, equals(adobeColorTableColorsCount));

    final actFile3 = File('./assets/act/act3.act');
    final act3 = AdobeColorTable.fromBytes(actFile3.readAsBytesSync());
    // print(act3.toJson());

    expect(act3.colors.length, equals(adobeColorTableColorsCount));
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
