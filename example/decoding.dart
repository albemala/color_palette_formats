// ignore_for_file: avoid_print

import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  for (final path in [
    'assets/acb1_v1.acb',
  ]) {
    final file = File(path);
    final acb = decodeAdobeColorBook(file);
    print(acb.toMap());
  }
  for (final path in [
    'assets/aco1_v1.aco',
    'assets/aco2_v1.aco',
  ]) {
    final file = File(path);
    final aco = decodeAdobeColorSwatch(file);
    print(aco.toMap());
  }
  for (final path in [
    'assets/act1.act',
    'assets/act2.act',
    'assets/act3.act',
  ]) {
    final file = File(path);
    final act = decodeAdobeColorTable(file);
    print(act.toMap());
  }
  for (final path in [
    'assets/ase1_v1.0.ase',
    'assets/ase2_v1.0.ase',
  ]) {
    final file = File(path);
    final ase = decodeAdobeSwatchExchange(file);
    print(ase.toMap());
  }
  for (final path in [
    'assets/gpl1.gimp',
    'assets/gpl2.gpl',
  ]) {
    final file = File(path);
    final gpl = decodeGimpPalette(file);
    print(gpl.toMap());
  }
  for (final path in [
    'assets/hpl1_v4.0.hpl',
    'assets/hpl2_v4.0.hpl',
  ]) {
    final file = File(path);
    final hpl = decodeHomesitePalette(file);
    print(hpl.toMap());
  }
  for (final path in [
    'assets/paint-dot-net1.txt',
  ]) {
    final file = File(path);
    final paintDotNet = decodePaintDotNetPalette(file);
    print(paintDotNet.toMap());
  }
  for (final path in [
    'assets/pal1_v0100.pal',
  ]) {
    final file = File(path);
    final pal = decodeJascPalette(file);
    print(pal.toMap());
  }
  for (final path in [
    'assets/procreate1.swatches',
    'assets/procreate2.swatches',
    // 'assets/procreate3.swatches',
  ]) {
    final file = File(path);
    final procreate = decodeProcreateSwatches(file);
    for (final swatch in procreate) {
      print(swatch.toMap());
    }
  }
  for (final path in [
    'assets/riff1_v3.pal',
    'assets/riff2_v3.pal',
  ]) {
    final file = File(path);
    final riff = decodeResourceInterchangeFileFormat(file);
    print(riff.toMap());
  }
  for (final path in [
    'assets/sketchpalette1_v1.4.sketchpalette',
    'assets/sketchpalette2_v1.4.sketchpalette',
  ]) {
    final file = File(path);
    final sketchpalette = decodeSketchPalette(file);
    print(sketchpalette.toMap());
  }
}
