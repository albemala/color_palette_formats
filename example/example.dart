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

  // Example: Reading a CorelDraw 4 Palette (.pal) file.
  final corelDraw4File = File('path/to/file.pal');
  final corelDraw4 = CorelDraw4Palette.fromBytes(
    corelDraw4File.readAsBytesSync(),
  );
  assert(corelDraw4.colors.length == 12);

  // Example: Reading a GPL (GIMP Palette) file.
  final gimpFile = File('path/to/file.gpl');
  final gimp = GimpPalette.fromBytes(gimpFile.readAsBytesSync());
  assert(gimp.colors.length == 256);

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

  // Example: Reading a Procreate V1 Swatches file.
  final procreateFile = File('path/to/file.swatches');
  final procreate = decodeProcreateV1Palettes(procreateFile.readAsBytesSync());
  assert(procreate.first.swatches.length == 30);

  // Example: Reading a Procreate V5 Swatches file.
  final procreateV5File = File('path/to/file.swatches');
  final procreateV5 = ProcreateV5Palette.fromBytes(
    procreateV5File.readAsBytesSync(),
  );
  assert(procreateV5.swatches.length == 23);

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
  assert(sketchpalette.compatibleVersion == SketchPalette.validVersion);
  assert(sketchpalette.pluginVersion == SketchPalette.validVersion);
  assert(sketchpalette.colors.length == 6);

  // Example: Reading a Scribus XML Palette file.
  final scribusFile = File('path/to/file.xml');
  final scribus = ScribusPalette.fromBytes(scribusFile.readAsBytesSync());
  assert(scribus.name == 'tango');
  assert(scribus.colors.length == 52);

  // Example: Reading a Skencil Palette (.spl) file.
  final skencilFile = File('path/to/file.spl');
  final skencil = SkencilPalette.fromBytes(skencilFile.readAsBytesSync());
  assert(skencil.colors.length == 23);

  // Example: Reading an sK1 Palette (.skp) file.
  final sk1File = File('assets/sk1/file.skp');
  final sk1 = Sk1Palette.fromBytes(sk1File.readAsBytesSync());
  assert(sk1.name == 'Ubuntu colors');
  assert(sk1.source == 'Canonical');
  assert(sk1.comments.length == 2);
  assert(sk1.columns == 1);
  assert(sk1.colors.length == 9);
  // Check first color details
  assert(sk1.colors.first.name == 'Ubuntu orange');
  assert(sk1.colors.first.colorSpace == Sk1ColorSpace.rgb);
  assert(sk1.colors.first.values.length == 3);
  assert(sk1.colors.first.alpha == 1.0);

  // Example: Reading an SOC (StarOffice Color) file.
  final socFile = File('path/to/file.soc');
  final soc = StarOfficeColorTable.fromBytes(socFile.readAsBytesSync());
  assert(soc.colors.length == 216);
}
