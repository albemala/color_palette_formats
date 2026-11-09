# Adding a new format

## 1. Create the codec folder

Add `lib/src/<name>/` with 4 files (see `lib/src/gimp/`, `lib/src/aco/`, `lib/src/sk1/`):

- `<name>.dart` — models only: `@MappableClass()` / `@MappableEnum()` classes, range asserts, `fromBytes` / `toBytes` / `isValidFormat` (try `_decode`, catch → `false`), plus a header comment with format name, extensions, apps, and `References:` links.
- `decode.dart` — `part of '<name>.dart';` with private `_decode(bytes)`.
- `encode.dart` — `part of '<name>.dart';` with private `_encode(model)`.
- `<name>.mapper.dart` — generated, never hand-edited.

Pick helpers by kind: binary → `package:buffer`; text → `src/text_parse_utils.dart`; XML → `src/xml_decode_utils.dart` / `src/xml_encode_utils.dart` + `package:xml`. If import or export is impossible, omit that direction (mark ❌ in docs, e.g. Procreate v1 has no `fromBytes` — use a top-level decode function instead).

## Code style rules

See `docs/code-guidelines.md` and mimic the closest existing codec.

## 2. Generate code

Run `scripts/generate-code.bash` (`build_runner` + `dart_mappable_builder`, then `dart format`).

## 3. Export it

Add one line (alphabetical) to `lib/color_palette_formats.dart`:

```dart
export 'src/<name>/<name>.dart';
```

## 4. Test it

- Add 1+ real sample files to `test/testdata/<name>/`.
- Add `test/<name>_test.dart` following `test/gimp_test.dart`: expected first color per sample file, `isValidFormat` true/false tests, and a round-trip write → read → expect test (delete temp file after).

## 5. Document it

- `example/example.dart` — append a `fromBytes` usage block.
- `example/decoding.dart` — append a `processPaletteFiles` block.
- `docs/supported-formats.md` — add table row (Format | Extension | Class | Import | Export | Color Spaces) + footnote if non-standard.
- `README.md` — add bullet to the supported-formats list.
