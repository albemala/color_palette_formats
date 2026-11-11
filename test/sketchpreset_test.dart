import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sketch Preset JSON File', () {
    late List<int> bytes;

    setUpAll(() {
      bytes =
          File(
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
      bytes =
          File(
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
    expect(SketchPreset.isValidFormat('{"root":{}}'.codeUnits), isFalse);
  });

  group('validation', () {
    String presetDoc(String red) =>
        '{"root":{"colorAssets":[{"name":"x","color":'
        '{"red":$red,"green":0,"blue":0,"alpha":1}}]}}';

    List<int> zipOf(String documentJson) {
      final content = utf8.encode(documentJson);
      final archive = Archive();
      archive.addFile(ArchiveFile('document.json', content.length, content));
      return ZipEncoder().encode(archive);
    }

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => SketchPreset.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(SketchPreset.isValidFormat(bytes), isFalse, reason: label);
    }

    test('rejects out-of-range and non-finite channels on every path', () {
      final cases = <String, List<int>>{
        'json above range': utf8.encode(presetDoc('2')),
        'json negative': utf8.encode(presetDoc('-0.5')),
        // Strict JSON has no Infinity literal, but overflow decodes to it.
        'json overflow to Infinity': utf8.encode(presetDoc('1e999')),
        'json red as string': utf8.encode(presetDoc('"x"')),
        'zip above range': zipOf(
          '{"assets":{"colorAssets":[{"name":"x","color":'
          '{"red":2,"green":0,"blue":0,"alpha":1}}]}}',
        ),
        'zip legacy color above range': zipOf(
          '{"assets":{"colors":[{"red":0,"green":0,"blue":2,"alpha":1}]}}',
        ),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, entry.value);
      }
    });

    test('rejects truncated zip input', () {
      final full =
          File(
            'test/testdata/sketchpreset/preset-zip.sketchpreset',
          ).readAsBytesSync();
      expectRejected('truncated zip', full.sublist(0, full.length ~/ 2));
    });

    test('accepts empty color assets', () {
      for (final doc in ['{"root":{"colorAssets":[]}}', '{"colorAssets":[]}']) {
        final preset = SketchPreset.fromBytes(utf8.encode(doc));
        expect(preset.colors, isEmpty, reason: doc);
        expect(SketchPreset.isValidFormat(utf8.encode(doc)), isTrue);
      }
    });

    test('encoder rejects invalid colors', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      final cases = <String, SketchPresetColor Function()>{
        'above range':
            () => SketchPresetColor(
              name: 'x',
              red: 2,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
        'negative':
            () => SketchPresetColor(
              name: 'x',
              red: -0.1,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
        'NaN':
            () => SketchPresetColor(
              name: 'x',
              red: double.nan,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
        'infinite':
            () => SketchPresetColor(
              name: 'x',
              red: double.infinity,
              green: 0,
              blue: 0,
              alpha: 1,
            ),
      };
      for (final entry in cases.entries) {
        expect(
          () => SketchPreset(colors: [entry.value()]).toBytes(),
          throwsA(either),
          reason: entry.key,
        );
      }
    });
  });

  test('write sketchpreset file', () {
    final preset = SketchPreset(
      colors: [
        SketchPresetColor(name: 'Red', red: 1, green: 0, blue: 0, alpha: 1),
        SketchPresetColor(
          name: 'Transparent Blue',
          red: 0,
          green: 0,
          blue: 1,
          alpha: 0.5,
        ),
      ],
    );

    // Round-trip in memory (no temp file written into the repo).
    final decoded = SketchPreset.fromBytes(preset.toBytes());
    expect(decoded.colors.length, equals(2));
    expect(decoded.colors[0].name, equals('Red'));
    expect(decoded.colors[0].red, equals(1.0));
    expect(decoded.colors[1].name, equals('Transparent Blue'));
    expect(decoded.colors[1].alpha, equals(0.5));
  });
}
