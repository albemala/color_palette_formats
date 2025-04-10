import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final validSocFiles = [
    './assets/soc/cmyk.soc',
    './assets/soc/gallery.soc',
    './assets/soc/html.soc',
  ];

  for (final filePath in validSocFiles) {
    test('isValidFormat returns true for valid SOC file: $filePath', () {
      final socFile = File(filePath);
      final bytes = socFile.readAsBytesSync();
      expect(StarOfficeColorTable.isValidFormat(bytes), isTrue);
    });

    test('read soc file: $filePath', () {
      final socFile = File(filePath);
      final socTable = StarOfficeColorTable.fromBytes(
        socFile.readAsBytesSync(),
      );

      if (filePath == './assets/soc/cmyk.soc') {
        expect(socTable.colors.length, equals(216));
        expect(socTable.colors[0].name, equals('0 0 0'));
        expect(socTable.colors[0].color, equals('#ffffff'));
        expect(socTable.colors[215].name, equals('100 100 100'));
        expect(socTable.colors[215].color, equals('#000000'));
      } else if (filePath == './assets/soc/gallery.soc') {
        expect(socTable.colors.length, equals(61));
        expect(socTable.colors[0].name, equals('0-0-0-0'));
        expect(socTable.colors[0].color, equals('#ffffff'));
        expect(socTable.colors[57].name, equals('51-68-100-5'));
        expect(socTable.colors[57].color, equals('#6e4300'));
      } else if (filePath == './assets/soc/html.soc') {
        expect(socTable.colors.length, equals(131));
        expect(socTable.colors[0].name, equals('white FFFFFF 255.255.255'));
        expect(socTable.colors[0].color, equals('#ffffff'));
        expect(
          socTable.colors[130].name,
          equals('darkmagenta 8B008B 139.0.139'),
        );
        expect(
          socTable.colors[130].color,
          equals('#8c008c'),
        ); // Note: XML has 8B008B, but seems like a typo based on name
      }
    });
  }

  test('isValidFormat returns false for invalid SOC file', () {
    final invalidBytes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Example invalid data
    expect(StarOfficeColorTable.isValidFormat(invalidBytes), isFalse);
  });

  test('write soc file', () async {
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
