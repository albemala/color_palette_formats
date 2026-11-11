part of 'clr.dart';

int _encodeGradientType(ClrGradientType type) => switch (type) {
  ClrGradientType.linear => 16,
  ClrGradientType.radial => 18,
};

int _encodeOverflow(ClrGradientOverflow overflow, bool linearRgb) {
  final base = switch (overflow) {
    ClrGradientOverflow.extend => 0,
    ClrGradientOverflow.reflect => 4,
    ClrGradientOverflow.repeat => 8,
  };
  return linearRgb ? base + 1 : base;
}

void _validateChannel(String label, int value, int max) {
  if (value < 0 || value > max) {
    throw FormatException(
      'Not a valid $_paletteName. $label "$value" out of range 0..$max.',
    );
  }
}

void _validatePalette(ClrPalette palette) {
  // The model constructors assert these ranges in debug builds; enforce
  // them here with FormatException because the byte writer silently masks
  // out-of-range values (e.g. writeUint8(300) stores 44) in release.
  if (palette.colors.length > 0xFFFF) {
    throw const FormatException(
      'Not a valid $_paletteName. Too many colors to write.',
    );
  }
  if (palette.gradients.length > 0xFFFF) {
    throw const FormatException(
      'Not a valid $_paletteName. Too many gradients to write.',
    );
  }
  for (final color in palette.colors) {
    if (color.version != 3 && color.version != 4) {
      throw FormatException(
        'Not a valid $_paletteName. Unsupported version "${color.version}".',
      );
    }
    _validateChannel('red', color.red, 255);
    _validateChannel('green', color.green, 255);
    _validateChannel('blue', color.blue, 255);
    _validateChannel('alpha', color.alpha, 255);
    _validateChannel('hue', color.hue, 65535);
    _validateChannel('saturation', color.saturation, 65535);
    _validateChannel('brightness', color.brightness, 65535);
  }
  for (final gradient in palette.gradients) {
    if (gradient.version != 3 && gradient.version != 4) {
      throw FormatException(
        'Not a valid $_paletteName. Unsupported version '
        '"${gradient.version}".',
      );
    }
    if (gradient.version == 3 && gradient.linearRgb) {
      throw FormatException(
        'Gradient with base color "${gradient.baseRed},'
        '${gradient.baseGreen},${gradient.baseBlue}" uses linearRgb '
        'which requires version 4.',
      );
    }
    _validateChannel('baseRed', gradient.baseRed, 255);
    _validateChannel('baseGreen', gradient.baseGreen, 255);
    _validateChannel('baseBlue', gradient.baseBlue, 255);
    _validateChannel('baseAlpha', gradient.baseAlpha, 255);
    if (gradient.stops.length > 0xFF) {
      throw const FormatException(
        'Not a valid $_paletteName. Too many gradient stops to write.',
      );
    }
    for (final stop in gradient.stops) {
      _validateChannel('offset', stop.offset, 255);
      _validateChannel('stop red', stop.red, 255);
      _validateChannel('stop green', stop.green, 255);
      _validateChannel('stop blue', stop.blue, 255);
      _validateChannel('stop alpha', stop.alpha, 255);
    }
  }
}

void _writePrefix(ByteDataWriter buffer) {
  buffer.writeUint8(0xFF);
  buffer.writeUint8(0xFF);
  buffer.writeUint8(0x00);
  buffer.writeUint8(0x00);
}

void _writeSectionName(ByteDataWriter buffer, String name) {
  buffer.writeUint16(name.length);
  for (var i = 0; i < name.length; i++) {
    buffer.writeUint8(name.codeUnitAt(i));
  }
}

void _writeZeros(ByteDataWriter buffer, int count) {
  for (var i = 0; i < count; i++) {
    buffer.writeUint8(0);
  }
}

List<int> _encode(ClrPalette palette) {
  _validatePalette(palette);

  final buffer = ByteDataWriter(endian: Endian.little);
  // file signature
  _writePrefix(buffer);
  // color list section
  _writeSectionName(buffer, ClrPalette.colorListName);
  // colors count
  buffer.writeUint16(palette.colors.length);
  // color definitions section
  _writeSectionName(buffer, ClrPalette.colorDefName);
  _writePrefix(buffer);
  // color entries
  for (var i = 0; i < palette.colors.length; i++) {
    _writeColor(buffer, palette.colors[i]);
    if (i < palette.colors.length - 1) {
      buffer.writeUint8(_colorSeparator[0]);
      buffer.writeUint8(_colorSeparator[1]);
    }
  }
  // end of the color section
  buffer.writeUint8(_colorEnd[0]);
  buffer.writeUint8(_colorEnd[1]);
  buffer.writeUint8(_colorEnd[2]);
  // gradients count
  buffer.writeUint16(palette.gradients.length);
  // gradient entries
  for (final gradient in palette.gradients) {
    buffer.writeUint8(_gradientSeparator[0]);
    buffer.writeUint8(_gradientSeparator[1]);
    _writeGradient(buffer, gradient);
    _writeZeros(buffer, 6); // trailing unknown bytes
  }
  if (palette.gradients.isNotEmpty) {
    buffer.writeUint8(_gradientEnd);
  }
  return buffer.toBytes();
}

void _writeColor(ByteDataWriter buffer, ClrPaletteColor color) {
  // entry version
  buffer.writeUint8(color.version);
  // base values
  buffer.writeUint8(color.red);
  buffer.writeUint8(color.green);
  buffer.writeUint8(color.blue);
  buffer.writeUint8(color.alpha);
  // gap
  buffer.writeUint8(_colorGap[0]);
  buffer.writeUint8(_colorGap[1]);
  // hsv values
  buffer.writeUint16(color.hue);
  buffer.writeUint16(color.saturation);
  buffer.writeUint16(color.brightness);
}

void _writeGradient(ByteDataWriter buffer, ClrGradient gradient) {
  // entry version
  buffer.writeUint8(gradient.version);
  // base color
  buffer.writeUint8(gradient.baseRed);
  buffer.writeUint8(gradient.baseGreen);
  buffer.writeUint8(gradient.baseBlue);
  buffer.writeUint8(gradient.baseAlpha);
  // gradient type
  buffer.writeUint8(_encodeGradientType(gradient.type));
  // reserved
  _writeZeros(buffer, 25);
  // stops count
  buffer.writeUint8(gradient.stops.length);
  // version 4 attributes
  if (gradient.version == 4) {
    _writeZeros(buffer, 4); // reserved
    buffer.writeUint8(_encodeOverflow(gradient.overflow, gradient.linearRgb));
    _writeZeros(buffer, 3); // reserved
  }
  // stops
  for (final stop in gradient.stops) {
    buffer.writeUint8(stop.offset);
    buffer.writeUint8(stop.red);
    buffer.writeUint8(stop.green);
    buffer.writeUint8(stop.blue);
    buffer.writeUint8(stop.alpha);
  }
}
