part of 'procreate.dart';

// Note: This function now returns a single palette, assuming the .swatches file
// contains only one palette definition, matching the JSON structure provided earlier.
ProcreateV5Palette _decode(List<int> bytes) {
  // Decode the zip archive
  final archive = ZipDecoder().decodeBytes(bytes);

  // Procreate .swatches files are zip archives containing a single JSON file.
  if (archive.isEmpty || archive.first.isFile == false) {
    throw const FormatException('''
Invalid Procreate v5 file: Expected a zip archive with at least one file.''');
  }
  final jsonFile = archive.first;

  // Decode the JSON content from the file within the archive
  final jsonContent = utf8.decode(
    jsonFile.content as List<int>,
  ); // Using utf8.decode for consistency

  // Parse the JSON string into a Map
  final paletteMap = json.decode(jsonContent) as Map<String, dynamic>;

  // Use the generated mapper to convert the map into a ProcreateV5Palette object
  // This leverages the structure defined in procreate.dart and its mapper.
  return ProcreateV5PaletteMapper.fromMap(paletteMap);
}
