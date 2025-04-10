part of 'procreate.dart';

List<ProcreateV1Palette> decodeProcreateV1Palettes(List<int> bytes) {
  final archive = ZipDecoder().decodeBytes(bytes);
  final jsonFile = archive.first;
  final jsonContent = String.fromCharCodes(jsonFile.content as List<int>);

  final swatches = json.decode(jsonContent) as List<dynamic>;
  return swatches.map((swatch) {
    return ProcreateV1PaletteMapper.fromMap(swatch as Map<String, dynamic>);
  }).toList();
}
