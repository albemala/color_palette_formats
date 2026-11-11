import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/sketchpalette/sketchpalette1_v1.4.sketchpalette': (
      6,
      SketchPaletteColor(red: 0.28, green: 0.16, blue: 0.18, alpha: 1),
    ),
    'test/testdata/sketchpalette/sketchpalette2_v1.4.sketchpalette': (
      10,
      SketchPaletteColor(
        red: 0.3529411764705882,
        green: 0.7843137254901961,
        blue: 0.9803921568627451,
        alpha: 1,
      ),
    ),
    'test/testdata/sketchpalette/material-design.sketchpalette': (
      256,
      SketchPaletteColor(
        red: 0.9568627450980391,
        green: 0.2627450980392157,
        blue: 0.21176470588235294,
        alpha: 1,
      ),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('Sketch Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final sketchpaletteFile = File(filePath);
        bytes = sketchpaletteFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(SketchPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final sketchpalette = SketchPalette.fromBytes(bytes);

        expect(
          sketchpalette.compatibleVersion,
          equals(SketchPalette.validVersion),
          reason: 'Compatible version mismatch',
        );
        expect(
          sketchpalette.pluginVersion,
          equals(SketchPalette.validVersion),
          reason: 'Plugin version mismatch',
        );

        expect(sketchpalette.colors.length, equals(expected.$1));

        final firstColor = sketchpalette.colors.first;
        final expectedFirstColor = expected.$2;

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
        expect(
          firstColor.alpha,
          closeTo(expectedFirstColor.alpha, 1e-9),
          reason: 'Alpha value mismatch for the first color',
        );
      });

      test('decode-encode-decode is stable', () {
        final palette = SketchPalette.fromBytes(bytes);
        final decodedAgain = SketchPalette.fromBytes(palette.toBytes());
        expect(decodedAgain.colors.length, equals(palette.colors.length));
        expect(
          decodedAgain.colors.first.red,
          closeTo(palette.colors.first.red, 1e-12),
        );
      });
    });
  });

  test('isValidFormat returns false for invalid SketchPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(SketchPalette.isValidFormat(invalidBytes), isFalse);
  });

  group('validation', () {
    String doc({
      String compatibleVersion = '"1.4"',
      String pluginVersion = '"1.4"',
      String colors = '[]',
    }) =>
        '{"compatibleVersion":$compatibleVersion,'
        '"pluginVersion":$pluginVersion,"colors":$colors}';
    List<int> body(String content) => utf8.encode(content);

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => SketchPalette.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(SketchPalette.isValidFormat(bytes), isFalse, reason: label);
    }

    test('rejects structural failures', () {
      final cases = <String, String>{
        'missing compatibleVersion': doc(
          compatibleVersion: 'null',
        ).replaceFirst('"compatibleVersion":null,', ''),
        'missing colors': '{"compatibleVersion":"1.4","pluginVersion":"1.4"}',
        'colors not a list': doc(colors: '{}'),
        'color not an object': doc(colors: '[42]'),
        'red as string': doc(
          colors: '[{"red":"x","green":0,"blue":0,"alpha":1}]',
        ),
        'missing alpha': doc(colors: '[{"red":0,"green":0,"blue":0}]'),
        'top-level array': '[]',
        'trailing garbage': '${doc()} trailing',
        'not JSON': 'not json at all',
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, body(entry.value));
      }
      expectRejected('non-UTF-8', [0xFF, 0xFE, 0x00]);
    });

    test('rejects out-of-range and non-finite channels', () {
      String color(String red) =>
          doc(colors: '[{"red":$red,"green":0,"blue":0,"alpha":1}]');
      final cases = <String, String>{
        'above range': color('2'),
        'negative': color('-0.5'),
        'alpha above range': doc(
          colors: '[{"red":0,"green":0,"blue":0,"alpha":2}]',
        ),
        // Strict JSON has no Infinity literal, but overflow decodes to it.
        'overflow to Infinity': color('1e999'),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, body(entry.value));
      }
    });

    test('rejects unsupported versions', () {
      final cases = <String, String>{
        'compatibleVersion 2.0': doc(compatibleVersion: '"2.0"'),
        'pluginVersion 2.0': doc(pluginVersion: '"2.0"'),
        'numeric version': doc(compatibleVersion: '1.4'),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, body(entry.value));
      }
    });

    test('accepts empty palettes', () {
      final palette = SketchPalette.fromBytes(body(doc()));
      expect(palette.colors, isEmpty);
      expect(SketchPalette.isValidFormat(body(doc())), isTrue);
    });

    test('encoder rejects invalid palettes', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      final cases = <String, SketchPaletteColor Function()>{
        'above range':
            () => SketchPaletteColor(red: 2, green: 0, blue: 0, alpha: 1),
        'negative':
            () => SketchPaletteColor(red: -0.1, green: 0, blue: 0, alpha: 1),
        'NaN':
            () => SketchPaletteColor(
              red: double.nan,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
        'infinite':
            () => SketchPaletteColor(
              red: double.infinity,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
      };
      for (final entry in cases.entries) {
        expect(
          () =>
              SketchPalette(
                compatibleVersion: SketchPalette.validVersion,
                pluginVersion: SketchPalette.validVersion,
                colors: [entry.value()],
              ).toBytes(),
          throwsA(either),
          reason: entry.key,
        );
      }
      // Version fields carry no constructor asserts, so the encoder's
      // FormatException surfaces directly.
      expect(
        () =>
            SketchPalette(
              compatibleVersion: '2.0',
              pluginVersion: '1.4',
              colors: [],
            ).toBytes(),
        throwsA(isA<FormatException>()),
        reason: 'bad compatibleVersion',
      );
    });
  });

  test('write sketchpalette file', () {
    final sketchPalette = SketchPalette(
      compatibleVersion: SketchPalette.validVersion,
      pluginVersion: SketchPalette.validVersion,
      colors: [
        SketchPaletteColor(red: 1, green: 0, blue: 0, alpha: 1),
        SketchPaletteColor(red: 0, green: 1, blue: 0, alpha: 1),
        SketchPaletteColor(red: 0, green: 0, blue: 1, alpha: 1),
      ],
    );

    // Round-trip in memory (no temp file written into the repo).
    final decodedSketchPalette = SketchPalette.fromBytes(
      sketchPalette.toBytes(),
    );

    expect(
      decodedSketchPalette.compatibleVersion,
      equals(SketchPalette.validVersion),
    );
    expect(
      decodedSketchPalette.pluginVersion,
      equals(SketchPalette.validVersion),
    );

    expect(decodedSketchPalette.colors.length, equals(3));

    expect(decodedSketchPalette.colors[0].red, equals(1));
    expect(decodedSketchPalette.colors[0].green, equals(0));
    expect(decodedSketchPalette.colors[0].blue, equals(0));
    expect(decodedSketchPalette.colors[0].alpha, equals(1));

    expect(decodedSketchPalette.colors[1].red, equals(0));
    expect(decodedSketchPalette.colors[1].green, equals(1));
    expect(decodedSketchPalette.colors[1].blue, equals(0));
    expect(decodedSketchPalette.colors[1].alpha, equals(1));

    expect(decodedSketchPalette.colors[2].red, equals(0));
    expect(decodedSketchPalette.colors[2].green, equals(0));
    expect(decodedSketchPalette.colors[2].blue, equals(1));
    expect(decodedSketchPalette.colors[2].alpha, equals(1));
  });
}
