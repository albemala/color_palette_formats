## 5.1.1

- Changed project links in `README.md` to point to the new portfolio site.


## 5.1.0

- Added `supportedVersions` to `AffinityDesignerPalette`.
- Changed `AffinityDesignerPalette.fromBytes` to decode version 12 files instead of throwing an unsupported-version error.


## 5.0.2

- Changed StarOffice Colors decoding to accept both legacy and OASIS namespace variants.


## 5.0.1

- Changed internal file names.


## 5.0.0

- Added ColorSchemer reading and writing.
- Added Rebelle reading and writing.
- Added Affinity reading.
- Added `LAB` color model support in ASE format.
- Fixed reading ASE palettes with empty color names.


## 4.0.0

- BREAKING: Changed default properties to be required in constructors.
- Added ArtRage reading.
- Added CxF reading.


## 3.0.0

- BREAKING: Renamed Jasc format to Paint Shop Pro.
- BREAKING: Renamed Procreate Swatches format to Procreate V1 Palette.
- BREAKING: Reworked GIMP palette API.
- BREAKING: Changed Dart SDK constraint to `>=3.7.0 <4.0.0`.
- Changed handling of valid versions and file signatures.
- Changed Flutter requirement to 3.29.
- Added Adobe Color Book Legacy (ACBL) format support.
- Added CorelDraw 4 Palette (PAL) format support.
- Added KOffice Palette (`.colors`) format support.
- Added Scribus Swatch (`.xml`) format support.
- Added Skencil Palette (`.spl`) format support.
- Added StarOffice Colors (SOC) format support.
- Added sK1 Palette (`.skp`) format support.
- Added Procreate v5 Swatches (`.swatches`) format support.
- Added palette format validation functions.
- Added parameter validation in constructors.


## 2.0.3

- Changed dependencies.
- Changed funding information.


## 2.0.2

- Changed `README.md`.


## 2.0.1

- Changed ASE decoding to ignore unknown block types.


## 2.0.0

- BREAKING: Reworked API to accept only bytes; decode with `<PaletteClass>.fromBytes` and encode with `palette.toBytes`.


## 1.1.2

- Fixed linter warnings.


## 1.1.1

- Fixed linter warnings.


## 1.1.0

- BREAKING: Changed Dart SDK constraint to `>=3.2.0 <4.0.0`.
- Changed Flutter requirement to 3.16.
- Changed code generation from `freezed` to `dart_mappable`.


## 1.0.0

- first release
