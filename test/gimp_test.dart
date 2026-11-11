import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/gimp/gpl1.gimp': GimpPalette(
      colors: [
        GimpPaletteColor(
          red: 255,
          green: 255,
          blue: 255,
          name: 'RGB = 255 255 255, Hex = FFFFFF',
        ),
      ],
    ),
    'test/testdata/gimp/gpl2.gpl': GimpPalette(
      colors: [
        GimpPaletteColor(red: 56, green: 37, blue: 9, name: 'wood brown6'),
      ],
    ),
    'test/testdata/gimp/cromatica.gpl': GimpPalette(
      colors: [
        GimpPaletteColor(red: 251, green: 248, blue: 253, name: 'fbf8fd'),
      ],
    ),
    'test/testdata/gimp/shido-10.gpl': GimpPalette(
      colors: [GimpPaletteColor(red: 0, green: 0, blue: 0, name: '000000')],
    ),
    'test/testdata/gimp/sunfall.gpl': GimpPalette(
      colors: [GimpPaletteColor(red: 0, green: 8, blue: 9, name: '000809')],
    ),
  };

  expectedData.forEach((filePath, expectedGimp) {
    group('GIMP Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final gimpFile = File(filePath);
        bytes = gimpFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(GimpPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final gimp = GimpPalette.fromBytes(bytes);

        // Compare colors
        expect(gimp.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (gimp.colors.isNotEmpty) {
          final firstColor = gimp.colors.first;
          final expectedFirstColor = expectedGimp.colors.first;

          expect(
            firstColor.name,
            equals(expectedFirstColor.name),
            reason: 'Name mismatch for the first color',
          );
          expect(
            firstColor.red,
            equals(expectedFirstColor.red),
            reason: 'Red value mismatch for the first color',
          );
          expect(
            firstColor.green,
            equals(expectedFirstColor.green),
            reason: 'Green value mismatch for the first color',
          );
          expect(
            firstColor.blue,
            equals(expectedFirstColor.blue),
            reason: 'Blue value mismatch for the first color',
          );
        }
      });
    });
  });

  test('isValidFormat returns false for invalid GimpPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(GimpPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write gimp file', () {
    final gimp = GimpPalette(
      info: ['Name: Test Gimp Palette'],
      comments: ['Comment: Test comment'],
      colors: [
        GimpPaletteColor(name: 'red', red: 255, green: 0, blue: 0),
        GimpPaletteColor(name: '', red: 0, green: 255, blue: 255),
        GimpPaletteColor(name: 'gray', red: 128, green: 128, blue: 128),
      ],
    );
    // write to temp file
    final gimpFile = File('./test/test.gpl');
    gimpFile.writeAsBytesSync(gimp.toBytes());

    final decodedGimp = GimpPalette.fromBytes(gimpFile.readAsBytesSync());

    expect(decodedGimp.info.first, equals('Name: Test Gimp Palette'));
    expect(decodedGimp.comments, equals(['Comment: Test comment']));
    expect(decodedGimp.colors.length, equals(3));

    expect(decodedGimp.colors[0].name, equals('red'));
    expect(decodedGimp.colors[0].red, equals(255));
    expect(decodedGimp.colors[0].green, equals(0));
    expect(decodedGimp.colors[0].blue, equals(0));

    expect(decodedGimp.colors[1].name, equals(''));
    expect(decodedGimp.colors[1].red, equals(0));
    expect(decodedGimp.colors[1].green, equals(255));
    expect(decodedGimp.colors[1].blue, equals(255));

    expect(decodedGimp.colors[2].name, equals('gray'));
    expect(decodedGimp.colors[2].red, equals(128));
    expect(decodedGimp.colors[2].green, equals(128));
    expect(decodedGimp.colors[2].blue, equals(128));

    // delete temp file
    gimpFile.deleteSync();
  });

  test('rejects malformed channel values', () {
    String fileWith(String line) => 'GIMP Palette\n$line\n';

    // Overflow, out-of-range, and negative channels throw.
    for (final bad in ['99999999999999999999', '256', '1000']) {
      for (final channel in [0, 1, 2]) {
        final channels = ['10', '20', '30'];
        channels[channel] = bad;
        final bytes = fileWith('${channels.join(' ')} x').codeUnits;
        expect(
          () => GimpPalette.fromBytes(bytes),
          throwsA(isA<FormatException>()),
          reason: 'channel $channel = $bad',
        );
      }
    }
    expect(
      () => GimpPalette.fromBytes(fileWith('-5 0 0 x').codeUnits),
      throwsA(isA<FormatException>()),
    );
    // A line with leading non-number text is info, not a color.
    final infoOnly = GimpPalette.fromBytes(fileWith('abc 1 2 3 hi').codeUnits);
    expect(infoOnly.colors, isEmpty);
    expect(infoOnly.info, equals(['abc 1 2 3 hi']));
  });

  test('decodes lone-CR line endings', () {
    final bytes = File('test/testdata/gimp/cromatica.gpl').readAsBytesSync();
    final crBytes = ascii.decode(bytes).replaceAll('\n', '\r').codeUnits;
    final palette = GimpPalette.fromBytes(crBytes);
    expect(palette.colors.length, equals(10));
    expect(palette.colors.first.name, equals('fbf8fd'));
    expect(palette.comments.first, equals('Palette Name: CROMATICA'));
  });

  test('encoder rejects invalid palettes', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    GimpPalette paletteWith({
      List<String> info = const [],
      List<String> comments = const [],
      List<GimpPaletteColor>? colors,
    }) => GimpPalette(
      info: info,
      comments: comments,
      colors:
          colors ?? [GimpPaletteColor(name: 'x', red: 1, green: 2, blue: 3)],
    );

    expect(
      () =>
          paletteWith(
            colors: [GimpPaletteColor(name: 'x', red: 256, green: 0, blue: 0)],
          ).toBytes(),
      throwsA(either),
    );
    expect(
      () =>
          paletteWith(
            colors: [GimpPaletteColor(name: 'a\nb', red: 0, green: 0, blue: 0)],
          ).toBytes(),
      throwsA(either),
    );
    expect(
      () => paletteWith(info: ['a\nb']).toBytes(),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => paletteWith(comments: ['a\rb']).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final once = GimpPalette.fromBytes(bytes);
      final twice = GimpPalette.fromBytes(once.toBytes());
      expect(twice.info, equals(once.info), reason: filePath);
      expect(twice.comments, equals(once.comments), reason: filePath);
      expect(twice.colors.length, equals(once.colors.length), reason: filePath);
      for (var i = 0; i < once.colors.length; i++) {
        expect(twice.colors[i].name, equals(once.colors[i].name));
        expect(twice.colors[i].red, equals(once.colors[i].red));
        expect(twice.colors[i].green, equals(once.colors[i].green));
        expect(twice.colors[i].blue, equals(once.colors[i].blue));
      }
    }
  });
}
