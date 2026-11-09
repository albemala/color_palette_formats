// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  processPaletteFiles<AdobeColorBook>(
    [
      'test/testdata/acb/acb1_v1.acb',
      'test/testdata/acb/DIC Color Guide.acb',
      'test/testdata/acb/HKS E.acb',
      'test/testdata/acb/ANPA Color.acb',
    ],
    AdobeColorBook.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorBookLegacy>(
    ['test/testdata/acbl/ACBL.acbl'],
    AdobeColorBookLegacy.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AcfPalette>(
    ['test/testdata/acf/acf1_v1.0.acf', 'test/testdata/acf/acf2_v2.1.acf'],
    AcfPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorSwatch>(
    [
      'test/testdata/aco/aco1_v1.aco',
      'test/testdata/aco/aco2_v1.aco',
      'test/testdata/aco/NES.aco',
      'test/testdata/aco/VisiBone2.aco',
    ],
    AdobeColorSwatch.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeColorTable>(
    [
      'test/testdata/act/act1.act',
      'test/testdata/act/act2.act',
      'test/testdata/act/act3.act',
      'test/testdata/act/Grayscale.act',
      'test/testdata/act/Black & White.act',
      'test/testdata/act/Windows.act',
      'test/testdata/act/Mac OS.act',
    ],
    AdobeColorTable.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AffinityDesignerPalette>(
    [
      'test/testdata/afpalette/afpalette-test.afpalette',
      'test/testdata/afpalette/3WHITE0OPC3WHITE100OPC.afpalette',
      'test/testdata/afpalette/EMPTY.afpalette',
      'test/testdata/afpalette/EMPTY2.afpalette',
      'test/testdata/afpalette/EMPTYDOC.afpalette',
      'test/testdata/afpalette/Grays.afpalette',
      'test/testdata/afpalette/Kit - Grade UI - Fills.afpalette',
      'test/testdata/afpalette/Maurice Denis 01.afpalette',
      'test/testdata/afpalette/Simple Test A.afpalette',
      'test/testdata/afpalette/Simple Test B.afpalette',
      'test/testdata/afpalette/_FMPEnlHHs01.afpalette',
      'test/testdata/afpalette/cromatica.afpalette',
      'test/testdata/afpalette/shido-10.afpalette',
      'test/testdata/afpalette/sunfall.afpalette',
      'test/testdata/afpalette/tulip collection 2026.afpalette',
    ],
    AffinityDesignerPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<Artrage6Palette>(
    [
      'test/testdata/artrage/Colors.col',
      'test/testdata/artrage/Complementary.col',
      'test/testdata/artrage/Pastel.col',
    ],
    Artrage6Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AdobeSwatchExchange>(
    [
      'test/testdata/ase/ase1_v1.0.ase',
      'test/testdata/ase/ase2_v1.0.ase',
      'test/testdata/ase/cromatica.ase',
      'test/testdata/ase/shido-10.ase',
      'test/testdata/ase/sunfall.ase',
      'test/testdata/ase/blue.ase',
      'test/testdata/ase/NNN Palette.ase',
    ],
    AdobeSwatchExchange.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<CorelDraw4Palette>(
    ['test/testdata/coreldraw4/coreldraw.pal'],
    CorelDraw4Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<GimpPalette>(
    [
      'test/testdata/gimp/gpl1.gimp',
      'test/testdata/gimp/gpl2.gpl',
      'test/testdata/gimp/cromatica.gpl',
      'test/testdata/gimp/shido-10.gpl',
      'test/testdata/gimp/sunfall.gpl',
    ],
    GimpPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<HomesitePalette>(
    ['test/testdata/hpl/hpl1_v4.0.hpl', 'test/testdata/hpl/hpl2_v4.0.hpl'],
    HomesitePalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<KOfficePalette>(
    ['test/testdata/koffice/KDE40.colors'],
    KOfficePalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<PaintDotNetPalette>(
    ['test/testdata/paint-dot-net/paint-dot-net1.txt'],
    PaintDotNetPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<PainterPalette>(
    [
      'test/testdata/painter/painter1.txt',
      'test/testdata/painter/painter2.txt',
    ],
    PainterPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<PaintShopProPalette>(
    [
      'test/testdata/psp/pal1_v0100.pal',
      'test/testdata/psp/VisiBone2_km.psppalette',
    ],
    PaintShopProPalette.fromBytes,
    (e) => e.toMap(),
  );
  for (final path in [
    // v1
    'test/testdata/procreate/procreate1.swatches',
    'test/testdata/procreate/procreate2.swatches',
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
      'test/testdata/procreate/procreate3.swatches',
      'test/testdata/procreate/shido-10.swatches',
      'test/testdata/procreate/sunfall.swatches',
      'test/testdata/procreate/cromatica.swatches',
    ],
    ProcreateV5Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<ResourceInterchangeFileFormat>(
    ['test/testdata/riff/riff1_v3.pal', 'test/testdata/riff/riff2_v3.pal'],
    ResourceInterchangeFileFormat.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<SketchPalette>(
    [
      'test/testdata/sketchpalette/sketchpalette1_v1.4.sketchpalette',
      'test/testdata/sketchpalette/sketchpalette2_v1.4.sketchpalette',
      'test/testdata/sketchpalette/material-design.sketchpalette',
    ],
    SketchPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<ScribusPalette>(
    ['test/testdata/scribus/Scribus.xml'],
    ScribusPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<SkencilPalette>(
    ['test/testdata/skencil/mini.spl', 'test/testdata/skencil/www.spl'],
    SkencilPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<Sk1Palette>(
    [
      'test/testdata/sk1/Fedora_color_palette.skp',
      'test/testdata/sk1/Lible_Colors.skp',
      'test/testdata/sk1/Ubuntu_colors.skp',
      'test/testdata/sk1/openSUSE_colors.skp',
    ],
    Sk1Palette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<RebellePalette>(
    ['test/testdata/rebelle/default.colors'],
    RebellePalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<StarOfficeColorTable>(
    [
      'test/testdata/soc/cmyk.soc',
      'test/testdata/soc/gallery.soc',
      'test/testdata/soc/html.soc',
    ],
    StarOfficeColorTable.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<CxfPalette>(
    ['test/testdata/cxf/sample.cxf'],
    CxfPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<ColorSchemerPalette>(
    ['test/testdata/colorschemer/Pumpkin.cs'],
    ColorSchemerPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<QuarkXPressPalette>(
    ['test/testdata/qcl/solid-hex.qcl', 'test/testdata/qcl/rgb-cmyk.qcl'],
    QuarkXPressPalette.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<QuarkXPressCui>(
    ['test/testdata/cui/solid-hex.cui'],
    QuarkXPressCui.fromBytes,
    (e) => e.toMap(),
  );
  processPaletteFiles<AutoCadColorBook>(
    [
      'test/testdata/autocad_acb/pantone-cotton.acb',
      'test/testdata/autocad_acb/acme-plain.acb',
    ],
    AutoCadColorBook.fromBytes,
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
