import 'dart:convert';
import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    'test/testdata/qcl/solid-hex.qcl': QuarkXPressPalette(
      stdVersion: '1.0',
      dtdVersion: '1.0',
      standard: 'CGATS.17',
      originator: '© Pantone, Inc., 2001',
      fileDescriptor: 'PANTONE® solid in hexachrome® coated',
      createdDate: '2005-09-13',
      createdText: 'Sep 13, 2005',
      manufacturer: 'PNTN',
      headerComment: 'Quark Format defines the UI and identifiers for Library',
      nameFormats: [
        QuarkXPressNameFormat(
          formatId: 1,
          longForm: 'PANTONE %n HC',
          shortForm: '%n',
        ),
        QuarkXPressNameFormat(
          formatId: 2,
          longForm: 'PANTONE Hexachrome %n C',
          shortForm: 'Hexachrome %n',
        ),
      ],
      libraryIdentifier: 'PnHS',
      defaultColorSpace: '6CLR',
      colorUsageRecommendation: '5',
      uiSpec: 'Solid Hex UI Spec.cui',
      colors: [
        QuarkXPressPaletteColor(
          sampleId: 'Yellow',
          nameFormatId: 2,
          name: 'PANTONE Hexachrome Yellow C',
          hexachrome: [0, 0, 100, 0, 0, 0],
          lab: [89.87, -1.92, 99.33],
        ),
      ],
    ),
    'test/testdata/qcl/rgb-cmyk.qcl': QuarkXPressPalette(
      stdVersion: '1.0',
      dtdVersion: '1.0',
      standard: 'CGATS.17',
      originator: 'Test Suite',
      fileDescriptor: 'Test RGB CMYK library',
      createdDate: '2026-11-09',
      createdText: 'Nov 9, 2026',
      manufacturer: 'TEST',
      headerComment: '',
      nameFormats: [
        QuarkXPressNameFormat(
          formatId: 1,
          longForm: 'TEST %n C',
          shortForm: '%n',
        ),
      ],
      libraryIdentifier: 'TST1',
      defaultColorSpace: 'QRGB',
      colorUsageRecommendation: '2',
      uiSpec: 'Test UI Spec.cui',
      colors: [
        QuarkXPressPaletteColor(
          sampleId: 'Red',
          nameFormatId: 1,
          name: 'TEST Red C',
          rgb: [255, 0, 0],
          cmyk: [0, 100, 100, 0],
        ),
      ],
    ),
  };

  final expectedCounts = {
    'test/testdata/qcl/solid-hex.qcl': 3,
    'test/testdata/qcl/rgb-cmyk.qcl': 2,
  };

  expectedData.forEach((filePath, expectedQcl) {
    group('QCL File: $filePath', () {
      late List<int> bytes;

      setUpAll(() {
        final qclFile = File(filePath);
        bytes = qclFile.readAsBytesSync();
      });

      test('isValidFormat returns true', () {
        expect(QuarkXPressPalette.isValidFormat(bytes), isTrue);
      });

      test('parses correctly', () {
        final qcl = QuarkXPressPalette.fromBytes(bytes);

        expect(qcl.standard, equals(expectedQcl.standard));
        expect(qcl.originator, equals(expectedQcl.originator));
        expect(qcl.fileDescriptor, equals(expectedQcl.fileDescriptor));
        expect(qcl.createdDate, equals(expectedQcl.createdDate));
        expect(qcl.createdText, equals(expectedQcl.createdText));
        expect(qcl.manufacturer, equals(expectedQcl.manufacturer));
        expect(qcl.headerComment, equals(expectedQcl.headerComment));
        expect(qcl.libraryIdentifier, equals(expectedQcl.libraryIdentifier));
        expect(qcl.defaultColorSpace, equals(expectedQcl.defaultColorSpace));
        expect(
          qcl.colorUsageRecommendation,
          equals(expectedQcl.colorUsageRecommendation),
        );
        expect(qcl.uiSpec, equals(expectedQcl.uiSpec));
        expect(qcl.nameFormats.length, equals(expectedQcl.nameFormats.length));
        expect(qcl.colors.length, equals(expectedCounts[filePath]));

        expect(qcl.colors.isNotEmpty, isTrue, reason: 'No colors to compare');

        if (qcl.colors.isNotEmpty) {
          final firstColor = qcl.colors.first;
          final expectedFirstColor = expectedQcl.colors.first;

          expect(firstColor.sampleId, equals(expectedFirstColor.sampleId));
          expect(
            firstColor.nameFormatId,
            equals(expectedFirstColor.nameFormatId),
          );
          expect(firstColor.name, equals(expectedFirstColor.name));
          expect(
            firstColor.rgb == null && expectedFirstColor.rgb == null ||
                listEquals(firstColor.rgb, expectedFirstColor.rgb),
            isTrue,
            reason: 'RGB values mismatch for the first color',
          );
          expect(
            firstColor.cmyk == null && expectedFirstColor.cmyk == null ||
                listEquals(firstColor.cmyk, expectedFirstColor.cmyk),
            isTrue,
            reason: 'CMYK values mismatch for the first color',
          );
          expect(
            firstColor.lab == null && expectedFirstColor.lab == null ||
                listEquals(firstColor.lab, expectedFirstColor.lab),
            isTrue,
            reason: 'Lab values mismatch for the first color',
          );
          expect(
            firstColor.hexachrome == null &&
                    expectedFirstColor.hexachrome == null ||
                listEquals(
                  firstColor.hexachrome,
                  expectedFirstColor.hexachrome,
                ),
            isTrue,
            reason: 'Hexachrome values mismatch for the first color',
          );
        }
      });
    });
  });

  test('resolves names through every name format', () {
    final qcl = QuarkXPressPalette.fromBytes(
      File('test/testdata/qcl/solid-hex.qcl').readAsBytesSync(),
    );

    expect(qcl.colors[0].name, equals('PANTONE Hexachrome Yellow C'));
    expect(qcl.colors[2].sampleId, equals('7547'));
    expect(qcl.colors[2].nameFormatId, equals(1));
    expect(qcl.colors[2].name, equals('PANTONE 7547 HC'));
  });

  test('reads columns in any data_format order', () {
    // Same color as the first solid-hex row, but with the selapa column
    // order (hexachrome before Lab) instead of the encoder canonical order.
    final bytes = utf8.encode('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE cgats17 SYSTEM 'cgats_data.dtd'>
<cgats17 std_version="1.0" dtd_version="1.0">
    <cgats17.preamble>
        <standard>CGATS.17</standard>
        <originator>Tests</originator>
        <file_descriptor>Order test</file_descriptor>
        <created date="2026-11-09">Nov 9, 2026</created>
    </cgats17.preamble>
    <cgats17.data_section>
        <cgats17.data_section_header>
            <manufacturer>TEST</manufacturer>
            <quark_format>
                <name_format>
                    <name_field_info format_id="2" long_form="PANTONE Hexachrome %n C" short_form="Hexachrome %n"/>
                </name_format>
                <library_identifier>PnHS</library_identifier>
                <default_color_space>6CLR</default_color_space>
                <color_usage_recommendation>5</color_usage_recommendation>
                <ui_spec>Order.cui</ui_spec>
            </quark_format>
        </cgats17.data_section_header>
        <cgats17.data_section_data>
            <number_of_fields>11</number_of_fields>
            <data_format>
                <field_info pos="1" name="SAMPLE_ID"/>
                <field_info pos="2" name="NAME_FORMAT_ID"/>
                <field_info pos="3" name="PC6_1"/>
                <field_info pos="4" name="PC6_2"/>
                <field_info pos="5" name="PC6_3"/>
                <field_info pos="6" name="PC6_4"/>
                <field_info pos="7" name="PC6_5"/>
                <field_info pos="8" name="PC6_6"/>
                <field_info pos="9" name="LAB_L"/>
                <field_info pos="10" name="LAB_A"/>
                <field_info pos="11" name="LAB_B"/>
            </data_format>
            <number_of_sets>1</number_of_sets>
            <table>
                <tr>
                    <td>Yellow</td>
                    <td>2</td>
                    <td>0</td>
                    <td>0</td>
                    <td>100</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>89.87</td>
                    <td>-1.92</td>
                    <td>99.33</td>
                </tr>
            </table>
        </cgats17.data_section_data>
    </cgats17.data_section>
</cgats17>
''');

    expect(QuarkXPressPalette.isValidFormat(bytes), isTrue);
    final qcl = QuarkXPressPalette.fromBytes(bytes);
    expect(qcl.colors.length, equals(1));
    final color = qcl.colors.single;
    expect(color.name, equals('PANTONE Hexachrome Yellow C'));
    expect(listEquals(color.hexachrome, [0, 0, 100, 0, 0, 0]), isTrue);
    expect(listEquals(color.lab, [89.87, -1.92, 99.33]), isTrue);
  });

  test('isValidFormat returns false for invalid QCL file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(QuarkXPressPalette.isValidFormat(invalidBytes), isFalse);
  });

  test('write qcl file', () {
    final qcl = QuarkXPressPalette(
      stdVersion: '1.0',
      dtdVersion: '1.0',
      standard: 'CGATS.17',
      originator: 'Tests',
      fileDescriptor: 'Round-trip library',
      createdDate: '2026-11-09',
      createdText: 'Nov 9, 2026',
      manufacturer: 'TEST',
      headerComment: '',
      nameFormats: [
        QuarkXPressNameFormat(
          formatId: 1,
          longForm: 'TEST %n C',
          shortForm: '%n',
        ),
      ],
      libraryIdentifier: 'TST1',
      defaultColorSpace: 'QRGB',
      colorUsageRecommendation: '2',
      uiSpec: 'Round-trip.cui',
      colors: [
        QuarkXPressPaletteColor(
          sampleId: 'Red',
          nameFormatId: 1,
          name: 'TEST Red C',
          rgb: [255, 0, 0],
        ),
        QuarkXPressPaletteColor(
          sampleId: 'Plain',
          name: 'Plain',
          lab: [50.0, 2.5, -3.75],
        ),
      ],
    );

    // Write to temp file
    final qclFile = File('./test/test.qcl');
    qclFile.writeAsBytesSync(qcl.toBytes());

    // Read back and verify
    final decodedQcl = QuarkXPressPalette.fromBytes(qclFile.readAsBytesSync());

    expect(decodedQcl.fileDescriptor, equals('Round-trip library'));
    expect(decodedQcl.colors.length, equals(2));

    expect(decodedQcl.colors[0].name, equals('TEST Red C'));
    expect(listEquals(decodedQcl.colors[0].rgb, [255, 0, 0]), isTrue);

    expect(decodedQcl.colors[1].nameFormatId, isNull);
    expect(decodedQcl.colors[1].name, equals('Plain'));
    expect(listEquals(decodedQcl.colors[1].lab, [50.0, 2.5, -3.75]), isTrue);

    // Delete temp file
    qclFile.deleteSync();
  });

  test('round-trips sample files byte-for-byte', () {
    for (final filePath in expectedData.keys) {
      final bytes = File(filePath).readAsBytesSync();
      final decoded = QuarkXPressPalette.fromBytes(bytes);
      expect(
        decoded.toBytes(),
        equals(bytes),
        reason: 'Round-trip mismatch for $filePath',
      );
    }
  });

  group('validation', () {
    String rgbCmyk() =>
        File('test/testdata/qcl/rgb-cmyk.qcl').readAsStringSync();
    String solidHex() =>
        File('test/testdata/qcl/solid-hex.qcl').readAsStringSync();
    List<int> mutate(String source, String from, String to) =>
        utf8.encode(source.replaceFirst(from, to));

    void expectRejected(String label, List<int> bytes) {
      expect(
        () => QuarkXPressPalette.fromBytes(bytes),
        throwsA(isA<FormatException>()),
        reason: label,
      );
      expect(QuarkXPressPalette.isValidFormat(bytes), isFalse, reason: label);
    }

    test('isValidFormat rejects broken bodies', () {
      final rgb = rgbCmyk();
      expectRejected('root only', utf8.encode('<cgats17/>'));
      expectRejected(
        'empty table',
        utf8.encode(rgb.replaceAll(RegExp('<tr>.*?</tr>', dotAll: true), '')),
      );
      expectRejected(
        'rgb out of range',
        mutate(rgb, '<td>255</td>', '<td>300</td>'),
      );
      expectRejected(
        'unknown name format',
        mutate(rgb, '<td>1</td>', '<td>9</td>'),
      );
    });

    test('rejects non-finite and out-of-range doubles', () {
      final rgb = rgbCmyk();
      final hex = solidHex();
      final cases = <String, List<int>>{
        'cmyk NaN': mutate(rgb, '<td>100</td>', '<td>NaN</td>'),
        'cmyk Infinity': mutate(rgb, '<td>100</td>', '<td>Infinity</td>'),
        'cmyk overflow': mutate(rgb, '<td>100</td>', '<td>1e999</td>'),
        'cmyk above range': mutate(rgb, '<td>100</td>', '<td>101</td>'),
        'cmyk below range': mutate(rgb, '<td>100</td>', '<td>-5</td>'),
        'lab NaN': mutate(hex, '<td>89.87</td>', '<td>NaN</td>'),
        'lab Infinity': mutate(hex, '<td>-1.92</td>', '<td>Infinity</td>'),
        'hexachrome NaN': mutate(hex, '<td>100</td>', '<td>NaN</td>'),
        'hexachrome above range': mutate(hex, '<td>100</td>', '<td>101</td>'),
        'non-numeric format_id': utf8.encode(
          hex.replaceFirst('format_id="2"', 'format_id="abc"'),
        ),
        'incomplete group': utf8.encode(
          rgb.replaceFirst('        <field_info pos="5" name="RGB_B"/>\n', ''),
        ),
      };
      for (final entry in cases.entries) {
        expectRejected(entry.key, entry.value);
      }
    });

    test('accepts out-of-range Lab values', () {
      // Lab is range-free (out-of-gamut measurements can exceed the usual
      // bounds); only finiteness is enforced.
      final bytes = mutate(solidHex(), '<td>89.87</td>', '<td>150</td>');
      final palette = QuarkXPressPalette.fromBytes(bytes);
      expect(palette.colors.first.lab?.first, equals(150));
      expect(QuarkXPressPalette.isValidFormat(bytes), isTrue);
    });

    test('encoder rejects invalid colors', () {
      // Constructor asserts fire in debug builds before the encoder's
      // FormatException guards (release safety nets) are reached.
      final either = anyOf(isA<FormatException>(), isA<AssertionError>());
      QuarkXPressPalette wrap(QuarkXPressPaletteColor color) =>
          QuarkXPressPalette(
            stdVersion: '1.0',
            dtdVersion: '1.0',
            standard: 'CGATS.17',
            originator: 'Tests',
            fileDescriptor: 'x',
            createdDate: '2026-11-09',
            createdText: 'x',
            manufacturer: 'TEST',
            headerComment: '',
            nameFormats: const [],
            libraryIdentifier: 'T',
            defaultColorSpace: 'QRGB',
            colorUsageRecommendation: '2',
            uiSpec: '',
            colors: [color],
          );
      final cases = <String, QuarkXPressPaletteColor Function()>{
        'rgb wrong length':
            () =>
                QuarkXPressPaletteColor(sampleId: 'B', name: 'B', rgb: [1, 2]),
        'rgb out of range':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              rgb: [300, 0, 0],
            ),
        'cmyk wrong length':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              cmyk: [1, 2, 3, 4, 5],
            ),
        'cmyk out of range':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              cmyk: [101, 0, 0, 0],
            ),
        'cmyk NaN':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              cmyk: [double.nan, 0, 0, 0],
            ),
        'lab infinite':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              lab: [double.infinity, 0, 0],
            ),
        'hexachrome wrong length':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              hexachrome: [1, 2],
            ),
        'hexachrome out of range':
            () => QuarkXPressPaletteColor(
              sampleId: 'B',
              name: 'B',
              hexachrome: [0, 0, 0, 0, 0, 101],
            ),
      };
      for (final entry in cases.entries) {
        expect(
          () => wrap(entry.value()).toBytes(),
          throwsA(either),
          reason: entry.key,
        );
      }
    });
  });
}
