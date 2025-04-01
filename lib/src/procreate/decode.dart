part of 'procreate.dart';

List<ProcreateSwatches> decodeProcreateSwatches(List<int> bytes) {
  final archive = ZipDecoder().decodeBytes(bytes);
  final jsonFile = archive.first;
  final jsonContent = String.fromCharCodes(jsonFile.content as List<int>);

  final swatches = json.decode(jsonContent) as List<dynamic>;
  return swatches.map((swatch) {
    return ProcreateSwatchesMapper.fromMap(swatch as Map<String, dynamic>);
  }).toList();
}
