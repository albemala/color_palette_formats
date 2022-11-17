import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:palettes/palettes.dart';

Future<void> main() async {
  test('read procreate file', () {
    final procreateFile1 = File('./assets/procreate1.swatches');
    final procreate1 = decodeProcreateSwatches(procreateFile1);
    // print(procreate1.first.toJson());

    expect(procreate1.first.swatches.length, equals(30));

    final procreateFile2 = File('./assets/procreate2.swatches');
    final procreate2 = decodeProcreateSwatches(procreateFile2);
    // print(procreate2.first.toJson());

    expect(procreate2.first.swatches.length, equals(30));
  });

  test('write procreate file', () async {
    const procreate = ProcreateSwatches(
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
    encodeProcreateSwatches([procreate], procreateFile);

    final decodedProcreate = decodeProcreateSwatches(procreateFile);
    // print(decodedProcreate.first.toJson());

    expect(decodedProcreate.first.swatches.length, equals(3));

    // delete temp file
    procreateFile.deleteSync();
  });
}
