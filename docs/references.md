# References

Spec links, sample files, and related open-source implementations collected while working on the codecs. Mirror new links here when adding a codec (see `docs/code-guidelines.md`).

## General overviews

- Selapa color swatch file formats (primary overview): http://www.selapa.net/swatches/colors/fileformats.php
- SwatchBooker by Olivier Berten (same author as selapa; reference reader for `acf`, `bcf`, `clr`, `cpl`, `qcl`, `bcs`, `cs`, … — GPLv3): https://github.com/olivierberten/SwatchBooker (e.g. `src/swatchbook/codecs/adobe_acf.py`)
- AnyPalette.js (reads many formats incl. ColorSchemer; `.acf`/`.bcf` listed as low-priority TODO): https://github.com/1j01/anypalette.js
- ColourSwatch by FHPythonUtils (reads `.gpl`, `.colors`, `.spl`, `.skp`, `.soc`, `.acbl`, `.ase`, … — MIT): https://github.com/FHPythonUtils/ColourSwatch
- CREATE mailing-list thread on a common swatch format (2008): https://lists.freedesktop.org/archives/create/2008-April/001166.html

## Adobe formats

- Photoshop file format spec, ACO section: https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1055819
- Photoshop file format spec, ACB section: https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1066780
- Photoshop file format spec, ACT section: https://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577411_pgfId-1070626
- Unofficial ACO spec: http://www.nomodes.com/aco.html
- Unofficial ACB spec: https://magnetiq.ca/pages/acb-spec/
- ACO v2 notes (open TODO in `aco.dart`): https://github.com/Ashung/import-colors-sketch/blob/master/src/lib/aco-to-colors.js

## ASCII / Binary Color Format (ACF, BCF)

- Selapa ACF section + BCF section with hexdumps (versions ACF 1.0, ACF 2.1, BCF 2.0): http://www.selapa.net/swatches/colors/fileformats.php
- Official `hificolr.pdf` (dead as of Nov 2026, was at `http://download.adobe.com/pub/adobe/pagemaker/all/6.x/hificolr.pdf`).
- Real-world `.acf` sample (Unix rgb.txt converted, 752 entries): https://wiki.inkscape.org/wiki/UnixRgbAcf
- Inkscape wiki discussion (16-bit channels, 48-bit RGB / 64-bit CMYK): https://wiki.inkscape.org/wiki/ColorPalette

## Other selapa roadmap formats

- Corel CPL: CMX 8 spec helped decode it (via selapa): http://web.archive.org/web/*/ftp.corel.com/CorelSolutionPartners/CMXv8/CMXv800.pdf
- RIFF PAL: official RIFF doc http://alpha.tmit.bme.hu/pub/audio/doc/riffmci.rtf and unofficial notes http://www.warpspeed.com.au/cgi-bin/inf2html.cmd?..%5Chtml%5Cbook%5CToolkt40%5CMMREF3.INF+2264
- QCL: files follow CGATS.17 with a `.cui` UI-spec sidecar (see selapa).
- AutoCAD ACB, Painter TXT, RAL BCS: selapa sections only, no known standalone spec.

## Per-codec links already in headers

- ColorSchemer parser reference: https://github.com/1j01/anypalette.js/blob/master/src/formats/ColorSchemer.coffee
- Affinity `.afpalette` reverse-engineering: https://github.com/Balakov/GrdToAfpalette, https://github.com/illumincrotty/cracking-afpalette
- sK1 project: https://sk1project.net/
- CxF namespace used in code: http://colorexchangeformat.com/CxF3-core

## Test assets

- 1j01/palettes (pinned: `bb970c8`): sample palette files per collection (`AdobeColorBook`, `AdobeColorTable`, `LibreOffice`, `OpenOffice`, `sk1_palette_collection_1.0`, `StarCraft`, …), used as test data for AnyPalette.js: https://github.com/1j01/palettes/tree/bb970c808fabfaaf228780eeb449febd88e751eb — candidate source for `test/testdata/<name>/` files when implementing new formats. License caveat from its README: the palettes are not the author's to license, so check each file's provenance before vendoring.
