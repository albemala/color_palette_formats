// ignore_for_file: prefer_asserts_with_message

import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  // Example: Reading an ACB (Adobe Color Book) file.
  final acbFile = File('path/to/file.acb');
  final acb = AdobeColorBook.fromBytes(acbFile.readAsBytesSync());
  assert(acb.colors.length == 300);

  // Example: Reading an ACBL (Adobe Color Book Legacy) file.
  final acblFile = File('path/to/file.acbl');
  final acbl = AdobeColorBookLegacy.fromBytes(acblFile.readAsBytesSync());
  assert(acbl.version == 1);
  assert(acbl.bookId == 3002);
  assert(acbl.colors.length == 11);

  // Example: Reading an ACO (Adobe Color Swatch) file.
  final acoFile = File('path/to/file.aco');
  final aco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
  assert(aco.colors.length == 52);

  // Example: Reading an ACT (Adobe Color Table) file.
  final actFile = File('path/to/file.act');
  final act = AdobeColorTable.fromBytes(actFile.readAsBytesSync());
  assert(act.colors.length == adobeColorTableColorsCount);

  // Example: Reading an ASE (Adobe Swatch Exchange) file.
  final aseFile = File('path/to/file.ase');
  final ase = AdobeSwatchExchange.fromBytes(aseFile.readAsBytesSync());
  assert(ase.colors.length == 122);

  // Example: Reading a GPL (GIMP Palette) file.
  final gplFile = File('path/to/file.gimp');
  final gpl = GimpPalette.fromBytes(gplFile.readAsBytesSync());
  assert(gpl.colors.length == 256);

  // Example: Reading an HPL (Homesite Palette) file.
  final hplFile = File('path/to/file.hpl');
  final hpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());
  assert(hpl.colors.length == 287);

  // Example: Reading a KOffice Palette (.colors) file.
  final kofficeFile = File('assets/koffice/KDE40.colors');
  final koffice = KOfficePalette.fromBytes(kofficeFile.readAsBytesSync());
  assert(koffice.colors.length == 40);

  // Example: Reading a PAL (Paint Shop Pro Palette) file.
  final palFile = File('path/to/file.pal');
  final pal = PaintShopProPalette.fromBytes(palFile.readAsBytesSync());
  assert(pal.colors.length == 3);

  // Example: Reading a Paint.NET Palette file.
  final paintDotNetFile = File('path/to/file.txt');
  final paintDotNet = PaintDotNetPalette.fromBytes(
    paintDotNetFile.readAsBytesSync(),
  );
  assert(paintDotNet.colors.length == 96);

  // Example: Reading a Procreate Swatches file.
  final procreateFile = File('path/to/file.swatches');
  final procreate = decodeProcreateSwatches(procreateFile.readAsBytesSync());
  assert(procreate.first.swatches.length == 30);

  // Example: Reading a RIFF (Resource Interchange File Format) Palette file.
  final riffFile = File('path/to/file.pal');
  final riff = ResourceInterchangeFileFormat.fromBytes(
    riffFile.readAsBytesSync(),
  );
  assert(riff.colors.length == 16);

  // Example: Reading a Sketch Palette file.
  final sketchpaletteFile = File('path/to/file.sketchpalette');
  final sketchpalette = SketchPalette.fromBytes(
    sketchpaletteFile.readAsBytesSync(),
  );
  assert(sketchpalette.compatibleVersion == supportedSketchPaletteVersion);
  assert(sketchpalette.pluginVersion == supportedSketchPaletteVersion);
  assert(sketchpalette.colors.length == 6);

  // Example: Reading a Scribus XML Palette file.
  final scribusFile = File('path/to/file.xml');
  final scribus = ScribusPalette.fromBytes(scribusFile.readAsBytesSync());
  assert(scribus.name == 'tango');
  assert(scribus.colors.length == 52);

  // Example: Reading an SOC (StarOffice Color) file.
  final socFile = File('path/to/file.soc');
  final soc = StarOfficeColorTable.fromBytes(socFile.readAsBytesSync());
  assert(soc.colors.length == 216);
}
