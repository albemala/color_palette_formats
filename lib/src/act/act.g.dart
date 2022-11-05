// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdobeColorTableColor _$$_AdobeColorTableColorFromJson(
        Map<String, dynamic> json) =>
    _$_AdobeColorTableColor(
      green: json['green'] as int,
      blue: json['blue'] as int,
      red: json['red'] as int,
    );

Map<String, dynamic> _$$_AdobeColorTableColorToJson(
        _$_AdobeColorTableColor instance) =>
    <String, dynamic>{
      'green': instance.green,
      'blue': instance.blue,
      'red': instance.red,
    };

_$_AdobeColorTable _$$_AdobeColorTableFromJson(Map<String, dynamic> json) =>
    _$_AdobeColorTable(
      colors: (json['colors'] as List<dynamic>)
          .map((e) => AdobeColorTableColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdobeColorTableToJson(_$_AdobeColorTable instance) =>
    <String, dynamic>{
      'colors': instance.colors,
    };
