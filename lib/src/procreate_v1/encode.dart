part of 'procreate.dart';

List<int> encodeProcreateV1Palette(List<ProcreateV1Palette> swatches) {
  for (final palette in swatches) {
    _validatePalette(palette);
  }
  final jsonList =
      swatches.map((swatch) {
        return swatch.toMap();
      }).toList();
  final jsonContent = json.encode(jsonList);
  // UTF-8 bytes, not UTF-16 code units: codeUnits corrupts non-ASCII names.
  final contentBytes = utf8.encode(jsonContent);

  final archive = Archive();
  // Real Procreate files name the entry with a capital S; decoding reads
  // the first entry regardless of name.
  archive.addFile(
    ArchiveFile('Swatches.json', contentBytes.length, contentBytes),
  );
  return ZipEncoder().encode(archive);
}
