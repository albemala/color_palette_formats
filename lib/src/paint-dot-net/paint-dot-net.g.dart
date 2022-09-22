// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paint-dot-net.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaintDotNetPaletteColor _$$_PaintDotNetPaletteColorFromJson(
        Map<String, dynamic> json) =>
    _$_PaintDotNetPaletteColor(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
      alpha: json['alpha'] as int,
    );

Map<String, dynamic> _$$_PaintDotNetPaletteColorToJson(
        _$_PaintDotNetPaletteColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'alpha': instance.alpha,
    };

_$_PaintDotNetPalette _$$_PaintDotNetPaletteFromJson(
        Map<String, dynamic> json) =>
    _$_PaintDotNetPalette(
      colors: (json['colors'] as List<dynamic>)
          .map((e) =>
              PaintDotNetPaletteColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaintDotNetPaletteToJson(
        _$_PaintDotNetPalette instance) =>
    <String, dynamic>{
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
