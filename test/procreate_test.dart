import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('isValidFormat returns true for valid Procreate Swatches file', () {
    final procreateFile = File('./assets/procreate/procreate1.swatches');
    final bytes = procreateFile.readAsBytesSync();
    expect(ProcreateSwatches.isValidFormat(bytes), isTrue);
  });

  test('isValidFormat returns false for invalid Procreate Swatches file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ProcreateSwatches.isValidFormat(invalidBytes), isFalse);
  });

  test('read procreate file', () {
    final procreateFile1 = File('./assets/procreate/procreate1.swatches');
    final procreate1 = decodeProcreateSwatches(
      procreateFile1.readAsBytesSync(),
    );
    // print(procreate1.first.toJson());

    expect(procreate1.first.swatches.length, equals(30));

    final procreateFile2 = File('./assets/procreate/procreate2.swatches');
    final procreate2 = decodeProcreateSwatches(
      procreateFile2.readAsBytesSync(),
    );
    // print(procreate2.first.toJson());

    expect(procreate2.first.swatches.length, equals(30));
  });

  test('write procreate file', () async {
    final procreate = ProcreateSwatches(
      name: 'test',
      swatches: [
        ProcreateSwatchesSwatch(
          hue: 1,
          saturation: 0,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateSwatchesColorSpace.hsb,
        ),
        ProcreateSwatchesSwatch(
          hue: 0,
          saturation: 1,
          brightness: 0,
          alpha: 1,
          colorSpace: ProcreateSwatchesColorSpace.hsb,
        ),
        ProcreateSwatchesSwatch(
          hue: 0,
          saturation: 0,
          brightness: 1,
          alpha: 1,
          colorSpace: ProcreateSwatchesColorSpace.hsb,
        ),
      ],
    );

    // write to temp file
    final procreateFile = File('./test/test.procreate');
    procreateFile.writeAsBytesSync(encodeProcreateSwatches([procreate]));

    final decodedProcreate = decodeProcreateSwatches(
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
      equals(ProcreateSwatchesColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[1].hue, equals(0));
    expect(decodedProcreate.first.swatches[1].saturation, equals(1));
    expect(decodedProcreate.first.swatches[1].brightness, equals(0));
    expect(decodedProcreate.first.swatches[1].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[1].colorSpace,
      equals(ProcreateSwatchesColorSpace.hsb),
    );

    expect(decodedProcreate.first.swatches[2].hue, equals(0));
    expect(decodedProcreate.first.swatches[2].saturation, equals(0));
    expect(decodedProcreate.first.swatches[2].brightness, equals(1));
    expect(decodedProcreate.first.swatches[2].alpha, equals(1));
    expect(
      decodedProcreate.first.swatches[2].colorSpace,
      equals(ProcreateSwatchesColorSpace.hsb),
    );

    // delete temp file
    procreateFile.deleteSync();
  });
}
