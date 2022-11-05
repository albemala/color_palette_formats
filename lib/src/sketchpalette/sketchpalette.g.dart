// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketchpalette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SketchPaletteColor _$$_SketchPaletteColorFromJson(
        Map<String, dynamic> json) =>
    _$_SketchPaletteColor(
      red: (json['red'] as num).toDouble(),
      green: (json['green'] as num).toDouble(),
      blue: (json['blue'] as num).toDouble(),
      alpha: (json['alpha'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SketchPaletteColorToJson(
        _$_SketchPaletteColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'alpha': instance.alpha,
    };

_$_SketchPalette _$$_SketchPaletteFromJson(Map<String, dynamic> json) =>
    _$_SketchPalette(
      compatibleVersion: json['compatibleVersion'] as String,
      pluginVersion: json['pluginVersion'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => SketchPaletteColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SketchPaletteToJson(_$_SketchPalette instance) =>
    <String, dynamic>{
      'compatibleVersion': instance.compatibleVersion,
      'pluginVersion': instance.pluginVersion,
      'colors': instance.colors,
    };
