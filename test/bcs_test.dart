import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/bcs/alligator-clf.bcs': BcsPalette(
      type: BcsPaletteType.clf,
      system: 'Colour system',
      germanSystem: 'Farbsystem',
      name: 'Alligator Collection 3000',
      colors: [
        BcsPaletteColor(
          name: 'Alligator Block 3000 3000-1',
          lab: [77.0, 14.0, 59.0],
        ),
      ],
    ),
    'test/testdata/bcs/designer-atl.bcs': BcsPalette(
      type: BcsPaletteType.atl,
      system: 'CMYK print',
      germanSystem: 'CMYK Druck',
      name: 'Designer Collection',
      germanName: 'Designer Kollektion',
      colors: [
        BcsPaletteColor(name: 'Designer Red', lab: [53.0, 80.0, 67.0]),
      ],
    ),
    'test/testdata/bcs/atlas-rgb.bcs': BcsPalette(
      type: BcsPaletteType.rgb,
      system: 'RGB print',
      name: 'Colour Atlas',
      colors: [
        BcsPaletteColor(name: 'Atlas Blue', lab: [32.5, 79.0, -107.75]),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/bcs/alligator-clf.bcs': 2,
    'test/testdata/bcs/designer-atl.bcs': 1,
    'test/testdata/bcs/atlas-rgb.bcs': 2,
  };

  expectedData.forEach((filePath, expectedBcs) {
    group('BCS Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final bcsFile = File(filePath);
        bytes = bcsFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(BcsPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final bcs = BcsPalette.fromBytes(bytes);

        expect(bcs.type, equals(expectedBcs.type));
        expect(bcs.system, equals(expectedBcs.system));
        expect(bcs.germanSystem, equals(expectedBcs.germanSystem));
        expect(bcs.name, equals(expectedBcs.name));
        expect(bcs.germanName, equals(expectedBcs.germanName));
        expect(bcs.colors.length, equals(expectedCounts[filePath]));
        expect(bcs.colors.isNotEmpty, isTrue, reason: 'No colors');

        final firstColor = bcs.colors.first;
        final expectedFirstColor = expectedBcs.colors.first;
        expect(firstColor.name, equals(expectedFirstColor.name));
        expect(firstColor.lab, equals(expectedFirstColor.lab));
      });
    });
  });

  test('reads signed Lab values and shared German titles', () {
    final bcs = BcsPalette.fromBytes(
      File('test/testdata/bcs/alligator-clf.bcs').readAsBytesSync(),
    );

    expect(bcs.germanName, isNull);
    expect(bcs.colors[1].name, equals('Alligator Block 3000 3808'));
    expect(bcs.colors[1].lab, equals([37.5, -9.25, -29.5]));
  });

  test('reads distinct German titles', () {
    final bcs = BcsPalette.fromBytes(
      File('test/testdata/bcs/designer-atl.bcs').readAsBytesSync(),
    );

    expect(bcs.name, equals('Designer Collection'));
    expect(bcs.germanName, equals('Designer Kollektion'));
  });

  test('keeps raw Lab values without normalizing', () {
    final bcs = BcsPalette.fromBytes(
      File('test/testdata/bcs/atlas-rgb.bcs').readAsBytesSync(),
    );

    expect(bcs.germanSystem, isNull);
    expect(bcs.colors[0].lab, equals([32.5, 79.0, -107.75]));
    expect(bcs.colors[1].lab, equals([100.0, 0.0, 0.0]));
  });

  test('isValidFormat returns false for invalid BcsPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(BcsPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('truncated file throws FormatException and is not valid', () {
    final bytes = File('test/testdata/bcs/designer-atl.bcs').readAsBytesSync();
    for (final truncated in [
      bytes.sublist(0, 20),
      bytes.sublist(0, 50),
      bytes.sublist(0, 100),
      bytes.sublist(0, bytes.length - 5),
    ]) {
      expect(BcsPalette.isValidFormat(truncated), isFalse);
      expect(
        () => BcsPalette.fromBytes(truncated),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('corrupt header throws FormatException and is not valid', () {
    final bytes =
        File('test/testdata/bcs/designer-atl.bcs').readAsBytesSync().toList();
    // Unknown-byte index: system block ends at bytes[0], then come the
    // 2 count bytes, the name-length byte and the name itself.
    final unknownIndex = bytes[0] + 4 + bytes[bytes[0] + 3];
    final cases = {
      'offset2 != 5': [4, 6],
      'offset1 < offset2': [0, 2],
      'bad signature': [1, 'X'.codeUnitAt(0)],
      'bad unknown byte': [unknownIndex, 0],
    };
    cases.forEach((reason, patch) {
      final corrupted = bytes.toList();
      corrupted[patch[0]] = patch[1];
      expect(BcsPalette.isValidFormat(corrupted), isFalse, reason: reason);
      expect(
        () => BcsPalette.fromBytes(corrupted),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('encoder rejects unencodable header fields', () {
    BcsPalette build({
      String system = 'System',
      String? germanSystem,
      String name = 'Name',
      String? germanName,
      List<BcsPaletteColor> colors = const [],
    }) => BcsPalette(
      type: BcsPaletteType.clf,
      system: system,
      germanSystem: germanSystem,
      name: name,
      germanName: germanName,
      colors: colors,
    );

    // ':' would break the bilingual block structure.
    expect(
      () => build(system: 'a:b').toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(() => build(name: 'a:b').toBytes(), throwsA(isA<FormatException>()));
    expect(
      () => build(germanName: 'a:b').toBytes(),
      throwsA(isA<FormatException>()),
    );
    // Header blocks are Latin-1 on the wire.
    expect(
      () => build(system: 'System €').toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => build(name: 'Name €').toBytes(),
      throwsA(isA<FormatException>()),
    );
    // Overlong blocks do not fit their length prefixes.
    expect(
      () => build(system: 'x' * 220).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => build(name: 'x' * 240).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () =>
          build(
            colors: [
              BcsPaletteColor(name: 'x' * 300, lab: [0, 0, 0]),
            ],
          ).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('isValidFormat distinguishes BCS from BCF and CLR', () {
    final bcfBytes = File('test/testdata/bcf/dic-v10.bcf').readAsBytesSync();
    expect(BcsPalette.isValidFormat(bcfBytes), isFalse);

    final clrBytes = File('test/testdata/clr/tone-v3.clr').readAsBytesSync();
    expect(BcsPalette.isValidFormat(clrBytes), isFalse);

    final bcsBytes =
        File('test/testdata/bcs/alligator-clf.bcs').readAsBytesSync();
    expect(BcfPalette.isValidFormat(bcsBytes), isFalse);
    expect(ClrPalette.isValidFormat(bcsBytes), isFalse);
    expect(BcsPalette.isValidFormat(bcsBytes), isTrue);
  });

  test('write bcs file', () {
    final bcs = BcsPalette(
      type: BcsPaletteType.clf,
      system: 'Colour system',
      germanSystem: 'Farbsystem',
      name: 'Test Palette',
      colors: [
        BcsPaletteColor(name: 'Test Red', lab: [53.0, 80.0, 67.0]),
        BcsPaletteColor(name: 'Test White', lab: [100.0, 0.0, 0.0]),
      ],
    );

    // write to temp file
    final bcsFile = File('./test/test.bcs');
    bcsFile.writeAsBytesSync(bcs.toBytes());

    final decodedBcs = BcsPalette.fromBytes(bcsFile.readAsBytesSync());

    expect(decodedBcs.type, equals(BcsPaletteType.clf));
    expect(decodedBcs.system, equals('Colour system'));
    expect(decodedBcs.germanSystem, equals('Farbsystem'));
    expect(decodedBcs.colors.length, equals(2));

    expect(decodedBcs.colors[0].name, equals('Test Red'));
    expect(decodedBcs.colors[0].lab, equals([53.0, 80.0, 67.0]));

    expect(decodedBcs.colors[1].name, equals('Test White'));
    expect(decodedBcs.colors[1].lab, equals([100.0, 0.0, 0.0]));

    // delete temp file
    bcsFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = BcsPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
