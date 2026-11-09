import 'dart:convert';

import 'package:color_palette_formats/src/xml_decode_utils.dart';
import 'package:color_palette_formats/src/xml_encode_utils.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:xml/xml.dart';

part 'autocad_acb.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: AutoCAD Color Book
 * Acronym: ACB
 * File extensions: .acb
 * Applications: AutoCAD family products
 * Format details:
 *   XML color book with one `colorPage` per display page. Each page carries
 *   a `pageColor` and a list of `colorEntry` items holding a name plus RGB
 *   values in one of two shapes: plain `RGB8` integers or `RGB8Encrypt`
 *   three-letter codes. The encryption scheme is unpublished and no public
 *   decoder exists, so encrypted codes are preserved raw without decoding.
 *   Colors from every page are concatenated into a single list; the page
 *   color of the first page is kept. The encoder always writes a single
 *   `colorPage`, so multi-page structure does not round-trip.
 *   Not the same format as the Adobe `.acb`.
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://www.cadforum.cz/en/how-to-create-a-custom-color-book-acb-palette-in-autocad-tip8649/
 * - https://keanw.com/2007/12/getting-the-nam.html
 * - https://github.com/olivierberten/SwatchBooker/blob/master/src/swatchbook/codecs/autocad_acb.py
 */

@MappableClass()
class AutoCadColorBookPageColor with AutoCadColorBookPageColorMappable {
  /// Plain RGB values. Value: [0..255]
  final List<int>? rgb;

  /// Encrypted RGB codes as stored in `RGB8Encrypt` (unpublished scheme).
  final List<String>? encryptedRgb;

  AutoCadColorBookPageColor({this.rgb, this.encryptedRgb})
    : assert(rgb == null || rgb.length == 3, 'rgb must have 3 values'),
      assert(
        rgb == null || rgb.every((v) => v >= 0 && v <= 255),
        'rgb values must be between 0 and 255',
      ),
      assert(
        encryptedRgb == null || encryptedRgb.length == 3,
        'encryptedRgb must have 3 values',
      ),
      assert(
        rgb != null || encryptedRgb != null,
        'either rgb or encryptedRgb must be set',
      );
}

@MappableClass()
class AutoCadColorBookColor with AutoCadColorBookColorMappable {
  final String name;

  /// Plain RGB values. Value: [0..255]
  final List<int>? rgb;

  /// Encrypted RGB codes as stored in `RGB8Encrypt` (unpublished scheme).
  final List<String>? encryptedRgb;

  AutoCadColorBookColor({required this.name, this.rgb, this.encryptedRgb})
    : assert(rgb == null || rgb.length == 3, 'rgb must have 3 values'),
      assert(
        rgb == null || rgb.every((v) => v >= 0 && v <= 255),
        'rgb values must be between 0 and 255',
      ),
      assert(
        encryptedRgb == null || encryptedRgb.length == 3,
        'encryptedRgb must have 3 values',
      ),
      assert(
        rgb != null || encryptedRgb != null,
        'either rgb or encryptedRgb must be set',
      );
}

@MappableClass()
class AutoCadColorBook with AutoCadColorBookMappable {
  final String bookName;
  final int? majorVersion;
  final int? minorVersion;

  /// Page color of the first `colorPage` in the file.
  final AutoCadColorBookPageColor pageColor;

  /// Colors of every `colorPage` concatenated in document order.
  final List<AutoCadColorBookColor> colors;

  AutoCadColorBook({
    required this.bookName,
    this.majorVersion,
    this.minorVersion,
    required this.pageColor,
    required this.colors,
  });

  factory AutoCadColorBook.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid AutoCAD Color Book.
  /// Runs a full decode so files with a valid root element but a broken
  /// body are rejected (a root-only check would accept them).
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}

// XML Element Constants
class AutoCadAcbConstants {
  static const String colorBook = 'colorBook';
  static const String bookName = 'bookName';
  static const String majorVersion = 'majorVersion';
  static const String minorVersion = 'minorVersion';
  static const String colorPage = 'colorPage';
  static const String pageColor = 'pageColor';
  static const String colorEntry = 'colorEntry';
  static const String colorName = 'colorName';
  static const String rgb8 = 'RGB8';
  static const String red = 'red';
  static const String green = 'green';
  static const String blue = 'blue';
  static const String rgb8Encrypt = 'RGB8Encrypt';
  static const String redEncrypt = 'redEncrypt';
  static const String greenEncrypt = 'greenEncrypt';
  static const String blueEncrypt = 'blueEncrypt';
}
