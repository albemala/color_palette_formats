part of 'procreate.dart';

// Encodes a single ProcreateV5Palette into the .swatches file format (zipped JSON).
List<int> _encode(ProcreateV5Palette palette) {
  // Use the generated mapper to convert the palette object to a Map
  final paletteMap = palette.toMap();

  // Encode the Map into a JSON string
  final jsonContent = json.encode(paletteMap);

  // Create a zip archive containing the JSON data in a file named 'swatches.json'
  final archive = Archive();
  archive.addFile(
    ArchiveFile(
      'swatches.json', // Standard filename within Procreate .swatches archives
      utf8.encode(jsonContent).length, // Use byte length for accuracy
      utf8.encode(jsonContent), // Encode JSON string to bytes
    ),
  );

  // Encode the archive using ZipEncoder
  return ZipEncoder().encode(archive);
}
