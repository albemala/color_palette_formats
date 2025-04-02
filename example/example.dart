// ignore_for_file: prefer_asserts_with_message

import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  // Example: Reading an ACB (Adobe Color Book) file.
  final acbFile = File('path/to/acb1_v1.acb');
  final acb = AdobeColorBook.fromBytes(acbFile.readAsBytesSync());
  assert(acb.colors.length == 300);

  // Example: Reading an ACBL (Adobe Color Book Legacy) file.
  final acblFile = File('path/to/ACBL.acbl');
  final acbl = AdobeColorBookLegacy.fromBytes(acblFile.readAsBytesSync());
  assert(acbl.version == 1);
  assert(acbl.bookId == 3002);
  assert(acbl.colors.length == 11);

  // Example: Reading an ACO (Adobe Color Swatch) file.
  final acoFile = File('path/to/aco1_v1.aco');
  final aco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
  assert(aco.version == supportedAdobeColorSwatchVersion);
  assert(aco.colors.length == 52);

  // Example: Reading an ACT (Adobe Color Table) file.
  final actFile = File('path/to/act1.act');
  final act = AdobeColorTable.fromBytes(actFile.readAsBytesSync());
  assert(act.colors.length == adobeColorTableColorsCount);

  // Example: Reading an ASE (Adobe Swatch Exchange) file.
  final aseFile = File('path/to/ase1_v1.0.ase');
  final ase = AdobeSwatchExchange.fromBytes(aseFile.readAsBytesSync());
  assert(ase.version == supportedAdobeSwatchExchangeVersion);
  assert(ase.colors.length == 122);

  // Example: Reading a GPL (GIMP Palette) file.
  final gplFile = File('path/to/gpl1.gimp');
  final gpl = GimpPalette.fromBytes(gplFile.readAsBytesSync());
  assert(gpl.name == 'Visibone2');
  assert(gpl.colors.length == 256);

  // Example: Reading an HPL (Homesite Palette) file.
  final hplFile = File('path/to/hpl1_v4.0.hpl');
  final hpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());
  assert(hpl.version == supportedHomesitePaletteVersion);
  assert(hpl.colors.length == 287);

  // Example: Reading a PAL (JASC Palette) file.
  final palFile = File('path/to/pal1_v0100.pal');
  final pal = JascPalette.fromBytes(palFile.readAsBytesSync());
  assert(pal.version == supportedJascPaletteVersion);
  assert(pal.colors.length == 3);

  // Example: Reading a Paint.NET Palette file.
  final paintDotNetFile = File('path/to/paint-dot-net1.txt');
  final paintDotNet = PaintDotNetPalette.fromBytes(
    paintDotNetFile.readAsBytesSync(),
  );
  assert(paintDotNet.colors.length == 96);

  // Example: Reading a Procreate Swatches file.
  final procreateFile = File('path/to/procreate1.swatches');
  final procreate = decodeProcreateSwatches(procreateFile.readAsBytesSync());
  assert(procreate.first.swatches.length == 30);

  // Example: Reading a RIFF (Resource Interchange File Format) Palette file.
  final riffFile = File('path/to/riff1_v3.pal');
  final riff = ResourceInterchangeFileFormat.fromBytes(
    riffFile.readAsBytesSync(),
  );
  assert(riff.version == supportedResourceInterchangeFileFormatVersion);
  assert(riff.colors.length == 16);

  // Example: Reading a Sketch Palette file.
  final sketchpaletteFile = File('path/to/sketchpalette1_v1.4.sketchpalette');
  final sketchpalette = SketchPalette.fromBytes(
    sketchpaletteFile.readAsBytesSync(),
  );
  assert(sketchpalette.compatibleVersion == supportedSketchPaletteVersion);
  assert(sketchpalette.pluginVersion == supportedSketchPaletteVersion);
  assert(sketchpalette.colors.length == 6);
}
