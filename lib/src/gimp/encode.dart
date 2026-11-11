part of 'gimp.dart';

List<int> _encode(GimpPalette gimpPalette) {
  _validatePalette(gimpPalette);
  final buffer = StringBuffer();
  buffer.writeln(GimpPalette.validFileSignature);
  for (final line in gimpPalette.info) {
    buffer.writeln(line);
  }
  for (final line in gimpPalette.comments) {
    buffer.writeln('# $line');
  }
  for (final color in gimpPalette.colors) {
    buffer.writeln('${color.red} ${color.green} ${color.blue} ${color.name}');
  }
  return utf8.encode(buffer.toString());
}

void _validatePalette(GimpPalette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  for (final entry
      in {
        for (var i = 0; i < palette.info.length; i++)
          'info $i': palette.info[i],
        for (var i = 0; i < palette.comments.length; i++)
          'comment $i': palette.comments[i],
      }.entries) {
    if (entry.value.contains('\r') || entry.value.contains('\n')) {
      throw FormatException(
        'Not a valid Gimp palette file. Invalid ${entry.key} '
        '"${entry.value}": must not contain line breaks.',
      );
    }
  }
  for (final color in palette.colors) {
    // Line breaks in names cannot round-trip: the decoder treats them as
    // line structure.
    if (color.name.contains('\r') || color.name.contains('\n')) {
      throw FormatException(
        'Not a valid Gimp palette file. Invalid color name '
        '"${color.name}": must not contain line breaks.',
      );
    }
    validateIntRange('Gimp palette file', 'red', color.red, 255);
    validateIntRange('Gimp palette file', 'green', color.green, 255);
    validateIntRange('Gimp palette file', 'blue', color.blue, 255);
  }
}
