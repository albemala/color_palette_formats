import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/scribus/Scribus.xml': ScribusPalette(
      name: 'tango',
      colors: [
        ScribusColor(
          name: ' Aluminum 1',
          rgb: '#eeeeec',
          spot: '0',
          register: '0',
        ),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedPalette) {
    group('Scribus Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final scribusFile = File(filePath);
        bytes = scribusFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ScribusPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final palette = ScribusPalette.fromBytes(bytes);

        // Verify palette name
        expect(
          palette.name,
          equals(expectedPalette.name),
          reason: 'Palette name mismatch',
        );

        // Compare colors
        expect(palette.colors.length, equals(66));

        final firstColor = palette.colors.first;
        final expectedFirstColor = expectedPalette.colors.first;

        expect(
          firstColor.name,
          equals(expectedFirstColor.name),
          reason: 'Name mismatch for the first color',
        );
        expect(
          firstColor.rgb,
          equals(expectedFirstColor.rgb),
          reason: 'RGB value mismatch for the first color',
        );
        expect(
          firstColor.spot,
          equals(expectedFirstColor.spot),
          reason: 'Spot value mismatch for the first color',
        );
        expect(
          firstColor.register,
          equals(expectedFirstColor.register),
          reason: 'Register value mismatch for the first color',
        );
      });
    });
  });

  test('isValidFormat returns false for invalid Scribus Palette file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(ScribusPalette.isValidFormat(invalidBytes), isFalse);
  });

  group('validation', () {
    late String validXml;

    setUpAll(() {
      validXml = File('test/testdata/scribus/Scribus.xml').readAsStringSync();
    });

    List<int> mutate(String from, String to) =>
        utf8.encode(validXml.replaceFirst(from, to));

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => ScribusPalette.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(ScribusPalette.isValidFormat(bytes), isFalse, reason: label);
    }

    test('rejects malformed RGB values', () {
      final cases = <String, List<int>>{
        'no hash': mutate('RGB="#eeeeec"', 'RGB="eeeeec"'),
        'short hex': mutate('RGB="#eeeeec"', 'RGB="#eee"'),
        'long hex': mutate('RGB="#eeeeec"', 'RGB="#eeeeecff"'),
        'non-hex': mutate('RGB="#eeeeec"', 'RGB="#zzzzzz"'),
        'named color': mutate('RGB="#eeeeec"', 'RGB="red"'),
        'empty': mutate('RGB="#eeeeec"', 'RGB=""'),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, entry.value);
      }
    });

    test('rejects invalid Spot and Register flags', () {
      final cases = <String, List<int>>{
        'spot 2': mutate('Spot="0"', 'Spot="2"'),
        'spot yes': mutate('Spot="0"', 'Spot="yes"'),
        'spot empty': mutate('Spot="0"', 'Spot=""'),
        'register 2': mutate('Register="0"', 'Register="2"'),
        'register true': mutate('Register="0"', 'Register="true"'),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, entry.value);
      }
    });

    test('accepts uppercase hex and defaults missing flags to 0', () {
      final upper = mutate('RGB="#eeeeec"', 'RGB="#EEEEEC"');
      final palette = ScribusPalette.fromBytes(upper);
      expect(palette.colors.first.rgb, equals('#EEEEEC'));
      expect(ScribusPalette.isValidFormat(upper), isTrue);

      final noSpot = utf8.encode(validXml.replaceFirst(' Spot="0"', ''));
      final fallback = ScribusPalette.fromBytes(noSpot);
      expect(fallback.colors.first.spot, equals('0'));
    });

    test('accepts empty palettes', () {
      final empty = utf8.encode('<SCRIBUSCOLORS Name="x"/>');
      final palette = ScribusPalette.fromBytes(empty);
      expect(palette.colors, isEmpty);
      expect(ScribusPalette.isValidFormat(empty), isTrue);
    });

    test('encoder rejects invalid values', () {
      final cases = <String, ScribusColor Function()>{
        'bad rgb':
            () => ScribusColor(name: 'x', rgb: 'red', spot: '0', register: '0'),
        'short rgb':
            () =>
                ScribusColor(name: 'x', rgb: '#fff', spot: '0', register: '0'),
        'bad spot':
            () => ScribusColor(
              name: 'x',
              rgb: '#ff0000',
              spot: '2',
              register: '0',
            ),
        'bad register':
            () => ScribusColor(
              name: 'x',
              rgb: '#ff0000',
              spot: '0',
              register: 'yes',
            ),
      };
      for (final entry in cases.entries) {
        expect(
          () => ScribusPalette(name: 'x', colors: [entry.value()]).toBytes(),
          throwsA(isA<FormatException>()),
          reason: entry.key,
        );
      }
    });
  });

  test('write scribus file', () {
    final palette = ScribusPalette(
      name: 'Test Scribus Palette',
      colors: [
        ScribusColor(
          name: 'Test Red',
          rgb: '#FF0000',
          spot: '1', // Example non-default value
          register: '0',
        ),
        ScribusColor(
          name: 'Test Green',
          rgb: '#00FF00',
          spot: ScribusColor.defaultSpot,
          register: ScribusColor.defaultRegister,
        ),
        ScribusColor(
          name: 'Test Blue',
          rgb: '#0000FF',
          spot: '0',
          register: '1', // Example non-default value
        ),
      ],
    );

    // Round-trip in memory (no temp file written into the repo).
    final decodedPalette = ScribusPalette.fromBytes(palette.toBytes());

    // Verify palette name
    expect(decodedPalette.name, equals(palette.name));

    // Verify number of colors
    expect(decodedPalette.colors.length, equals(palette.colors.length));

    // Verify first color details
    expect(decodedPalette.colors[0].name, equals(palette.colors[0].name));
    expect(decodedPalette.colors[0].rgb, equals(palette.colors[0].rgb));
    expect(decodedPalette.colors[0].spot, equals(palette.colors[0].spot));
    expect(
      decodedPalette.colors[0].register,
      equals(palette.colors[0].register),
    );

    // Verify second color details (including defaults)
    expect(decodedPalette.colors[1].name, equals(palette.colors[1].name));
    expect(decodedPalette.colors[1].rgb, equals(palette.colors[1].rgb));
    expect(decodedPalette.colors[1].spot, equals('0')); // Check default
    expect(decodedPalette.colors[1].register, equals('0')); // Check default

    // Verify third color details
    expect(decodedPalette.colors[2].name, equals(palette.colors[2].name));
    expect(decodedPalette.colors[2].rgb, equals(palette.colors[2].rgb));
    expect(decodedPalette.colors[2].spot, equals(palette.colors[2].spot));
    expect(
      decodedPalette.colors[2].register,
      equals(palette.colors[2].register),
    );
  });
}
