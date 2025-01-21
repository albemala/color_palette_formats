// ignore_for_file: avoid_print

import 'dart:io';

import 'package:color_palette_formats/color_palette_formats.dart';

void main() {
  for (final path in [
    'assets/acb1_v1.acb',
  ]) {
    final file = File(path);
    final acb = AdobeColorBook.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(acb.toMap());
  }
  for (final path in [
    'assets/ACBL.acbl',
  ]) {
    final file = File(path);
    final acbl = AdobeColorBookLegacy.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(acbl.toMap());
  }
  for (final path in [
    'assets/aco1_v1.aco',
    'assets/aco2_v1.aco',
  ]) {
    final file = File(path);
    final aco = AdobeColorSwatch.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(aco.toMap());
  }
  for (final path in [
    'assets/act1.act',
    'assets/act2.act',
    'assets/act3.act',
  ]) {
    final file = File(path);
    final act = AdobeColorTable.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(act.toMap());
  }
  for (final path in [
    'assets/ase1_v1.0.ase',
    'assets/ase2_v1.0.ase',
  ]) {
    final file = File(path);
    final ase = AdobeSwatchExchange.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(ase.toMap());
  }
  for (final path in [
    'assets/gpl1.gimp',
    'assets/gpl2.gpl',
  ]) {
    final file = File(path);
    final gpl = GimpPalette.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(gpl.toMap());
  }
  for (final path in [
    'assets/hpl1_v4.0.hpl',
    'assets/hpl2_v4.0.hpl',
  ]) {
    final file = File(path);
    final hpl = HomesitePalette.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(hpl.toMap());
  }
  for (final path in [
    'assets/paint-dot-net1.txt',
  ]) {
    final file = File(path);
    final paintDotNet = PaintDotNetPalette.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(paintDotNet.toMap());
  }
  for (final path in [
    'assets/pal1_v0100.pal',
  ]) {
    final file = File(path);
    final pal = JascPalette.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(pal.toMap());
  }
  for (final path in [
    'assets/procreate1.swatches',
    'assets/procreate2.swatches',
    // 'assets/procreate3.swatches',
  ]) {
    final file = File(path);
    final procreate = decodeProcreateSwatches(file.readAsBytesSync());
    for (final swatch in procreate) {
      print('--- $path ---');
      print(swatch.toMap());
    }
  }
  for (final path in [
    'assets/riff1_v3.pal',
    'assets/riff2_v3.pal',
  ]) {
    final file = File(path);
    final riff =
        ResourceInterchangeFileFormat.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(riff.toMap());
  }
  for (final path in [
    'assets/sketchpalette1_v1.4.sketchpalette',
    'assets/sketchpalette2_v1.4.sketchpalette',
  ]) {
    final file = File(path);
    final sketchpalette = SketchPalette.fromBytes(file.readAsBytesSync());
    print('--- $path ---');
    print(sketchpalette.toMap());
  }
}
