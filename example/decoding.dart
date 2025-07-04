// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  processPaletteFiles<AdobeColorBook>(
    [
      'assets/acb/acb1_v1.acb',
      'assets/acb/DIC Color Guide.acb',
      'assets/acb/HKS E.acb',
      'assets/acb/ANPA Color.acb',
    ],
    AdobeColorBook.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorBookLegacy>(
    ['assets/acbl/ACBL.acbl'],
    AdobeColorBookLegacy.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorSwatch>(
    [
      'assets/aco/aco1_v1.aco',
      'assets/aco/aco2_v1.aco',
      'assets/aco/NES.aco',
      'assets/aco/VisiBone2.aco',
    ],
    AdobeColorSwatch.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorTable>(
    [
      'assets/act/act1.act',
      'assets/act/act2.act',
      'assets/act/act3.act',
      'assets/act/Grayscale.act',
      'assets/act/Black & White.act',
      'assets/act/Windows.act',
      'assets/act/Mac OS.act',
    ],
    AdobeColorTable.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeSwatchExchange>(
    [
      'assets/ase/ase1_v1.0.ase',
      'assets/ase/ase2_v1.0.ase',
      'assets/ase/cromatica.ase',
      'assets/ase/shido-10.ase',
      'assets/ase/sunfall.ase',
      'assets/ase/blue.ase',
    ],
    AdobeSwatchExchange.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<CorelDraw4Palette>(
    ['assets/coreldraw4/coreldraw.pal'],
    CorelDraw4Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<GimpPalette>(
    [
      'assets/gimp/gpl1.gimp',
      'assets/gimp/gpl2.gpl',
      'assets/gimp/cromatica.gpl',
      'assets/gimp/shido-10.gpl',
      'assets/gimp/sunfall.gpl',
    ],
    GimpPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<HomesitePalette>(
    ['assets/hpl/hpl1_v4.0.hpl', 'assets/hpl/hpl2_v4.0.hpl'],
    HomesitePalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<KOfficePalette>(
    ['assets/koffice/KDE40.colors'],
    KOfficePalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<PaintDotNetPalette>(
    ['assets/paint-dot-net/paint-dot-net1.txt'],
    PaintDotNetPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<PaintShopProPalette>(
    ['assets/psp/pal1_v0100.pal', 'assets/psp/VisiBone2_km.psppalette'],
    PaintShopProPalette.fromBytes,
    (e) => e.toMap(),
  );
  for (final path in [
    // v1
    'assets/procreate/procreate1.swatches',
    'assets/procreate/procreate2.swatches',
  ]) {
    final file = File(path);
    final procreate = decodeProcreateV1Palettes(file.readAsBytesSync());
    for (final swatch in procreate) {
      print('--- $path ---');
      print(swatch.toMap());
    }
  }
  processPaletteFiles<ProcreateV5Palette>(
    [
      // v5
      'assets/procreate/procreate3.swatches',
      'assets/procreate/shido-10.swatches',
      'assets/procreate/sunfall.swatches',
      'assets/procreate/cromatica.swatches',
    ],
    ProcreateV5Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<ResourceInterchangeFileFormat>(
    ['assets/riff/riff1_v3.pal', 'assets/riff/riff2_v3.pal'],
    ResourceInterchangeFileFormat.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<SketchPalette>(
    [
      'assets/sketchpalette/sketchpalette1_v1.4.sketchpalette',
      'assets/sketchpalette/sketchpalette2_v1.4.sketchpalette',
      'assets/sketchpalette/material-design.sketchpalette',
    ],
    SketchPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<ScribusPalette>(
    ['assets/scribus/Scribus.xml'],
    ScribusPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<SkencilPalette>(
    ['assets/skencil/mini.spl', 'assets/skencil/www.spl'],
    SkencilPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<Sk1Palette>(
    [
      'assets/sk1/Fedora_color_palette.skp',
      'assets/sk1/Lible_Colors.skp',
      'assets/sk1/Ubuntu_colors.skp',
      'assets/sk1/openSUSE_colors.skp',
    ],
    Sk1Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<StarOfficeColorTable>(
    ['assets/soc/cmyk.soc', 'assets/soc/gallery.soc', 'assets/soc/html.soc'],
    StarOfficeColorTable.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<CxfPalette>(
    ['assets/cxf/sample.cxf'],
    CxfPalette.fromBytes,
    (e) => e.toMap(),
  );
}

void processPaletteFiles<T>(
  List<String> paths,
  T Function(List<int> bytes) fromBytes,
  Map<String, dynamic> Function(T) toMap,
) {
  for (final path in paths) {
    final file = File(path);
    final palette = fromBytes(file.readAsBytesSync());
    print('\n');
    print('======================================');
    print('PALETTE: $path');
    print('======================================');
    print(jsonEncode(toMap(palette)));
  }
}
