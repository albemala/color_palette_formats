part of 'procreate.dart';

List<ProcreateV1Palette> decodeProcreateV1Palettes(List<int> bytes) {
  try {
    final archive = ZipDecoder().decodeBytes(bytes);
    if (archive.isEmpty) {
      throw const FormatException(
        'Not a valid Procreate v1 swatches file. Empty archive.',
      );
    }
    final jsonFile = archive.first;
    // The JSON payload is UTF-8 encoded; String.fromCharCodes would
    // misdecode non-ASCII palette names.
    final jsonContent = utf8.decode(jsonFile.content as List<int>);

    final decoded = json.decode(jsonContent);
    if (decoded is! List<dynamic>) {
      throw const FormatException(
        'Not a valid Procreate v1 swatches file. '
        'Expected a JSON list of palettes.',
      );
    }
    return decoded.map((swatch) {
      if (swatch is! Map<String, dynamic>) {
        throw const FormatException(
          'Not a valid Procreate v1 swatches file. '
          'Expected each palette to be a JSON object.',
        );
      }
      final palette = ProcreateV1PaletteMapper.fromMap(swatch);
      _validatePalette(palette);
      return palette;
    }).toList();
  } on FormatException {
    rethrow;
  } catch (e) {
    // Zip failures, cast failures, mapper failures (missing keys, unknown
    // color spaces, wrong value types), and debug-only assertion failures
    // all surface here; the format contract is FormatException on invalid
    // input, identical in debug and release builds.
    throw FormatException(
      'Not a valid Procreate v1 swatches file. '
      '${e.toString().split('\n').first}',
    );
  }
}

void _validatePalette(ProcreateV1Palette palette) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  for (final swatch in palette.swatches) {
    _validateChannel('hue', swatch.hue);
    _validateChannel('saturation', swatch.saturation);
    _validateChannel('brightness', swatch.brightness);
    _validateChannel('alpha', swatch.alpha);
  }
}

void _validateChannel(String name, double value) {
  // NaN passes bare range comparisons, so finiteness is checked explicitly.
  // JSON has no NaN/Infinity literals, but overflow (e.g. 1e999) can still
  // decode to Infinity.
  if (!value.isFinite || value < 0 || value > 1) {
    throw FormatException(
      'Not a valid Procreate v1 swatches file. Invalid $name value '
      '"$value": must be finite and between 0 and 1.',
    );
  }
}
