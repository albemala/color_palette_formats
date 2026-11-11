import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'clf.mapper.dart';
part 'decode.dart';
part 'encode.dart';

/*
 * Format name: CLF Lab colors file
 * Acronym: CLF
 * File extensions: .clf
 * Applications: freieFarbe Open Colour Systems Collection, Scribus
 *   colorchart script
 * Format details:
 *   Plain-text UTF-8, one color per line: name, L, a, b separated
 *   by tabs. Decoding is loose following the ColorPaletteCodable
 *   reader: blank and malformed lines are skipped (comma decimal
 *   separators accepted), and only a file with no valid colors is
 *   rejected. This is the freieFarbe Lab text format, not the ACES
 *   Common LUT Format (which shares the .clf extension).
 * References:
 * - http://www.selapa.net/swatches/colors/fileformats.php
 * - https://github.com/dagronf/ColorPaletteCodable/blob/main/Sources/ColorPaletteCodable/palette/coders/CLFPaletteCoder.swift
 * - https://freiefarbe.de/en/blog/2017/12/29/scribus-skript-colorchart-by-greg-pittman/
 */

@MappableClass()
class ClfPaletteColor with ClfPaletteColorMappable {
  /// Name of the color.
  final String name;

  /// Raw CIE Lab values as stored (L, a, b), kept without
  /// normalizing.
  final List<double> lab;

  ClfPaletteColor({required this.name, required this.lab})
    : assert(lab.length == 3, 'lab must have 3 values');
}

@MappableClass()
class ClfPalette with ClfPaletteMappable {
  /// Field separator used on the wire (tab).
  static const fieldSeparator = '\t';

  final List<ClfPaletteColor> colors;

  ClfPalette({required this.colors});

  factory ClfPalette.fromBytes(List<int> bytes) {
    return _decode(bytes);
  }

  List<int> toBytes() {
    return _encode(this);
  }

  /// Checks if the provided bytes represent a valid CLF Lab colors
  /// file.
  static bool isValidFormat(List<int> bytes) {
    try {
      _decode(bytes);
      return true;
    } catch (_) {
      return false;
    }
  }
}
