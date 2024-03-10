# Color palette formats

[![Pub](https://img.shields.io/pub/v/color_palette_formats)](https://pub.dev/packages/color_palette_formats)

A package for decoding and encoding various color palette formats. It allows Flutter apps to read and write color data
across a wide range of industry-standard formats.

Currently, the package supports the following formats:

- Adobe Color Book (ACB)
- Adobe Color
- Swatch (ACO)
- Adobe Color Table (ACT)
- Adobe Swatch Exchange (ASE)
- GIMP Palette (GPL)
- Homesite Palette (HPL)
- JASC
- Palette (PAL)
- Paint.NET Palette
- Procreate Swatches
- Resource Interchange File Format (RIFF)
- Sketch Palette

## Examples

#### Reading a color palette file

```dart
// Example: Reading an ACO (Adobe Color Swatch) file.
final acoFile = File('path/to/aco1_v1.aco');
final aco = decodeAdobeColorSwatch(acoFile);
assert(aco.version == supportedAdobeColorSwatchVersion);
assert(aco.colors.length == 52);

// Example: Reading a Procreate Swatches file.
final procreateFile = File('path/to/procreate1.swatches');
final procreate = decodeProcreateSwatches(procreateFile);
assert(procreate.first.swatches.length == 30);

// Example: Reading a Sketch Palette file.
final sketchpaletteFile =  File('path/to/sketchpalette1_v1.4.sketchpalette');
final sketchpalette = decodeSketchPalette(sketchpaletteFile);
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
encodeAdobeSwatchExchange(ase, aseFile);
```

## Support this project

<a href="https://www.buymeacoffee.com/albemala" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" >
</a>

## Credits

Created by [@albemala](https://github.com/albemala) ([Twitter](https://twitter.com/albemala)).
