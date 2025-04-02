// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'jasc-pal.dart';

class JascPaletteColorMapper extends ClassMapperBase<JascPaletteColor> {
  JascPaletteColorMapper._();

  static JascPaletteColorMapper? _instance;
  static JascPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JascPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'JascPaletteColor';

  static int _$red(JascPaletteColor v) => v.red;
  static const Field<JascPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(JascPaletteColor v) => v.green;
  static const Field<JascPaletteColor, int> _f$green = Field('green', _$green);
  static int _$blue(JascPaletteColor v) => v.blue;
  static const Field<JascPaletteColor, int> _f$blue = Field('blue', _$blue);

  @override
  final MappableFields<JascPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static JascPaletteColor _instantiate(DecodingData data) {
    return JascPaletteColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue));
  }

  @override
  final Function instantiate = _instantiate;

  static JascPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JascPaletteColor>(map);
  }

  static JascPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<JascPaletteColor>(json);
  }
}

mixin JascPaletteColorMappable {
  String toJson() {
    return JascPaletteColorMapper.ensureInitialized()
        .encodeJson<JascPaletteColor>(this as JascPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return JascPaletteColorMapper.ensureInitialized()
        .encodeMap<JascPaletteColor>(this as JascPaletteColor);
  }

  JascPaletteColorCopyWith<JascPaletteColor, JascPaletteColor, JascPaletteColor>
      get copyWith =>
          _JascPaletteColorCopyWithImpl<JascPaletteColor, JascPaletteColor>(
              this as JascPaletteColor, $identity, $identity);
  @override
  String toString() {
    return JascPaletteColorMapper.ensureInitialized()
        .stringifyValue(this as JascPaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return JascPaletteColorMapper.ensureInitialized()
        .equalsValue(this as JascPaletteColor, other);
  }

  @override
  int get hashCode {
    return JascPaletteColorMapper.ensureInitialized()
        .hashValue(this as JascPaletteColor);
  }
}

extension JascPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JascPaletteColor, $Out> {
  JascPaletteColorCopyWith<$R, JascPaletteColor, $Out>
      get $asJascPaletteColor => $base
          .as((v, t, t2) => _JascPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JascPaletteColorCopyWith<$R, $In extends JascPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  JascPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _JascPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JascPaletteColor, $Out>
    implements JascPaletteColorCopyWith<$R, JascPaletteColor, $Out> {
  _JascPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JascPaletteColor> $mapper =
      JascPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue
      }));
  @override
  JascPaletteColor $make(CopyWithData data) => JascPaletteColor(
      red: data.get(#red, or: $value.red),
      green: data.get(#green, or: $value.green),
      blue: data.get(#blue, or: $value.blue));

  @override
  JascPaletteColorCopyWith<$R2, JascPaletteColor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JascPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JascPaletteMapper extends ClassMapperBase<JascPalette> {
  JascPaletteMapper._();

  static JascPaletteMapper? _instance;
  static JascPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JascPaletteMapper._());
      JascPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JascPalette';

  static List<JascPaletteColor> _$colors(JascPalette v) => v.colors;
  static const Field<JascPalette, List<JascPaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<JascPalette> fields = const {
    #colors: _f$colors,
  };

  static JascPalette _instantiate(DecodingData data) {
    return JascPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static JascPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JascPalette>(map);
  }

  static JascPalette fromJson(String json) {
    return ensureInitialized().decodeJson<JascPalette>(json);
  }
}

mixin JascPaletteMappable {
  String toJson() {
    return JascPaletteMapper.ensureInitialized()
        .encodeJson<JascPalette>(this as JascPalette);
  }

  Map<String, dynamic> toMap() {
    return JascPaletteMapper.ensureInitialized()
        .encodeMap<JascPalette>(this as JascPalette);
  }

  JascPaletteCopyWith<JascPalette, JascPalette, JascPalette> get copyWith =>
      _JascPaletteCopyWithImpl<JascPalette, JascPalette>(
          this as JascPalette, $identity, $identity);
  @override
  String toString() {
    return JascPaletteMapper.ensureInitialized()
        .stringifyValue(this as JascPalette);
  }

  @override
  bool operator ==(Object other) {
    return JascPaletteMapper.ensureInitialized()
        .equalsValue(this as JascPalette, other);
  }

  @override
  int get hashCode {
    return JascPaletteMapper.ensureInitialized().hashValue(this as JascPalette);
  }
}

extension JascPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JascPalette, $Out> {
  JascPaletteCopyWith<$R, JascPalette, $Out> get $asJascPalette =>
      $base.as((v, t, t2) => _JascPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JascPaletteCopyWith<$R, $In extends JascPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, JascPaletteColor,
          JascPaletteColorCopyWith<$R, JascPaletteColor, JascPaletteColor>>
      get colors;
  $R call({List<JascPaletteColor>? colors});
  JascPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JascPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JascPalette, $Out>
    implements JascPaletteCopyWith<$R, JascPalette, $Out> {
  _JascPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JascPalette> $mapper =
      JascPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, JascPaletteColor,
          JascPaletteColorCopyWith<$R, JascPaletteColor, JascPaletteColor>>
      get colors => ListCopyWith($value.colors, (v, t) => v.copyWith.$chain(t),
          (v) => call(colors: v));
  @override
  $R call({List<JascPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  JascPalette $make(CopyWithData data) =>
      JascPalette(colors: data.get(#colors, or: $value.colors));

  @override
  JascPaletteCopyWith<$R2, JascPalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JascPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
