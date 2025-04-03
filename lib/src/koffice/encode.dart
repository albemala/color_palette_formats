part of 'koffice.dart';

List<int> _encode(KOfficePalette palette) {
  final buffer = StringBuffer();

  // Write signature
  buffer.writeln(_fileSignature);

  // Write colors
  for (final color in palette.colors) {
    // Format: R G B Name
    buffer.writeln('${color.r} ${color.g} ${color.b}\t${color.name}');
  }

  // Encode to UTF-8 bytes
  return utf8.encode(buffer.toString());
}
