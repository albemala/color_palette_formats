part of 'clf.dart';

void _validateName(String name) {
  if (name.contains(ClfPalette.fieldSeparator) ||
      name.contains('\n') ||
      name.contains('\r')) {
    throw FormatException(
      'Not a valid $_paletteName. Color name "$name" contains a separator.',
    );
  }
}

List<int> _encode(ClfPalette palette) {
  if (palette.colors.isEmpty) {
    throw const FormatException(
      'Not a valid $_paletteName. No colors to write.',
    );
  }
  const separator = ClfPalette.fieldSeparator;
  final lines = <String>[];
  for (final color in palette.colors) {
    if (color.lab.length != 3) {
      throw FormatException('Color "${color.name}" must carry 3 Lab values.');
    }
    _validateName(color.name);
    lines.add(
      '${color.name}$separator${color.lab[0]}$separator'
      '${color.lab[1]}$separator${color.lab[2]}',
    );
  }
  return utf8.encode(lines.join('\n'));
}
