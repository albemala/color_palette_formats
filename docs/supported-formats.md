# Supported formats

The `color_palette_formats` package can read and write a wide range of color palette file formats. The table below summarizes every format supported by the package, whether it can be imported (decoded) and exported (encoded), and the color spaces it supports.

| Format | Extension | Class | Import | Export | Color Spaces |
|---|---|---|---|:---:|:---:|---|
| ASCII Color Format | `.acf` | `AcfPalette` | ✅ | ✅ | RGB, CMYK, Lab, HiFi |
| Adobe Color Book | `.acb` | `AdobeColorBook` | ✅ | ❌ | RGB, HSB, CMYK, LAB, Grayscale, Pantone, Focoltone, Trumatch, Toyo, HKS |
| Adobe Color Book Legacy | `.acbl` | `AdobeColorBookLegacy` | ✅ | ✅ | CMYK (free-form string; defaults to 4 channels, Float) |
| Adobe Color Swatch | `.aco` | `AdobeColorSwatch` | ✅ | ✅ | RGB, HSB, CMYK, LAB, Grayscale, Wide CMYK |
| Adobe Color Table | `.act` | `AdobeColorTable` | ✅ | ✅ | RGB |
| Adobe Swatch Exchange | `.ase` | `AdobeSwatchExchange` | ✅ | ✅ | RGB, CMYK, Gray, LAB |
| Affinity Designer Palette | `.afpalette` | `AffinityDesignerPalette` | ✅ | ❌ | RGB + Alpha |
| ArtRage 6 Palette | `.col` | `Artrage6Palette` | ✅ | ❌ | RGB + Alpha |
| AutoCAD Color Book | `.acb` | `AutoCadColorBook` | ✅ | ✅ | RGB (plain `RGB8` or encrypted `RGB8Encrypt` codes) |
| Binary Color Format | `.bcf` | `BcfPalette` | ✅ | ✅ | XYZ, CMYK, RGB, Lab, HiFi |
| ColorSchemer Studio | `.cs` | `ColorSchemerPalette` | ✅ | ✅ | RGB |
| CorelDraw 4 Palette | `.pal` | `CorelDraw4Palette` | ✅ | ✅ | CMYK |
| Corel Palette | `.cpl` | `CplPalette` | ✅ | ✅ | RGB, CMYK, CMY, HSB, HLS, Grayscale, B/W, YIQ, Lab, Hexachrome |
| Corel Painter Palette | `.txt` | `PainterPalette` | ✅ | ✅ | RGB |
| Color Exchange Format | `.cxf` | `CxfPalette` | ✅ | ❌ | CIE Lab |
| Flash Color Set | `.clr` | `ClrPalette` | ✅ | ✅ | RGB + Alpha, HSV |
| GIMP Palette | `.gpl`, `.gimp` | `GimpPalette` | ✅ | ✅ | RGB |
| Homesite Palette | `.hpl` | `HomesitePalette` | ✅ | ✅ | RGB |
| KOffice Palette | `.colors` | `KOfficePalette` | ✅ | ✅ | RGB |
| Paint.NET Palette | `.txt` | `PaintDotNetPalette` | ✅ | ✅ | RGB + Alpha |
| Procreate v1 Swatches | `.swatches` | `ProcreateV1Palette` | ❌¹ | ✅ | HSB |
| Procreate v5 Swatches | `.swatches` | `ProcreateV5Palette` | ✅ | ✅ | Multi-model (RGB, CMYK, LAB, Gray) via raw int + ICC profile |
| QuarkXPress Color Library | `.qcl` | `QuarkXPressPalette` | ✅ | ✅ | RGB, CMYK, Lab, Hexachrome |
| QuarkXPress UI Specs | `.cui` | `QuarkXPressCui` | ✅ | ✅ | Display layout only (no colors) |
| RAL BCS | `.bcs` | `BcsPalette` | ✅ | ✅ | Lab |
| CLF Lab colors file | `.clf` | `ClfPalette` | ✅ | ✅ | Lab |
| Jasc / Corel Paint Shop Pro | `.pal`, `.psppalette` | `PaintShopProPalette` | ✅ | ✅ | RGB |
| Rebelle Palette | `.txt`, `.colors` | `RebellePalette` | ✅ | ✅ | RGB |
| Resource Interchange File Format | `.pal` | `ResourceInterchangeFileFormat` | ✅ | ✅ | RGB |
| Scribus Swatch | `.xml` | `ScribusPalette` | ✅ | ✅ | RGB (hex) |
| sK1 Palette | `.skp` | `Sk1Palette` | ✅ | ✅ | RGB, CMYK, Gray |
| Skencil Palette | `.spl` | `SkencilPalette` | ✅ | ✅ | RGB |
| Sketch Palette | `.sketchpalette` | `SketchPalette` | ✅ | ✅ | RGB + Alpha |
| StarOffice Colors | `.soc` | `StarOfficeColorTable` | ✅ | ✅ | RGB (hex) |

## Notes

¹ **Procreate v1 Swatches** does not expose a `fromBytes` factory on `ProcreateV1Palette`. To import, use the top-level `decodeProcreateV1Palettes(List<int> bytes)` function instead, which returns a `List<ProcreateV1Palette>` (v1 files can contain multiple palettes in a single archive).

**Procreate v5 Swatches** does not use a Dart enum for color spaces. The format stores `colorSpace` and `colorModel` as raw `int` values and embeds an ICC profile (`ProcreateV5ColorProfile`) that can express RGB, CMYK, LAB, Gray, and other models at the ICC level.

**Adobe Color Book Legacy (ACBL)** stores the color space as a free-form `String` field (default `"CMYK"`) along with separate `encoding` (default `"Float"`) and `channels` (default `4`) fields, so any color space string can technically be round-tripped.
