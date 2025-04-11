part of 'sk1.dart';

List<int> _encode(Sk1Palette palette) {
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
