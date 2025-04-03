# Color palette formats

[![Pub](https://img.shields.io/pub/v/color_palette_formats)](https://pub.dev/packages/color_palette_formats)

A package for decoding and encoding various color palette formats. It allows Flutter apps to read and write color data
across a wide range of industry-standard formats.

Currently, the package supports the following formats:

- Adobe Color Book (ACB)
- Adobe Color Book Legacy (ACBL)
- Adobe Color Swatch (ACO)
- Adobe Color Table (ACT)
- Adobe Swatch Exchange (ASE)
- CorelDraw 4 Palette (PAL)
- GIMP Palette (GPL)
- Homesite Palette (HPL)
- KOffice Palette (.colors)
- Paint.NET Palette (.txt)
- Procreate Swatches (.swatches)
- Jasc / Corel Paint Shop Pro (.pal, .psppalette)
- Resource Interchange File Format (RIFF)
- Scribus Swatch (.xml)
- Skencil Palette (.spl)
- Sketch Palette (.sketchpalette)
- StarOffice Colors (SOC)

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

- **[Hexee Pro](https://hexee.app/)** - Palette editor & Advanced color toolkit for designers and developers.

Feel free to submit a pull request to add your project to this list.

## Support this project

- [GitHub Sponsor](https://github.com/sponsors/albemala)
- [Buy Me A Coffee](https://www.buymeacoffee.com/albemala)

## Other projects

[All my projects](https://projects.albemala.me/)

## Credits

Created by [@albemala](https://github.com/albemala) ([Twitter](https://twitter.com/albemala))
