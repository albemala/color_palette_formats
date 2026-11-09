// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sketchpreset.dart';

class SketchPresetColorMapper extends ClassMapperBase<SketchPresetColor> {
  SketchPresetColorMapper._();

  static SketchPresetColorMapper? _instance;
  static SketchPresetColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchPresetColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SketchPresetColor';

  static String? _$name(SketchPresetColor v) => v.name;
  static const Field<SketchPresetColor, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static double _$red(SketchPresetColor v) => v.red;
  static const Field<SketchPresetColor, double> _f$red = Field('red', _$red);
  static double _$green(SketchPresetColor v) => v.green;
  static const Field<SketchPresetColor, double> _f$green = Field(
    'green',
    _$green,
  );
  static double _$blue(SketchPresetColor v) => v.blue;
  static const Field<SketchPresetColor, double> _f$blue = Field('blue', _$blue);
  static double _$alpha(SketchPresetColor v) => v.alpha;
  static const Field<SketchPresetColor, double> _f$alpha = Field(
    'alpha',
    _$alpha,
  );

  @override
  final MappableFields<SketchPresetColor> fields = const {
    #name: _f$name,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static SketchPresetColor _instantiate(DecodingData data) {
    return SketchPresetColor(
      name: data.dec(_f$name),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SketchPresetColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchPresetColor>(map);
  }

  static SketchPresetColor fromJson(String json) {
    return ensureInitialized().decodeJson<SketchPresetColor>(json);
  }
}

mixin SketchPresetColorMappable {
  String toJson() {
    return SketchPresetColorMapper.ensureInitialized()
        .encodeJson<SketchPresetColor>(this as SketchPresetColor);
  }

  Map<String, dynamic> toMap() {
    return SketchPresetColorMapper.ensureInitialized()
        .encodeMap<SketchPresetColor>(this as SketchPresetColor);
  }

  SketchPresetColorCopyWith<
    SketchPresetColor,
    SketchPresetColor,
    SketchPresetColor
  >
  get copyWith =>
      _SketchPresetColorCopyWithImpl<SketchPresetColor, SketchPresetColor>(
        this as SketchPresetColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SketchPresetColorMapper.ensureInitialized().stringifyValue(
      this as SketchPresetColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return SketchPresetColorMapper.ensureInitialized().equalsValue(
      this as SketchPresetColor,
      other,
    );
  }

  @override
  int get hashCode {
    return SketchPresetColorMapper.ensureInitialized().hashValue(
      this as SketchPresetColor,
    );
  }
}

extension SketchPresetColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchPresetColor, $Out> {
  SketchPresetColorCopyWith<$R, SketchPresetColor, $Out>
  get $asSketchPresetColor => $base.as(
    (v, t, t2) => _SketchPresetColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SketchPresetColorCopyWith<
  $R,
  $In extends SketchPresetColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    double? red,
    double? green,
    double? blue,
    double? alpha,
  });
  SketchPresetColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SketchPresetColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchPresetColor, $Out>
    implements SketchPresetColorCopyWith<$R, SketchPresetColor, $Out> {
  _SketchPresetColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchPresetColor> $mapper =
      SketchPresetColorMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    double? red,
    double? green,
    double? blue,
    double? alpha,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (alpha != null) #alpha: alpha,
    }),
  );
  @override
  SketchPresetColor $make(CopyWithData data) => SketchPresetColor(
    name: data.get(#name, or: $value.name),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    alpha: data.get(#alpha, or: $value.alpha),
  );

  @override
  SketchPresetColorCopyWith<$R2, SketchPresetColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SketchPresetColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SketchPresetMapper extends ClassMapperBase<SketchPreset> {
  SketchPresetMapper._();

  static SketchPresetMapper? _instance;
  static SketchPresetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchPresetMapper._());
      SketchPresetColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SketchPreset';

  static List<SketchPresetColor> _$colors(SketchPreset v) => v.colors;
  static const Field<SketchPreset, List<SketchPresetColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<SketchPreset> fields = const {#colors: _f$colors};

  static SketchPreset _instantiate(DecodingData data) {
    return SketchPreset(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static SketchPreset fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchPreset>(map);
  }

  static SketchPreset fromJson(String json) {
    return ensureInitialized().decodeJson<SketchPreset>(json);
  }
}

mixin SketchPresetMappable {
  String toJson() {
    return SketchPresetMapper.ensureInitialized().encodeJson<SketchPreset>(
      this as SketchPreset,
    );
  }

  Map<String, dynamic> toMap() {
    return SketchPresetMapper.ensureInitialized().encodeMap<SketchPreset>(
      this as SketchPreset,
    );
  }

  SketchPresetCopyWith<SketchPreset, SketchPreset, SketchPreset> get copyWith =>
      _SketchPresetCopyWithImpl<SketchPreset, SketchPreset>(
        this as SketchPreset,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SketchPresetMapper.ensureInitialized().stringifyValue(
      this as SketchPreset,
    );
  }

  @override
  bool operator ==(Object other) {
    return SketchPresetMapper.ensureInitialized().equalsValue(
      this as SketchPreset,
      other,
    );
  }

  @override
  int get hashCode {
    return SketchPresetMapper.ensureInitialized().hashValue(
      this as SketchPreset,
    );
  }
}

extension SketchPresetValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchPreset, $Out> {
  SketchPresetCopyWith<$R, SketchPreset, $Out> get $asSketchPreset =>
      $base.as((v, t, t2) => _SketchPresetCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SketchPresetCopyWith<$R, $In extends SketchPreset, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    SketchPresetColor,
    SketchPresetColorCopyWith<$R, SketchPresetColor, SketchPresetColor>
  >
  get colors;
  $R call({List<SketchPresetColor>? colors});
  SketchPresetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SketchPresetCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchPreset, $Out>
    implements SketchPresetCopyWith<$R, SketchPreset, $Out> {
  _SketchPresetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchPreset> $mapper =
      SketchPresetMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    SketchPresetColor,
    SketchPresetColorCopyWith<$R, SketchPresetColor, SketchPresetColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<SketchPresetColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  SketchPreset $make(CopyWithData data) =>
      SketchPreset(colors: data.get(#colors, or: $value.colors));

  @override
  SketchPresetCopyWith<$R2, SketchPreset, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SketchPresetCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
