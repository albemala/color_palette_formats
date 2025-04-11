import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedData = {
    './assets/soc/cmyk.soc': StarOfficeColorTable(
      colors: [StarOfficeColor(name: '0 0 0', color: '#ffffff')],
    ),
    './assets/soc/gallery.soc': StarOfficeColorTable(
      colors: [StarOfficeColor(name: '0-0-0-0', color: '#ffffff')],
    ),
    './assets/soc/html.soc': StarOfficeColorTable(
      colors: [
        StarOfficeColor(name: 'white FFFFFF 255.255.255', color: '#ffffff'),
      ],
    ),
  };

  expectedData.forEach((filePath, expectedSocTable) {
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

        // Compare colors
        expect(
          socTable.colors.isNotEmpty,
          isTrue,
          reason: 'No colors to compare',
        );

        if (socTable.colors.isNotEmpty) {
          final firstColor = socTable.colors.first;
          final expectedFirstColor = expectedSocTable.colors.first;

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
        }
      });
    });
  });

  test('isValidFormat returns false for invalid SOC file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(StarOfficeColorTable.isValidFormat(invalidBytes), isFalse);
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

    // Write to temp file
    final tempFile = File('./test/test.soc');
    tempFile.writeAsBytesSync(socTable.toBytes());

    // Read back and verify
    final decodedSocTable = StarOfficeColorTable.fromBytes(
      tempFile.readAsBytesSync(),
    );

    expect(decodedSocTable.colors.length, equals(socTable.colors.length));

    for (var i = 0; i < decodedSocTable.colors.length; i++) {
      expect(decodedSocTable.colors[i].name, equals(socTable.colors[i].name));
      expect(decodedSocTable.colors[i].color, equals(socTable.colors[i].color));
    }

    // Delete temp file
    tempFile.deleteSync();
  });
}
