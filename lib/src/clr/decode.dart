part of 'clr.dart';

const _paletteName = 'Flash Color Set';
const _colorGap = [0x00, 0x00];
const _colorSeparator = [0x03, 0x80];
const _colorEnd = [0x00, 0x01, 0x80];
const _gradientSeparator = [0x03, 0x80];
const _gradientEnd = 0x00;

ClrGradientType _parseGradientType(int value) => switch (value) {
  16 => ClrGradientType.linear,
  18 => ClrGradientType.radial,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported gradient type "$value".',
    ),
};

ClrGradientOverflow _parseOverflow(int value) => switch (value & 0xFE) {
  0 => ClrGradientOverflow.extend,
  4 => ClrGradientOverflow.reflect,
  8 => ClrGradientOverflow.repeat,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported overflow mode "$value".',
    ),
};

void _validatePrefix(ByteDataReader buffer) {
  final prefix = buffer.read(4).toList();
  if (prefix[0] != 0xFF ||
      prefix[1] != 0xFF ||
      prefix[2] != 0x00 ||
      prefix[3] != 0x00) {
    throw const FormatException(
      'Not a valid $_paletteName. Invalid file signature.',
    );
  }
}

String _readSectionName(ByteDataReader buffer) {
  final length = buffer.readUint16();
  final codes = buffer.read(length).toList();
  return String.fromCharCodes(codes);
}

void _validateSectionName(ByteDataReader buffer, String expected) {
  final name = _readSectionName(buffer);
  if (name != expected) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Expected "$expected" but found "$name".',
    );
  }
}

void _validateBytes(ByteDataReader buffer, List<int> expected) {
  final actual = buffer.read(expected.length).toList();
  for (var i = 0; i < expected.length; i++) {
    if (actual[i] != expected[i]) {
      throw const FormatException(
        'Not a valid $_paletteName. Invalid entry separator.',
      );
    }
  }
}

int _readVersion(ByteDataReader buffer) {
  final version = buffer.readUint8();
  if (version != 3 && version != 4) {
    throw FormatException(
      'Not a valid $_paletteName. Unsupported version "$version".',
    );
  }
  return version;
}

ClrPalette _decode(List<int> bytes) {
  final buffer = ByteDataReader(endian: Endian.little)..add(bytes);

  return decodeWithTruncationGuard(_paletteName, () => _decodeBody(buffer));
}

ClrPalette _decodeBody(ByteDataReader buffer) {
  _validatePrefix(buffer);
  _validateSectionName(buffer, ClrPalette.colorListName);
  final colorCount = buffer.readUint16();
  _validateSectionName(buffer, ClrPalette.colorDefName);
  _validatePrefix(buffer);

  final colors = <ClrPaletteColor>[];
  for (var i = 0; i < colorCount; i++) {
    colors.add(_readColor(buffer));
    if (i < colorCount - 1) {
      _validateBytes(buffer, _colorSeparator);
    }
  }
  // End of the color section (3 bytes for the last entry, or a
  // bare marker when there are no colors).
  _validateBytes(buffer, _colorEnd);

  final gradientCount = buffer.readUint16();
  final gradients = <ClrGradient>[];
  for (var i = 0; i < gradientCount; i++) {
    _validateBytes(buffer, _gradientSeparator);
    gradients.add(_readGradient(buffer));
    buffer.read(6); // trailing unknown bytes
  }
  if (gradientCount > 0) {
    final end = buffer.readUint8();
    if (end != _gradientEnd) {
      throw const FormatException(
        'Not a valid $_paletteName. Invalid gradient section end.',
      );
    }
  }

  return ClrPalette(colors: colors, gradients: gradients);
}

ClrPaletteColor _readColor(ByteDataReader buffer) {
  final version = _readVersion(buffer);
  final red = buffer.readUint8();
  final green = buffer.readUint8();
  final blue = buffer.readUint8();
  final alpha = buffer.readUint8();
  buffer.read(2); // gap
  final hue = buffer.readUint16();
  final saturation = buffer.readUint16();
  final brightness = buffer.readUint16();

  return ClrPaletteColor(
    version: version,
    red: red,
    green: green,
    blue: blue,
    alpha: alpha,
    hue: hue,
    saturation: saturation,
    brightness: brightness,
  );
}

ClrGradient _readGradient(ByteDataReader buffer) {
  final version = _readVersion(buffer);
  final baseRed = buffer.readUint8();
  final baseGreen = buffer.readUint8();
  final baseBlue = buffer.readUint8();
  final baseAlpha = buffer.readUint8();
  final type = _parseGradientType(buffer.readUint8());
  buffer.read(25); // reserved
  final stopCount = buffer.readUint8();

  var overflow = ClrGradientOverflow.extend;
  var linearRgb = false;
  if (version == 4) {
    buffer.read(4); // reserved
    final attributes = buffer.readUint8();
    overflow = _parseOverflow(attributes);
    linearRgb = (attributes & 0x01) == 1;
    buffer.read(3); // reserved
  }

  final stops = <ClrGradientStop>[];
  for (var i = 0; i < stopCount; i++) {
    stops.add(
      ClrGradientStop(
        offset: buffer.readUint8(),
        red: buffer.readUint8(),
        green: buffer.readUint8(),
        blue: buffer.readUint8(),
        alpha: buffer.readUint8(),
      ),
    );
  }

  return ClrGradient(
    version: version,
    baseRed: baseRed,
    baseGreen: baseGreen,
    baseBlue: baseBlue,
    baseAlpha: baseAlpha,
    type: type,
    overflow: overflow,
    linearRgb: linearRgb,
    stops: stops,
  );
}
