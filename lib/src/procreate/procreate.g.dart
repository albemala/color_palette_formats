// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procreate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProcreateSwatchesSwatch _$$_ProcreateSwatchesSwatchFromJson(
        Map<String, dynamic> json) =>
    _$_ProcreateSwatchesSwatch(
      hue: (json['hue'] as num).toDouble(),
      saturation: (json['saturation'] as num).toDouble(),
      brightness: (json['brightness'] as num).toDouble(),
      alpha: (json['alpha'] as num).toDouble(),
      colorSpace: _toColorSpace(json['colorSpace'] as int),
    );

Map<String, dynamic> _$$_ProcreateSwatchesSwatchToJson(
        _$_ProcreateSwatchesSwatch instance) =>
    <String, dynamic>{
      'hue': instance.hue,
      'saturation': instance.saturation,
      'brightness': instance.brightness,
      'alpha': instance.alpha,
      'colorSpace': _fromColorSpace(instance.colorSpace),
    };

_$_ProcreateSwatches _$$_ProcreateSwatchesFromJson(Map<String, dynamic> json) =>
    _$_ProcreateSwatches(
      name: json['name'] as String,
      swatches: (json['swatches'] as List<dynamic>)
          .map((e) =>
              ProcreateSwatchesSwatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProcreateSwatchesToJson(
        _$_ProcreateSwatches instance) =>
    <String, dynamic>{
      'name': instance.name,
      'swatches': instance.swatches,
    };
