// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdobeColorBookColor _$$_AdobeColorBookColorFromJson(
        Map<String, dynamic> json) =>
    _$_AdobeColorBookColor(
      name: json['name'] as String,
      code: json['code'] as String,
      values: (json['values'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_AdobeColorBookColorToJson(
        _$_AdobeColorBookColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'values': instance.values,
    };

_$_AdobeColorBook _$$_AdobeColorBookFromJson(Map<String, dynamic> json) =>
    _$_AdobeColorBook(
      version: json['version'] as int,
      identifier: json['identifier'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      colorNamePrefix: json['colorNamePrefix'] as String,
      colorNameSuffix: json['colorNameSuffix'] as String,
      colorCount: json['colorCount'] as int,
      pageSize: json['pageSize'] as int,
      pageSelectorOffset: json['pageSelectorOffset'] as int,
      colorSpace:
          $enumDecode(_$AdobeColorBookColorSpaceEnumMap, json['colorSpace']),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => AdobeColorBookColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdobeColorBookToJson(_$_AdobeColorBook instance) =>
    <String, dynamic>{
      'version': instance.version,
      'identifier': instance.identifier,
      'title': instance.title,
      'description': instance.description,
      'colorNamePrefix': instance.colorNamePrefix,
      'colorNameSuffix': instance.colorNameSuffix,
      'colorCount': instance.colorCount,
      'pageSize': instance.pageSize,
      'pageSelectorOffset': instance.pageSelectorOffset,
      'colorSpace': _$AdobeColorBookColorSpaceEnumMap[instance.colorSpace]!,
      'colors': instance.colors,
    };

const _$AdobeColorBookColorSpaceEnumMap = {
  AdobeColorBookColorSpace.rgb: 'rgb',
  AdobeColorBookColorSpace.hsb: 'hsb',
  AdobeColorBookColorSpace.cmyk: 'cmyk',
  AdobeColorBookColorSpace.pantone: 'pantone',
  AdobeColorBookColorSpace.focoltone: 'focoltone',
  AdobeColorBookColorSpace.trumatch: 'trumatch',
  AdobeColorBookColorSpace.toyo: 'toyo',
  AdobeColorBookColorSpace.lab: 'lab',
  AdobeColorBookColorSpace.grayscale: 'grayscale',
  AdobeColorBookColorSpace.hks: 'hks',
};
