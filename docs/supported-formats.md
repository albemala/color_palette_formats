# Supported formats

The `color_palette_formats` package can read and write a wide range of color palette file formats. The table below summarizes every format supported by the package, whether it can be imported (decoded) and exported (encoded), and the color spaces it supports.

| Format | Class | Import | Export | Color Spaces |
|---|---|:---:|:---:|---|
| Adobe Color Book (ACB) | `AdobeColorBook` | ✅ | ❌ | RGB, HSB, CMYK, LAB, Grayscale, Pantone, Focoltone, Trumatch, Toyo, HKS |
| Adobe Color Book Legacy (ACBL) | `AdobeColorBookLegacy` | ✅ | ✅ | CMYK (free-form string; defaults to 4 channels, Float) |
| Adobe Color Swatch (ACO) | `AdobeColorSwatch` | ✅ | ✅ | RGB, HSB, CMYK, LAB, Grayscale, Wide CMYK |
| Adobe Color Table (ACT) | `AdobeColorTable` | ✅ | ✅ | RGB |
| Adobe Swatch Exchange (ASE) | `AdobeSwatchExchange` | ✅ | ✅ | RGB, CMYK, Gray, LAB |
| Affinity Designer Palette | `AffinityDesignerPalette` | ✅ | ❌ | RGB + Alpha |
| ArtRage 6 Palette | `Artrage6Palette` | ✅ | ❌ | RGB + Alpha |
| ColorSchemer Studio | `ColorSchemerPalette` | ✅ | ✅ | RGB |
| CorelDraw 4 Palette (PAL) | `CorelDraw4Palette` | ✅ | ✅ | CMYK |
| Color Exchange Format (CXF) | `CxfPalette` | ✅ | ❌ | CIE Lab |
| GIMP Palette (GPL) | `GimpPalette` | ✅ | ✅ | RGB |
| Homesite Palette (HPL) | `HomesitePalette` | ✅ | ✅ | RGB |
| KOffice Palette (.colors) | `KOfficePalette` | ✅ | ✅ | RGB |
| Paint.NET Palette (.txt) | `PaintDotNetPalette` | ✅ | ✅ | RGB + Alpha |
| Procreate v1 Swatches | `ProcreateV1Palette` | ❌¹ | ✅ | HSB |
| Procreate v5 Swatches | `ProcreateV5Palette` | ✅ | ✅ | Multi-model (RGB, CMYK, LAB, Gray) via raw int + ICC profile |
| Jasc / Corel Paint Shop Pro | `PaintShopProPalette` | ✅ | ✅ | RGB |
| Rebelle Palette | `RebellePalette` | ✅ | ✅ | RGB |
| Resource Interchange File Format (RIFF) | `ResourceInterchangeFileFormat` | ✅ | ✅ | RGB |
| Scribus Swatch | `ScribusPalette` | ✅ | ✅ | RGB (hex) |
| sK1 Palette (.skp) | `Sk1Palette` | ✅ | ✅ | RGB, CMYK, Gray |
| Skencil Palette (.spl) | `SkencilPalette` | ✅ | ✅ | RGB |
| Sketch Palette (.sketchpalette) | `SketchPalette` | ✅ | ✅ | RGB + Alpha |
| StarOffice Colors (SOC) | `StarOfficeColorTable` | ✅ | ✅ | RGB (hex) |

## Notes

¹ **Procreate v1 Swatches** does not expose a `fromBytes` factory on `ProcreateV1Palette`. To import, use the top-level `decodeProcreateV1Palettes(List<int> bytes)` function instead, which returns a `List<ProcreateV1Palette>` (v1 files can contain multiple palettes in a single archive).

**Procreate v5 Swatches** does not use a Dart enum for color spaces. The format stores `colorSpace` and `colorModel` as raw `int` values and embeds an ICC profile (`ProcreateV5ColorProfile`) that can express RGB, CMYK, LAB, Gray, and other models at the ICC level.

**Adobe Color Book Legacy (ACBL)** stores the color space as a free-form `String` field (default `"CMYK"`) along with separate `encoding` (default `"Float"`) and `channels` (default `4`) fields, so any color space string can technically be round-tripped.
