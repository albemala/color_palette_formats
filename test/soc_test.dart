import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/soc/cmyk.soc': (
      216,
      StarOfficeColor(name: '0 0 0', color: '#ffffff'),
    ),
    'test/testdata/soc/gallery.soc': (
      61,
      StarOfficeColor(name: '0-0-0-0', color: '#ffffff'),
    ),
    'test/testdata/soc/html.soc': (
      131,
      StarOfficeColor(name: 'white FFFFFF 255.255.255', color: '#ffffff'),
    ),
    'test/testdata/soc/DMC 1-7.soc': (
      447,
      StarOfficeColor(name: 'Ecru', color: '#EDDEC4'),
    ),
  };

  expectedData.forEach((filePath, expected) {
    group('StarOffice Color Table File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final socFile = File(filePath);
        bytes = socFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(StarOfficeColorTable.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final socTable = StarOfficeColorTable.fromBytes(bytes);

        expect(socTable.colors.length, equals(expected.$1));

        final firstColor = socTable.colors.first;
        final expectedFirstColor = expected.$2;

        expect(
          firstColor.name,
          equals(expectedFirstColor.name),
          reason: 'Name mismatch for the first color',
        );
        expect(
          firstColor.color,
          equals(expectedFirstColor.color),
          reason: 'Color value mismatch for the first color',
        );
      });

      test('decode-encode-decode is stable', () {
        final table = StarOfficeColorTable.fromBytes(bytes);
        final decodedAgain = StarOfficeColorTable.fromBytes(table.toBytes());
        expect(decodedAgain.colors.length, equals(table.colors.length));
        expect(decodedAgain.colors.first.name, equals(table.colors.first.name));
        expect(
          decodedAgain.colors.first.color,
          equals(table.colors.first.color),
        );
      });
    });
  });

  test('isValidFormat returns false for invalid SOC file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(StarOfficeColorTable.isValidFormat(invalidBytes), isFalse);
  });

  group('validation', () {
    late String galleryXml;

    setUpAll(() {
      galleryXml = File('test/testdata/soc/gallery.soc').readAsStringSync();
    });

    List<int> mutate(String from, String to) =>
        utf8.encode(galleryXml.replaceFirst(from, to));

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => StarOfficeColorTable.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(StarOfficeColorTable.isValidFormat(bytes), isFalse, reason: label);
    }

    test('rejects malformed hex colors', () {
      final cases = <String, List<int>>{
        'non-hex digits': mutate(
          'draw:color="#ffffff"',
          'draw:color="#zzzzzz"',
        ),
        'short hex': mutate('draw:color="#ffffff"', 'draw:color="#fff"'),
        'long hex': mutate('draw:color="#ffffff"', 'draw:color="#ffffffff"'),
        'nine-char alpha': mutate(
          'draw:color="#ffffff"',
          'draw:color="#ff0000ff"',
        ),
        'named color': mutate('draw:color="#ffffff"', 'draw:color="red"'),
        'empty': mutate('draw:color="#ffffff"', 'draw:color=""'),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, entry.value);
      }
    });

    test('rejects missing attributes', () {
      expectRejected('missing color', mutate(' draw:color="#ffffff"', ''));
      expectRejected('missing name', mutate('draw:name="0-0-0-0" ', ''));
    });

    test('accepts uppercase hex', () {
      final bytes = mutate('draw:color="#ffffff"', 'draw:color="#FFFFFF"');
      final table = StarOfficeColorTable.fromBytes(bytes);
      expect(table.colors.first.color, equals('#FFFFFF'));
      expect(StarOfficeColorTable.isValidFormat(bytes), isTrue);
    });

    test('accepts empty tables and tolerates trailing text', () {
      final empty = utf8.encode(
        galleryXml.replaceAll(RegExp('<draw:color[^/]*/>'), ''),
      );
      final table = StarOfficeColorTable.fromBytes(empty);
      expect(table.colors, isEmpty);
      expect(StarOfficeColorTable.isValidFormat(empty), isTrue);

      // The XML parser ignores text after the document element.
      final trailing = utf8.encode('$galleryXml TRAILING');
      final trailed = StarOfficeColorTable.fromBytes(trailing);
      expect(trailed.colors.length, equals(61));
      expect(StarOfficeColorTable.isValidFormat(trailing), isTrue);
    });

    test('encoder rejects invalid colors', () {
      final cases = <String, StarOfficeColor Function()>{
        'named color': () => StarOfficeColor(name: 'x', color: 'red'),
        'non-hex': () => StarOfficeColor(name: 'x', color: '#zzzzzz'),
        'short hex': () => StarOfficeColor(name: 'x', color: '#fff'),
        'long hex': () => StarOfficeColor(name: 'x', color: '#ffffffff'),
        'empty': () => StarOfficeColor(name: 'x', color: ''),
      };
      for (final entry in cases.entries) {
        expect(
          () => StarOfficeColorTable(colors: [entry.value()]).toBytes(),
          throwsA(isA<FormatException>()),
          reason: entry.key,
        );
      }
    });
  });

  test('write soc file', () {
    final socTable = StarOfficeColorTable(
      colors: [
        StarOfficeColor(name: 'Test Red', color: '#FF0000'),
        StarOfficeColor(name: 'Test Green', color: '#00FF00'),
        StarOfficeColor(name: 'Test Blue', color: '#0000FF'),
        StarOfficeColor(name: 'Test Gray', color: '#808080'),
      ],
    );

    // Round-trip in memory (no temp file written into the repo).
    final decodedSocTable = StarOfficeColorTable.fromBytes(socTable.toBytes());

    expect(decodedSocTable.colors.length, equals(socTable.colors.length));

    for (var i = 0; i < decodedSocTable.colors.length; i++) {
      expect(decodedSocTable.colors[i].name, equals(socTable.colors[i].name));
      expect(decodedSocTable.colors[i].color, equals(socTable.colors[i].color));
    }
  });
}
