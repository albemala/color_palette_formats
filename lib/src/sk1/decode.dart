part of 'sk1.dart';

Sk1Palette _decode(List<int> bytes) {
  final lines = splitLines(bytes);

  // Validate header
  if (lines.isEmpty || !lines.first.startsWith(_fileSignature)) {
    throw const FormatException('Invalid or missing sK1 palette signature.');
  }

  // Find required data
  String? name;
  String? source;
  final comments = <String>[];
  int? columns;
  final colors = <Sk1Color>[];

  // Define regex patterns for extracting data
  final commandPattern = RegExp(r'^([a-zA-Z_][a-zA-Z0-9_]*)\((.*)\)$');

  var foundPalette = false;

  for (final line in lines) {
    final trimmedLine = line.trim();

    // Skip empty lines and comments
    if (trimmedLine.isEmpty || trimmedLine.startsWith('#')) {
      continue;
    }

    // Check for palette markers
    if (trimmedLine == _paletteStartCommand) {
      foundPalette = true;
      continue;
    }

    if (trimmedLine == _paletteEndCommand) {
      break;
    }

    // Only process commands after palette() is found
    if (!foundPalette) {
      continue;
    }

    // Parse command
    final commandMatch = commandPattern.firstMatch(trimmedLine);
    if (commandMatch == null) {
      continue;
    }

    final command = commandMatch.group(1)!;
    final args = commandMatch.group(2)!.trim();

    try {
      switch (command) {
        case _setNameCommand:
          name = _parseStringArgument(args);
        case _setSourceCommand:
          source = _parseStringArgument(args);
        case _addCommentsCommand:
          comments.add(_parseStringArgument(args));
        case _setColumnsCommand:
          columns = _parseIntArgument(args);
        case _colorCommand:
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

String _parseStringArgument(String args) {
  if (args.startsWith("'") && args.endsWith("'")) {
    return args.substring(1, args.length - 1).replaceAll(r"\'", "'");
  } else if (args.startsWith("u'") && args.endsWith("'")) {
    return args.substring(2, args.length - 1).replaceAll(r"\'", "'");
  } else {
    throw FormatException('Invalid string format: $args');
  }
}

int _parseIntArgument(String args) {
  final value = int.tryParse(args);
  if (value == null) {
    throw FormatException('Invalid integer format: $args');
  }
  return value;
}

Sk1Color _parseColorArgument(String args) {
  // Example: ['RGB', [0.866, 0.282, 0.078], 1.0, 'Ubuntu orange']

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
    final colorSpaceStr = _parseStringArgument(parts[0]).toUpperCase();
    final Sk1ColorSpace colorSpace;
    switch (colorSpaceStr) {
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

    // 3. Parse alpha
    final alpha = double.parse(parts[2].trim());

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

// Helper method to split color parts respecting nested structures
List<String> _splitColorParts(String content) {
  final parts = <String>[];
  var depth = 0;
  var start = 0;

  for (var i = 0; i < content.length; i++) {
    final char = content[i];

    if (char == '[') {
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
