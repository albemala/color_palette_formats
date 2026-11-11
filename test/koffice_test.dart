import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/koffice/KDE40.colors': KOfficePalette(
      colors: [KOfficePaletteColor(r: 0, g: 0, b: 0, name: 'Black')],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('KOffice Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final kofficeFile = File(filePath);
        bytes = kofficeFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(KOfficePalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final kofficePalette = KOfficePalette.fromBytes(bytes);

        // Compare colors
        expect(
          kofficePalette.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (kofficePalette.colors.isNotEmpty) {
          final firstColor = kofficePalette.colors.first;
          final expectedFirstColor = expectedPalette.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.r,
            equals(expectedFirstColor.r),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.g,
            equals(expectedFirstColor.g),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.b,
            equals(expectedFirstColor.b),
            reason: 'Blue value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid KOfficePalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(KOfficePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write koffice file', () {
    final kofficePalette = KOfficePalette(
      colors: [
        KOfficePaletteColor(r: 255, g: 0, b: 0, name: 'Red'),
        KOfficePaletteColor(r: 0, g: 255, b: 0, name: 'Green'),
        KOfficePaletteColor(r: 0, g: 0, b: 255, name: 'Blue'),
        KOfficePaletteColor(r: 128, g: 128, b: 128, name: 'Gray'),
      ],
    );
    // write to temp file
    final tempFile = File('./test/test.colors');
    tempFile.writeAsBytesSync(kofficePalette.toBytes());

    final decodedPalette = KOfficePalette.fromBytes(tempFile.readAsBytesSync());

    expect(decodedPalette.colors.length, equals(4));

    expect(decodedPalette.colors[0].r, equals(255));
    expect(decodedPalette.colors[0].g, equals(0));
    expect(decodedPalette.colors[0].b, equals(0));
    expect(decodedPalette.colors[0].name, equals('Red'));

    expect(decodedPalette.colors[1].r, equals(0));
    expect(decodedPalette.colors[1].g, equals(255));
    expect(decodedPalette.colors[1].b, equals(0));
    expect(decodedPalette.colors[1].name, equals('Green'));

    expect(decodedPalette.colors[2].r, equals(0));
    expect(decodedPalette.colors[2].g, equals(0));
    expect(decodedPalette.colors[2].b, equals(255));
    expect(decodedPalette.colors[2].name, equals('Blue'));

    expect(decodedPalette.colors[3].r, equals(128));
    expect(decodedPalette.colors[3].g, equals(128));
    expect(decodedPalette.colors[3].b, equals(128));
    expect(decodedPalette.colors[3].name, equals('Gray'));

    // delete temp file
    tempFile.deleteSync();
  });

  test('rejects malformed channel values', () {
    String fileWith(String line) => 'KDE RGB Palette\n$line\n';

    // Overflow, out-of-range, and negative channels throw.
    for (final bad in ['99999999999999999999', '256', '1000']) {
      for (final channel in [0, 1, 2]) {
        final channels = ['10', '20', '30'];
        channels[channel] = bad;
        final bytes = fileWith('${channels.join(' ')}\tX').codeUnits;
        expect(
          () => KOfficePalette.fromBytes(bytes),
          throwsA(isA<FormatException>()),
          reason: 'channel $channel = $bad',
        );
        expect(
          KOfficePalette.isValidFormat(bytes),
          isFalse,
          reason: 'channel $channel = $bad',
        );
      }
    }
    expect(
      () => KOfficePalette.fromBytes(fileWith('-5 0 0\tX').codeUnits),
      throwsA(isA<FormatException>()),
    );
    expect(
      KOfficePalette.isValidFormat(fileWith('-5 0 0\tX').codeUnits),
      isFalse,
    );
    // A line with leading non-number text is skipped, not a color.
    final infoOnly = KOfficePalette.fromBytes(
      fileWith('abc 1 2 3 hi').codeUnits,
    );
    expect(infoOnly.colors, isEmpty);
  });

  test('accepts nameless and whitespace-separated color lines', () {
    String fileWith(String line) => 'KDE RGB Palette\n$line\n';

    // Bare channels decode with an empty name.
    final nameless = KOfficePalette.fromBytes(fileWith('1 2 3').codeUnits);
    expect(nameless.colors.length, equals(1));
    expect(nameless.colors.first.r, equals(1));
    expect(nameless.colors.first.name, isEmpty);

    // Multi-space, tab, and padded lines decode identically.
    for (final line in ['56  37   9\tX', '  56 37 9  X  ']) {
      final palette = KOfficePalette.fromBytes(fileWith(line).codeUnits);
      expect(palette.colors.length, equals(1), reason: 'line "$line"');
      expect(palette.colors.first.r, equals(56));
      expect(palette.colors.first.g, equals(37));
      expect(palette.colors.first.b, equals(9));
      expect(palette.colors.first.name, equals('X'));
    }
  });

  test('decodes lone-CR line endings', () {
    final bytes = File('test/testdata/koffice/KDE40.colors').readAsBytesSync();
    final crBytes = ascii.decode(bytes).replaceAll('\n', '\r').codeUnits;
    final palette = KOfficePalette.fromBytes(crBytes);
    expect(palette.colors.length, equals(40));
    expect(palette.colors.first.name, equals('Black'));
    expect(palette.colors.last.name, equals('Very light orange'));
  });

  test('encoder rejects invalid palettes', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    KOfficePalette paletteWith({List<KOfficePaletteColor>? colors}) =>
        KOfficePalette(
          colors: colors ?? [KOfficePaletteColor(r: 1, g: 2, b: 3, name: 'X')],
        );

    expect(
      () =>
          paletteWith(
            colors: [KOfficePaletteColor(r: 256, g: 0, b: 0, name: 'X')],
          ).toBytes(),
      throwsA(either),
    );
    expect(
      () =>
          paletteWith(
            colors: [KOfficePaletteColor(r: 0, g: 0, b: 0, name: 'a\nb')],
          ).toBytes(),
      throwsA(either),
    );
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final once = KOfficePalette.fromBytes(bytes);
      final twice = KOfficePalette.fromBytes(once.toBytes());
      expect(twice.colors.length, equals(once.colors.length), reason: filePath);
      for (var i = 0; i < once.colors.length; i++) {
        expect(twice.colors[i].name, equals(once.colors[i].name));
        expect(twice.colors[i].r, equals(once.colors[i].r));
        expect(twice.colors[i].g, equals(once.colors[i].g));
        expect(twice.colors[i].b, equals(once.colors[i].b));
      }
    }
  });
}
