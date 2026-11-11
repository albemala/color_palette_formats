part of 'koffice.dart';

List<int> _encode(KOfficePalette palette) {
  _validatePalette(palette);
  final buffer = StringBuffer();

  // Write signature
  buffer.writeln(KOfficePalette.validFileSignature);

  // Write colors
  for (final color in palette.colors) {
    // Format: R G B Name
    buffer.writeln('${color.r} ${color.g} ${color.b}\t${color.name}');
  }

  // Encode to UTF-8 bytes
  return utf8.encode(buffer.toString());
}

void _validatePalette(KOfficePalette palette) {
  // The model constructor asserts these ranges in debug builds; enforce
  // them here with FormatException for release safety.
  for (final color in palette.colors) {
    // Line breaks in names cannot round-trip: the decoder treats them as
    // line structure.
    if (color.name.contains('\r') || color.name.contains('\n')) {
      throw FormatException(
        'Not a valid KOffice palette file. Invalid color name '
        '"${color.name}": must not contain line breaks.',
      );
    }
    validateIntRange('KOffice palette file', 'r', color.r, 255);
    validateIntRange('KOffice palette file', 'g', color.g, 255);
    validateIntRange('KOffice palette file', 'b', color.b, 255);
  }
}
