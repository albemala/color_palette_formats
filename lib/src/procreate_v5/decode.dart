part of 'procreate.dart';

// Note: decoding is tolerant following ColorPaletteCodable's
// ProcreateSwatchesCoder: the JSON may use a numeric version, omit
// colorProfiles/optional swatch fields, or (rarely) wrap the palette in a
// single-element array. Missing values fall back to defaults so real-world
// files keep decoding.
ProcreateV5Palette _decode(List<int> bytes) {
  try {
    // Decode the zip archive
    final archive = ZipDecoder().decodeBytes(bytes);

    final jsonFile = _findJsonFile(archive);
    if (jsonFile == null) {
      throw const FormatException(
        'Invalid Procreate v5 file: Expected a zip archive with at '
        'least one file.',
      );
    }

    // Decode the JSON content from the file within the archive
    final jsonContent = utf8.decode(
      jsonFile.content as List<int>,
    ); // Using utf8.decode for consistency

    // Parse the JSON: normally a single palette object; accept a
    // single-element array for tolerance.
    final decodedJson = json.decode(jsonContent);
    final paletteMap = _asPaletteMap(decodedJson);

    _normalizePaletteMap(paletteMap);

    // Use the generated mapper to convert the map into a
    // ProcreateV5Palette object
    // This leverages the structure defined in procreate.dart and its mapper.
    final palette = ProcreateV5PaletteMapper.fromMap(paletteMap);
    _validatePalette(palette);
    return palette;
  } on FormatException {
    rethrow;
  } catch (e) {
    // Cast failures, mapper failures (missing keys, wrong value types),
    // and debug-only assertion failures all surface here; the format
    // contract is FormatException on invalid input, identical in debug
    // and release builds.
    throw FormatException(
      'Invalid Procreate v5 file: ${e.toString().split('\n').first}',
    );
  }
}

/// Finds `Swatches.json` case-insensitively, falling back to the first
/// file for archives using a different casing (e.g. `swatches.json`).
ArchiveFile? _findJsonFile(Archive archive) {
  final files = archive.files.where((f) => f.isFile).toList();
  if (files.isEmpty) return null;
  for (final file in files) {
    if (file.name.toLowerCase() == 'swatches.json') return file;
  }
  return files.first;
}

Map<String, dynamic> _asPaletteMap(dynamic decodedJson) {
  if (decodedJson is Map<String, dynamic>) return decodedJson;
  if (decodedJson is List && decodedJson.length == 1) {
    final first = decodedJson.first;
    if (first is Map<String, dynamic>) {
      return Map<String, dynamic>.from(first);
    }
  }
  throw const FormatException(
    'Invalid Procreate v5 file: Expected a single palette JSON object.',
  );
}

void _normalizePaletteMap(Map<String, dynamic> paletteMap) {
  paletteMap['colorProfiles'] ??= <dynamic>[];
  final swatches = paletteMap['swatches'];
  if (swatches is List) {
    for (var i = 0; i < swatches.length; i++) {
      final swatch = swatches[i];
      if (swatch is Map<String, dynamic>) {
        swatches[i] = _normalizeSwatchMap(swatch);
      }
    }
  }
}

Map<String, dynamic> _normalizeSwatchMap(Map<String, dynamic> swatch) {
  final normalized = Map<String, dynamic>.from(swatch);
  normalized['alpha'] ??= 1.0;
  normalized['origin'] ??= 0;
  normalized['colorSpace'] ??= 0;
  normalized['colorModel'] ??= 0;
  normalized['colorProfile'] ??= '';
  final version = normalized['version'];
  if (version == null) {
    normalized['version'] = ProcreateV5Swatch.defaultVersion;
  } else if (version is num) {
    normalized['version'] = version.toString();
  }
  if (normalized['components'] == null) {
    final hue = normalized['hue'];
    final saturation = normalized['saturation'];
    final brightness = normalized['brightness'];
    if (hue is num && saturation is num && brightness is num) {
      normalized['components'] = [hue, saturation, brightness];
    } else {
      normalized['components'] = <dynamic>[];
    }
  }
  return normalized;
}

void _validatePalette(ProcreateV5Palette palette) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety. NaN passes bare
  // range comparisons, so finiteness is checked explicitly.
  for (final swatch in palette.swatches) {
    if (swatch == null) continue; // Null swatches are tolerated as-is.
    _validateUnit('alpha', swatch.alpha);
    _validateUnit('brightness', swatch.brightness);
    _validateUnit('saturation', swatch.saturation);
    _validateUnit('hue', swatch.hue);
    // Components are multi-model via ICC, so no 0..1 range applies; only
    // the non-empty invariant (plus finiteness) is enforced.
    if (swatch.components.isEmpty) {
      throw const FormatException(
        'Invalid Procreate v5 file: components list cannot be empty.',
      );
    }
    for (final component in swatch.components) {
      if (!component.isFinite) {
        throw FormatException(
          'Invalid Procreate v5 file: non-finite component "$component".',
        );
      }
    }
  }
}

void _validateUnit(String name, double value) {
  if (!value.isFinite || value < 0 || value > 1) {
    throw FormatException(
      'Invalid Procreate v5 file: invalid $name value "$value": '
      'must be finite and between 0 and 1.',
    );
  }
}
