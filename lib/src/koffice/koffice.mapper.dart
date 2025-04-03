// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'koffice.dart';

class KOfficePaletteColorMapper extends ClassMapperBase<KOfficePaletteColor> {
  KOfficePaletteColorMapper._();

  static KOfficePaletteColorMapper? _instance;
  static KOfficePaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KOfficePaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'KOfficePaletteColor';

  static int _$r(KOfficePaletteColor v) => v.r;
  static const Field<KOfficePaletteColor, int> _f$r = Field('r', _$r);
  static int _$g(KOfficePaletteColor v) => v.g;
  static const Field<KOfficePaletteColor, int> _f$g = Field('g', _$g);
  static int _$b(KOfficePaletteColor v) => v.b;
  static const Field<KOfficePaletteColor, int> _f$b = Field('b', _$b);
  static String _$name(KOfficePaletteColor v) => v.name;
  static const Field<KOfficePaletteColor, String> _f$name =
      Field('name', _$name);

  @override
  final MappableFields<KOfficePaletteColor> fields = const {
    #r: _f$r,
    #g: _f$g,
    #b: _f$b,
    #name: _f$name,
  };

  static KOfficePaletteColor _instantiate(DecodingData data) {
    return KOfficePaletteColor(
        r: data.dec(_f$r),
        g: data.dec(_f$g),
        b: data.dec(_f$b),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static KOfficePaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KOfficePaletteColor>(map);
  }

  static KOfficePaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<KOfficePaletteColor>(json);
  }
}

mixin KOfficePaletteColorMappable {
  String toJson() {
    return KOfficePaletteColorMapper.ensureInitialized()
        .encodeJson<KOfficePaletteColor>(this as KOfficePaletteColor);
  }

  Map<String, dynamic> toMap() {
    return KOfficePaletteColorMapper.ensureInitialized()
        .encodeMap<KOfficePaletteColor>(this as KOfficePaletteColor);
  }

  KOfficePaletteColorCopyWith<KOfficePaletteColor, KOfficePaletteColor,
      KOfficePaletteColor> get copyWith => _KOfficePaletteColorCopyWithImpl<
          KOfficePaletteColor, KOfficePaletteColor>(
      this as KOfficePaletteColor, $identity, $identity);
  @override
  String toString() {
    return KOfficePaletteColorMapper.ensureInitialized()
        .stringifyValue(this as KOfficePaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return KOfficePaletteColorMapper.ensureInitialized()
        .equalsValue(this as KOfficePaletteColor, other);
  }

  @override
  int get hashCode {
    return KOfficePaletteColorMapper.ensureInitialized()
        .hashValue(this as KOfficePaletteColor);
  }
}

extension KOfficePaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KOfficePaletteColor, $Out> {
  KOfficePaletteColorCopyWith<$R, KOfficePaletteColor, $Out>
      get $asKOfficePaletteColor => $base.as(
          (v, t, t2) => _KOfficePaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KOfficePaletteColorCopyWith<$R, $In extends KOfficePaletteColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? r, int? g, int? b, String? name});
  KOfficePaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KOfficePaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KOfficePaletteColor, $Out>
    implements KOfficePaletteColorCopyWith<$R, KOfficePaletteColor, $Out> {
  _KOfficePaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KOfficePaletteColor> $mapper =
      KOfficePaletteColorMapper.ensureInitialized();
  @override
  $R call({int? r, int? g, int? b, String? name}) => $apply(FieldCopyWithData({
        if (r != null) #r: r,
        if (g != null) #g: g,
        if (b != null) #b: b,
        if (name != null) #name: name
      }));
  @override
  KOfficePaletteColor $make(CopyWithData data) => KOfficePaletteColor(
      r: data.get(#r, or: $value.r),
      g: data.get(#g, or: $value.g),
      b: data.get(#b, or: $value.b),
      name: data.get(#name, or: $value.name));

  @override
  KOfficePaletteColorCopyWith<$R2, KOfficePaletteColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _KOfficePaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KOfficePaletteMapper extends ClassMapperBase<KOfficePalette> {
  KOfficePaletteMapper._();

  static KOfficePaletteMapper? _instance;
  static KOfficePaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KOfficePaletteMapper._());
      KOfficePaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KOfficePalette';

  static List<KOfficePaletteColor> _$colors(KOfficePalette v) => v.colors;
  static const Field<KOfficePalette, List<KOfficePaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<KOfficePalette> fields = const {
    #colors: _f$colors,
  };

  static KOfficePalette _instantiate(DecodingData data) {
    return KOfficePalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static KOfficePalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KOfficePalette>(map);
  }

  static KOfficePalette fromJson(String json) {
    return ensureInitialized().decodeJson<KOfficePalette>(json);
  }
}

mixin KOfficePaletteMappable {
  String toJson() {
    return KOfficePaletteMapper.ensureInitialized()
        .encodeJson<KOfficePalette>(this as KOfficePalette);
  }

  Map<String, dynamic> toMap() {
    return KOfficePaletteMapper.ensureInitialized()
        .encodeMap<KOfficePalette>(this as KOfficePalette);
  }

  KOfficePaletteCopyWith<KOfficePalette, KOfficePalette, KOfficePalette>
      get copyWith =>
          _KOfficePaletteCopyWithImpl<KOfficePalette, KOfficePalette>(
              this as KOfficePalette, $identity, $identity);
  @override
  String toString() {
    return KOfficePaletteMapper.ensureInitialized()
        .stringifyValue(this as KOfficePalette);
  }

  @override
  bool operator ==(Object other) {
    return KOfficePaletteMapper.ensureInitialized()
        .equalsValue(this as KOfficePalette, other);
  }

  @override
  int get hashCode {
    return KOfficePaletteMapper.ensureInitialized()
        .hashValue(this as KOfficePalette);
  }
}

extension KOfficePaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KOfficePalette, $Out> {
  KOfficePaletteCopyWith<$R, KOfficePalette, $Out> get $asKOfficePalette =>
      $base.as((v, t, t2) => _KOfficePaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KOfficePaletteCopyWith<$R, $In extends KOfficePalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      KOfficePaletteColor,
      KOfficePaletteColorCopyWith<$R, KOfficePaletteColor,
          KOfficePaletteColor>> get colors;
  $R call({List<KOfficePaletteColor>? colors});
  KOfficePaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KOfficePaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KOfficePalette, $Out>
    implements KOfficePaletteCopyWith<$R, KOfficePalette, $Out> {
  _KOfficePaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KOfficePalette> $mapper =
      KOfficePaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      KOfficePaletteColor,
      KOfficePaletteColorCopyWith<$R, KOfficePaletteColor,
          KOfficePaletteColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({List<KOfficePaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  KOfficePalette $make(CopyWithData data) =>
      KOfficePalette(colors: data.get(#colors, or: $value.colors));

  @override
  KOfficePaletteCopyWith<$R2, KOfficePalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KOfficePaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
