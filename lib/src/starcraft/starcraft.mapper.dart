// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'starcraft.dart';

class StarCraftPaletteColorMapper
    extends ClassMapperBase<StarCraftPaletteColor> {
  StarCraftPaletteColorMapper._();

  static StarCraftPaletteColorMapper? _instance;
  static StarCraftPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarCraftPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StarCraftPaletteColor';

  static int _$red(StarCraftPaletteColor v) => v.red;
  static const Field<StarCraftPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(StarCraftPaletteColor v) => v.green;
  static const Field<StarCraftPaletteColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(StarCraftPaletteColor v) => v.blue;
  static const Field<StarCraftPaletteColor, int> _f$blue = Field(
    'blue',
    _$blue,
  );

  @override
  final MappableFields<StarCraftPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static StarCraftPaletteColor _instantiate(DecodingData data) {
    return StarCraftPaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StarCraftPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarCraftPaletteColor>(map);
  }

  static StarCraftPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<StarCraftPaletteColor>(json);
  }
}

mixin StarCraftPaletteColorMappable {
  String toJson() {
    return StarCraftPaletteColorMapper.ensureInitialized()
        .encodeJson<StarCraftPaletteColor>(this as StarCraftPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return StarCraftPaletteColorMapper.ensureInitialized()
        .encodeMap<StarCraftPaletteColor>(this as StarCraftPaletteColor);
  }

  StarCraftPaletteColorCopyWith<
    StarCraftPaletteColor,
    StarCraftPaletteColor,
    StarCraftPaletteColor
  >
  get copyWith => _StarCraftPaletteColorCopyWithImpl<
    StarCraftPaletteColor,
    StarCraftPaletteColor
  >(this as StarCraftPaletteColor, $identity, $identity);
  @override
  String toString() {
    return StarCraftPaletteColorMapper.ensureInitialized().stringifyValue(
      this as StarCraftPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return StarCraftPaletteColorMapper.ensureInitialized().equalsValue(
      this as StarCraftPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return StarCraftPaletteColorMapper.ensureInitialized().hashValue(
      this as StarCraftPaletteColor,
    );
  }
}

extension StarCraftPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarCraftPaletteColor, $Out> {
  StarCraftPaletteColorCopyWith<$R, StarCraftPaletteColor, $Out>
  get $asStarCraftPaletteColor => $base.as(
    (v, t, t2) => _StarCraftPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StarCraftPaletteColorCopyWith<
  $R,
  $In extends StarCraftPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  StarCraftPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StarCraftPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarCraftPaletteColor, $Out>
    implements StarCraftPaletteColorCopyWith<$R, StarCraftPaletteColor, $Out> {
  _StarCraftPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarCraftPaletteColor> $mapper =
      StarCraftPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
    }),
  );
  @override
  StarCraftPaletteColor $make(CopyWithData data) => StarCraftPaletteColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
  );

  @override
  StarCraftPaletteColorCopyWith<$R2, StarCraftPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StarCraftPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StarCraftPaletteMapper extends ClassMapperBase<StarCraftPalette> {
  StarCraftPaletteMapper._();

  static StarCraftPaletteMapper? _instance;
  static StarCraftPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarCraftPaletteMapper._());
      StarCraftPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StarCraftPalette';

  static List<StarCraftPaletteColor> _$colors(StarCraftPalette v) => v.colors;
  static const Field<StarCraftPalette, List<StarCraftPaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<StarCraftPalette> fields = const {#colors: _f$colors};

  static StarCraftPalette _instantiate(DecodingData data) {
    return StarCraftPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static StarCraftPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarCraftPalette>(map);
  }

  static StarCraftPalette fromJson(String json) {
    return ensureInitialized().decodeJson<StarCraftPalette>(json);
  }
}

mixin StarCraftPaletteMappable {
  String toJson() {
    return StarCraftPaletteMapper.ensureInitialized()
        .encodeJson<StarCraftPalette>(this as StarCraftPalette);
  }

  Map<String, dynamic> toMap() {
    return StarCraftPaletteMapper.ensureInitialized()
        .encodeMap<StarCraftPalette>(this as StarCraftPalette);
  }

  StarCraftPaletteCopyWith<StarCraftPalette, StarCraftPalette, StarCraftPalette>
  get copyWith =>
      _StarCraftPaletteCopyWithImpl<StarCraftPalette, StarCraftPalette>(
        this as StarCraftPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StarCraftPaletteMapper.ensureInitialized().stringifyValue(
      this as StarCraftPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return StarCraftPaletteMapper.ensureInitialized().equalsValue(
      this as StarCraftPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return StarCraftPaletteMapper.ensureInitialized().hashValue(
      this as StarCraftPalette,
    );
  }
}

extension StarCraftPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarCraftPalette, $Out> {
  StarCraftPaletteCopyWith<$R, StarCraftPalette, $Out>
  get $asStarCraftPalette =>
      $base.as((v, t, t2) => _StarCraftPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StarCraftPaletteCopyWith<$R, $In extends StarCraftPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    StarCraftPaletteColor,
    StarCraftPaletteColorCopyWith<
      $R,
      StarCraftPaletteColor,
      StarCraftPaletteColor
    >
  >
  get colors;
  $R call({List<StarCraftPaletteColor>? colors});
  StarCraftPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StarCraftPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarCraftPalette, $Out>
    implements StarCraftPaletteCopyWith<$R, StarCraftPalette, $Out> {
  _StarCraftPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarCraftPalette> $mapper =
      StarCraftPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    StarCraftPaletteColor,
    StarCraftPaletteColorCopyWith<
      $R,
      StarCraftPaletteColor,
      StarCraftPaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<StarCraftPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  StarCraftPalette $make(CopyWithData data) =>
      StarCraftPalette(colors: data.get(#colors, or: $value.colors));

  @override
  StarCraftPaletteCopyWith<$R2, StarCraftPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StarCraftPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
