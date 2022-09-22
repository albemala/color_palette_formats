// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdobeSwatchExchangeColor _$$_AdobeSwatchExchangeColorFromJson(
        Map<String, dynamic> json) =>
    _$_AdobeSwatchExchangeColor(
      name: json['name'] as String,
      model: $enumDecode(_$AdobeSwatchExchangeColorModelEnumMap, json['model']),
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      type: $enumDecode(_$AdobeSwatchExchangeColorTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_AdobeSwatchExchangeColorToJson(
        _$_AdobeSwatchExchangeColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': _$AdobeSwatchExchangeColorModelEnumMap[instance.model]!,
      'values': instance.values,
      'type': _$AdobeSwatchExchangeColorTypeEnumMap[instance.type]!,
    };

const _$AdobeSwatchExchangeColorModelEnumMap = {
  AdobeSwatchExchangeColorModel.rgb: 'rgb',
  AdobeSwatchExchangeColorModel.cmyk: 'cmyk',
  AdobeSwatchExchangeColorModel.gray: 'gray',
};

const _$AdobeSwatchExchangeColorTypeEnumMap = {
  AdobeSwatchExchangeColorType.global: 'global',
  AdobeSwatchExchangeColorType.spot: 'spot',
  AdobeSwatchExchangeColorType.normal: 'normal',
};

_$_AdobeSwatchExchange _$$_AdobeSwatchExchangeFromJson(
        Map<String, dynamic> json) =>
    _$_AdobeSwatchExchange(
      version: json['version'] as String,
      groups: json['groups'] as List<dynamic>,
      colors: (json['colors'] as List<dynamic>)
          .map((e) =>
              AdobeSwatchExchangeColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdobeSwatchExchangeToJson(
        _$_AdobeSwatchExchange instance) =>
    <String, dynamic>{
      'version': instance.version,
      'groups': instance.groups,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
    };
