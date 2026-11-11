import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/painter/painter1.txt': PainterPalette(
      rows: 7,
      columns: 1,
      width: 140,
      height: 30,
      textHeight: 12,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 247,
          green: 224,
          blue: 23,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'PANTONE Yellow C',
        ),
      ],
    ),
    'test/testdata/painter/painter2.txt': PainterPalette(
      rows: 16,
      columns: 6,
      width: 41,
      height: 12,
      textHeight: 14,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 255,
          green: 255,
          blue: 255,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'FFFFFF',
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/painter/painter1.txt': 3,
    'test/testdata/painter/painter2.txt': 2,
  };

  expectedData.forEach((filePath, expectedPainter) {
    group('Painter Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final painterFile = File(filePath);
        bytes = painterFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(PainterPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final painter = PainterPalette.fromBytes(bytes);

        expect(painter.rows, equals(expectedPainter.rows));
        expect(painter.columns, equals(expectedPainter.columns));
        expect(painter.width, equals(expectedPainter.width));
        expect(painter.height, equals(expectedPainter.height));
        expect(painter.textHeight, equals(expectedPainter.textHeight));
        expect(painter.spacing, equals(expectedPainter.spacing));
        expect(painter.colors.length, equals(expectedCounts[filePath]));

        expect(
          painter.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (painter.colors.isNotEmpty) {
          final firstColor = painter.colors.first;
          final expectedFirstColor = expectedPainter.colors.first;

          expect(firstColor.red, equals(expectedFirstColor.red));
          expect(firstColor.green, equals(expectedFirstColor.green));
          expect(firstColor.blue, equals(expectedFirstColor.blue));
          expect(firstColor.hv, equals(expectedFirstColor.hv));
          expect(firstColor.sv, equals(expectedFirstColor.sv));
          expect(firstColor.vv, equals(expectedFirstColor.vv));
          expect(firstColor.name, equals(expectedFirstColor.name));
        }
      });
    });
  });

  test('parses non-zero variability values', () {
    final painter = PainterPalette.fromBytes(
      File('test/testdata/painter/painter1.txt').readAsBytesSync(),
    );

    final secondColor = painter.colors[1];
    expect(secondColor.name, equals('PANTONE Orange 021 C'));
    expect(secondColor.red, equals(237));
    expect(secondColor.green, equals(110));
    expect(secondColor.blue, equals(0));
    expect(secondColor.hv, equals(1.25));
    expect(secondColor.sv, equals(2.5));
    expect(secondColor.vv, equals(3.75));
  });

  test('tolerates varying whitespace around separators', () {
    final bytes = utf8.encode('''
ROWS 16
COLS 6
WIDTH 41
HEIGHT 12
TEXTHEIGHT 14
SPACING 1
R: 255, G:255, B:0 HV:0.00, SV:0.00, VV:0.00  FFFF00''');

    expect(PainterPalette.isValidFormat(bytes), isTrue);
    final painter = PainterPalette.fromBytes(bytes);
    expect(painter.colors.length, equals(1));
    expect(painter.colors.single.red, equals(255));
    expect(painter.colors.single.green, equals(255));
    expect(painter.colors.single.blue, equals(0));
    expect(painter.colors.single.name, equals('FFFF00'));
  });

  test('isValidFormat returns false for invalid PainterPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(PainterPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('parses all fixture colors', () {
    final first = PainterPalette.fromBytes(
      File('test/testdata/painter/painter1.txt').readAsBytesSync(),
    );
    final expectedFirst = [
      ('PANTONE Yellow C', [247, 224, 23], [0.0, 0.0, 0.0]),
      ('PANTONE Orange 021 C', [237, 110, 0], [1.25, 2.5, 3.75]),
      ('PANTONE Blue 072 C', [41, 5, 161], [0.0, 0.0, 0.0]),
    ];
    expect(first.colors.length, equals(expectedFirst.length));
    for (var i = 0; i < expectedFirst.length; i++) {
      final color = first.colors[i];
      expect(color.name, equals(expectedFirst[i].$1), reason: 'color $i name');
      expect(
        [color.red, color.green, color.blue],
        equals(expectedFirst[i].$2),
        reason: 'color $i rgb',
      );
      expect(
        [color.hv, color.sv, color.vv],
        equals(expectedFirst[i].$3),
        reason: 'color $i variability',
      );
    }

    final second = PainterPalette.fromBytes(
      File('test/testdata/painter/painter2.txt').readAsBytesSync(),
    );
    expect(second.colors.length, equals(2));
    expect(second.colors[0].name, equals('FFFFFF'));
    expect([
      second.colors[0].red,
      second.colors[0].green,
      second.colors[0].blue,
    ], equals([255, 255, 255]));
    expect(second.colors[1].name, equals('000000'));
    expect([
      second.colors[1].red,
      second.colors[1].green,
      second.colors[1].blue,
    ], equals([0, 0, 0]));
  });

  test('truncated input throws FormatException and is not valid', () {
    const header = '''
ROWS 7
COLS 1
WIDTH 140
HEIGHT 30
TEXTHEIGHT 12
SPACING 1
''';
    const color =
        'R:247, G:224, B:23  HV:0.00, SV:0.00, VV:0.00  PANTONE Yellow C';
    for (final content in [
      'ROWS 7',
      'ROWS 7\nCOLS 1\n',
      header.split('\n').take(5).join('\n'),
      (header + color).substring(0, header.length + 10),
    ]) {
      final input = utf8.encode(content);
      expect(PainterPalette.isValidFormat(input), isFalse);
      expect(
        () => PainterPalette.fromBytes(input),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('decode rejects malformed values', () {
    const header = '''
ROWS 7
COLS 1
WIDTH 140
HEIGHT 30
TEXTHEIGHT 12
SPACING 1
''';
    final cases = {
      'negative header': '''
ROWS -1
COLS 1
WIDTH 140
HEIGHT 30
TEXTHEIGHT 12
SPACING 1
R:1, G:2, B:3  HV:0.00, SV:0.00, VV:0.00  X''',
      'channel over 255':
          '${header}R:300, G:0, B:0  HV:0.00, SV:0.00, VV:0.00  X',
      'NaN variability': '${header}R:1, G:2, B:3  HV:NaN, SV:0.00, VV:0.00  X',
      'infinite variability':
          '${header}R:1, G:2, B:3  HV:0.00, SV:Infinity, VV:0.00  X',
    };
    cases.forEach((reason, content) {
      final input = utf8.encode(content);
      expect(PainterPalette.isValidFormat(input), isFalse, reason: reason);
      expect(
        () => PainterPalette.fromBytes(input),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('decodes lone-CR line endings', () {
    final bytes = utf8.encode(
      'ROWS 7\rCOLS 1\rWIDTH 140\rHEIGHT 30\rTEXTHEIGHT 12\rSPACING 1\r'
      'R:247, G:224, B:23  HV:0.00, SV:0.00, VV:0.00  PANTONE Yellow C\r',
    );
    final palette = PainterPalette.fromBytes(bytes);
    expect(palette.rows, equals(7));
    expect(palette.colors.length, equals(1));
    expect(palette.colors.single.name, equals('PANTONE Yellow C'));
  });

  test('encoder writes no trailing newline', () {
    final bytes = File('test/testdata/painter/painter2.txt').readAsBytesSync();
    final palette = PainterPalette.fromBytes(bytes);
    expect(palette.toBytes(), equals(bytes));
    expect(palette.toBytes().last, isNot(equals(utf8.encode('\n').single)));
  });

  test('encoder rejects unencodable palettes', () {
    // Out-of-range values trip the constructor asserts in debug builds
    // and the encoder validation in release; accept either.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    PainterPaletteColor color({
      int red = 1,
      int green = 2,
      int blue = 3,
      double hv = 0,
      double sv = 0,
      double vv = 0,
      String name = 'X',
    }) => PainterPaletteColor(
      red: red,
      green: green,
      blue: blue,
      hv: hv,
      sv: sv,
      vv: vv,
      name: name,
    );
    PainterPalette build({int rows = 1, List<PainterPaletteColor>? colors}) =>
        PainterPalette(
          rows: rows,
          columns: 1,
          width: 10,
          height: 10,
          textHeight: 10,
          spacing: 1,
          colors: colors ?? [color()],
        );

    expect(() => build(colors: []).toBytes(), throwsA(isA<FormatException>()));
    expect(() => build(rows: -1).toBytes(), throwsA(either));
    expect(() => build(colors: [color(red: 300)]).toBytes(), throwsA(either));
    expect(
      () => build(colors: [color(hv: double.nan)]).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => build(colors: [color(vv: double.infinity)]).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => build(colors: [color(name: 'A\nB')]).toBytes(),
      throwsA(isA<FormatException>()),
    );
    // Empty names are allowed by design and round-trip.
    final unnamed = build(colors: [color(name: '')]);
    expect(
      PainterPalette.fromBytes(unnamed.toBytes()).colors.single.name,
      isEmpty,
    );
  });

  test('write painter file', () {
    final painter = PainterPalette(
      rows: 1,
      columns: 2,
      width: 140,
      height: 30,
      textHeight: 12,
      spacing: 1,
      colors: [
        PainterPaletteColor(
          red: 255,
          green: 0,
          blue: 0,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'red',
        ),
        PainterPaletteColor(
          red: 0,
          green: 0,
          blue: 255,
          hv: 0,
          sv: 0,
          vv: 0,
          name: 'blue',
        ),
      ],
    );

    // write to temp file
    final painterFile = File('./test/test.txt');
    painterFile.writeAsBytesSync(painter.toBytes());

    final decodedPainter = PainterPalette.fromBytes(
      painterFile.readAsBytesSync(),
    );

    expect(decodedPainter.rows, equals(1));
    expect(decodedPainter.columns, equals(2));
    expect(decodedPainter.colors.length, equals(2));

    expect(decodedPainter.colors[0].name, equals('red'));
    expect(decodedPainter.colors[0].red, equals(255));
    expect(decodedPainter.colors[0].green, equals(0));
    expect(decodedPainter.colors[0].blue, equals(0));

    expect(decodedPainter.colors[1].name, equals('blue'));
    expect(decodedPainter.colors[1].blue, equals(255));

    // delete temp file
    painterFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = PainterPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
