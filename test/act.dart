import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read act file', () {
    final actFile1 = File('./assets/act1.act');
    final act1 = decodeAdobeColorTable(actFile1);
    // print(act1.toJson());

    expect(act1.colors.length, equals(adobeColorTableColorsCount));

    final actFile2 = File('./assets/act2.act');
    final act2 = decodeAdobeColorTable(actFile2);
    // print(act2.toJson());

    expect(act2.colors.length, equals(adobeColorTableColorsCount));

    final actFile3 = File('./assets/act3.act');
    final act3 = decodeAdobeColorTable(actFile3);
    // print(act3.toJson());

    expect(act3.colors.length, equals(adobeColorTableColorsCount));
  });

  test('write act file', () async {
    final act = AdobeColorTable(
      colors: List.generate(
        adobeColorTableColorsCount,
        (index) => AdobeColorTableColor(
          green: index,
          blue: index,
          red: index,
        ),
      ).toList(),
    );

    // write to temp file
    final actFile = File('./test/test.act');
    encodeAdobeColorTable(act, actFile);

    final decodedAct = decodeAdobeColorTable(actFile);
    // print(decodedAct.toJson());

    expect(decodedAct.colors.length, equals(adobeColorTableColorsCount));

    // delete temp file
    actFile.deleteSync();
  });
}
