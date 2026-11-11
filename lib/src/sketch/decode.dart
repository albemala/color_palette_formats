part of 'sketch.dart';

SketchDocumentPalette _decode(List<int> bytes) {
  try {
    return _decodeUnsafe(bytes);
  } on FormatException {
    rethrow;
  } catch (e) {
    // Zip failures (truncated central directory, unexpected entry types)
    // and debug-only assertion failures all surface here; the format
    // contract is FormatException on invalid input, identical in debug
    // and release builds.
    throw FormatException(
      'Invalid Sketch document: ${e.toString().split('\n').first}',
    );
  }
}

SketchDocumentPalette _decodeUnsafe(List<int> bytes) {
  final archive = ZipDecoder().decodeBytes(bytes);

  Map<String, dynamic>? documentJson;
  for (final file in archive.files) {
    if (file.isFile && file.name.toLowerCase() == 'document.json') {
      final decoded = json.decode(utf8.decode(file.content as List<int>));
      if (decoded is Map<String, dynamic>) documentJson = decoded;
      break;
    }
  }
  if (documentJson == null) {
    throw const FormatException(
      'Invalid Sketch document: expected `document.json` in archive.',
    );
  }

  // Color Variables first, mirroring the reference plugin's
  // swatches-else-colors logic.
  final sharedSwatches = documentJson['sharedSwatches'];
  if (sharedSwatches is Map<String, dynamic>) {
    final objects = sharedSwatches['objects'];
    if (objects is List && objects.isNotEmpty) {
      return SketchDocumentPalette(colors: _parseSwatches(objects));
    }
  }

  // Legacy document colors.
  final assets = documentJson['assets'];
  if (assets is Map<String, dynamic>) {
    final colors = <SketchDocumentColor>[];
    final colorAssets = assets['colorAssets'];
    if (colorAssets is List) {
      for (final entry in colorAssets) {
        if (entry is! Map<String, dynamic>) {
          throw const FormatException(
            'Invalid Sketch document: expected color asset objects.',
          );
        }
        final color = entry['color'];
        if (color is! Map<String, dynamic>) {
          throw const FormatException(
            'Invalid Sketch document: expected color asset objects.',
          );
        }
        final name = entry['name'];
        colors.add(
          SketchDocumentColor(
            name: name is String ? name : null,
            red: _unitInterval(color['red']),
            green: _unitInterval(color['green']),
            blue: _unitInterval(color['blue']),
            alpha: _unitInterval(color['alpha']),
          ),
        );
      }
    }
    final legacyColors = assets['colors'];
    if (legacyColors is List) {
      for (final entry in legacyColors) {
        if (entry is! Map<String, dynamic>) {
          throw const FormatException(
            'Invalid Sketch document: expected color objects.',
          );
        }
        colors.add(
          SketchDocumentColor(
            red: _unitInterval(entry['red']),
            green: _unitInterval(entry['green']),
            blue: _unitInterval(entry['blue']),
            alpha: _unitInterval(entry['alpha']),
          ),
        );
      }
    }
    return SketchDocumentPalette(colors: colors);
  }

  return SketchDocumentPalette(colors: const []);
}

List<SketchDocumentColor> _parseSwatches(List<dynamic> objects) {
  final colors = <SketchDocumentColor>[];
  for (final entry in objects) {
    if (entry is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid Sketch document: expected swatch objects.',
      );
    }
    final value = entry['value'];
    if (value is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid Sketch document: expected swatch objects.',
      );
    }
    final name = entry['name'];
    colors.add(
      SketchDocumentColor(
        name: name is String ? name : null,
        red: _unitInterval(value['red']),
        green: _unitInterval(value['green']),
        blue: _unitInterval(value['blue']),
        alpha: _unitInterval(value['alpha']),
      ),
    );
  }
  return colors;
}

double _unitInterval(dynamic value) {
  const message = 'Invalid Sketch document: expected 0..1 components.';
  if (value is! num) {
    throw const FormatException(message);
  }
  final channel = value.toDouble();
  // NaN passes bare range comparisons, so finiteness is checked
  // explicitly. Overflow literals such as 1e999 decode to Infinity. The
  // model constructor asserts this range in debug builds; enforce it here
  // with FormatException for release safety.
  if (!channel.isFinite || channel < 0 || channel > 1) {
    throw FormatException('$message Found "$value".');
  }
  return channel;
}
