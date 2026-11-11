import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/cpl/std-double.cpl': CplPalette(
      version: CplVersion.ccbc,
      name: '',
      type: 0,
      colors: [
        CplPaletteColor(
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 0, 255, 0],
          name: 'Red',
        ),
      ],
    ),
    'test/testdata/cpl/std-single.cpl': CplPalette(
      version: CplVersion.ccdc,
      name: '',
      type: 0,
      colors: [
        CplPaletteColor(
          model: 9,
          type: 0,
          values: [0, 0, 0, 0, 128, 0, 0, 0],
          name: 'Gray',
        ),
      ],
    ),
    'test/testdata/cpl/long-single.cpl': CplPalette(
      version: CplVersion.cddc,
      name: 'Test Single',
      type: 3,
      colors: [
        CplPaletteColor(
          id: 1,
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 0, 255, 0],
          secondModel: 3,
          secondType: 0,
          secondValues: [0, 0, 0, 0, 0, 255, 255, 0],
          name: 'Red',
        ),
      ],
    ),
    'test/testdata/cpl/long-double.cpl': CplPalette(
      version: CplVersion.cdbc,
      name: 'Test Double',
      type: 3,
      colors: [
        CplPaletteColor(
          id: 10,
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 255, 0, 0],
          secondModel: 2,
          secondType: 0,
          secondValues: [0, 0, 0, 0, 100, 0, 100, 0],
          name: 'Green',
        ),
      ],
    ),
    'test/testdata/cpl/short-header.cpl': CplPalette(
      version: CplVersion.dddc,
      name: 'Header Short',
      type: 38,
      colors: [
        CplPaletteColor(
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 255, 255, 0],
          name: 'Cyan',
        ),
      ],
    ),
    'test/testdata/cpl/x4.cpl': CplPalette(
      version: CplVersion.cddd,
      name: 'Test X4',
      type: 3,
      colors: [
        CplPaletteColor(
          id: 1,
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 255, 255, 0],
          secondModel: 3,
          secondType: 0,
          secondValues: [0, 0, 0, 0, 255, 0, 0, 0],
          name: 'Cyan',
          row: 0,
          column: 0,
          unknown: 1300,
        ),
      ],
    ),
    'test/testdata/cpl/custom.cpl': CplPalette(
      version: CplVersion.dcdc,
      name: 'Custom Gray',
      type: 0,
      colors: [
        CplPaletteColor(
          model: 9,
          type: 0,
          values: [0, 0, 0, 0, 0, 0, 0, 0],
          name: 'Black',
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/cpl/std-double.cpl': 2,
    'test/testdata/cpl/std-single.cpl': 1,
    'test/testdata/cpl/long-single.cpl': 2,
    'test/testdata/cpl/long-double.cpl': 1,
    'test/testdata/cpl/short-header.cpl': 2,
    'test/testdata/cpl/x4.cpl': 2,
    'test/testdata/cpl/custom.cpl': 2,
  };

  expectedData.forEach((filePath, expectedCpl) {
    group('CPL Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final cplFile = File(filePath);
        bytes = cplFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(CplPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final cpl = CplPalette.fromBytes(bytes);

        expect(cpl.version, equals(expectedCpl.version));
        expect(cpl.name, equals(expectedCpl.name));
        expect(cpl.type, equals(expectedCpl.type));
        expect(cpl.colors.length, equals(expectedCounts[filePath]));
        expect(cpl.colors.isNotEmpty, isTrue, reason: 'No colors');

        final firstColor = cpl.colors.first;
        final expectedFirstColor = expectedCpl.colors.first;
        expect(firstColor.id, equals(expectedFirstColor.id));
        expect(firstColor.model, equals(expectedFirstColor.model));
        expect(firstColor.type, equals(expectedFirstColor.type));
        expect(firstColor.values, equals(expectedFirstColor.values));
        expect(firstColor.secondModel, equals(expectedFirstColor.secondModel));
        expect(firstColor.secondType, equals(expectedFirstColor.secondType));
        expect(
          firstColor.secondValues,
          equals(expectedFirstColor.secondValues),
        );
        expect(firstColor.name, equals(expectedFirstColor.name));
        expect(firstColor.row, equals(expectedFirstColor.row));
        expect(firstColor.column, equals(expectedFirstColor.column));
        expect(firstColor.unknown, equals(expectedFirstColor.unknown));
      });
    });
  });

  test('reads long entries with a reused model slot', () {
    final cpl = CplPalette.fromBytes(
      File('test/testdata/cpl/long-single.cpl').readAsBytesSync(),
    );

    final blue = cpl.colors[1];
    expect(blue.id, equals(2));
    expect(blue.secondModel, equals(blue.model));
    expect(blue.secondValues, equals(blue.values));
    expect(blue.name, equals('Blue'));
    expect(cpl.specialInks, equals([1, 2]));
  });

  test('reads X4 positions and UI blocks', () {
    final cpl = CplPalette.fromBytes(
      File('test/testdata/cpl/x4.cpl').readAsBytesSync(),
    );

    expect(cpl.uiColorModels, equals([2, 0]));
    expect(cpl.displayColumns, equals(2));
    expect(cpl.displayRows, equals(1));
    expect(cpl.totalColumns, equals(2));
    expect(cpl.totalRows, equals(1));

    final magenta = cpl.colors[1];
    expect(magenta.name, equals('Magenta'));
    expect(magenta.row, equals(0));
    expect(magenta.column, equals(1));
    expect(magenta.unknown, equals(1300));
  });

  test('keeps raw values without normalizing', () {
    final cpl = CplPalette.fromBytes(
      File('test/testdata/cpl/std-double.cpl').readAsBytesSync(),
    );

    expect(cpl.colors[0].values, equals([0, 0, 0, 0, 0, 0, 255, 0]));
    expect(cpl.colors[1].values, equals([0, 0, 0, 0, 0, 0, 100, 0]));
  });

  test('isValidFormat returns false for invalid CplPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(CplPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat distinguishes CPL from CLR and BCF', () {
    final clrBytes = File('test/testdata/clr/tone-v3.clr').readAsBytesSync();
    expect(CplPalette.isValidFormat(clrBytes), isFalse);

    final bcfBytes = File('test/testdata/bcf/dic-v10.bcf').readAsBytesSync();
    expect(CplPalette.isValidFormat(bcfBytes), isFalse);

    final cplBytes = File('test/testdata/cpl/std-double.cpl').readAsBytesSync();
    expect(ClrPalette.isValidFormat(cplBytes), isFalse);
    expect(BcfPalette.isValidFormat(cplBytes), isFalse);
    expect(CplPalette.isValidFormat(cplBytes), isTrue);
  });

  test('write cpl file', () {
    final cpl = CplPalette(
      version: CplVersion.ccdc,
      name: '',
      type: 0,
      colors: [
        CplPaletteColor(
          model: 5,
          type: 0,
          values: [0, 0, 0, 0, 0, 0, 255, 0],
          name: 'Red',
        ),
        CplPaletteColor(
          model: 9,
          type: 0,
          values: [0, 0, 0, 0, 255, 0, 0, 0],
          name: 'White',
        ),
      ],
    );

    // write to temp file
    final cplFile = File('./test/test.cpl');
    cplFile.writeAsBytesSync(cpl.toBytes());

    final decodedCpl = CplPalette.fromBytes(cplFile.readAsBytesSync());

    expect(decodedCpl.version, equals(CplVersion.ccdc));
    expect(decodedCpl.colors.length, equals(2));

    expect(decodedCpl.colors[0].model, equals(5));
    expect(decodedCpl.colors[0].name, equals('Red'));

    expect(decodedCpl.colors[1].model, equals(9));
    expect(decodedCpl.colors[1].values, equals([0, 0, 0, 0, 255, 0, 0, 0]));

    // delete temp file
    cplFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = CplPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });

  test('reports truncated input as FormatException', () {
    final families = {
      'test/testdata/cpl/std-double.cpl': 'simple',
      'test/testdata/cpl/custom.cpl': 'custom',
      'test/testdata/cpl/long-single.cpl': 'headered',
      'test/testdata/cpl/x4.cpl': 'positioned',
    };
    for (final entry in families.entries) {
      final bytes = File(entry.key).readAsBytesSync();
      // Mid-header, mid-color, and mid-name cuts.
      for (final cut in [5, bytes.length ~/ 2, bytes.length - 3]) {
        expect(
          () => CplPalette.fromBytes(bytes.sublist(0, cut)),
          throwsA(isA<FormatException>()),
          reason: '${entry.value} cut at $cut',
        );
      }
      expect(
        CplPalette.isValidFormat(bytes.sublist(0, bytes.length - 3)),
        isFalse,
        reason: entry.key,
      );
    }
  });

  test('encoder rejects out-of-range values', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());
    CplPaletteColor colorWith({
      int model = 5,
      int type = 0,
      List<int> values = const [0, 0, 0, 0, 0, 0, 255, 0],
    }) => CplPaletteColor(model: model, type: type, values: values, name: 'X');

    CplPalette paletteWith(List<CplPaletteColor> colors) =>
        CplPalette(version: CplVersion.ccdc, name: '', type: 0, colors: colors);

    expect(
      () => paletteWith([colorWith(model: 70000)]).toBytes(),
      throwsA(either),
    );
    expect(() => paletteWith([colorWith(type: -1)]).toBytes(), throwsA(either));
    expect(
      () =>
          paletteWith([
            colorWith(values: [0, 0, 0, 0, 0, 0, 256, 0]),
          ]).toBytes(),
      throwsA(either),
    );
    expect(
      () =>
          paletteWith([
            colorWith(values: [0, 0, 0, 0, 0, 0, -1, 0]),
          ]).toBytes(),
      throwsA(either),
    );
    // Headered families: palette type and layout ranges.
    CplPalette headeredWith({
      int type = 38,
      int? displayColumns,
      int? displayRows,
      int? totalColumns,
      int? totalRows,
    }) => CplPalette(
      version: CplVersion.dddc,
      name: 'N',
      type: type,
      colors: [colorWith()],
      displayColumns: displayColumns,
      displayRows: displayRows,
      totalColumns: totalColumns,
      totalRows: totalRows,
    );

    expect(() => headeredWith(type: 70000).toBytes(), throwsA(either));
    expect(
      () =>
          headeredWith(
            displayColumns: 1,
            displayRows: 1,
            totalColumns: 70000,
            totalRows: 1,
          ).toBytes(),
      throwsA(either),
    );
  });
}
