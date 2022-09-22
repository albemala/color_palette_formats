// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jasc-pal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JascPaletteColor _$$_JascPaletteColorFromJson(Map<String, dynamic> json) =>
    _$_JascPaletteColor(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
    );

Map<String, dynamic> _$$_JascPaletteColorToJson(_$_JascPaletteColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
    };

_$_JascPalette _$$_JascPaletteFromJson(Map<String, dynamic> json) =>
    _$_JascPalette(
      version: json['version'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => JascPaletteColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_JascPaletteToJson(_$_JascPalette instance) =>
    <String, dynamic>{
      'version': instance.version,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
