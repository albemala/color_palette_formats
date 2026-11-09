part of 'procreate.dart';

// Note: decoding is tolerant following ColorPaletteCodable's
// ProcreateSwatchesCoder: the JSON may use a numeric version, omit
// colorProfiles/optional swatch fields, or (rarely) wrap the palette in a
// single-element array. Missing values fall back to defaults so real-world
// files keep decoding.
ProcreateV5Palette _decode(List<int> bytes) {
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
  return ProcreateV5PaletteMapper.fromMap(paletteMap);
}

/// Finds `Swatches.json` case-insensitively, falling back to the first
/// file for archives using a different casing (e.g. `swatches.json`).
ArchiveFile? _findJsonFile(Archive archive) {
  final files = archive.files.where((f) => f.isFile).toList();
  if (files.isEmpty) return null;
  for (final file in files) {
    if (file.name.toLowerCase() == 'swatches.json') return file;
  }
  return archive.first;
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
