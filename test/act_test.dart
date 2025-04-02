import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('read act file', () {
    final actFile1 = File('./assets/act1.act');
    final act1 = AdobeColorTable.fromBytes(actFile1.readAsBytesSync());
    // print(act1.toJson());

    expect(act1.colors.length, equals(adobeColorTableColorsCount));

    final actFile2 = File('./assets/act2.act');
    final act2 = AdobeColorTable.fromBytes(actFile2.readAsBytesSync());
    // print(act2.toJson());

    expect(act2.colors.length, equals(adobeColorTableColorsCount));

    final actFile3 = File('./assets/act3.act');
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
