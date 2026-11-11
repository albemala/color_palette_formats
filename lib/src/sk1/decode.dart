part of 'sk1.dart';

// Matches function-like commands: command('string'), command(number),
// or command([...]). Captures the command name and the raw argument list.
final _commandRegex = RegExp(r'^([a-zA-Z_][a-zA-Z0-9_]*)\((.*)\)$');

Sk1Palette _decode(List<int> bytes) {
  final lines = splitLinesUniversal(bytes);

  // Validate header
  if (lines.isEmpty || !lines.first.startsWith(Sk1Palette.validFileSignature)) {
    throw const FormatException('Invalid or missing sK1 palette signature.');
  }

  // Find required data
  String? name;
  String? source;
  final comments = <String>[];
  int? columns;
  final colors = <Sk1Color>[];

  // Use the generic command regex from sk1.dart
  var foundPalette = false;

  for (final line in lines) {
    final trimmedLine = line.trim();

    // Skip empty lines and comments
    if (trimmedLine.isEmpty || trimmedLine.startsWith('#')) {
      continue;
    }

    // Check for palette markers
    if (trimmedLine == 'palette()') {
      foundPalette = true;
      continue;
    }

    if (trimmedLine == 'palette_end()') {
      break;
    }

    // Only process commands after palette() is found
    if (!foundPalette) {
      continue;
    }

    // Regex to parse function-like calls: command('string') or
    // command(number) or command([...])
    // It captures the command name and the argument list within parentheses.
    // Parse command
    final commandMatch = _commandRegex.firstMatch(trimmedLine);
    if (commandMatch == null) {
      continue;
    }

    // Both groups are required by the regex; a missing group means a
    // malformed line, which is skipped like any non-command line.
    final command = commandMatch.group(1);
    final rawArgs = commandMatch.group(2);
    if (command == null || rawArgs == null) {
      continue;
    }
    final args = rawArgs.trim();

    try {
      switch (command) {
        case 'set_name':
          name = _parseStringArgument(args);
        case 'set_source':
          source = _parseStringArgument(args);
        case 'add_comments':
          comments.add(_parseStringArgument(args));
        case 'set_columns':
          columns = _parseColumns(args);
        case 'color':
          colors.add(_parseColorArgument(args));
      }
    } catch (e) {
      throw FormatException('Error parsing line "$trimmedLine": $e');
    }
  }

  // Validate required data
  if (!foundPalette) {
    throw const FormatException('Missing palette start marker.');
  }

  if (name == null) {
    throw const FormatException('Missing palette name.');
  }

  if (columns == null) {
    throw const FormatException('Missing columns value.');
  }

  return Sk1Palette(
    name: name,
    source: source,
    comments: comments,
    columns: columns,
    colors: colors,
  );
}

int _parseColumns(String args) {
  // int.tryParse returns null on overflow, which must not silently
  // become 0.
  final parsed = int.tryParse(args);
  if (parsed == null) {
    throw FormatException('Invalid columns value: $args');
  }
  if (parsed < 0) {
    throw FormatException('Invalid columns value out of range: $args');
  }
  return parsed;
}

String _parseStringArgument(String args) {
  // Handle unicode string (u'string')
  if (args.startsWith("u'") && args.endsWith("'")) {
    return args.substring(2, args.length - 1).replaceAll(r"\'", "'");
  }
  // Handle regular string ('string')
  else if (args.startsWith("'") && args.endsWith("'")) {
    return args.substring(1, args.length - 1).replaceAll(r"\'", "'");
  } else {
    throw FormatException('Invalid string format: $args');
  }
}

Sk1Color _parseColorArgument(String args) {
  // Basic validation: starts with [ and ends with ]
  if (!args.startsWith('[') || !args.endsWith(']')) {
    throw FormatException('Invalid color format: $args');
  }

  // Remove outer brackets
  final content = args.substring(1, args.length - 1).trim();

  // Split the content into parts manually
  final parts = _splitColorParts(content);
  if (parts.length != 4) {
    throw FormatException('Color requires 4 parts: $args');
  }

  try {
    // 1. Parse color space
    final colorSpaceStr = _parseStringArgument(parts[0]);
    final Sk1ColorSpace colorSpace;
    switch (colorSpaceStr.toUpperCase()) {
      case 'RGB':
        colorSpace = Sk1ColorSpace.rgb;
      case 'CMYK':
        colorSpace = Sk1ColorSpace.cmyk;
      case 'GRAY':
        colorSpace = Sk1ColorSpace.gray;
      default:
        throw FormatException('Unknown color space: $colorSpaceStr');
    }

    // 2. Parse values list
    final valuesList = parts[1].trim();
    if (!valuesList.startsWith('[') || !valuesList.endsWith(']')) {
      throw FormatException('Invalid values list: $valuesList');
    }

    final valuesStr = valuesList.substring(1, valuesList.length - 1);
    final values =
        valuesStr.split(',').map((s) => double.parse(s.trim())).toList();

    // The model constructor asserts these in debug builds; enforce them
    // here with FormatException because asserts are absent in release and
    // NaN comparisons would otherwise slip through any range check.
    final expectedLength = switch (colorSpace) {
      Sk1ColorSpace.rgb => 3,
      Sk1ColorSpace.cmyk => 4,
      Sk1ColorSpace.gray => 1,
    };
    if (values.length != expectedLength) {
      throw FormatException(
        'Incorrect number of values for color space $colorSpaceStr: '
        'expected $expectedLength but found ${values.length}.',
      );
    }
    for (final value in values) {
      if (value.isNaN || value.isInfinite || value < 0.0 || value > 1.0) {
        throw FormatException('Color value out of range 0.0..1.0: $value');
      }
    }

    // 3. Parse alpha
    final alpha = double.parse(parts[2].trim());
    if (alpha.isNaN || alpha.isInfinite || alpha < 0.0 || alpha > 1.0) {
      throw FormatException('Alpha value out of range 0.0..1.0: $alpha');
    }

    // 4. Parse name
    final name = _parseStringArgument(parts[3]);

    return Sk1Color(
      colorSpace: colorSpace,
      values: values,
      alpha: alpha,
      name: name,
    );
  } catch (e) {
    throw FormatException('Error parsing color data: $e');
  }
}

// Splits color parts on top-level commas, ignoring commas and brackets
// inside quoted strings (color names may contain them). A backslash
// inside a string escapes the next character (e.g. \').
List<String> _splitColorParts(String content) {
  final parts = <String>[];
  var depth = 0;
  var inString = false;
  var start = 0;

  for (var i = 0; i < content.length; i++) {
    final char = content[i];

    if (inString) {
      if (char == r'\') {
        i++; // Skip the escaped character.
      } else if (char == "'") {
        inString = false;
      }
      continue;
    }

    if (char == "'") {
      inString = true;
    } else if (char == '[') {
      depth++;
    } else if (char == ']') {
      depth--;
    } else if (char == ',' && depth == 0) {
      // Only split at top level commas
      parts.add(content.substring(start, i).trim());
      start = i + 1;
    }
  }

  // Add the last part
  parts.add(content.substring(start).trim());
  return parts;
}
