import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/skencil/mini.spl': (
      23,
      SkencilPaletteColor(red: 0, green: 0, blue: 0, name: 'Black'),
    ),
    'test/testdata/skencil/www.spl': (
      216,
      SkencilPaletteColor(red: 0, green: 0, blue: 0, name: '#000000'),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('Skencil Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final skencilFile = File(filePath);
        bytes = skencilFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(SkencilPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final skencilPalette = SkencilPalette.fromBytes(bytes);

        expect(skencilPalette.colors.length, equals(expected.$1));

        final firstColor = skencilPalette.colors.first;
        final expectedFirstColor = expected.$2;

        expect(
          firstColor.name,
          equals(expectedFirstColor.name),
          reason: 'Name mismatch for the first color',
        );
        // Use closeTo for floating point comparisons
        expect(
          firstColor.red,
          closeTo(expectedFirstColor.red, 1e-9),
          reason: 'Red value mismatch for the first color',
        );
        expect(
          firstColor.green,
          closeTo(expectedFirstColor.green, 1e-9),
          reason: 'Green value mismatch for the first color',
        );
        expect(
          firstColor.blue,
          closeTo(expectedFirstColor.blue, 1e-9),
          reason: 'Blue value mismatch for the first color',
        );
      });
    });
  });

  test('isValidFormat returns false for invalid SkencilPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SkencilPalette.isValidFormat(invalidBytes), isFalse);
  });

  group('validation', () {
    const header = '##Sketch RGBPalette 0\n';
    List<int> body(String content) => utf8.encode(header + content);

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => SkencilPalette.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(SkencilPalette.isValidFormat(bytes), isFalse, reason: label);
    }

    test('rejects malformed and out-of-range values', () {
      final cases = <String, String>{
        'negative red': '-0.5 0.0 0.0\tNeg\n',
        'negative green': '0.0 -1.0 0.0\tNeg\n',
        'above range': '2.0 0.0 0.0\tBig\n',
        'double dot': '1.2.3 0.0 0.0\tWeird\n',
        'overflow': '1e999 0.0 0.0\tHuge\n',
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, body(entry.value));
      }
    });

    test('accepts exponents and both separators', () {
      final palette = SkencilPalette.fromBytes(
        body('1e0 0.0 0.0\tExp\n0.0 0.0 1.0 Blue\n'),
      );
      expect(palette.colors.length, equals(2));
      expect(palette.colors.first.red, closeTo(1.0, 1e-9));
      expect(palette.colors.first.name, equals('Exp'));
      expect(palette.colors[1].name, equals('Blue'));
      expect(
        SkencilPalette.isValidFormat(
          body('1e0 0.0 0.0\tExp\n0.0 0.0 1.0 Blue\n'),
        ),
        isTrue,
      );
    });

    test('reads lone-CR endings as separate colors', () {
      final palette = SkencilPalette.fromBytes(
        utf8.encode('${header}1.0 0.0 0.0\tRed\r0.0 0.0 1.0\tBlue\r'),
      );
      expect(palette.colors.length, equals(2));
      expect(palette.colors[0].name, equals('Red'));
      expect(palette.colors[1].name, equals('Blue'));
    });

    test('skips unknown lines, rejects nameless triples', () {
      // Comment-like lines are skipped; a nameless `r g b` triple starts
      // with a number, so it is a corrupt color attempt, not a comment.
      final mixed = SkencilPalette.fromBytes(
        body('1.0 0.0 0.0\tRed\nnot a color\n0.0 1.0 0.0\tGreen\n'),
      );
      expect(mixed.colors.length, equals(2));
      expect(mixed.colors.first.name, equals('Red'));

      expectRejected('nameless triple', body('0.0 0.0 1.0\n'));

      final empty = SkencilPalette.fromBytes(body(''));
      expect(empty.colors, isEmpty);
      expect(SkencilPalette.isValidFormat(body('')), isTrue);
    });

    test('encoder rejects invalid colors', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      final cases = <String, SkencilPaletteColor Function()>{
        'above range':
            () => SkencilPaletteColor(name: 'x', red: 2, green: 0, blue: 0),
        'negative':
            () => SkencilPaletteColor(name: 'x', red: -0.1, green: 0, blue: 0),
        'NaN':
            () => SkencilPaletteColor(
              name: 'x',
              red: double.nan,
              green: 0,
              blue: 0,
            ),
        'infinite':
            () => SkencilPaletteColor(
              name: 'x',
              red: double.infinity,
              green: 0,
              blue: 0,
            ),
      };
      for (final entry in cases.entries) {
        expect(
          () => SkencilPalette(colors: [entry.value()]).toBytes(),
          throwsA(either),
          reason: entry.key,
        );
      }
      for (final badName in ['a\nb', 'a\rb']) {
        expect(
          () =>
              SkencilPalette(
                colors: [
                  SkencilPaletteColor(red: 0, green: 0, blue: 0, name: badName),
                ],
              ).toBytes(),
          throwsA(isA<FormatException>()),
          reason: 'name = ${badName.codeUnits}',
        );
      }
    });
  });

  test('write skencil file', () {
    final skencilPalette = SkencilPalette(
      colors: [
        SkencilPaletteColor(name: 'Test Red', red: 1, green: 0, blue: 0),
        SkencilPaletteColor(name: 'Test Green', red: 0, green: 1, blue: 0),
        SkencilPaletteColor(name: 'Test Blue', red: 0, green: 0, blue: 1),
        SkencilPaletteColor(name: 'Test Gray', red: 0.5, green: 0.5, blue: 0.5),
      ],
    );

    // Round-trip in memory (no temp file written into the repo).
    final decodedPalette = SkencilPalette.fromBytes(skencilPalette.toBytes());

    expect(decodedPalette.colors.length, equals(4));

    // Verify first color
    expect(decodedPalette.colors[0].name, equals('Test Red'));
    expect(decodedPalette.colors[0].red, closeTo(1.0, 0.000001));
    expect(decodedPalette.colors[0].green, closeTo(0.0, 0.000001));
    expect(decodedPalette.colors[0].blue, closeTo(0.0, 0.000001));

    // Verify last color
    expect(decodedPalette.colors[3].name, equals('Test Gray'));
    expect(decodedPalette.colors[3].red, closeTo(0.5, 0.000001));
    expect(decodedPalette.colors[3].green, closeTo(0.5, 0.000001));
    expect(decodedPalette.colors[3].blue, closeTo(0.5, 0.000001));
  });
}
