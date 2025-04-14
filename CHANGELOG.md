## 3.0.0

### Breaking Changes
- Renamed Jasc format to Paint Shop Pro.
- Renamed Procreate Swatches format to Procreate V1 Palette.
- Reworked GIMP palette API.
- Changed how valid versions and file signatures are handled.
- Now targeting Dart >= 3.7 and Flutter >= 3.29.

### Added
- Added support for Adobe Color Book Legacy (ACBL) format.
- Added support for CorelDraw 4 Palette (PAL) format.
- Added support for KOffice Palette (.colors) format.
- Added support for Scribus Swatch (.xml) format.
- Added support for Skencil Palette (.spl) format.
- Added support for StarOffice Colors (SOC) format.
- Added support for sK1 Palette (.skp) format.
- Added support for Procreate v5 Swatches (.swatches) format.
- Added functions to validate palette formats.
- Added parameters validation in constructors.

## 2.0.3

- Upgraded dependencies
- Updated funding information

## 2.0.2

- Updated readme

## 2.0.1

- Ignore unknown block type when decoding ase format
- Upgraded `dart_mappable` to latest version

## 2.0.0

- **Breaking Change**: Reworked API to accept only bytes. The new API now uses `<PaletteClass>.fromBytes()` to decode
  and `palette.toBytes()` to encode.

## 1.1.2

- Fixed linter issues

## 1.1.1

- Fixed linter issues

## 1.1.0

- Targeting dart 3.2 and flutter 3.16
- Replaced `freezed` with `dart_mappable`

## 1.0.0

- First release
