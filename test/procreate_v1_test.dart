import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validProcreateFiles = [
    './assets/procreate/procreate1.swatches',
    './assets/procreate/procreate2.swatches',
  ];

  for (final filePath in validProcreateFiles) {
    test(
      'isValidFormat returns true for valid Procreate Swatches file: $filePath',
      () {
        final procreateFile = File(filePath);
        final bytes = procreateFile.readAsBytesSync();
        expect(ProcreateV1Palette.isValidFormat(bytes), isTrue);
      },
    );

    test('read procreate file: $filePath', () {
      final procreateFile = File(filePath);
      final procreatePalettes = decodeProcreateV1Palettes(
        procreateFile.readAsBytesSync(),
      );

      expect(procreatePalettes.first.swatches.length, equals(30));
    });
  }

  test('isValidFormat returns false for invalid Procreate Swatches file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ProcreateV1Palette.isValidFormat(invalidBytes), isFalse);
  });

  test('write procreate file', () async {
    final procreate = ProcreateV1Palette(
      name: 'test',
      swatches: [
        ProcreateV1Swatch(
          hue: 1,
          saturation: 0,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
        ProcreateV1Swatch(
          hue: 0,
          saturation: 1,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
        ProcreateV1Swatch(
          hue: 0,
          saturation: 0,
          brightness: 1,
          alpha: 1,
          colorSpace: ProcreateV1ColorSpace.hsb,
        ),
      ],
    );

    // write to temp file
    final procreateFile = File('./test/test.procreate');
    procreateFile.writeAsBytesSync(encodeProcreateV1Palette([procreate]));

    final decodedProcreate = decodeProcreateV1Palettes(
      procreateFile.readAsBytesSync(),
    );
    // print(decodedProcreate.first.toJson());

    expect(decodedProcreate.first.swatches.length, equals(3));

    expect(decodedProcreate.first.swatches[0].hue, equals(1));
    expect(decodedProcreate.first.swatches[0].saturation, equals(0));
    expect(decodedProcreate.first.swatches[0].brightness, equals(0));
    expect(decodedProcreate.first.swatches[0].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[0].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[1].hue, equals(0));
    expect(decodedProcreate.first.swatches[1].saturation, equals(1));
    expect(decodedProcreate.first.swatches[1].brightness, equals(0));
    expect(decodedProcreate.first.swatches[1].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[1].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[2].hue, equals(0));
    expect(decodedProcreate.first.swatches[2].saturation, equals(0));
    expect(decodedProcreate.first.swatches[2].brightness, equals(1));
    expect(decodedProcreate.first.swatches[2].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[2].colorSpace,
      equals(ProcreateV1ColorSpace.hsb),
    );

    // delete temp file
    procreateFile.deleteSync();
  });
}
