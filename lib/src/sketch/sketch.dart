import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'sketch.mapper.dart';
part 'decode.dart';

/*
 * Format name: Sketch Document colors
 * File extensions: .sketch
 * Applications: Sketch
 * Format details: Import-only extractor (a document cannot round-trip, so
 *   there is no `toBytes`). A `.sketch` file is a ZIP archive; colors are
 *   read from `document.json`, preferring Color Variables
 *   (`sharedSwatches.objects`: `{name, value: {red, green, blue, alpha}}`,
 *   0..1 floats) and falling back to legacy document colors
 *   (`assets.colorAssets`: `{name, color}` plus `assets.colors`: bare
 *   colors). The non-empty Color Variables list wins when present.
 * References:
 * - https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/sketch-to-colors.js
 * - https://developer.sketch.com/file-format/
 * - https://www.sketch.com/blog/open-format-reading-sketch-file-sketch-to-json/
 * - https://github.com/sketch-hq/sketch-document
 */

@MappableClass()
class SketchDocumentColor with SketchDocumentColorMappable {
  final String? name;

  /// Value: [0..1]
  final double red;

  /// Value: [0..1]
  final double green;

  /// Value: [0..1]
  final double blue;

  /// Value: [0..1]
  final double alpha;

  SketchDocumentColor({
    this.name,
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  }) : assert(red >= 0 && red <= 1, 'red must be between 0 and 1'),
       assert(green >= 0 && green <= 1, 'green must be between 0 and 1'),
       assert(blue >= 0 && blue <= 1, 'blue must be between 0 and 1'),
       assert(alpha >= 0 && alpha <= 1, 'alpha must be between 0 and 1');
}

@MappableClass()
class SketchDocumentPalette with SketchDocumentPaletteMappable {
  final List<SketchDocumentColor> colors;

  SketchDocumentPalette({required this.colors});

  /// Extracts the document colors (no `toBytes`: a document cannot
  /// round-trip through a palette).
  factory SketchDocumentPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  /// Checks if the provided bytes represent a valid Sketch document.
  /// Runs a full decode so truncated files are rejected.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
