part of 'sketchpreset.dart';

SketchPreset _decode(List<int> bytes) {
  if (_isZip(bytes)) {
    return _decodeZip(bytes);
  }
  return _decodeJsonBytes(bytes, 'Sketch Preset');
}

bool _isZip(List<int> bytes) {
  return bytes.length >= 4 &&
      bytes[0] == 0x50 &&
      bytes[1] == 0x4B &&
      (bytes[2] == 0x03 || bytes[2] == 0x05 || bytes[2] == 0x07) &&
      (bytes[3] == 0x04 || bytes[3] == 0x06 || bytes[3] == 0x08);
}

SketchPreset _decodeJsonBytes(List<int> bytes, String label) {
  final decodedJson = json.decode(utf8.decode(bytes));
  final colorAssets = _findColorAssets(decodedJson);
  if (colorAssets == null) {
    throw FormatException('Invalid $label file: expected `root.colorAssets`.');
  }
  return SketchPreset(colors: _parseColorAssets(colorAssets, label));
}

/// Best-effort ZIP branch: prefer the open bundle layout (`document.json`
/// with an `assets.colorAssets` collection), then scan every JSON entry for
/// a `colorAssets` / `root.colorAssets` shape. The 54+ native
/// `MSPersistentAssetCollection` serialization has no public spec.
SketchPreset _decodeZip(List<int> bytes) {
  final archive = ZipDecoder().decodeBytes(bytes);

  ArchiveFile? documentJson;
  for (final file in archive.files) {
    if (file.isFile && file.name.toLowerCase() == 'document.json') {
      documentJson = file;
      break;
    }
  }
  if (documentJson != null) {
    final decodedJson = json.decode(
      utf8.decode(documentJson.content as List<int>),
    );
    if (decodedJson is Map<String, dynamic>) {
      final assets = decodedJson['assets'];
      if (assets is Map<String, dynamic>) {
        final colorAssets = assets['colorAssets'];
        if (colorAssets is List) {
          return SketchPreset(
            colors: _parseColorAssets(colorAssets, 'Sketch Preset'),
          );
        }
        final colors = assets['colors'];
        if (colors is List) {
          return SketchPreset(colors: _parseLegacyColors(colors));
        }
      }
    }
    throw const FormatException(
      'Invalid Sketch Preset file: `document.json` has no color assets.',
    );
  }

  for (final file in archive.files) {
    if (!file.isFile || !file.name.toLowerCase().endsWith('.json')) {
      continue;
    }
    try {
      final decodedJson = json.decode(utf8.decode(file.content as List<int>));
      final colorAssets = _findColorAssets(decodedJson);
      if (colorAssets != null) {
        return SketchPreset(
          colors: _parseColorAssets(colorAssets, 'Sketch Preset'),
        );
      }
    } on FormatException {
      continue;
    }
  }
  throw const FormatException(
    'Invalid Sketch Preset file: no color assets found in archive.',
  );
}

/// Accepts the pre-54 `{root: {colorAssets: [...]}}` shape and a bare
/// `{colorAssets: [...]}` shape.
List<dynamic>? _findColorAssets(dynamic decodedJson) {
  if (decodedJson is Map<String, dynamic>) {
    final colorAssets = decodedJson['colorAssets'];
    if (colorAssets is List) return colorAssets;
    final root = decodedJson['root'];
    if (root is Map<String, dynamic>) {
      final nested = root['colorAssets'];
      if (nested is List) return nested;
    }
  }
  return null;
}

List<SketchPresetColor> _parseColorAssets(
  List<dynamic> colorAssets,
  String label,
) {
  final colors = <SketchPresetColor>[];
  for (final entry in colorAssets) {
    if (entry is! Map<String, dynamic>) {
      throw FormatException('Invalid $label file: expected color objects.');
    }
    final color = entry['color'];
    if (color is! Map<String, dynamic>) {
      throw FormatException('Invalid $label file: expected color objects.');
    }
    final name = entry['name'];
    colors.add(
      SketchPresetColor(
        name: name is String ? name : null,
        red: _unitInterval(color['red'], label),
        green: _unitInterval(color['green'], label),
        blue: _unitInterval(color['blue'], label),
        alpha: _unitInterval(color['alpha'], label),
      ),
    );
  }
  return colors;
}

/// Legacy `assets.colors` entries are bare `{red, green, blue, alpha}`
/// colors without names.
List<SketchPresetColor> _parseLegacyColors(List<dynamic> colors) {
  final parsed = <SketchPresetColor>[];
  for (final entry in colors) {
    if (entry is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid Sketch Preset file: expected color objects.',
      );
    }
    parsed.add(
      SketchPresetColor(
        red: _unitInterval(entry['red'], 'Sketch Preset'),
        green: _unitInterval(entry['green'], 'Sketch Preset'),
        blue: _unitInterval(entry['blue'], 'Sketch Preset'),
        alpha: _unitInterval(entry['alpha'], 'Sketch Preset'),
      ),
    );
  }
  return parsed;
}

double _unitInterval(dynamic value, String label) {
  if (value is num) return value.toDouble();
  throw FormatException('Invalid $label file: expected 0..1 components.');
}
