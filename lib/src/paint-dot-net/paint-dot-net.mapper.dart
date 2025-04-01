// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'paint-dot-net.dart';

class PaintDotNetPaletteColorMapper
    extends ClassMapperBase<PaintDotNetPaletteColor> {
  PaintDotNetPaletteColorMapper._();

  static PaintDotNetPaletteColorMapper? _instance;
  static PaintDotNetPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PaintDotNetPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaintDotNetPaletteColor';

  static int _$red(PaintDotNetPaletteColor v) => v.red;
  static const Field<PaintDotNetPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(PaintDotNetPaletteColor v) => v.green;
  static const Field<PaintDotNetPaletteColor, int> _f$green =
      Field('green', _$green);
  static int _$blue(PaintDotNetPaletteColor v) => v.blue;
  static const Field<PaintDotNetPaletteColor, int> _f$blue =
      Field('blue', _$blue);
  static int _$alpha(PaintDotNetPaletteColor v) => v.alpha;
  static const Field<PaintDotNetPaletteColor, int> _f$alpha =
      Field('alpha', _$alpha);

  @override
  final MappableFields<PaintDotNetPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static PaintDotNetPaletteColor _instantiate(DecodingData data) {
    return PaintDotNetPaletteColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue),
        alpha: data.dec(_f$alpha));
  }

  @override
  final Function instantiate = _instantiate;

  static PaintDotNetPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaintDotNetPaletteColor>(map);
  }

  static PaintDotNetPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<PaintDotNetPaletteColor>(json);
  }
}

mixin PaintDotNetPaletteColorMappable {
  String toJson() {
    return PaintDotNetPaletteColorMapper.ensureInitialized()
        .encodeJson<PaintDotNetPaletteColor>(this as PaintDotNetPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return PaintDotNetPaletteColorMapper.ensureInitialized()
        .encodeMap<PaintDotNetPaletteColor>(this as PaintDotNetPaletteColor);
  }

  PaintDotNetPaletteColorCopyWith<PaintDotNetPaletteColor,
          PaintDotNetPaletteColor, PaintDotNetPaletteColor>
      get copyWith => _PaintDotNetPaletteColorCopyWithImpl<
              PaintDotNetPaletteColor, PaintDotNetPaletteColor>(
          this as PaintDotNetPaletteColor, $identity, $identity);
  @override
  String toString() {
    return PaintDotNetPaletteColorMapper.ensureInitialized()
        .stringifyValue(this as PaintDotNetPaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return PaintDotNetPaletteColorMapper.ensureInitialized()
        .equalsValue(this as PaintDotNetPaletteColor, other);
  }

  @override
  int get hashCode {
    return PaintDotNetPaletteColorMapper.ensureInitialized()
        .hashValue(this as PaintDotNetPaletteColor);
  }
}

extension PaintDotNetPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaintDotNetPaletteColor, $Out> {
  PaintDotNetPaletteColorCopyWith<$R, PaintDotNetPaletteColor, $Out>
      get $asPaintDotNetPaletteColor => $base.as((v, t, t2) =>
          _PaintDotNetPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaintDotNetPaletteColorCopyWith<
    $R,
    $In extends PaintDotNetPaletteColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue, int? alpha});
  PaintDotNetPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaintDotNetPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaintDotNetPaletteColor, $Out>
    implements
        PaintDotNetPaletteColorCopyWith<$R, PaintDotNetPaletteColor, $Out> {
  _PaintDotNetPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaintDotNetPaletteColor> $mapper =
      PaintDotNetPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue, int? alpha}) =>
      $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue,
        if (alpha != null) #alpha: alpha
      }));
  @override
  PaintDotNetPaletteColor $make(CopyWithData data) => PaintDotNetPaletteColor(
      red: data.get(#red, or: $value.red),
      green: data.get(#green, or: $value.green),
      blue: data.get(#blue, or: $value.blue),
      alpha: data.get(#alpha, or: $value.alpha));

  @override
  PaintDotNetPaletteColorCopyWith<$R2, PaintDotNetPaletteColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PaintDotNetPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PaintDotNetPaletteMapper extends ClassMapperBase<PaintDotNetPalette> {
  PaintDotNetPaletteMapper._();

  static PaintDotNetPaletteMapper? _instance;
  static PaintDotNetPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaintDotNetPaletteMapper._());
      PaintDotNetPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaintDotNetPalette';

  static List<PaintDotNetPaletteColor> _$colors(PaintDotNetPalette v) =>
      v.colors;
  static const Field<PaintDotNetPalette, List<PaintDotNetPaletteColor>>
      _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<PaintDotNetPalette> fields = const {
    #colors: _f$colors,
  };

  static PaintDotNetPalette _instantiate(DecodingData data) {
    return PaintDotNetPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static PaintDotNetPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaintDotNetPalette>(map);
  }

  static PaintDotNetPalette fromJson(String json) {
    return ensureInitialized().decodeJson<PaintDotNetPalette>(json);
  }
}

mixin PaintDotNetPaletteMappable {
  String toJson() {
    return PaintDotNetPaletteMapper.ensureInitialized()
        .encodeJson<PaintDotNetPalette>(this as PaintDotNetPalette);
  }

  Map<String, dynamic> toMap() {
    return PaintDotNetPaletteMapper.ensureInitialized()
        .encodeMap<PaintDotNetPalette>(this as PaintDotNetPalette);
  }

  PaintDotNetPaletteCopyWith<PaintDotNetPalette, PaintDotNetPalette,
          PaintDotNetPalette>
      get copyWith => _PaintDotNetPaletteCopyWithImpl<PaintDotNetPalette,
          PaintDotNetPalette>(this as PaintDotNetPalette, $identity, $identity);
  @override
  String toString() {
    return PaintDotNetPaletteMapper.ensureInitialized()
        .stringifyValue(this as PaintDotNetPalette);
  }

  @override
  bool operator ==(Object other) {
    return PaintDotNetPaletteMapper.ensureInitialized()
        .equalsValue(this as PaintDotNetPalette, other);
  }

  @override
  int get hashCode {
    return PaintDotNetPaletteMapper.ensureInitialized()
        .hashValue(this as PaintDotNetPalette);
  }
}

extension PaintDotNetPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaintDotNetPalette, $Out> {
  PaintDotNetPaletteCopyWith<$R, PaintDotNetPalette, $Out>
      get $asPaintDotNetPalette => $base.as(
          (v, t, t2) => _PaintDotNetPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaintDotNetPaletteCopyWith<$R, $In extends PaintDotNetPalette,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      PaintDotNetPaletteColor,
      PaintDotNetPaletteColorCopyWith<$R, PaintDotNetPaletteColor,
          PaintDotNetPaletteColor>> get colors;
  $R call({List<PaintDotNetPaletteColor>? colors});
  PaintDotNetPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaintDotNetPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaintDotNetPalette, $Out>
    implements PaintDotNetPaletteCopyWith<$R, PaintDotNetPalette, $Out> {
  _PaintDotNetPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaintDotNetPalette> $mapper =
      PaintDotNetPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      PaintDotNetPaletteColor,
      PaintDotNetPaletteColorCopyWith<$R, PaintDotNetPaletteColor,
          PaintDotNetPaletteColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({List<PaintDotNetPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  PaintDotNetPalette $make(CopyWithData data) =>
      PaintDotNetPalette(colors: data.get(#colors, or: $value.colors));

  @override
  PaintDotNetPaletteCopyWith<$R2, PaintDotNetPalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaintDotNetPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
