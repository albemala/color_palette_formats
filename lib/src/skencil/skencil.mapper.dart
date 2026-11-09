// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'skencil.dart';

class SkencilPaletteColorMapper extends ClassMapperBase<SkencilPaletteColor> {
  SkencilPaletteColorMapper._();

  static SkencilPaletteColorMapper? _instance;
  static SkencilPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SkencilPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SkencilPaletteColor';

  static double _$red(SkencilPaletteColor v) => v.red;
  static const Field<SkencilPaletteColor, double> _f$red = Field('red', _$red);
  static double _$green(SkencilPaletteColor v) => v.green;
  static const Field<SkencilPaletteColor, double> _f$green = Field(
    'green',
    _$green,
  );
  static double _$blue(SkencilPaletteColor v) => v.blue;
  static const Field<SkencilPaletteColor, double> _f$blue = Field(
    'blue',
    _$blue,
  );
  static String _$name(SkencilPaletteColor v) => v.name;
  static const Field<SkencilPaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );

  @override
  final MappableFields<SkencilPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #name: _f$name,
  };

  static SkencilPaletteColor _instantiate(DecodingData data) {
    return SkencilPaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      name: data.dec(_f$name),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SkencilPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SkencilPaletteColor>(map);
  }

  static SkencilPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<SkencilPaletteColor>(json);
  }
}

mixin SkencilPaletteColorMappable {
  String toJson() {
    return SkencilPaletteColorMapper.ensureInitialized()
        .encodeJson<SkencilPaletteColor>(this as SkencilPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return SkencilPaletteColorMapper.ensureInitialized()
        .encodeMap<SkencilPaletteColor>(this as SkencilPaletteColor);
  }

  SkencilPaletteColorCopyWith<
    SkencilPaletteColor,
    SkencilPaletteColor,
    SkencilPaletteColor
  >
  get copyWith => _SkencilPaletteColorCopyWithImpl<
    SkencilPaletteColor,
    SkencilPaletteColor
  >(this as SkencilPaletteColor, $identity, $identity);
  @override
  String toString() {
    return SkencilPaletteColorMapper.ensureInitialized().stringifyValue(
      this as SkencilPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return SkencilPaletteColorMapper.ensureInitialized().equalsValue(
      this as SkencilPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return SkencilPaletteColorMapper.ensureInitialized().hashValue(
      this as SkencilPaletteColor,
    );
  }
}

extension SkencilPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SkencilPaletteColor, $Out> {
  SkencilPaletteColorCopyWith<$R, SkencilPaletteColor, $Out>
  get $asSkencilPaletteColor => $base.as(
    (v, t, t2) => _SkencilPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SkencilPaletteColorCopyWith<
  $R,
  $In extends SkencilPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? red, double? green, double? blue, String? name});
  SkencilPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SkencilPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SkencilPaletteColor, $Out>
    implements SkencilPaletteColorCopyWith<$R, SkencilPaletteColor, $Out> {
  _SkencilPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SkencilPaletteColor> $mapper =
      SkencilPaletteColorMapper.ensureInitialized();
  @override
  $R call({double? red, double? green, double? blue, String? name}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (name != null) #name: name,
    }),
  );
  @override
  SkencilPaletteColor $make(CopyWithData data) => SkencilPaletteColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    name: data.get(#name, or: $value.name),
  );

  @override
  SkencilPaletteColorCopyWith<$R2, SkencilPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SkencilPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SkencilPaletteMapper extends ClassMapperBase<SkencilPalette> {
  SkencilPaletteMapper._();

  static SkencilPaletteMapper? _instance;
  static SkencilPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SkencilPaletteMapper._());
      SkencilPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SkencilPalette';

  static List<SkencilPaletteColor> _$colors(SkencilPalette v) => v.colors;
  static const Field<SkencilPalette, List<SkencilPaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<SkencilPalette> fields = const {#colors: _f$colors};

  static SkencilPalette _instantiate(DecodingData data) {
    return SkencilPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static SkencilPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SkencilPalette>(map);
  }

  static SkencilPalette fromJson(String json) {
    return ensureInitialized().decodeJson<SkencilPalette>(json);
  }
}

mixin SkencilPaletteMappable {
  String toJson() {
    return SkencilPaletteMapper.ensureInitialized().encodeJson<SkencilPalette>(
      this as SkencilPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return SkencilPaletteMapper.ensureInitialized().encodeMap<SkencilPalette>(
      this as SkencilPalette,
    );
  }

  SkencilPaletteCopyWith<SkencilPalette, SkencilPalette, SkencilPalette>
  get copyWith => _SkencilPaletteCopyWithImpl<SkencilPalette, SkencilPalette>(
    this as SkencilPalette,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SkencilPaletteMapper.ensureInitialized().stringifyValue(
      this as SkencilPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return SkencilPaletteMapper.ensureInitialized().equalsValue(
      this as SkencilPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return SkencilPaletteMapper.ensureInitialized().hashValue(
      this as SkencilPalette,
    );
  }
}

extension SkencilPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SkencilPalette, $Out> {
  SkencilPaletteCopyWith<$R, SkencilPalette, $Out> get $asSkencilPalette =>
      $base.as((v, t, t2) => _SkencilPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SkencilPaletteCopyWith<$R, $In extends SkencilPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    SkencilPaletteColor,
    SkencilPaletteColorCopyWith<$R, SkencilPaletteColor, SkencilPaletteColor>
  >
  get colors;
  $R call({List<SkencilPaletteColor>? colors});
  SkencilPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SkencilPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SkencilPalette, $Out>
    implements SkencilPaletteCopyWith<$R, SkencilPalette, $Out> {
  _SkencilPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SkencilPalette> $mapper =
      SkencilPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    SkencilPaletteColor,
    SkencilPaletteColorCopyWith<$R, SkencilPaletteColor, SkencilPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<SkencilPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  SkencilPalette $make(CopyWithData data) =>
      SkencilPalette(colors: data.get(#colors, or: $value.colors));

  @override
  SkencilPaletteCopyWith<$R2, SkencilPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SkencilPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
