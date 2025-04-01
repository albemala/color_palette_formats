// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sketchpalette.dart';

class SketchPaletteColorMapper extends ClassMapperBase<SketchPaletteColor> {
  SketchPaletteColorMapper._();

  static SketchPaletteColorMapper? _instance;
  static SketchPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SketchPaletteColor';

  static double _$red(SketchPaletteColor v) => v.red;
  static const Field<SketchPaletteColor, double> _f$red = Field('red', _$red);
  static double _$green(SketchPaletteColor v) => v.green;
  static const Field<SketchPaletteColor, double> _f$green =
      Field('green', _$green);
  static double _$blue(SketchPaletteColor v) => v.blue;
  static const Field<SketchPaletteColor, double> _f$blue =
      Field('blue', _$blue);
  static double _$alpha(SketchPaletteColor v) => v.alpha;
  static const Field<SketchPaletteColor, double> _f$alpha =
      Field('alpha', _$alpha);

  @override
  final MappableFields<SketchPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static SketchPaletteColor _instantiate(DecodingData data) {
    return SketchPaletteColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue),
        alpha: data.dec(_f$alpha));
  }

  @override
  final Function instantiate = _instantiate;

  static SketchPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchPaletteColor>(map);
  }

  static SketchPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<SketchPaletteColor>(json);
  }
}

mixin SketchPaletteColorMappable {
  String toJson() {
    return SketchPaletteColorMapper.ensureInitialized()
        .encodeJson<SketchPaletteColor>(this as SketchPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return SketchPaletteColorMapper.ensureInitialized()
        .encodeMap<SketchPaletteColor>(this as SketchPaletteColor);
  }

  SketchPaletteColorCopyWith<SketchPaletteColor, SketchPaletteColor,
          SketchPaletteColor>
      get copyWith => _SketchPaletteColorCopyWithImpl<SketchPaletteColor,
          SketchPaletteColor>(this as SketchPaletteColor, $identity, $identity);
  @override
  String toString() {
    return SketchPaletteColorMapper.ensureInitialized()
        .stringifyValue(this as SketchPaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return SketchPaletteColorMapper.ensureInitialized()
        .equalsValue(this as SketchPaletteColor, other);
  }

  @override
  int get hashCode {
    return SketchPaletteColorMapper.ensureInitialized()
        .hashValue(this as SketchPaletteColor);
  }
}

extension SketchPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchPaletteColor, $Out> {
  SketchPaletteColorCopyWith<$R, SketchPaletteColor, $Out>
      get $asSketchPaletteColor => $base.as(
          (v, t, t2) => _SketchPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SketchPaletteColorCopyWith<$R, $In extends SketchPaletteColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? red, double? green, double? blue, double? alpha});
  SketchPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SketchPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchPaletteColor, $Out>
    implements SketchPaletteColorCopyWith<$R, SketchPaletteColor, $Out> {
  _SketchPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchPaletteColor> $mapper =
      SketchPaletteColorMapper.ensureInitialized();
  @override
  $R call({double? red, double? green, double? blue, double? alpha}) =>
      $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue,
        if (alpha != null) #alpha: alpha
      }));
  @override
  SketchPaletteColor $make(CopyWithData data) => SketchPaletteColor(
      red: data.get(#red, or: $value.red),
      green: data.get(#green, or: $value.green),
      blue: data.get(#blue, or: $value.blue),
      alpha: data.get(#alpha, or: $value.alpha));

  @override
  SketchPaletteColorCopyWith<$R2, SketchPaletteColor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SketchPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SketchPaletteMapper extends ClassMapperBase<SketchPalette> {
  SketchPaletteMapper._();

  static SketchPaletteMapper? _instance;
  static SketchPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchPaletteMapper._());
      SketchPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SketchPalette';

  static String _$compatibleVersion(SketchPalette v) => v.compatibleVersion;
  static const Field<SketchPalette, String> _f$compatibleVersion =
      Field('compatibleVersion', _$compatibleVersion);
  static String _$pluginVersion(SketchPalette v) => v.pluginVersion;
  static const Field<SketchPalette, String> _f$pluginVersion =
      Field('pluginVersion', _$pluginVersion);
  static List<SketchPaletteColor> _$colors(SketchPalette v) => v.colors;
  static const Field<SketchPalette, List<SketchPaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<SketchPalette> fields = const {
    #compatibleVersion: _f$compatibleVersion,
    #pluginVersion: _f$pluginVersion,
    #colors: _f$colors,
  };

  static SketchPalette _instantiate(DecodingData data) {
    return SketchPalette(
        compatibleVersion: data.dec(_f$compatibleVersion),
        pluginVersion: data.dec(_f$pluginVersion),
        colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static SketchPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchPalette>(map);
  }

  static SketchPalette fromJson(String json) {
    return ensureInitialized().decodeJson<SketchPalette>(json);
  }
}

mixin SketchPaletteMappable {
  String toJson() {
    return SketchPaletteMapper.ensureInitialized()
        .encodeJson<SketchPalette>(this as SketchPalette);
  }

  Map<String, dynamic> toMap() {
    return SketchPaletteMapper.ensureInitialized()
        .encodeMap<SketchPalette>(this as SketchPalette);
  }

  SketchPaletteCopyWith<SketchPalette, SketchPalette, SketchPalette>
      get copyWith => _SketchPaletteCopyWithImpl<SketchPalette, SketchPalette>(
          this as SketchPalette, $identity, $identity);
  @override
  String toString() {
    return SketchPaletteMapper.ensureInitialized()
        .stringifyValue(this as SketchPalette);
  }

  @override
  bool operator ==(Object other) {
    return SketchPaletteMapper.ensureInitialized()
        .equalsValue(this as SketchPalette, other);
  }

  @override
  int get hashCode {
    return SketchPaletteMapper.ensureInitialized()
        .hashValue(this as SketchPalette);
  }
}

extension SketchPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchPalette, $Out> {
  SketchPaletteCopyWith<$R, SketchPalette, $Out> get $asSketchPalette =>
      $base.as((v, t, t2) => _SketchPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SketchPaletteCopyWith<$R, $In extends SketchPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      SketchPaletteColor,
      SketchPaletteColorCopyWith<$R, SketchPaletteColor,
          SketchPaletteColor>> get colors;
  $R call(
      {String? compatibleVersion,
      String? pluginVersion,
      List<SketchPaletteColor>? colors});
  SketchPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SketchPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchPalette, $Out>
    implements SketchPaletteCopyWith<$R, SketchPalette, $Out> {
  _SketchPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchPalette> $mapper =
      SketchPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      SketchPaletteColor,
      SketchPaletteColorCopyWith<$R, SketchPaletteColor,
          SketchPaletteColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call(
          {String? compatibleVersion,
          String? pluginVersion,
          List<SketchPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (compatibleVersion != null) #compatibleVersion: compatibleVersion,
        if (pluginVersion != null) #pluginVersion: pluginVersion,
        if (colors != null) #colors: colors
      }));
  @override
  SketchPalette $make(CopyWithData data) => SketchPalette(
      compatibleVersion:
          data.get(#compatibleVersion, or: $value.compatibleVersion),
      pluginVersion: data.get(#pluginVersion, or: $value.pluginVersion),
      colors: data.get(#colors, or: $value.colors));

  @override
  SketchPaletteCopyWith<$R2, SketchPalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SketchPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
