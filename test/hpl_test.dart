import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validHplFiles = [
    './assets/hpl/hpl1_v4.0.hpl',
    './assets/hpl/hpl2_v4.0.hpl',
  ];

  for (final filePath in validHplFiles) {
    test('isValidFormat returns true for valid HPL file: $filePath', () {
      final hplFile = File(filePath);
      final bytes = hplFile.readAsBytesSync();
      expect(HomesitePalette.isValidFormat(bytes), isTrue);
    });

    test('read hpl file: $filePath', () {
      final hplFile = File(filePath);
      final hpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());

      if (filePath == './assets/hpl/hpl1_v4.0.hpl') {
        expect(hpl.colors.length, equals(287));
      } else if (filePath == './assets/hpl/hpl2_v4.0.hpl') {
        expect(hpl.colors.length, equals(256));
      }
    });
  }

  test('isValidFormat returns false for invalid HPL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(HomesitePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write hpl file', () async {
    final hpl = HomesitePalette(
      colors: [
        HomesitePaletteColor(red: 255, green: 0, blue: 0),
        HomesitePaletteColor(red: 0, green: 255, blue: 255),
        HomesitePaletteColor(red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final hplFile = File('./test/test.hpl');
    hplFile.writeAsBytesSync(hpl.toBytes());
    // print(hplFile.readAsStringSync());

    final decodedHpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());
    // print(decodedHpl.toJson());

    expect(decodedHpl.colors.length, equals(3));

    expect(decodedHpl.colors[0].red, equals(255));
    expect(decodedHpl.colors[0].green, equals(0));
    expect(decodedHpl.colors[0].blue, equals(0));

    expect(decodedHpl.colors[1].red, equals(0));
    expect(decodedHpl.colors[1].green, equals(255));
    expect(decodedHpl.colors[1].blue, equals(255));

    expect(decodedHpl.colors[2].red, equals(128));
    expect(decodedHpl.colors[2].green, equals(128));
    expect(decodedHpl.colors[2].blue, equals(128));

    // delete temp file
    hplFile.deleteSync();
  });
}
