import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/hpl/hpl1_v4.0.hpl': HomesitePalette(
      colors: [HomesitePaletteColor(red: 0, green: 0, blue: 0)],
    ),
    'test/testdata/hpl/hpl2_v4.0.hpl': HomesitePalette(
      colors: [HomesitePaletteColor(red: 0, green: 0, blue: 0)],
    ),
  };

  expectedData.forEach((filePath, expectedHpl) {
    group('HPL File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final hplFile = File(filePath);
        bytes = hplFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(HomesitePalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final hpl = HomesitePalette.fromBytes(bytes);

        // Compare colors
        expect(hpl.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (hpl.colors.isNotEmpty) {
          final firstColor = hpl.colors.first;
          final expectedFirstColor = expectedHpl.colors.first;

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

  test('isValidFormat returns false for invalid HPL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(HomesitePalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write hpl file', () {
    final hpl = HomesitePalette(
      colors: [
        HomesitePaletteColor(red: 255, green: 0, blue: 0),
        HomesitePaletteColor(red: 0, green: 255, blue: 255),
        HomesitePaletteColor(red: 128, green: 128, blue: 128),
      ],
    );

    // write to temp file
    final hplFile = File('./test/test.hpl');
    hplFile.writeAsBytesSync(hpl.toBytes());

    final decodedHpl = HomesitePalette.fromBytes(hplFile.readAsBytesSync());

    expect(decodedHpl.colors.length, equals(3));

    expect(decodedHpl.colors[0].red, equals(255));
    expect(decodedHpl.colors[0].green, equals(0));
    expect(decodedHpl.colors[0].blue, equals(0));

    expect(decodedHpl.colors[1].red, equals(0));
    expect(decodedHpl.colors[1].green, equals(255));
    expect(decodedHpl.colors[1].blue, equals(255));

    expect(decodedHpl.colors[2].red, equals(128));
    expect(decodedHpl.colors[2].green, equals(128));
    expect(decodedHpl.colors[2].blue, equals(128));

    // delete temp file
    hplFile.deleteSync();
  });

  test('rejects truncated and malformed input with FormatException', () {
    String fileWith(String body) => 'Palette\nVersion 4.0\n\n$body';

    // Truncated: header without a version line must throw FormatException,
    // never RangeError.
    for (final truncated in ['Palette', '']) {
      expect(
        () => HomesitePalette.fromBytes(truncated.codeUnits),
        throwsA(isA<FormatException>()),
        reason: 'truncated "$truncated"',
      );
      expect(
        HomesitePalette.isValidFormat(truncated.codeUnits),
        isFalse,
        reason: 'truncated "$truncated"',
      );
    }

    // Wrong value counts throw FormatException, never RangeError.
    for (final body in ['1 2\n', '1 2 3 4\n', '1\n', '\n']) {
      // A body of just '\n' is only blank lines: valid empty palette.
      if (body.trim().isEmpty) {
        expect(
          HomesitePalette.fromBytes(fileWith(body).codeUnits).colors,
          isEmpty,
        );
        continue;
      }
      expect(
        () => HomesitePalette.fromBytes(fileWith(body).codeUnits),
        throwsA(isA<FormatException>()),
        reason: 'body "$body"',
      );
      expect(
        HomesitePalette.isValidFormat(fileWith(body).codeUnits),
        isFalse,
        reason: 'body "$body"',
      );
    }

    // Out-of-range channels throw FormatException.
    for (final bad in ['256', '1000', '-1', '-5']) {
      for (final channel in [0, 1, 2]) {
        final channels = ['10', '20', '30'];
        channels[channel] = bad;
        final bytes = fileWith('${channels.join(' ')}\n').codeUnits;
        expect(
          () => HomesitePalette.fromBytes(bytes),
          throwsA(isA<FormatException>()),
          reason: 'channel $channel = $bad',
        );
      }
    }

    // Non-numeric channels and overflow throw FormatException.
    for (final body in ['abc def ghi\n', '99999999999999999999 0 0\n']) {
      expect(
        () => HomesitePalette.fromBytes(fileWith(body).codeUnits),
        throwsA(isA<FormatException>()),
        reason: 'body "$body"',
      );
    }
  });

  test('tolerates separators and blank lines', () {
    String fileWith(String body) => 'Palette\nVersion 4.0\n\n$body';

    // Multi-space, tab, and leading/trailing whitespace decode identically.
    for (final body in ['56  37   9\n', '56\t37\t9\n', '  56 37 9  \n']) {
      final palette = HomesitePalette.fromBytes(fileWith(body).codeUnits);
      expect(palette.colors.length, equals(1), reason: 'body "$body"');
      expect(palette.colors.first.red, equals(56));
      expect(palette.colors.first.green, equals(37));
      expect(palette.colors.first.blue, equals(9));
    }

    // Whitespace-only lines are skipped like empty lines.
    final withBlanks = HomesitePalette.fromBytes(
      fileWith('1 2 3\n   \n\n4 5 6\n').codeUnits,
    );
    expect(withBlanks.colors.length, equals(2));
  });

  test('decodes lone-CR line endings', () {
    final bytes = File('test/testdata/hpl/hpl1_v4.0.hpl').readAsBytesSync();
    final crBytes = ascii.decode(bytes).replaceAll('\n', '\r').codeUnits;
    final palette = HomesitePalette.fromBytes(crBytes);
    expect(palette.colors.length, equals(287));
    expect(palette.colors.first.red, equals(0));
    expect(palette.colors[1].red, equals(255));
  });

  test('encoder rejects out-of-range channels', () {
    // Constructor asserts fire in debug builds before the encoder's
    // FormatException guards (release safety nets) are reached.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());
    for (final bad in [256, -1]) {
      expect(
        () =>
            HomesitePalette(
              colors: [HomesitePaletteColor(red: bad, green: 0, blue: 0)],
            ).toBytes(),
        throwsA(either),
        reason: 'red = $bad',
      );
    }
  });

  test('decode-encode-decode is stable on all fixtures', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final once = HomesitePalette.fromBytes(bytes);
      final twice = HomesitePalette.fromBytes(once.toBytes());
      expect(twice.colors.length, equals(once.colors.length), reason: filePath);
      for (var i = 0; i < once.colors.length; i++) {
        expect(twice.colors[i].red, equals(once.colors[i].red));
        expect(twice.colors[i].green, equals(once.colors[i].green));
        expect(twice.colors[i].blue, equals(once.colors[i].blue));
      }
    }
  });
}
