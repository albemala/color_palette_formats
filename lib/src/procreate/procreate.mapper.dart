// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'procreate.dart';

class ProcreateSwatchesColorSpaceMapper
    extends EnumMapper<ProcreateSwatchesColorSpace> {
  ProcreateSwatchesColorSpaceMapper._();

  static ProcreateSwatchesColorSpaceMapper? _instance;
  static ProcreateSwatchesColorSpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProcreateSwatchesColorSpaceMapper._());
    }
    return _instance!;
  }

  static ProcreateSwatchesColorSpace fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProcreateSwatchesColorSpace decode(dynamic value) {
    switch (value) {
      case 0:
        return ProcreateSwatchesColorSpace.hsb;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProcreateSwatchesColorSpace self) {
    switch (self) {
      case ProcreateSwatchesColorSpace.hsb:
        return 0;
    }
  }
}

extension ProcreateSwatchesColorSpaceMapperExtension
    on ProcreateSwatchesColorSpace {
  dynamic toValue() {
    ProcreateSwatchesColorSpaceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProcreateSwatchesColorSpace>(this);
  }
}

class ProcreateSwatchesSwatchMapper
    extends ClassMapperBase<ProcreateSwatchesSwatch> {
  ProcreateSwatchesSwatchMapper._();

  static ProcreateSwatchesSwatchMapper? _instance;
  static ProcreateSwatchesSwatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProcreateSwatchesSwatchMapper._());
      ProcreateSwatchesColorSpaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateSwatchesSwatch';

  static double _$hue(ProcreateSwatchesSwatch v) => v.hue;
  static const Field<ProcreateSwatchesSwatch, double> _f$hue =
      Field('hue', _$hue);
  static double _$saturation(ProcreateSwatchesSwatch v) => v.saturation;
  static const Field<ProcreateSwatchesSwatch, double> _f$saturation =
      Field('saturation', _$saturation);
  static double _$brightness(ProcreateSwatchesSwatch v) => v.brightness;
  static const Field<ProcreateSwatchesSwatch, double> _f$brightness =
      Field('brightness', _$brightness);
  static double _$alpha(ProcreateSwatchesSwatch v) => v.alpha;
  static const Field<ProcreateSwatchesSwatch, double> _f$alpha =
      Field('alpha', _$alpha);
  static ProcreateSwatchesColorSpace _$colorSpace(ProcreateSwatchesSwatch v) =>
      v.colorSpace;
  static const Field<ProcreateSwatchesSwatch, ProcreateSwatchesColorSpace>
      _f$colorSpace = Field('colorSpace', _$colorSpace);

  @override
  final MappableFields<ProcreateSwatchesSwatch> fields = const {
    #hue: _f$hue,
    #saturation: _f$saturation,
    #brightness: _f$brightness,
    #alpha: _f$alpha,
    #colorSpace: _f$colorSpace,
  };

  static ProcreateSwatchesSwatch _instantiate(DecodingData data) {
    return ProcreateSwatchesSwatch(
        hue: data.dec(_f$hue),
        saturation: data.dec(_f$saturation),
        brightness: data.dec(_f$brightness),
        alpha: data.dec(_f$alpha),
        colorSpace: data.dec(_f$colorSpace));
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateSwatchesSwatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateSwatchesSwatch>(map);
  }

  static ProcreateSwatchesSwatch fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateSwatchesSwatch>(json);
  }
}

mixin ProcreateSwatchesSwatchMappable {
  String toJson() {
    return ProcreateSwatchesSwatchMapper.ensureInitialized()
        .encodeJson<ProcreateSwatchesSwatch>(this as ProcreateSwatchesSwatch);
  }

  Map<String, dynamic> toMap() {
    return ProcreateSwatchesSwatchMapper.ensureInitialized()
        .encodeMap<ProcreateSwatchesSwatch>(this as ProcreateSwatchesSwatch);
  }

  ProcreateSwatchesSwatchCopyWith<ProcreateSwatchesSwatch,
          ProcreateSwatchesSwatch, ProcreateSwatchesSwatch>
      get copyWith => _ProcreateSwatchesSwatchCopyWithImpl(
          this as ProcreateSwatchesSwatch, $identity, $identity);
  @override
  String toString() {
    return ProcreateSwatchesSwatchMapper.ensureInitialized()
        .stringifyValue(this as ProcreateSwatchesSwatch);
  }

  @override
  bool operator ==(Object other) {
    return ProcreateSwatchesSwatchMapper.ensureInitialized()
        .equalsValue(this as ProcreateSwatchesSwatch, other);
  }

  @override
  int get hashCode {
    return ProcreateSwatchesSwatchMapper.ensureInitialized()
        .hashValue(this as ProcreateSwatchesSwatch);
  }
}

extension ProcreateSwatchesSwatchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateSwatchesSwatch, $Out> {
  ProcreateSwatchesSwatchCopyWith<$R, ProcreateSwatchesSwatch, $Out>
      get $asProcreateSwatchesSwatch => $base
          .as((v, t, t2) => _ProcreateSwatchesSwatchCopyWithImpl(v, t, t2));
}

abstract class ProcreateSwatchesSwatchCopyWith<
    $R,
    $In extends ProcreateSwatchesSwatch,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {double? hue,
      double? saturation,
      double? brightness,
      double? alpha,
      ProcreateSwatchesColorSpace? colorSpace});
  ProcreateSwatchesSwatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProcreateSwatchesSwatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateSwatchesSwatch, $Out>
    implements
        ProcreateSwatchesSwatchCopyWith<$R, ProcreateSwatchesSwatch, $Out> {
  _ProcreateSwatchesSwatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateSwatchesSwatch> $mapper =
      ProcreateSwatchesSwatchMapper.ensureInitialized();
  @override
  $R call(
          {double? hue,
          double? saturation,
          double? brightness,
          double? alpha,
          ProcreateSwatchesColorSpace? colorSpace}) =>
      $apply(FieldCopyWithData({
        if (hue != null) #hue: hue,
        if (saturation != null) #saturation: saturation,
        if (brightness != null) #brightness: brightness,
        if (alpha != null) #alpha: alpha,
        if (colorSpace != null) #colorSpace: colorSpace
      }));
  @override
  ProcreateSwatchesSwatch $make(CopyWithData data) => ProcreateSwatchesSwatch(
      hue: data.get(#hue, or: $value.hue),
      saturation: data.get(#saturation, or: $value.saturation),
      brightness: data.get(#brightness, or: $value.brightness),
      alpha: data.get(#alpha, or: $value.alpha),
      colorSpace: data.get(#colorSpace, or: $value.colorSpace));

  @override
  ProcreateSwatchesSwatchCopyWith<$R2, ProcreateSwatchesSwatch, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProcreateSwatchesSwatchCopyWithImpl($value, $cast, t);
}

class ProcreateSwatchesMapper extends ClassMapperBase<ProcreateSwatches> {
  ProcreateSwatchesMapper._();

  static ProcreateSwatchesMapper? _instance;
  static ProcreateSwatchesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateSwatchesMapper._());
      ProcreateSwatchesSwatchMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateSwatches';

  static String _$name(ProcreateSwatches v) => v.name;
  static const Field<ProcreateSwatches, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static List<ProcreateSwatchesSwatch> _$swatches(ProcreateSwatches v) =>
      v.swatches;
  static const Field<ProcreateSwatches, List<ProcreateSwatchesSwatch>>
      _f$swatches = Field('swatches', _$swatches);

  @override
  final MappableFields<ProcreateSwatches> fields = const {
    #name: _f$name,
    #swatches: _f$swatches,
  };

  static ProcreateSwatches _instantiate(DecodingData data) {
    return ProcreateSwatches(
        name: data.dec(_f$name), swatches: data.dec(_f$swatches));
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateSwatches fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateSwatches>(map);
  }

  static ProcreateSwatches fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateSwatches>(json);
  }
}

mixin ProcreateSwatchesMappable {
  String toJson() {
    return ProcreateSwatchesMapper.ensureInitialized()
        .encodeJson<ProcreateSwatches>(this as ProcreateSwatches);
  }

  Map<String, dynamic> toMap() {
    return ProcreateSwatchesMapper.ensureInitialized()
        .encodeMap<ProcreateSwatches>(this as ProcreateSwatches);
  }

  ProcreateSwatchesCopyWith<ProcreateSwatches, ProcreateSwatches,
          ProcreateSwatches>
      get copyWith => _ProcreateSwatchesCopyWithImpl(
          this as ProcreateSwatches, $identity, $identity);
  @override
  String toString() {
    return ProcreateSwatchesMapper.ensureInitialized()
        .stringifyValue(this as ProcreateSwatches);
  }

  @override
  bool operator ==(Object other) {
    return ProcreateSwatchesMapper.ensureInitialized()
        .equalsValue(this as ProcreateSwatches, other);
  }

  @override
  int get hashCode {
    return ProcreateSwatchesMapper.ensureInitialized()
        .hashValue(this as ProcreateSwatches);
  }
}

extension ProcreateSwatchesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateSwatches, $Out> {
  ProcreateSwatchesCopyWith<$R, ProcreateSwatches, $Out>
      get $asProcreateSwatches =>
          $base.as((v, t, t2) => _ProcreateSwatchesCopyWithImpl(v, t, t2));
}

abstract class ProcreateSwatchesCopyWith<$R, $In extends ProcreateSwatches,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ProcreateSwatchesSwatch,
      ProcreateSwatchesSwatchCopyWith<$R, ProcreateSwatchesSwatch,
          ProcreateSwatchesSwatch>> get swatches;
  $R call({String? name, List<ProcreateSwatchesSwatch>? swatches});
  ProcreateSwatchesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProcreateSwatchesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateSwatches, $Out>
    implements ProcreateSwatchesCopyWith<$R, ProcreateSwatches, $Out> {
  _ProcreateSwatchesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateSwatches> $mapper =
      ProcreateSwatchesMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ProcreateSwatchesSwatch,
      ProcreateSwatchesSwatchCopyWith<$R, ProcreateSwatchesSwatch,
          ProcreateSwatchesSwatch>> get swatches => ListCopyWith(
      $value.swatches,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(swatches: v));
  @override
  $R call({String? name, List<ProcreateSwatchesSwatch>? swatches}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (swatches != null) #swatches: swatches
      }));
  @override
  ProcreateSwatches $make(CopyWithData data) => ProcreateSwatches(
      name: data.get(#name, or: $value.name),
      swatches: data.get(#swatches, or: $value.swatches));

  @override
  ProcreateSwatchesCopyWith<$R2, ProcreateSwatches, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProcreateSwatchesCopyWithImpl($value, $cast, t);
}
