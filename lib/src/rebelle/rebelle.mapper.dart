// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rebelle.dart';

class RebellePaletteColorMapper extends ClassMapperBase<RebellePaletteColor> {
  RebellePaletteColorMapper._();

  static RebellePaletteColorMapper? _instance;
  static RebellePaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RebellePaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RebellePaletteColor';

  static int _$red(RebellePaletteColor v) => v.red;
  static const Field<RebellePaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(RebellePaletteColor v) => v.green;
  static const Field<RebellePaletteColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(RebellePaletteColor v) => v.blue;
  static const Field<RebellePaletteColor, int> _f$blue = Field('blue', _$blue);
  static String _$name(RebellePaletteColor v) => v.name;
  static const Field<RebellePaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );

  @override
  final MappableFields<RebellePaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #name: _f$name,
  };

  static RebellePaletteColor _instantiate(DecodingData data) {
    return RebellePaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      name: data.dec(_f$name),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RebellePaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RebellePaletteColor>(map);
  }

  static RebellePaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<RebellePaletteColor>(json);
  }
}

mixin RebellePaletteColorMappable {
  String toJson() {
    return RebellePaletteColorMapper.ensureInitialized()
        .encodeJson<RebellePaletteColor>(this as RebellePaletteColor);
  }

  Map<String, dynamic> toMap() {
    return RebellePaletteColorMapper.ensureInitialized()
        .encodeMap<RebellePaletteColor>(this as RebellePaletteColor);
  }

  RebellePaletteColorCopyWith<
    RebellePaletteColor,
    RebellePaletteColor,
    RebellePaletteColor
  >
  get copyWith => _RebellePaletteColorCopyWithImpl<
    RebellePaletteColor,
    RebellePaletteColor
  >(this as RebellePaletteColor, $identity, $identity);
  @override
  String toString() {
    return RebellePaletteColorMapper.ensureInitialized().stringifyValue(
      this as RebellePaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return RebellePaletteColorMapper.ensureInitialized().equalsValue(
      this as RebellePaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return RebellePaletteColorMapper.ensureInitialized().hashValue(
      this as RebellePaletteColor,
    );
  }
}

extension RebellePaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RebellePaletteColor, $Out> {
  RebellePaletteColorCopyWith<$R, RebellePaletteColor, $Out>
  get $asRebellePaletteColor => $base.as(
    (v, t, t2) => _RebellePaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RebellePaletteColorCopyWith<
  $R,
  $In extends RebellePaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue, String? name});
  RebellePaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RebellePaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RebellePaletteColor, $Out>
    implements RebellePaletteColorCopyWith<$R, RebellePaletteColor, $Out> {
  _RebellePaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RebellePaletteColor> $mapper =
      RebellePaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue, String? name}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (name != null) #name: name,
    }),
  );
  @override
  RebellePaletteColor $make(CopyWithData data) => RebellePaletteColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    name: data.get(#name, or: $value.name),
  );

  @override
  RebellePaletteColorCopyWith<$R2, RebellePaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RebellePaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RebellePaletteMapper extends ClassMapperBase<RebellePalette> {
  RebellePaletteMapper._();

  static RebellePaletteMapper? _instance;
  static RebellePaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RebellePaletteMapper._());
      RebellePaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RebellePalette';

  static List<RebellePaletteColor> _$colors(RebellePalette v) => v.colors;
  static const Field<RebellePalette, List<RebellePaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<RebellePalette> fields = const {#colors: _f$colors};

  static RebellePalette _instantiate(DecodingData data) {
    return RebellePalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static RebellePalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RebellePalette>(map);
  }

  static RebellePalette fromJson(String json) {
    return ensureInitialized().decodeJson<RebellePalette>(json);
  }
}

mixin RebellePaletteMappable {
  String toJson() {
    return RebellePaletteMapper.ensureInitialized().encodeJson<RebellePalette>(
      this as RebellePalette,
    );
  }

  Map<String, dynamic> toMap() {
    return RebellePaletteMapper.ensureInitialized().encodeMap<RebellePalette>(
      this as RebellePalette,
    );
  }

  RebellePaletteCopyWith<RebellePalette, RebellePalette, RebellePalette>
  get copyWith => _RebellePaletteCopyWithImpl<RebellePalette, RebellePalette>(
    this as RebellePalette,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RebellePaletteMapper.ensureInitialized().stringifyValue(
      this as RebellePalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return RebellePaletteMapper.ensureInitialized().equalsValue(
      this as RebellePalette,
      other,
    );
  }

  @override
  int get hashCode {
    return RebellePaletteMapper.ensureInitialized().hashValue(
      this as RebellePalette,
    );
  }
}

extension RebellePaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RebellePalette, $Out> {
  RebellePaletteCopyWith<$R, RebellePalette, $Out> get $asRebellePalette =>
      $base.as((v, t, t2) => _RebellePaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RebellePaletteCopyWith<$R, $In extends RebellePalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    RebellePaletteColor,
    RebellePaletteColorCopyWith<$R, RebellePaletteColor, RebellePaletteColor>
  >
  get colors;
  $R call({List<RebellePaletteColor>? colors});
  RebellePaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RebellePaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RebellePalette, $Out>
    implements RebellePaletteCopyWith<$R, RebellePalette, $Out> {
  _RebellePaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RebellePalette> $mapper =
      RebellePaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    RebellePaletteColor,
    RebellePaletteColorCopyWith<$R, RebellePaletteColor, RebellePaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<RebellePaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  RebellePalette $make(CopyWithData data) =>
      RebellePalette(colors: data.get(#colors, or: $value.colors));

  @override
  RebellePaletteCopyWith<$R2, RebellePalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RebellePaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
