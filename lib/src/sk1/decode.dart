part of 'sk1.dart';

Sk1Palette _decode(List<int> bytes) {
  final lines = splitLines(bytes);
  final iterator = lines.iterator;

  // 1. Validate Header
  if (!iterator.moveNext() || !iterator.current.startsWith(_fileSignature)) {
    throw FormatException('Invalid or missing sK1 palette signature.');
  }

  // 2. Find palette() start
  while (iterator.moveNext() &&
      iterator.current.trim() != _paletteStartCommand) {
    // Skip lines until palette() is found
  }
  if (iterator.current.trim() != _paletteStartCommand) {
    throw FormatException('Missing "$_paletteStartCommand" command.');
  }

  // 3. Parse palette properties and colors
  String? name;
  String? source;
  final comments = <String>[];
  int? columns;
  final colors = <Sk1Color>[];

  while (iterator.moveNext()) {
    final line = iterator.current.trim();

    if (line.isEmpty || line.startsWith('#')) {
      // Skip empty lines and comments (though ##sK1 palette is the official header)
      continue;
    }

    if (line == _paletteEndCommand) {
      // Found the end
      break;
    }

    final commandMatch = _commandRegex.firstMatch(line);
    if (commandMatch == null) {
      // Might be a malformed line or unexpected content
      // For now, we'll ignore it, but stricter parsing could throw here.
      // print('Warning: Skipping unrecognized line: $line');
      continue;
    }

    final command = commandMatch.group(1)!;
    final argsString = commandMatch.group(2)!.trim();

    try {
      switch (command) {
        case _setNameCommand:
          name = _parseStringArgument(argsString, _setNameCommand);
          break;
        case _setSourceCommand:
          source = _parseStringArgument(argsString, _setSourceCommand);
          break;
        case _addCommentsCommand:
          comments.add(_parseStringArgument(argsString, _addCommentsCommand));
          break;
        case _setColumnsCommand:
          columns = _parseIntArgument(argsString, _setColumnsCommand);
          break;
        case _colorCommand:
          colors.add(_parseColorArgument(argsString));
          break;
        default:
          // Unknown command, ignore for now
          // print('Warning: Skipping unknown command: $command');
          break;
      }
    } on FormatException catch (e) {
      // Add line context to the exception
      throw FormatException(
        'Error parsing line "${iterator.current}": ${e.message}',
      );
    }
  }

  // 4. Validate required fields
  if (name == null) {
    throw FormatException('Missing required "$_setNameCommand" command.');
  }
  if (columns == null) {
    throw FormatException('Missing required "$_setColumnsCommand" command.');
  }

  return Sk1Palette(
    name: name,
    source: source,
    comments: comments,
    columns: columns,
    colors: colors,
  );
}

String _parseStringArgument(String argsString, String command) {
  final match = _stringArgRegex.firstMatch(argsString);
  if (match == null || match.groupCount < 1) {
    throw FormatException(
      'Invalid argument for $command: Expected a single string like \'value\', got "$argsString"',
    );
  }
  // Unescape any escaped single quotes
  return match.group(1)!.replaceAll("\\'", "'");
}

int _parseIntArgument(String argsString, String command) {
  final match = _intArgRegex.firstMatch(argsString);
  if (match == null || match.groupCount < 1) {
    throw FormatException(
      'Invalid argument for $command: Expected a single integer like 1, got "$argsString"',
    );
  }
  final value = int.tryParse(match.group(1)!);
  if (value == null) {
    throw FormatException(
      'Invalid argument for $command: Could not parse integer from "$argsString"',
    );
  }
  return value;
}

Sk1Color _parseColorArgument(String argsString) {
  // Example: ['RGB', [0.866, 0.282, 0.078], 1.0, 'Ubuntu orange']
  // Example: ['RGB', [0.235..., 0.431..., 0.705...], 1.0, u'Fedora Blue']

  // Basic validation: starts with [ and ends with ]
  if (!argsString.startsWith('[') || !argsString.endsWith(']')) {
    throw FormatException(
      'Invalid argument for $_colorCommand: Expected a list like [...], got "$argsString"',
    );
  }

  // Remove outer brackets
  String content = argsString.substring(1, argsString.length - 1).trim();

  try {
    // 1. Parse Color Space String (e.g., 'RGB')
    if (!content.startsWith('\'')) {
      throw FormatException('Expected color space string starting with \'.');
    }
    final spaceEndIndex = content.indexOf('\'', 1);
    if (spaceEndIndex == -1) {
      throw FormatException('Could not find end quote for color space string.');
    }
    final colorSpaceStr = content.substring(1, spaceEndIndex).toUpperCase();
    final Sk1ColorSpace colorSpace;
    switch (colorSpaceStr) {
      case 'RGB':
        colorSpace = Sk1ColorSpace.rgb;
        break;
      case 'CMYK':
        colorSpace = Sk1ColorSpace.cmyk;
        break;
      case 'GRAY':
        colorSpace = Sk1ColorSpace.gray;
        break;
      default:
        throw FormatException('Unknown color space "$colorSpaceStr".');
    }
    // Move content past the parsed part + comma
    content = content.substring(spaceEndIndex + 1).trim();
    if (!content.startsWith(',')) {
      throw FormatException('Expected comma after color space string.');
    }
    content = content.substring(1).trim();

    // 2. Parse Values List (e.g., [0.866, 0.282, 0.078])
    if (!content.startsWith('[')) {
      throw FormatException('Expected values list starting with [.');
    }
    final valuesEndIndex = content.indexOf(']');
    if (valuesEndIndex == -1) {
      throw FormatException('Could not find end bracket for values list.');
    }
    final valuesListStr = content.substring(1, valuesEndIndex);
    final values =
        valuesListStr.split(',').map((s) => double.parse(s.trim())).toList();
    // Move content past the parsed part + comma
    content = content.substring(valuesEndIndex + 1).trim();
    if (!content.startsWith(',')) {
      throw FormatException('Expected comma after values list.');
    }
    content = content.substring(1).trim();

    // 3. Parse Alpha (e.g., 1.0)
    final alphaEndIndex = content.indexOf(',');
    if (alphaEndIndex == -1) {
      throw FormatException('Could not find comma after alpha value.');
    }
    final alphaStr = content.substring(0, alphaEndIndex).trim();
    final double alpha;
    try {
      alpha = double.parse(alphaStr);
    } catch (e) {
      throw FormatException('Could not parse alpha value "$alphaStr": $e');
    }
    // Move content past the parsed part + comma
    content = content.substring(alphaEndIndex + 1).trim();

    // 4. Parse Name String (e.g., 'Ubuntu orange' or u'Fedora Blue')
    String name;
    if (content.startsWith('u\'') && content.endsWith('\'')) {
      name = content.substring(2, content.length - 1);
    } else if (content.startsWith('\'') && content.endsWith('\'')) {
      name = content.substring(1, content.length - 1);
    } else {
      throw FormatException(
        'Could not parse name string: Expected \'...\' or u\'...\', got "$content"',
      );
    }
    // Unescape any escaped single quotes potentially added during encoding
    name = name.replaceAll("\\'", "'");

    // 5. Construct Sk1Color
    return Sk1Color(
      colorSpace: colorSpace,
      values: values,
      alpha: alpha,
      name: name,
    );
  } catch (e) {
    // Catch parsing errors (double.parse, indexing, FormatException, etc.)
    throw FormatException(
      'Error parsing $_colorCommand arguments "$argsString": ${e.toString()}',
    );
  }
}
