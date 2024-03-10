// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'aco.dart';

class AdobeColorSwatchColorSpaceMapper
    extends EnumMapper<AdobeColorSwatchColorSpace> {
  AdobeColorSwatchColorSpaceMapper._();

  static AdobeColorSwatchColorSpaceMapper? _instance;
  static AdobeColorSwatchColorSpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeColorSwatchColorSpaceMapper._());
    }
    return _instance!;
  }

  static AdobeColorSwatchColorSpace fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdobeColorSwatchColorSpace decode(dynamic value) {
    switch (value) {
      case 'rgb':
        return AdobeColorSwatchColorSpace.rgb;
      case 'hsb':
        return AdobeColorSwatchColorSpace.hsb;
      case 'cmyk':
        return AdobeColorSwatchColorSpace.cmyk;
      case 'lab':
        return AdobeColorSwatchColorSpace.lab;
      case 'grayscale':
        return AdobeColorSwatchColorSpace.grayscale;
      case 'wideCmyk':
        return AdobeColorSwatchColorSpace.wideCmyk;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdobeColorSwatchColorSpace self) {
    switch (self) {
      case AdobeColorSwatchColorSpace.rgb:
        return 'rgb';
      case AdobeColorSwatchColorSpace.hsb:
        return 'hsb';
      case AdobeColorSwatchColorSpace.cmyk:
        return 'cmyk';
      case AdobeColorSwatchColorSpace.lab:
        return 'lab';
      case AdobeColorSwatchColorSpace.grayscale:
        return 'grayscale';
      case AdobeColorSwatchColorSpace.wideCmyk:
        return 'wideCmyk';
    }
  }
}

extension AdobeColorSwatchColorSpaceMapperExtension
    on AdobeColorSwatchColorSpace {
  String toValue() {
    AdobeColorSwatchColorSpaceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdobeColorSwatchColorSpace>(this)
        as String;
  }
}

class AdobeColorSwatchColorMapper
    extends ClassMapperBase<AdobeColorSwatchColor> {
  AdobeColorSwatchColorMapper._();

  static AdobeColorSwatchColorMapper? _instance;
  static AdobeColorSwatchColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorSwatchColorMapper._());
      AdobeColorSwatchColorSpaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorSwatchColor';

  static AdobeColorSwatchColorSpace _$colorSpace(AdobeColorSwatchColor v) =>
      v.colorSpace;
  static const Field<AdobeColorSwatchColor, AdobeColorSwatchColorSpace>
      _f$colorSpace = Field('colorSpace', _$colorSpace);
  static List<int> _$values(AdobeColorSwatchColor v) => v.values;
  static const Field<AdobeColorSwatchColor, List<int>> _f$values =
      Field('values', _$values);

  @override
  final MappableFields<AdobeColorSwatchColor> fields = const {
    #colorSpace: _f$colorSpace,
    #values: _f$values,
  };

  static AdobeColorSwatchColor _instantiate(DecodingData data) {
    return AdobeColorSwatchColor(
        colorSpace: data.dec(_f$colorSpace), values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorSwatchColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorSwatchColor>(map);
  }

  static AdobeColorSwatchColor fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorSwatchColor>(json);
  }
}

mixin AdobeColorSwatchColorMappable {
  String toJson() {
    return AdobeColorSwatchColorMapper.ensureInitialized()
        .encodeJson<AdobeColorSwatchColor>(this as AdobeColorSwatchColor);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorSwatchColorMapper.ensureInitialized()
        .encodeMap<AdobeColorSwatchColor>(this as AdobeColorSwatchColor);
  }

  AdobeColorSwatchColorCopyWith<AdobeColorSwatchColor, AdobeColorSwatchColor,
          AdobeColorSwatchColor>
      get copyWith => _AdobeColorSwatchColorCopyWithImpl(
          this as AdobeColorSwatchColor, $identity, $identity);
  @override
  String toString() {
    return AdobeColorSwatchColorMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorSwatchColor);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AdobeColorSwatchColorMapper.ensureInitialized()
                .isValueEqual(this as AdobeColorSwatchColor, other));
  }

  @override
  int get hashCode {
    return AdobeColorSwatchColorMapper.ensureInitialized()
        .hashValue(this as AdobeColorSwatchColor);
  }
}

extension AdobeColorSwatchColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorSwatchColor, $Out> {
  AdobeColorSwatchColorCopyWith<$R, AdobeColorSwatchColor, $Out>
      get $asAdobeColorSwatchColor =>
          $base.as((v, t, t2) => _AdobeColorSwatchColorCopyWithImpl(v, t, t2));
}

abstract class AdobeColorSwatchColorCopyWith<
    $R,
    $In extends AdobeColorSwatchColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values;
  $R call({AdobeColorSwatchColorSpace? colorSpace, List<int>? values});
  AdobeColorSwatchColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorSwatchColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorSwatchColor, $Out>
    implements AdobeColorSwatchColorCopyWith<$R, AdobeColorSwatchColor, $Out> {
  _AdobeColorSwatchColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorSwatchColor> $mapper =
      AdobeColorSwatchColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call({AdobeColorSwatchColorSpace? colorSpace, List<int>? values}) =>
      $apply(FieldCopyWithData({
        if (colorSpace != null) #colorSpace: colorSpace,
        if (values != null) #values: values
      }));
  @override
  AdobeColorSwatchColor $make(CopyWithData data) => AdobeColorSwatchColor(
      colorSpace: data.get(#colorSpace, or: $value.colorSpace),
      values: data.get(#values, or: $value.values));

  @override
  AdobeColorSwatchColorCopyWith<$R2, AdobeColorSwatchColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeColorSwatchColorCopyWithImpl($value, $cast, t);
}

class AdobeColorSwatchMapper extends ClassMapperBase<AdobeColorSwatch> {
  AdobeColorSwatchMapper._();

  static AdobeColorSwatchMapper? _instance;
  static AdobeColorSwatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorSwatchMapper._());
      AdobeColorSwatchColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorSwatch';

  static int _$version(AdobeColorSwatch v) => v.version;
  static const Field<AdobeColorSwatch, int> _f$version =
      Field('version', _$version);
  static List<AdobeColorSwatchColor> _$colors(AdobeColorSwatch v) => v.colors;
  static const Field<AdobeColorSwatch, List<AdobeColorSwatchColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<AdobeColorSwatch> fields = const {
    #version: _f$version,
    #colors: _f$colors,
  };

  static AdobeColorSwatch _instantiate(DecodingData data) {
    return AdobeColorSwatch(
        version: data.dec(_f$version), colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorSwatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorSwatch>(map);
  }

  static AdobeColorSwatch fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorSwatch>(json);
  }
}

mixin AdobeColorSwatchMappable {
  String toJson() {
    return AdobeColorSwatchMapper.ensureInitialized()
        .encodeJson<AdobeColorSwatch>(this as AdobeColorSwatch);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorSwatchMapper.ensureInitialized()
        .encodeMap<AdobeColorSwatch>(this as AdobeColorSwatch);
  }

  AdobeColorSwatchCopyWith<AdobeColorSwatch, AdobeColorSwatch, AdobeColorSwatch>
      get copyWith => _AdobeColorSwatchCopyWithImpl(
          this as AdobeColorSwatch, $identity, $identity);
  @override
  String toString() {
    return AdobeColorSwatchMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorSwatch);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AdobeColorSwatchMapper.ensureInitialized()
                .isValueEqual(this as AdobeColorSwatch, other));
  }

  @override
  int get hashCode {
    return AdobeColorSwatchMapper.ensureInitialized()
        .hashValue(this as AdobeColorSwatch);
  }
}

extension AdobeColorSwatchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorSwatch, $Out> {
  AdobeColorSwatchCopyWith<$R, AdobeColorSwatch, $Out>
      get $asAdobeColorSwatch =>
          $base.as((v, t, t2) => _AdobeColorSwatchCopyWithImpl(v, t, t2));
}

abstract class AdobeColorSwatchCopyWith<$R, $In extends AdobeColorSwatch, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      AdobeColorSwatchColor,
      AdobeColorSwatchColorCopyWith<$R, AdobeColorSwatchColor,
          AdobeColorSwatchColor>> get colors;
  $R call({int? version, List<AdobeColorSwatchColor>? colors});
  AdobeColorSwatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorSwatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorSwatch, $Out>
    implements AdobeColorSwatchCopyWith<$R, AdobeColorSwatch, $Out> {
  _AdobeColorSwatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorSwatch> $mapper =
      AdobeColorSwatchMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      AdobeColorSwatchColor,
      AdobeColorSwatchColorCopyWith<$R, AdobeColorSwatchColor,
          AdobeColorSwatchColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({int? version, List<AdobeColorSwatchColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (colors != null) #colors: colors
      }));
  @override
  AdobeColorSwatch $make(CopyWithData data) => AdobeColorSwatch(
      version: data.get(#version, or: $value.version),
      colors: data.get(#colors, or: $value.colors));

  @override
  AdobeColorSwatchCopyWith<$R2, AdobeColorSwatch, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdobeColorSwatchCopyWithImpl($value, $cast, t);
}
