// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GimpPaletteColor _$$_GimpPaletteColorFromJson(Map<String, dynamic> json) =>
    _$_GimpPaletteColor(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_GimpPaletteColorToJson(_$_GimpPaletteColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'name': instance.name,
    };

_$_GimpPalette _$$_GimpPaletteFromJson(Map<String, dynamic> json) =>
    _$_GimpPalette(
      name: json['name'] as String,
      columns: json['columns'] as int?,
      comments: json['comments'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => GimpPaletteColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GimpPaletteToJson(_$_GimpPalette instance) =>
    <String, dynamic>{
      'name': instance.name,
      'columns': instance.columns,
      'comments': instance.comments,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
