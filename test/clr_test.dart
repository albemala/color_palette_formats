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

  test('truncated file throws FormatException and is not valid', () {
    final bytes = File('test/testdata/clr/tone-v4.clr').readAsBytesSync();
    for (final truncated in [
      bytes.sublist(0, 2),
      bytes.sublist(0, 10),
      bytes.sublist(0, 33),
      bytes.sublist(0, 50),
      bytes.sublist(0, 100),
      bytes.sublist(0, bytes.length - 5),
    ]) {
      expect(ClrPalette.isValidFormat(truncated), isFalse);
      expect(
        () => ClrPalette.fromBytes(truncated),
        throwsA(isA<FormatException>()),
      );
    }
  });

  test('corrupt file throws FormatException and is not valid', () {
    final bytes = File('test/testdata/clr/tone-v4.clr').readAsBytesSync();
    // tone-v4.clr layout: color0 version at 33, separator at 46,
    // color-section end at 61..63, grad0 type at 73, grad0
    // overflow attributes at 104, gradient-section end at 207.
    final cases = {
      'bad prefix': [0, 0],
      'bad section name': [6, 'X'.codeUnitAt(0)],
      'bad color version': [33, 9],
      'bad color separator': [46, 0],
      'bad color-section end': [63, 0],
      'bad gradient type': [73, 17],
      'bad overflow attributes': [104, 2],
      'bad gradient-section end': [bytes.length - 1, 1],
    };
    cases.forEach((reason, patch) {
      final corrupted = bytes.toList();
      corrupted[patch[0]] = patch[1];
      expect(ClrPalette.isValidFormat(corrupted), isFalse, reason: reason);
      expect(
        () => ClrPalette.fromBytes(corrupted),
        throwsA(isA<FormatException>()),
        reason: reason,
      );
    });
  });

  test('reads full gradient stop sequences', () {
    final v3 = ClrPalette.fromBytes(
      File('test/testdata/clr/tone-v3.clr').readAsBytesSync(),
    );
    expect(v3.gradients.length, equals(1));
    expect(v3.gradients.first.stops.length, equals(2));
    expect(v3.gradients.first.stops[1].offset, equals(255));
    expect(v3.gradients.first.stops[1].red, equals(0));

    final v4 = ClrPalette.fromBytes(
      File('test/testdata/clr/tone-v4.clr').readAsBytesSync(),
    );
    expect(v4.gradients[0].stops.length, equals(2));
    expect(v4.gradients[0].stops[1].offset, equals(255));
    expect(v4.gradients[0].stops[1].green, equals(170));
    expect(v4.gradients[1].stops.length, equals(7));
  });

  test('empty palette round-trips', () {
    final palette = ClrPalette(colors: [], gradients: []);
    final decoded = ClrPalette.fromBytes(palette.toBytes());
    expect(decoded.colors, isEmpty);
    expect(decoded.gradients, isEmpty);
  });

  test('encoder rejects out-of-range values', () {
    // Out-of-range values trip the constructor asserts in debug builds
    // and the encoder validation in release; accept either.
    final either = anyOf(isA<FormatException>(), isA<AssertionError>());

    ClrPaletteColor color({
      int version = 3,
      int red = 0,
      int green = 0,
      int blue = 0,
      int alpha = 255,
      int hue = 0,
      int saturation = 0,
      int brightness = 0,
    }) => ClrPaletteColor(
      version: version,
      red: red,
      green: green,
      blue: blue,
      alpha: alpha,
      hue: hue,
      saturation: saturation,
      brightness: brightness,
    );
    ClrGradient gradient({
      int version = 3,
      bool linearRgb = false,
      List<ClrGradientStop> stops = const [],
    }) => ClrGradient(
      version: version,
      baseRed: 0,
      baseGreen: 0,
      baseBlue: 0,
      baseAlpha: 255,
      type: ClrGradientType.linear,
      overflow: ClrGradientOverflow.extend,
      linearRgb: linearRgb,
      stops: stops,
    );

    expect(
      () => ClrPalette(colors: [color(version: 9)], gradients: []).toBytes(),
      throwsA(either),
    );
    expect(
      () => ClrPalette(colors: [color(red: 300)], gradients: []).toBytes(),
      throwsA(either),
    );
    expect(
      () => ClrPalette(colors: [color(hue: 70000)], gradients: []).toBytes(),
      throwsA(either),
    );
    expect(
      () => ClrPalette(colors: [], gradients: [gradient(version: 9)]).toBytes(),
      throwsA(either),
    );
    // linearRgb requires version 4.
    expect(
      () =>
          ClrPalette(
            colors: [],
            gradients: [gradient(linearRgb: true)],
          ).toBytes(),
      throwsA(either),
    );
    // Stop count does not fit the uint8 wire field.
    expect(
      () =>
          ClrPalette(
            colors: [],
            gradients: [
              gradient(
                version: 4,
                stops: List.generate(
                  256,
                  (i) => ClrGradientStop(
                    offset: i % 256,
                    red: 0,
                    green: 0,
                    blue: 0,
                    alpha: 255,
                  ),
                ),
              ),
            ],
          ).toBytes(),
      throwsA(isA<FormatException>()),
    );
    // Stop channels are validated too.
    expect(
      () =>
          ClrPalette(
            colors: [],
            gradients: [
              gradient(
                stops: [
                  ClrGradientStop(
                    offset: 300,
                    red: 0,
                    green: 0,
                    blue: 0,
                    alpha: 255,
                  ),
                ],
              ),
            ],
          ).toBytes(),
      throwsA(either),
    );
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
