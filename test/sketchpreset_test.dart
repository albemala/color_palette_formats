import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sketch Preset JSON File', () {
    late List<int> bytes;

    setUpAll(() {
      bytes = File(
        'test/testdata/sketchpreset/preset-json.sketchpreset',
      ).readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(SketchPreset.isValidFormat(bytes), isTrue);
    });

    test('parses correctly', () {
      final preset = SketchPreset.fromBytes(bytes);

      expect(preset.colors.length, equals(3));

      final first = preset.colors.first;
      expect(first.name, equals('Brand Red'));
      expect(first.red, closeTo(0.9568627450980391, 1e-9));
      expect(first.green, closeTo(0.2627450980392157, 1e-9));
      expect(first.blue, closeTo(0.21176470588235294, 1e-9));
      expect(first.alpha, equals(1.0));
    });

    test('parses alpha correctly', () {
      final preset = SketchPreset.fromBytes(bytes);
      expect(preset.colors[2].name, equals('Ghost White'));
      expect(preset.colors[2].alpha, equals(0.5));
    });

    test('round-trip write and re-read', () {
      final preset = SketchPreset.fromBytes(bytes);
      final decoded = SketchPreset.fromBytes(preset.toBytes());

      expect(decoded.colors.length, equals(preset.colors.length));
      for (var i = 0; i < decoded.colors.length; i++) {
        expect(decoded.colors[i].name, equals(preset.colors[i].name));
        expect(decoded.colors[i].red, equals(preset.colors[i].red));
        expect(decoded.colors[i].green, equals(preset.colors[i].green));
        expect(decoded.colors[i].blue, equals(preset.colors[i].blue));
        expect(decoded.colors[i].alpha, equals(preset.colors[i].alpha));
      }
    });
  });

  group('Sketch Preset ZIP File', () {
    late List<int> bytes;

    setUpAll(() {
      bytes = File(
        'test/testdata/sketchpreset/preset-zip.sketchpreset',
      ).readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(SketchPreset.isValidFormat(bytes), isTrue);
    });

    test('parses document.json color assets', () {
      final preset = SketchPreset.fromBytes(bytes);

      expect(preset.colors.length, equals(2));
      expect(preset.colors.first.name, equals('Ocean'));
      expect(preset.colors.first.red, equals(0.0));
      expect(preset.colors.first.green, closeTo(0.47843137254901963, 1e-9));
      expect(preset.colors.first.blue, equals(1.0));
      expect(preset.colors[1].name, equals('Sand'));
    });
  });

  test('isValidFormat returns false for invalid preset', () {
    expect(SketchPreset.isValidFormat([0, 1, 2, 3, 4, 5]), isFalse);
    expect(
      SketchPreset.isValidFormat('{"root":{}}'.codeUnits),
      isFalse,
    );
  });

  test('write sketchpreset file', () {
    final preset = SketchPreset(
      colors: [
        SketchPresetColor(
          name: 'Red',
          red: 1,
          green: 0,
          blue: 0,
          alpha: 1,
        ),
        SketchPresetColor(
          name: 'Transparent Blue',
          red: 0,
          green: 0,
          blue: 1,
          alpha: 0.5,
        ),
      ],
    );

    final presetFile = File('./test/test.sketchpreset');
    presetFile.writeAsBytesSync(preset.toBytes());

    final decoded = SketchPreset.fromBytes(presetFile.readAsBytesSync());
    expect(decoded.colors.length, equals(2));
    expect(decoded.colors[0].name, equals('Red'));
    expect(decoded.colors[0].red, equals(1.0));
    expect(decoded.colors[1].name, equals('Transparent Blue'));
    expect(decoded.colors[1].alpha, equals(0.5));

    presetFile.deleteSync();
  });
}
