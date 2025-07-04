import 'dart:io';
import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CXF', () {
    test('decode sample.cxf', () {
      final file = File('assets/cxf/sample.cxf');
      final bytes = file.readAsBytesSync();

      final palette = CxfPalette.fromBytes(bytes);

      expect(palette.colors.length, equals(2));

      // Test first color
      final color1 = palette.colors[0];
      expect(color1.name, equals('S 0300-N'));
      expect(color1.l, closeTo(96.0565, 0.001));
      expect(color1.a, closeTo(-0.2286, 0.001));
      expect(color1.b, closeTo(2.3575, 0.001));

      // Test second color
      final color2 = palette.colors[1];
      expect(color2.name, equals('S 0500-N'));
      expect(color2.l, closeTo(94.2091, 0.001));
      expect(color2.a, closeTo(0.0443, 0.001));
      expect(color2.b, closeTo(2.146, 0.001));
    });

    test('isValidFormat returns true for valid CXF', () {
      final file = File('assets/cxf/sample.cxf');
      final bytes = file.readAsBytesSync();

      expect(CxfPalette.isValidFormat(bytes), isTrue);
    });

    test('isValidFormat returns false for invalid data', () {
      final invalidBytes = [0x00, 0x01, 0x02, 0x03];

      expect(CxfPalette.isValidFormat(invalidBytes), isFalse);
    });
  });
}
