part of 'procreate.dart';

List<int> encodeProcreateSwatches(List<ProcreateSwatches> swatches) {
  final jsonList =
      swatches.map((swatch) {
        return swatch.toMap();
      }).toList();
  final jsonContent = json.encode(jsonList);

  final archive = Archive();
  archive.addFile(
    ArchiveFile('swatches.json', jsonContent.length, jsonContent.codeUnits),
  );
  return ZipEncoder().encode(archive);
}
