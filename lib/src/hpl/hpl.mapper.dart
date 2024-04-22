// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hpl.dart';

class HomesitePaletteColorMapper extends ClassMapperBase<HomesitePaletteColor> {
  HomesitePaletteColorMapper._();

  static HomesitePaletteColorMapper? _instance;
  static HomesitePaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomesitePaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HomesitePaletteColor';

  static int _$red(HomesitePaletteColor v) => v.red;
  static const Field<HomesitePaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(HomesitePaletteColor v) => v.green;
  static const Field<HomesitePaletteColor, int> _f$green =
      Field('green', _$green);
  static int _$blue(HomesitePaletteColor v) => v.blue;
  static const Field<HomesitePaletteColor, int> _f$blue = Field('blue', _$blue);

  @override
  final MappableFields<HomesitePaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static HomesitePaletteColor _instantiate(DecodingData data) {
    return HomesitePaletteColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue));
  }

  @override
  final Function instantiate = _instantiate;

  static HomesitePaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomesitePaletteColor>(map);
  }

  static HomesitePaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<HomesitePaletteColor>(json);
  }
}

mixin HomesitePaletteColorMappable {
  String toJson() {
    return HomesitePaletteColorMapper.ensureInitialized()
        .encodeJson<HomesitePaletteColor>(this as HomesitePaletteColor);
  }

  Map<String, dynamic> toMap() {
    return HomesitePaletteColorMapper.ensureInitialized()
        .encodeMap<HomesitePaletteColor>(this as HomesitePaletteColor);
  }

  HomesitePaletteColorCopyWith<HomesitePaletteColor, HomesitePaletteColor,
          HomesitePaletteColor>
      get copyWith => _HomesitePaletteColorCopyWithImpl(
          this as HomesitePaletteColor, $identity, $identity);
  @override
  String toString() {
    return HomesitePaletteColorMapper.ensureInitialized()
        .stringifyValue(this as HomesitePaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return HomesitePaletteColorMapper.ensureInitialized()
        .equalsValue(this as HomesitePaletteColor, other);
  }

  @override
  int get hashCode {
    return HomesitePaletteColorMapper.ensureInitialized()
        .hashValue(this as HomesitePaletteColor);
  }
}

extension HomesitePaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomesitePaletteColor, $Out> {
  HomesitePaletteColorCopyWith<$R, HomesitePaletteColor, $Out>
      get $asHomesitePaletteColor =>
          $base.as((v, t, t2) => _HomesitePaletteColorCopyWithImpl(v, t, t2));
}

abstract class HomesitePaletteColorCopyWith<
    $R,
    $In extends HomesitePaletteColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  HomesitePaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HomesitePaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomesitePaletteColor, $Out>
    implements HomesitePaletteColorCopyWith<$R, HomesitePaletteColor, $Out> {
  _HomesitePaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomesitePaletteColor> $mapper =
      HomesitePaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue
      }));
  @override
  HomesitePaletteColor $make(CopyWithData data) => HomesitePaletteColor(
      red: data.get(#red, or: $value.red),
      green: data.get(#green, or: $value.green),
      blue: data.get(#blue, or: $value.blue));

  @override
  HomesitePaletteColorCopyWith<$R2, HomesitePaletteColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HomesitePaletteColorCopyWithImpl($value, $cast, t);
}

class HomesitePaletteMapper extends ClassMapperBase<HomesitePalette> {
  HomesitePaletteMapper._();

  static HomesitePaletteMapper? _instance;
  static HomesitePaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomesitePaletteMapper._());
      HomesitePaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomesitePalette';

  static String _$version(HomesitePalette v) => v.version;
  static const Field<HomesitePalette, String> _f$version =
      Field('version', _$version);
  static List<HomesitePaletteColor> _$colors(HomesitePalette v) => v.colors;
  static const Field<HomesitePalette, List<HomesitePaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<HomesitePalette> fields = const {
    #version: _f$version,
    #colors: _f$colors,
  };

  static HomesitePalette _instantiate(DecodingData data) {
    return HomesitePalette(
        version: data.dec(_f$version), colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static HomesitePalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomesitePalette>(map);
  }

  static HomesitePalette fromJson(String json) {
    return ensureInitialized().decodeJson<HomesitePalette>(json);
  }
}

mixin HomesitePaletteMappable {
  String toJson() {
    return HomesitePaletteMapper.ensureInitialized()
        .encodeJson<HomesitePalette>(this as HomesitePalette);
  }

  Map<String, dynamic> toMap() {
    return HomesitePaletteMapper.ensureInitialized()
        .encodeMap<HomesitePalette>(this as HomesitePalette);
  }

  HomesitePaletteCopyWith<HomesitePalette, HomesitePalette, HomesitePalette>
      get copyWith => _HomesitePaletteCopyWithImpl(
          this as HomesitePalette, $identity, $identity);
  @override
  String toString() {
    return HomesitePaletteMapper.ensureInitialized()
        .stringifyValue(this as HomesitePalette);
  }

  @override
  bool operator ==(Object other) {
    return HomesitePaletteMapper.ensureInitialized()
        .equalsValue(this as HomesitePalette, other);
  }

  @override
  int get hashCode {
    return HomesitePaletteMapper.ensureInitialized()
        .hashValue(this as HomesitePalette);
  }
}

extension HomesitePaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomesitePalette, $Out> {
  HomesitePaletteCopyWith<$R, HomesitePalette, $Out> get $asHomesitePalette =>
      $base.as((v, t, t2) => _HomesitePaletteCopyWithImpl(v, t, t2));
}

abstract class HomesitePaletteCopyWith<$R, $In extends HomesitePalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      HomesitePaletteColor,
      HomesitePaletteColorCopyWith<$R, HomesitePaletteColor,
          HomesitePaletteColor>> get colors;
  $R call({String? version, List<HomesitePaletteColor>? colors});
  HomesitePaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HomesitePaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomesitePalette, $Out>
    implements HomesitePaletteCopyWith<$R, HomesitePalette, $Out> {
  _HomesitePaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomesitePalette> $mapper =
      HomesitePaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      HomesitePaletteColor,
      HomesitePaletteColorCopyWith<$R, HomesitePaletteColor,
          HomesitePaletteColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({String? version, List<HomesitePaletteColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (colors != null) #colors: colors
      }));
  @override
  HomesitePalette $make(CopyWithData data) => HomesitePalette(
      version: data.get(#version, or: $value.version),
      colors: data.get(#colors, or: $value.colors));

  @override
  HomesitePaletteCopyWith<$R2, HomesitePalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomesitePaletteCopyWithImpl($value, $cast, t);
}
