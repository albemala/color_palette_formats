# Color palette formats

[![Pub](https://img.shields.io/pub/v/color_palette_formats)](https://pub.dev/packages/color_palette_formats)

A package for decoding and encoding various color palette formats. It allows Flutter apps to read and write color data
across a wide range of industry-standard formats.

Currently, the package supports the following formats (see `docs/supported-formats.md` for the extended version with file extensions, classes, and color spaces):

| Format | Import | Export |
|---|---|:---:|:---:|
| ASCII Color Format | ✅ | ✅ |
| Adobe Color Book | ✅ | ❌ |
| Adobe Color Book Legacy | ✅ | ✅ |
| Adobe Color Swatch | ✅ | ✅ |
| Adobe Color Table | ✅ | ✅ |
| Adobe Swatch Exchange | ✅ | ✅ |
| Affinity Designer Palette | ✅ | ❌ |
| ArtRage 6 Palette | ✅ | ❌ |
| AutoCAD Color Book | ✅ | ✅ |
| Binary Color Format | ✅ | ✅ |
| ColorSchemer Studio | ✅ | ✅ |
| CorelDraw 4 Palette | ✅ | ✅ |
| Corel Palette | ✅ | ✅ |
| Corel Painter Palette | ✅ | ✅ |
| Color Exchange Format | ✅ | ❌ |
| Flash Color Set | ✅ | ✅ |
| GIMP Palette | ✅ | ✅ |
| Homesite Palette | ✅ | ✅ |
| KOffice Palette | ✅ | ✅ |
| Paint.NET Palette | ✅ | ✅ |
| Procreate v1 Swatches¹ | ❌ | ✅ |
| Procreate v5 Swatches | ✅ | ✅ |
| QuarkXPress Color Library | ✅ | ✅ |
| QuarkXPress UI Specs | ✅ | ✅ |
| RAL BCS | ✅ | ✅ |
| Jasc / Corel Paint Shop Pro | ✅ | ✅ |
| Rebelle Palette | ✅ | ✅ |
| Resource Interchange File Format | ✅ | ✅ |
| Scribus Swatch | ✅ | ✅ |
| sK1 Palette | ✅ | ✅ |
| Skencil Palette | ✅ | ✅ |
| Sketch Palette | ✅ | ✅ |
| StarOffice Colors | ✅ | ✅ |

¹ Procreate v1 files are imported via the top-level `decodeProcreateV1Palettes` function instead of a `fromBytes` factory.

## Examples

#### Reading a color palette file

```dart
// Example: Reading an ACO (Adobe Color Swatch) file.
final acoFile = File('path/to/aco1_v1.aco');
final aco = AdobeColorSwatch.fromBytes(acoFile.readAsBytesSync());
assert(aco.version == supportedAdobeColorSwatchVersion);
assert(aco.colors.length == 52);

// Example: Reading a Procreate Swatches file.
final procreateFile = File('path/to/procreate1.swatches');
final procreate = decodeProcreateSwatches(procreateFile.readAsBytesSync());
assert(procreate.first.swatches.length == 30);

// Example: Reading a Sketch Palette file.
final sketchpaletteFile =  File('path/to/sketchpalette1_v1.4.sketchpalette');
final sketchpalette = SketchPalette.fromBytes(sketchpaletteFile.readAsBytesSync());
assert(sketchpalette.compatibleVersion == supportedSketchPaletteVersion);
assert(sketchpalette.pluginVersion == supportedSketchPaletteVersion);
assert(sketchpalette.colors.length == 6);
```

#### Writing a color palette file

```dart
final ase = AdobeSwatchExchange(
  version: supportedAdobeSwatchExchangeVersion,
  colors: [
    AdobeSwatchExchangeColor(
      name: 'red',
      model: AdobeSwatchExchangeColorModel.rgb,
      values: [1, 0, 0],
    ),
    AdobeSwatchExchangeColor(
      name: 'cyan',
      model: AdobeSwatchExchangeColorModel.cmyk,
      values: [1, 0, 0, 0],
    ),
    AdobeSwatchExchangeColor(
      name: 'gray',
      model: AdobeSwatchExchangeColorModel.gray,
      values: [0.5],
    ),
  ],
);
// write to file
final aseFile = File('path/to/ase1_v1.ase');
aseFile.writeAsBytesSync(ase.toBytes());
```

## Projects using this package

- **[Hexee Pro](https://albemala.me/apps/hexee-pro/)** - Palette editor & Advanced color toolkit for designers and developers.

Feel free to submit a pull request to add your project to this list.

## Support this project

- [GitHub Sponsor](https://github.com/sponsors/albemala)
- [Buy Me A Coffee](https://www.buymeacoffee.com/albemala)

## Other projects

[All my projects](https://albemala.me/apps/)

## Credits

Created by [@albemala](https://github.com/albemala) ([Twitter](https://twitter.com/albemala))
