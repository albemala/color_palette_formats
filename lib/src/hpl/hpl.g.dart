// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hpl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomesitePaletteColor _$$_HomesitePaletteColorFromJson(
        Map<String, dynamic> json) =>
    _$_HomesitePaletteColor(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
    );

Map<String, dynamic> _$$_HomesitePaletteColorToJson(
        _$_HomesitePaletteColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
    };

_$_HomesitePalette _$$_HomesitePaletteFromJson(Map<String, dynamic> json) =>
    _$_HomesitePalette(
      version: json['version'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => HomesitePaletteColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HomesitePaletteToJson(_$_HomesitePalette instance) =>
    <String, dynamic>{
      'version': instance.version,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
