part of 'coreldraw4.dart';

const _paletteName = 'CorelDraw 4 Palette';

CorelDraw4Palette _decode(List<int> bytes) {
  // Lone-CR line endings are accepted (classic Mac files).
  final lines = splitLinesUniversal(bytes);

  // Regex to capture the name in quotes and the four CMYK values.
  // Handles potential extra whitespace. Anchored so lines with trailing
  // junk are skipped instead of prefix-matching.
  final colorMatchRegex = RegExp(
    r'^"([^"]+)"\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)$',
  );

  final colors = <CorelDraw4PaletteColor>[];
  for (final line in lines) {
    final trimmedLine = line.trim();

    if (trimmedLine.isEmpty) {
      // skip empty lines
      continue;
    }

    final match = colorMatchRegex.firstMatch(trimmedLine);
    if (match == null) {
      // Non-matching lines (junk, DOS Ctrl-Z end-of-file markers) are
      // skipped.
      continue;
    }

    // All groups are required by the regex, so a missing group means a
    // malformed line rather than skippable junk.
    final values = <String>[];
    for (var i = 1; i <= 5; i++) {
      final value = match.group(i);
      if (value == null) {
        throw FormatException(
          'Not a valid $_paletteName: malformed color line "$trimmedLine".',
        );
      }
      values.add(value);
    }

    // line is a color
    colors.add(
      CorelDraw4PaletteColor(
        name: values[0],
        cyan: _parseChannel(values[1]),
        magenta: _parseChannel(values[2]),
        yellow: _parseChannel(values[3]),
        black: _parseChannel(values[4]),
      ),
    );
  }

  if (colors.isEmpty) {
    throw const FormatException('Not a valid $_paletteName: no colors found.');
  }

  return CorelDraw4Palette(colors: colors);
}

int _parseChannel(String value) {
  // int.tryParse returns null on overflow, which must not silently
  // become 0.
  final parsed = int.tryParse(value);
  if (parsed == null) {
    throw FormatException(
      'Not a valid $_paletteName. Channel "$value" is not a number.',
    );
  }
  validateIntRange(_paletteName, 'channel', parsed, 100);
  return parsed;
}
