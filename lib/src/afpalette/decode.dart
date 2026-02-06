part of 'afpalette.dart';

// Chunk IDs (stored as little-endian values to match file)
const int _chunkP1CN = 0x506C434E; // File name
const int _chunkPaNV = 0x50614E56; // Name list
const int _chunkPaLV = 0x50616C56; // Palette list
const int _chunkCols = 0x436F6C73; // Colour list
const int _chunkColD = 0x636F6C44; // Colour data
const int _chunkPosn = 0x506F736E; // Position

AffinityDesignerPalette _decode(List<int> bytes) {
  // Read header manually to ensure correct byte order
  if (bytes.length < 8) {
    throw const FormatException('File too short: expected at least 8 bytes');
  }

  // Validate header (little-endian)
  final magic =
      bytes[0] | (bytes[1] << 8) | (bytes[2] << 16) | (bytes[3] << 24);
  if (magic != AffinityDesignerPalette.magicNumber) {
    throw FormatException(
      '''
Invalid magic number: expected 0x${AffinityDesignerPalette.magicNumber.toRadixString(16)}, got 0x${magic.toRadixString(16)}''',
    );
  }

  final version =
      bytes[4] | (bytes[5] << 8) | (bytes[6] << 16) | (bytes[7] << 24);
  if (version != AffinityDesignerPalette.version) {
    throw FormatException(
      '''
Unsupported version: expected ${AffinityDesignerPalette.version}, got $version''',
    );
  }

  // Parse chunks using the same approach as the JavaScript decoder:
  // Search for chunks throughout the file rather than assuming sequential order
  String? fileName;
  final colors = <AffinityDesignerPaletteColor>[];
  final colorNames = <String>[];

  // Start searching after header (byte 8)
  var index = 8;

  // Search for P1CN chunk (filename)
  index = _skipToChunk(bytes, index, _chunkP1CN);
  if (index < bytes.length) {
    // Read filename
    final nameInfo = _readUtf8String(bytes, index);
    fileName = nameInfo.text;
    index = nameInfo.newIndex;

    // Search for PaLV chunk (palette list)
    index = _skipToChunk(bytes, index, _chunkPaLV);
    if (index + 4 <= bytes.length) {
      final paletteCount = _readUint32(bytes, index);
      index += 4;

      // For each palette, parse positions and colors
      for (var j = 0; j < paletteCount && index < bytes.length; j++) {
        // Search for Posn chunk (positions) - optional
        final posnIndex = _skipToChunk(bytes, index, _chunkPosn);
        if (posnIndex < bytes.length) {
          index = posnIndex;
          if (index + 4 <= bytes.length) {
            final positionCount = _readUint32(bytes, index);
            index += 4;

            // Skip position data (8 bytes per position: float64 position + float64 midpoint)
            index += positionCount * 16;
          }
        }

        // Try to find Cols chunk (color list) - but it may not exist
        final colsIndex = _skipToChunk(bytes, index, _chunkCols);
        var colourCount = 0;

        if (colsIndex < bytes.length) {
          // Found Cols chunk
          index = colsIndex;
          if (index + 4 <= bytes.length) {
            colourCount = _readUint32(bytes, index);
            index += 4;
          }
        } else {
          // No Cols chunk - search for colD chunks directly until we can't find more
          colourCount =
              100; // Use a large number, we'll break when no more colD found
        }

        // Read each color
        for (var k = 0; k < colourCount; k++) {
          // Search for colD chunk (color data)
          final colDIndex = _skipToChunk(bytes, index, _chunkColD);
          if (colDIndex >= bytes.length) {
            break; // No more colD chunks
          }

          index = colDIndex;

          // Skip the '_' character
          index++;

          if (index + 16 <= bytes.length) {
            final red = _readFloat32(bytes, index);
            index += 4;
            final green = _readFloat32(bytes, index);
            index += 4;
            final blue = _readFloat32(bytes, index);
            index += 4;
            final alpha = _readFloat32(bytes, index);
            index += 4;

            colors.add(
              AffinityDesignerPaletteColor(
                name: '', // Will be filled in later from name list
                red: red,
                green: green,
                blue: blue,
                alpha: alpha,
              ),
            );
          }
        }
      }

      // Search for PaNV chunk (name list)
      index = _skipToChunk(bytes, index, _chunkPaNV);
      if (index + 4 <= bytes.length) {
        // Skip 4 bytes after PaNV chunk ID (based on JS implementation)
        index += 4;
        final nameCount = _readUint32(bytes, index);
        index += 4;

        for (var j = 0; j < nameCount && index < bytes.length; j++) {
          final nameInfo = _readUtf8String(bytes, index);
          colorNames.add(nameInfo.text);
          index = nameInfo.newIndex;
        }
      }
    }
  }

  // Match color names to colors
  final finalColors = <AffinityDesignerPaletteColor>[];
  for (var i = 0; i < colors.length; i++) {
    final name = i < colorNames.length ? colorNames[i] : 'Color $i';
    finalColors.add(
      AffinityDesignerPaletteColor(
        name: name,
        red: colors[i].red,
        green: colors[i].green,
        blue: colors[i].blue,
        alpha: colors[i].alpha,
      ),
    );
  }

  return AffinityDesignerPalette(fileName: fileName, colors: finalColors);
}

// Helper function to skip to a specific chunk and return position after chunk ID
// Returns bytes.length if chunk not found
int _skipToChunk(List<int> bytes, int current, int chunkId) {
  for (var i = current; i < bytes.length - 4; i++) {
    final foundId = _readUint32(bytes, i);
    if (foundId == chunkId) {
      return i + 4; // Return position AFTER the chunk ID
    }
  }
  return bytes.length;
}

// Helper function to read a 32-bit unsigned integer from a byte list (little-endian)
int _readUint32(List<int> bytes, int index) {
  if (index + 4 > bytes.length) return 0;
  return bytes[index] |
      (bytes[index + 1] << 8) |
      (bytes[index + 2] << 16) |
      (bytes[index + 3] << 24);
}

// Helper function to read a 32-bit float from a byte list (little-endian)
double _readFloat32(List<int> bytes, int index) {
  if (index + 4 > bytes.length) return 0;
  final byteData = ByteData(4);
  byteData.setUint8(0, bytes[index]);
  byteData.setUint8(1, bytes[index + 1]);
  byteData.setUint8(2, bytes[index + 2]);
  byteData.setUint8(3, bytes[index + 3]);
  return byteData.getFloat32(0, Endian.little);
}

// Helper class for UTF-8 string reading result
class _Utf8StringResult {
  final String text;
  final int newIndex;

  _Utf8StringResult({required this.text, required this.newIndex});
}

// Helper function to read a UTF-8 string from a byte list
// Matches JavaScript AFReadUtf8String implementation
_Utf8StringResult _readUtf8String(List<int> bytes, int index) {
  if (index + 4 > bytes.length) {
    return _Utf8StringResult(text: '', newIndex: index);
  }

  final length = _readUint32(bytes, index);
  index += 4;

  final endIndex = index + length;
  if (endIndex > bytes.length) {
    return _Utf8StringResult(text: '', newIndex: index);
  }

  // Read characters until we hit a null terminator or reach the length
  final charCodes = <int>[];
  for (var i = 0; i < length; i++) {
    final byte = bytes[index + i];
    if (byte == 0) {
      break;
    }
    charCodes.add(byte);
  }

  final text = String.fromCharCodes(charCodes);
  // Always advance by the full length of the field
  return _Utf8StringResult(text: text, newIndex: endIndex);
}
