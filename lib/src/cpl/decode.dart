part of 'cpl.dart';

const _paletteName = 'Corel Palette';

CplVersion _parseVersion(int first, int second) => switch ((first, second)) {
  (0xCC, 0xBC) => CplVersion.ccbc,
  (0xCC, 0xDC) => CplVersion.ccdc,
  (0xCD, 0xBC) => CplVersion.cdbc,
  (0xCD, 0xDC) => CplVersion.cddc,
  (0xDD, 0xDC) => CplVersion.dddc,
  (0xCD, 0xDD) => CplVersion.cddd,
  (0xDC, 0xDC) => CplVersion.dcdc,
  _ =>
    throw FormatException(
      'Not a valid $_paletteName. Unsupported version "$first $second".',
    ),
};

/// Long entries (id + two model slots) are stored when the version
/// is cdbc/cddc/cddd and the palette type is below 38 (except 5/16).
bool _usesLongEntries(CplVersion version, int type) {
  final longVersion =
      version == CplVersion.cdbc ||
      version == CplVersion.cddc ||
      version == CplVersion.cddd;
  return longVersion && type < 38 && type != 5 && type != 16;
}

/// Single-byte (latin1) color names are stored for custom and
/// ccdc palettes, and for cddc palettes whose type is not 16.
bool _usesSingleByteNames(CplVersion version, int type) {
  return version == CplVersion.dcdc ||
      version == CplVersion.ccdc ||
      (version == CplVersion.cddc && type != 16);
}

String _readLatin1String(ByteDataReader buffer, int length) {
  return String.fromCharCodes(buffer.read(length).toList());
}

String _readUtf16LeString(ByteDataReader buffer, int length) {
  final codes = [for (var i = 0; i < length; i++) buffer.readUint16()];
  return String.fromCharCodes(codes);
}

String _readName(ByteDataReader buffer, bool singleByte) {
  final length = buffer.readUint8();
  if (length == 0) return '';
  return singleByte
      ? _readLatin1String(buffer, length)
      : _readUtf16LeString(buffer, length);
}

ByteDataReader _subReader(List<int> bytes, int offset) {
  if (offset < 0 || offset > bytes.length) {
    throw FormatException(
      'Not a valid $_paletteName. Invalid header offset "$offset".',
    );
  }
  return ByteDataReader(endian: Endian.little)..add(bytes.sublist(offset));
}

CplPalette _decode(List<int> bytes) {
  if (bytes.length < 2) {
    throw const FormatException(
      'Not a valid $_paletteName. File is shorter than 2 bytes.',
    );
  }
  final head = ByteDataReader(endian: Endian.little)..add(bytes);
  final version = _parseVersion(head.readUint8(), head.readUint8());

  if (version == CplVersion.dcdc) return _decodeCustom(head, version);
  if (version == CplVersion.ccbc || version == CplVersion.ccdc) {
    return _decodeSimple(head, version);
  }
  return _decodeHeadered(bytes, version);
}

CplPalette _decodeSimple(ByteDataReader head, CplVersion version) {
  final colorCount = head.readUint16();
  final singleByte = version == CplVersion.ccdc;
  final colors = <CplPaletteColor>[];
  for (var i = 0; i < colorCount; i++) {
    colors.add(
      _readColor(head, singleByte: singleByte, long: false, positioned: false),
    );
  }
  return CplPalette(version: version, name: '', type: 0, colors: colors);
}

CplPalette _decodeCustom(ByteDataReader head, CplVersion version) {
  final name = _readName(head, true);
  final colorCount = head.readUint16();
  final colors = <CplPaletteColor>[];
  for (var i = 0; i < colorCount; i++) {
    colors.add(
      _readColor(head, singleByte: true, long: false, positioned: false),
    );
  }
  return CplPalette(version: version, name: name, type: 0, colors: colors);
}

CplPalette _decodeHeadered(List<int> bytes, CplVersion version) {
  final head = ByteDataReader(endian: Endian.little)..add(bytes.sublist(2));
  final headerCount = head.readUint32();
  if (2 + 4 + headerCount * 8 > bytes.length) {
    throw const FormatException(
      'Not a valid $_paletteName. Truncated header table.',
    );
  }
  final headers = <int, int>{};
  for (var i = 0; i < headerCount; i++) {
    headers[head.readUint32()] = head.readUint32();
  }
  for (final required in [0, 1, 2]) {
    if (!headers.containsKey(required)) {
      throw FormatException(
        'Not a valid $_paletteName. Missing header "$required".',
      );
    }
  }

  // Header 0: palette name (single-byte only for cddc).
  final name = _readName(
    _subReader(bytes, headers[0]!),
    version == CplVersion.cddc,
  );
  // Header 1: palette type.
  final type = _subReader(bytes, headers[1]!).readUint16();

  final singleByte = _usesSingleByteNames(version, type);
  final long = _usesLongEntries(version, type);
  final positioned = version == CplVersion.cddd;

  // Header 2: color count followed by the color entries.
  final colorsReader = _subReader(bytes, headers[2]!);
  final colorCount = colorsReader.readUint16();
  final colors = <CplPaletteColor>[];
  for (var i = 0; i < colorCount; i++) {
    colors.add(
      _readColor(
        colorsReader,
        singleByte: singleByte,
        long: long,
        positioned: positioned,
      ),
    );
  }

  // Header 3: custom inks (count + uint16 positions).
  var specialInks = <int>[];
  if (headers.containsKey(3)) {
    final inksReader = _subReader(bytes, headers[3]!);
    final inkCount = inksReader.readUint16();
    specialInks = [for (var i = 0; i < inkCount; i++) inksReader.readUint16()];
  }

  // Header 4: UI color models (2 bytes, X4 only).
  var uiColorModels = <int>[];
  if (headers.containsKey(4)) {
    final uiReader = _subReader(bytes, headers[4]!);
    uiColorModels = [uiReader.readUint8(), uiReader.readUint8()];
  }

  // Header 5: UI layout (displayed + total columns and rows).
  int? displayColumns;
  int? displayRows;
  int? totalColumns;
  int? totalRows;
  if (headers.containsKey(5)) {
    final layoutReader = _subReader(bytes, headers[5]!);
    displayColumns = layoutReader.readUint16();
    displayRows = layoutReader.readUint16();
    totalColumns = layoutReader.readUint16();
    totalRows = layoutReader.readUint16();
  }

  return CplPalette(
    version: version,
    name: name,
    type: type,
    colors: colors,
    specialInks: specialInks,
    uiColorModels: uiColorModels,
    displayColumns: displayColumns,
    displayRows: displayRows,
    totalColumns: totalColumns,
    totalRows: totalRows,
  );
}

CplPaletteColor _readColor(
  ByteDataReader buffer, {
  required bool singleByte,
  required bool long,
  required bool positioned,
}) {
  final id = long ? buffer.readUint32() : null;
  final model = buffer.readUint16();
  final type = buffer.readUint16();
  final values = buffer.read(8).toList();

  int? secondModel;
  int? secondType;
  List<int>? secondValues;
  if (long) {
    secondModel = buffer.readUint16();
    secondType = buffer.readUint16();
    secondValues = buffer.read(8).toList();
  }

  final name = _readName(buffer, singleByte);

  int? row;
  int? column;
  int? unknown;
  if (positioned) {
    row = buffer.readUint32();
    column = buffer.readUint32();
    unknown = buffer.readUint32();
  }

  return CplPaletteColor(
    id: id,
    model: model,
    type: type,
    values: values,
    secondModel: secondModel,
    secondType: secondType,
    secondValues: secondValues,
    name: name,
    row: row,
    column: column,
    unknown: unknown,
  );
}
