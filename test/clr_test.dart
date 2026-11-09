import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/clr/tone-v3.clr': ClrPalette(
      colors: [
        ClrPaletteColor(
          version: 3,
          red: 0,
          green: 0,
          blue: 0,
          alpha: 255,
          hue: 0,
          saturation: 0,
          brightness: 0,
        ),
      ],
      gradients: [
        ClrGradient(
          version: 3,
          baseRed: 0,
          baseGreen: 0,
          baseBlue: 0,
          baseAlpha: 255,
          type: ClrGradientType.linear,
          overflow: ClrGradientOverflow.extend,
          linearRgb: false,
          stops: [
            ClrGradientStop(
              offset: 0,
              red: 255,
              green: 255,
              blue: 255,
              alpha: 255,
            ),
          ],
        ),
      ],
    ),
    'test/testdata/clr/tone-v4.clr': ClrPalette(
      colors: [
        ClrPaletteColor(
          version: 4,
          red: 51,
          green: 255,
          blue: 0,
          alpha: 255,
          hue: 80,
          saturation: 240,
          brightness: 120,
        ),
      ],
      gradients: [
        ClrGradient(
          version: 4,
          baseRed: 173,
          baseGreen: 208,
          baseBlue: 30,
          baseAlpha: 255,
          type: ClrGradientType.radial,
          overflow: ClrGradientOverflow.reflect,
          linearRgb: true,
          stops: [
            ClrGradientStop(
              offset: 0,
              red: 173,
              green: 208,
              blue: 30,
              alpha: 255,
            ),
          ],
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/clr/tone-v3.clr': (3, 1),
    'test/testdata/clr/tone-v4.clr': (2, 2),
  };

  expectedData.forEach((filePath, expectedClr) {
    group('CLR Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final clrFile = File(filePath);
        bytes = clrFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ClrPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final clr = ClrPalette.fromBytes(bytes);
        final (colorCount, gradientCount) = expectedCounts[filePath]!;

        expect(clr.colors.length, equals(colorCount));
        expect(clr.gradients.length, equals(gradientCount));

        expect(clr.colors.isNotEmpty, isTrue, reason: 'No colors');

        final firstColor = clr.colors.first;
        final expectedFirstColor = expectedClr.colors.first;
        expect(firstColor.version, equals(expectedFirstColor.version));
        expect(firstColor.red, equals(expectedFirstColor.red));
        expect(firstColor.green, equals(expectedFirstColor.green));
        expect(firstColor.blue, equals(expectedFirstColor.blue));
        expect(firstColor.alpha, equals(expectedFirstColor.alpha));
        expect(firstColor.hue, equals(expectedFirstColor.hue));
        expect(firstColor.saturation, equals(expectedFirstColor.saturation));
        expect(firstColor.brightness, equals(expectedFirstColor.brightness));

        expect(clr.gradients.isNotEmpty, isTrue, reason: 'No gradients');

        final firstGradient = clr.gradients.first;
        final expectedFirstGradient = expectedClr.gradients.first;
        expect(firstGradient.version, equals(expectedFirstGradient.version));
        expect(firstGradient.baseRed, equals(expectedFirstGradient.baseRed));
        expect(
          firstGradient.baseGreen,
          equals(expectedFirstGradient.baseGreen),
        );
        expect(firstGradient.baseBlue, equals(expectedFirstGradient.baseBlue));
        expect(
          firstGradient.baseAlpha,
          equals(expectedFirstGradient.baseAlpha),
        );
        expect(firstGradient.type, equals(expectedFirstGradient.type));
        expect(firstGradient.overflow, equals(expectedFirstGradient.overflow));
        expect(
          firstGradient.linearRgb,
          equals(expectedFirstGradient.linearRgb),
        );

        final firstStop = firstGradient.stops.first;
        final expectedFirstStop = expectedFirstGradient.stops.first;
        expect(firstStop.offset, equals(expectedFirstStop.offset));
        expect(firstStop.red, equals(expectedFirstStop.red));
        expect(firstStop.green, equals(expectedFirstStop.green));
        expect(firstStop.blue, equals(expectedFirstStop.blue));
        expect(firstStop.alpha, equals(expectedFirstStop.alpha));
      });
    });
  });

  test('keeps raw values without normalizing', () {
    final clr = ClrPalette.fromBytes(
      File('test/testdata/clr/tone-v3.clr').readAsBytesSync(),
    );

    expect(clr.colors[1].red, equals(255));
    expect(clr.colors[1].saturation, equals(240));
    expect(clr.colors[2].alpha, equals(128));
    expect(clr.gradients.first.stops.last.offset, equals(255));
  });

  test('reads version 4 attributes and transparency', () {
    final clr = ClrPalette.fromBytes(
      File('test/testdata/clr/tone-v4.clr').readAsBytesSync(),
    );

    final radial = clr.gradients[0];
    expect(radial.type, equals(ClrGradientType.radial));
    expect(radial.overflow, equals(ClrGradientOverflow.reflect));
    expect(radial.linearRgb, isTrue);

    final linear = clr.gradients[1];
    expect(linear.type, equals(ClrGradientType.linear));
    expect(linear.overflow, equals(ClrGradientOverflow.repeat));
    expect(linear.linearRgb, isFalse);
    expect(linear.stops.length, equals(7));
    expect(linear.stops[2].alpha, equals(128));
  });

  test('isValidFormat returns false for invalid ClrPalette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(ClrPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('isValidFormat distinguishes CLR from BCF', () {
    final bcfBytes = File('test/testdata/bcf/dic-v10.bcf').readAsBytesSync();
    expect(ClrPalette.isValidFormat(bcfBytes), isFalse);
    expect(BcfPalette.isValidFormat(bcfBytes), isTrue);

    final clrBytes = File('test/testdata/clr/tone-v3.clr').readAsBytesSync();
    expect(BcfPalette.isValidFormat(clrBytes), isFalse);
    expect(ClrPalette.isValidFormat(clrBytes), isTrue);
  });

  test('write clr file', () {
    final clr = ClrPalette(
      colors: [
        ClrPaletteColor(
          version: 3,
          red: 255,
          green: 0,
          blue: 0,
          alpha: 255,
          hue: 0,
          saturation: 240,
          brightness: 120,
        ),
        ClrPaletteColor(
          version: 3,
          red: 0,
          green: 0,
          blue: 255,
          alpha: 255,
          hue: 160,
          saturation: 240,
          brightness: 120,
        ),
      ],
      gradients: [],
    );

    // write to temp file
    final clrFile = File('./test/test.clr');
    clrFile.writeAsBytesSync(clr.toBytes());

    final decodedClr = ClrPalette.fromBytes(clrFile.readAsBytesSync());

    expect(decodedClr.colors.length, equals(2));
    expect(decodedClr.gradients, isEmpty);

    expect(decodedClr.colors[0].red, equals(255));
    expect(decodedClr.colors[0].saturation, equals(240));

    expect(decodedClr.colors[1].blue, equals(255));
    expect(decodedClr.colors[1].hue, equals(160));

    // delete temp file
    clrFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = ClrPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
