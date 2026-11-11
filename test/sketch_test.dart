import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sketch Document with Color Variables', () {
    late List<int> bytes;

    setUpAll(() {
      bytes =
          File(
            'test/testdata/sketch/document-swatches.sketch',
          ).readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(SketchDocumentPalette.isValidFormat(bytes), isTrue);
    });

    test('parses shared swatches', () {
      final palette = SketchDocumentPalette.fromBytes(bytes);

      expect(palette.colors.length, equals(3));

      final first = palette.colors.first;
      expect(first.name, equals('Brand/colors.brand.beige.100'));
      expect(first.red, closeTo(0.8784313725490196, 1e-9));
      expect(first.green, closeTo(0.792156862745098, 1e-9));
      expect(first.blue, closeTo(0.615686274509804, 1e-9));
      expect(first.alpha, equals(1.0));
    });

    test('parses alpha correctly', () {
      final palette = SketchDocumentPalette.fromBytes(bytes);
      expect(palette.colors[2].name, equals('Transparent Black'));
      expect(palette.colors[2].alpha, equals(0.5));
    });
  });

  group('Sketch Document with legacy colors', () {
    late List<int> bytes;

    setUpAll(() {
      bytes =
          File('test/testdata/sketch/document-legacy.sketch').readAsBytesSync();
    });

    test('isValidFormat returns true', () {
      expect(SketchDocumentPalette.isValidFormat(bytes), isTrue);
    });

    test('falls back to asset colors', () {
      final palette = SketchDocumentPalette.fromBytes(bytes);

      expect(palette.colors.length, equals(2));
      expect(palette.colors.first.name, equals('Legacy Blue'));
      expect(palette.colors.first.blue, equals(1.0));
      // Bare `assets.colors` entries have no name.
      expect(palette.colors[1].name, isNull);
      expect(palette.colors[1].red, equals(1.0));
    });
  });

  test('isValidFormat returns false for invalid sketch file', () {
    expect(SketchDocumentPalette.isValidFormat([0, 1, 2, 3, 4, 5]), isFalse);
    final missingDocument =
        File('test/testdata/sketch/not-a-document.sketch').readAsBytesSync();
    expect(SketchDocumentPalette.isValidFormat(missingDocument), isFalse);
  });

  group('validation', () {
    List<int> zipOf(String documentJson) {
      final content = utf8.encode(documentJson);
      final archive = Archive();
      archive.addFile(ArchiveFile('document.json', content.length, content));
      return ZipEncoder().encode(archive);
    }

    String swatchDoc(String red) =>
        '{"sharedSwatches":{"objects":[{"name":"x","value":'
        '{"red":$red,"green":0,"blue":0,"alpha":1}}]}}';

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => SketchDocumentPalette.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(
        SketchDocumentPalette.isValidFormat(bytes),
        isFalse,
        reason: label,
      );
    }

    test('rejects out-of-range and non-finite channels on every path', () {
      final cases = <String, String>{
        'swatch above range': swatchDoc('2'),
        'swatch negative': swatchDoc('-0.5'),
        // Strict JSON has no Infinity literal, but overflow decodes to it.
        'swatch overflow to Infinity': swatchDoc('1e999'),
        'swatch red as string': swatchDoc('"x"'),
        'legacy colorAsset above range':
            '{"assets":{"colorAssets":[{"name":"x","color":'
            '{"red":2,"green":0,"blue":0,"alpha":1}}]}}',
        'legacy bare color above range':
            '{"assets":{"colors":[{"red":0,"green":0,"blue":2,"alpha":1}]}}',
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, zipOf(entry.value));
      }
    });

    test('rejects non-zip and truncated input', () {
      expectRejected('non-zip', [0, 1, 2, 3, 4, 5]);
      final full =
          File(
            'test/testdata/sketch/document-swatches.sketch',
          ).readAsBytesSync();
      expectRejected('truncated zip', full.sublist(0, full.length ~/ 2));
    });

    test('accepts documents without colors', () {
      final empty = SketchDocumentPalette.fromBytes(zipOf('{}'));
      expect(empty.colors, isEmpty);
      expect(SketchDocumentPalette.isValidFormat(zipOf('{}')), isTrue);
    });
  });
}
