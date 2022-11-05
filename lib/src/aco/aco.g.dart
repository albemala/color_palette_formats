// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aco.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdobeColorSwatchColor _$$_AdobeColorSwatchColorFromJson(
        Map<String, dynamic> json) =>
    _$_AdobeColorSwatchColor(
      colorSpace:
          $enumDecode(_$AdobeColorSwatchColorSpaceEnumMap, json['colorSpace']),
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_AdobeColorSwatchColorToJson(
        _$_AdobeColorSwatchColor instance) =>
    <String, dynamic>{
      'colorSpace': _$AdobeColorSwatchColorSpaceEnumMap[instance.colorSpace]!,
      'values': instance.values,
    };

const _$AdobeColorSwatchColorSpaceEnumMap = {
  AdobeColorSwatchColorSpace.rgb: 'rgb',
  AdobeColorSwatchColorSpace.hsb: 'hsb',
  AdobeColorSwatchColorSpace.cmyk: 'cmyk',
  AdobeColorSwatchColorSpace.lab: 'lab',
  AdobeColorSwatchColorSpace.grayscale: 'grayscale',
  AdobeColorSwatchColorSpace.wideCmyk: 'wideCmyk',
};

_$_AdobeColorSwatch _$$_AdobeColorSwatchFromJson(Map<String, dynamic> json) =>
    _$_AdobeColorSwatch(
      version: json['version'] as int,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => AdobeColorSwatchColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdobeColorSwatchToJson(_$_AdobeColorSwatch instance) =>
    <String, dynamic>{
      'version': instance.version,
      'colors': instance.colors,
    };
