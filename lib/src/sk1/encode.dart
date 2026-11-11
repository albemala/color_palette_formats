part of 'sk1.dart';

List<int> _encode(Sk1Palette palette) {
  _validatePalette(palette);

  final buffer = StringBuffer();

  // 1. Write signature and start command
  buffer.writeln(Sk1Palette.validFileSignature);
  buffer.writeln('palette()');

  // 2. Write metadata
  buffer.writeln("set_name('${_escapeString(palette.name)}')");
  if (palette.source != null && palette.source!.isNotEmpty) {
    buffer.writeln("set_source('${_escapeString(palette.source!)}')");
  }
  for (final comment in palette.comments) {
    buffer.writeln("add_comments('${_escapeString(comment)}')");
  }
  buffer.writeln('set_columns(${palette.columns})');

  // 3. Write colors
  for (final color in palette.colors) {
    buffer.writeln(_encodeColor(color));
  }

  // 4. Write end command
  buffer.writeln('palette_end()');

  return utf8.encode(buffer.toString());
}

String _encodeColor(Sk1Color color) {
  final colorSpaceStr = color.colorSpace.name.toUpperCase();
  // Format values with reasonable precision, similar to the example
  final valuesStr = color.values
      .map((v) => v.toStringAsPrecision(17))
      .join(', ');
  final alphaStr = color.alpha.toString(); // Usually 1.0
  final nameStr = _escapeString(color.name);

  return "color(['$colorSpaceStr', [$valuesStr], $alphaStr, '$nameStr'])";
}

// Helper to escape single quotes within string arguments if necessary
String _escapeString(String value) {
  // sK1 format uses single quotes. Escape any internal single quotes.
  return value.replaceAll("'", r"\'");
}

void _validatePalette(Sk1Palette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  if (palette.columns < 0) {
    throw FormatException(
      'Invalid sK1 palette columns value: ${palette.columns}.',
    );
  }
  for (final field
      in <String, String>{
        'name': palette.name,
        if (palette.source != null) 'source': palette.source!,
        for (var i = 0; i < palette.comments.length; i++)
          'comment $i': palette.comments[i],
      }.entries) {
    if (field.value.contains('\r') || field.value.contains('\n')) {
      throw FormatException(
        'Invalid sK1 palette ${field.key} '
        '"${field.value}": must not contain line breaks.',
      );
    }
  }
  for (final color in palette.colors) {
    if (color.name.contains('\r') || color.name.contains('\n')) {
      throw FormatException(
        'Invalid sK1 color name "${color.name}": '
        'must not contain line breaks.',
      );
    }
    final expectedLength = switch (color.colorSpace) {
      Sk1ColorSpace.rgb => 3,
      Sk1ColorSpace.cmyk => 4,
      Sk1ColorSpace.gray => 1,
    };
    if (color.values.length != expectedLength) {
      throw FormatException(
        'Incorrect number of values for color space '
        '${color.colorSpace}: expected $expectedLength '
        'but found ${color.values.length}.',
      );
    }
    for (final value in color.values) {
      if (value.isNaN || value.isInfinite || value < 0.0 || value > 1.0) {
        throw FormatException('Color value out of range 0.0..1.0: $value');
      }
    }
    if (color.alpha.isNaN ||
        color.alpha.isInfinite ||
        color.alpha < 0.0 ||
        color.alpha > 1.0) {
      throw FormatException(
        'Alpha value out of range 0.0..1.0: ${color.alpha}',
      );
    }
  }
}
