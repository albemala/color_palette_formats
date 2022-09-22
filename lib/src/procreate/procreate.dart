import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'procreate.freezed.dart';
part 'procreate.g.dart';

/*
* Procreate swatches (.swatches) (Procreate)
*
* Content example:
*

[
  {
    "name" : "Retro & Vintage",
    "swatches" : [
      {
        "hue" : 0.096825396825396814,
        "saturation" : 0.41338580203493147,
        "brightness" : 0.99607843160629272,
        "alpha" : 1,
        "colorSpace" : 0
      },
      {
        "hue" : 0.4381720505892564,
        "saturation" : 0.40000000980592509,
        "brightness" : 0.60784316062927246,
        "alpha" : 1,
        "colorSpace" : 0
      }
    ]
  }
]

*
* References:
* - ...
*/

enum ProcreateSwatchesColorSpace {
  hsb,
}

@freezed
class ProcreateSwatchesSwatch with _$ProcreateSwatchesSwatch {
  const factory ProcreateSwatchesSwatch({
    /// Value: [0..1]
    required double hue,

    /// Value: [0..1]
    required double saturation,

    /// Value: [0..1]
    required double brightness,

    /// Value: [0..1]
    required double alpha,
    @JsonKey(
      fromJson: _toColorSpace,
      toJson: _fromColorSpace,
    )
        required ProcreateSwatchesColorSpace colorSpace,
  }) = _ProcreateSwatchesSwatch;

  factory ProcreateSwatchesSwatch.fromJson(Map<String, dynamic> json) =>
      _$ProcreateSwatchesSwatchFromJson(json);
}

@freezed
class ProcreateSwatches with _$ProcreateSwatches {
  const factory ProcreateSwatches({
    required String name,
    required List<ProcreateSwatchesSwatch> swatches,
  }) = _ProcreateSwatches;

  factory ProcreateSwatches.fromJson(Map<String, dynamic> json) =>
      _$ProcreateSwatchesFromJson(json);
}

ProcreateSwatchesColorSpace _toColorSpace(int colorSpace) {
  return ProcreateSwatchesColorSpace.values[colorSpace];
}

int _fromColorSpace(ProcreateSwatchesColorSpace colorSpace) {
  return ProcreateSwatchesColorSpace.values.indexOf(colorSpace);
}

List<ProcreateSwatches> decodeProcreateSwatches(File file) {
  final bytes = file.readAsBytesSync();

  final archive = ZipDecoder().decodeBytes(bytes);
  final jsonFile = archive.first;
  final jsonContent = String.fromCharCodes(jsonFile.content as List<int>);

  final swatches = json.decode(jsonContent) as List<dynamic>;
  return swatches
      .map(
        (swatch) => ProcreateSwatches.fromJson(swatch as Map<String, dynamic>),
      )
      .toList();
}

void encodeProcreateSwatches(List<ProcreateSwatches> swatches, File file) {
  final jsonContent = json.encode(swatches);

  final archive = Archive();
  archive.addFile(
    ArchiveFile(
      'swatches.json',
      jsonContent.length,
      jsonContent.codeUnits,
    ),
  );

  final bytes = ZipEncoder().encode(archive) ?? [];
  file.writeAsBytesSync(bytes);
}
