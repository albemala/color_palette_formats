import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'sketchpreset.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: Sketch Preset
 * Versions: pre-54 JSON, 54+ ZIP
 * File extensions: .sketchpreset
 * Applications: Sketch
 * Format details: Two shapes. Sketch < 54 writes plain JSON with colors at
 *   `root.colorAssets` (`{name, color: {red, green, blue, alpha}}`, 0..1
 *   floats). Sketch 54+ writes a ZIP archive (only readable here through
 *   the open file-format bundle layout: `document.json` with an
 *   `assets.colorAssets` collection); the native
 *   `MSPersistentAssetCollection` serialization has no public spec, so ZIP
 *   entries are scanned best-effort for `colorAssets` shapes.
 * References:
 * - https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/sketchpreset-to-colors.js
 * - https://developer.sketch.com/file-format/
 * - https://github.com/sketch-hq/sketch-document
 */

@MappableClass()
class SketchPresetColor with SketchPresetColorMappable {
  final String? name;

  /// Value: [0..1]
  final double red;

  /// Value: [0..1]
  final double green;

  /// Value: [0..1]
  final double blue;

  /// Value: [0..1]
  final double alpha;

  SketchPresetColor({
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
class SketchPreset with SketchPresetMappable {
  final List<SketchPresetColor> colors;

  SketchPreset({required this.colors});

  factory SketchPreset.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid Sketch Preset file.
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
