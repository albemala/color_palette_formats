// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResourceInterchangeFileFormatColor
    _$$_ResourceInterchangeFileFormatColorFromJson(Map<String, dynamic> json) =>
        _$_ResourceInterchangeFileFormatColor(
          red: json['red'] as int,
          green: json['green'] as int,
          blue: json['blue'] as int,
        );

Map<String, dynamic> _$$_ResourceInterchangeFileFormatColorToJson(
        _$_ResourceInterchangeFileFormatColor instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
    };

_$_ResourceInterchangeFileFormat _$$_ResourceInterchangeFileFormatFromJson(
        Map<String, dynamic> json) =>
    _$_ResourceInterchangeFileFormat(
      version: json['version'] as int,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ResourceInterchangeFileFormatColor.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResourceInterchangeFileFormatToJson(
        _$_ResourceInterchangeFileFormat instance) =>
    <String, dynamic>{
      'version': instance.version,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
