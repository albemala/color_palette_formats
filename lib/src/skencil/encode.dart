part of 'skencil.dart';

List<int> _encode(SkencilPalette skencilPalette) {
  final buffer = StringBuffer();
  buffer.writeln(_fileSignature);

  for (final color in skencilPalette.colors) {
    // Format floats with sufficient precision, separated by spaces, then a tab, then the name.
    // Using toStringAsFixed(6) to match the precision in the 'mini.spl' example.
    final redStr = color.red.toStringAsFixed(6);
    final greenStr = color.green.toStringAsFixed(6);
    final blueStr = color.blue.toStringAsFixed(6);
    buffer.writeln('$redStr $greenStr $blueStr\t${color.name}');
  }
  return utf8.encode(buffer.toString());
}
