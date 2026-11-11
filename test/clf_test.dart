import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/clf/hlc-atlas.clf': ClfPalette(
      colors: [
        ClfPaletteColor(name: 'HLC 070 50 030', lab: [50.0, 10.2, 28.19]),
      ],
    ),
  };

  final expectedCounts = {'test/testdata/clf/hlc-atlas.clf': 4};

  expectedData.forEach((filePath, expectedClf) {
    group('CLF Palette File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final clfFile = File(filePath);
        bytes = clfFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(ClfPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final clf = ClfPalette.fromBytes(bytes);

        expect(clf.colors.length, equals(expectedCounts[filePath]));
        expect(clf.colors.isNotEmpty, isTrue, reason: 'No colors');

        final firstColor = clf.colors.first;
        final expectedFirstColor = expectedClf.colors.first;
        expect(firstColor.name, equals(expectedFirstColor.name));
        expect(firstColor.lab, equals(expectedFirstColor.lab));
      });
    });
  });

  test('reads all colors with raw Lab values', () {
    final clf = ClfPalette.fromBytes(
      File('test/testdata/clf/hlc-atlas.clf').readAsBytesSync(),
    );

    expect(clf.colors[1].name, equals('HLC 130 40 060'));
    expect(clf.colors[1].lab, equals([40.0, -38.7, 46.5]));
    expect(clf.colors[2].lab, equals([30.0, 22.4, -66.3]));
    expect(clf.colors[3].lab, equals([50.0, 0.0, 0.0]));
  });

  test('skips blank and malformed lines like the reference reader', () {
    final bytes = utf8.encode(
      'Not a color line\n'
      '\n'
      'HLC Red\t53.0\t80.0\t67.0\n'
      'Comma Green\t87,0\t-30,5\t72,25\n'
      'Incomplete\t1.0\t2.0\n'
      'Not numbers\ta\tb\tc\n',
    );

    final clf = ClfPalette.fromBytes(bytes);

    expect(clf.colors.length, equals(2));
    expect(clf.colors[0].name, equals('HLC Red'));
    expect(clf.colors[0].lab, equals([53.0, 80.0, 67.0]));
    expect(clf.colors[1].name, equals('Comma Green'));
    expect(clf.colors[1].lab, equals([87.0, -30.5, 72.25]));
  });

  test('isValidFormat returns false for files with no valid colors', () {
    expect(ClfPalette.isValidFormat([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]), isFalse);
    expect(ClfPalette.isValidFormat([]), isFalse);
    expect(ClfPalette.isValidFormat(utf8.encode('No tabs here\n')), isFalse);
  });

  test('splits lone-CR line endings like the reference reader', () {
    final bytes = utf8.encode(
      'HLC Red\t53.0\t80.0\t67.0\r'
      'Comma Green\t87,0\t-30,5\t72,25\r',
    );

    final clf = ClfPalette.fromBytes(bytes);

    expect(ClfPalette.isValidFormat(bytes), isTrue);
    expect(clf.colors.length, equals(2));
    expect(clf.colors[0].name, equals('HLC Red'));
    expect(clf.colors[0].lab, equals([53.0, 80.0, 67.0]));
    expect(clf.colors[1].name, equals('Comma Green'));
    expect(clf.colors[1].lab, equals([87.0, -30.5, 72.25]));
  });

  test('splits CRLF line endings', () {
    final bytes = utf8.encode(
      'HLC Red\t53.0\t80.0\t67.0\r\n'
      'HLC Gray\t50.0\t0.0\t0.0\r\n',
    );

    final clf = ClfPalette.fromBytes(bytes);

    expect(clf.colors.length, equals(2));
    expect(clf.colors[0].name, equals('HLC Red'));
    expect(clf.colors[1].name, equals('HLC Gray'));
  });

  test('invalid UTF-8 throws FormatException and is not valid', () {
    const bytes = [0xFF, 0xFE, 0xFD];
    expect(ClfPalette.isValidFormat(bytes), isFalse);
    expect(() => ClfPalette.fromBytes(bytes), throwsA(isA<FormatException>()));
  });

  test('encoder rejects separators and empty palettes', () {
    ClfPalette build(String name) => ClfPalette(
      colors: [
        ClfPaletteColor(name: name, lab: [50.0, 0.0, 0.0]),
      ],
    );

    expect(() => build('a\tb').toBytes(), throwsA(isA<FormatException>()));
    expect(() => build('a\nb').toBytes(), throwsA(isA<FormatException>()));
    expect(() => build('a\rb').toBytes(), throwsA(isA<FormatException>()));
    expect(
      () => ClfPalette(colors: []).toBytes(),
      throwsA(isA<FormatException>()),
    );
  });

  test('write clf file', () {
    final clf = ClfPalette(
      colors: [
        ClfPaletteColor(name: 'Test Red', lab: [53.0, 80.0, 67.0]),
        ClfPaletteColor(name: 'Test Gray', lab: [50.0, 0.0, 0.0]),
      ],
    );

    // write to temp file
    final clfFile = File('./test/test.clf');
    clfFile.writeAsBytesSync(clf.toBytes());

    final decodedClf = ClfPalette.fromBytes(clfFile.readAsBytesSync());

    expect(decodedClf.colors.length, equals(2));

    expect(decodedClf.colors[0].name, equals('Test Red'));
    expect(decodedClf.colors[0].lab, equals([53.0, 80.0, 67.0]));

    expect(decodedClf.colors[1].name, equals('Test Gray'));
    expect(decodedClf.colors[1].lab, equals([50.0, 0.0, 0.0]));

    // delete temp file
    clfFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = ClfPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });
}
