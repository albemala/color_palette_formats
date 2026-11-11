// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'starcraft_padded.dart';

class StarCraftPaddedPaletteColorMapper
    extends ClassMapperBase<StarCraftPaddedPaletteColor> {
  StarCraftPaddedPaletteColorMapper._();

  static StarCraftPaddedPaletteColorMapper? _instance;
  static StarCraftPaddedPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = StarCraftPaddedPaletteColorMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'StarCraftPaddedPaletteColor';

  static int _$red(StarCraftPaddedPaletteColor v) => v.red;
  static const Field<StarCraftPaddedPaletteColor, int> _f$red = Field(
    'red',
    _$red,
  );
  static int _$green(StarCraftPaddedPaletteColor v) => v.green;
  static const Field<StarCraftPaddedPaletteColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(StarCraftPaddedPaletteColor v) => v.blue;
  static const Field<StarCraftPaddedPaletteColor, int> _f$blue = Field(
    'blue',
    _$blue,
  );

  @override
  final MappableFields<StarCraftPaddedPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static StarCraftPaddedPaletteColor _instantiate(DecodingData data) {
    return StarCraftPaddedPaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StarCraftPaddedPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarCraftPaddedPaletteColor>(map);
  }

  static StarCraftPaddedPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<StarCraftPaddedPaletteColor>(json);
  }
}

mixin StarCraftPaddedPaletteColorMappable {
  String toJson() {
    return StarCraftPaddedPaletteColorMapper.ensureInitialized()
        .encodeJson<StarCraftPaddedPaletteColor>(
          this as StarCraftPaddedPaletteColor,
        );
  }

  Map<String, dynamic> toMap() {
    return StarCraftPaddedPaletteColorMapper.ensureInitialized()
        .encodeMap<StarCraftPaddedPaletteColor>(
          this as StarCraftPaddedPaletteColor,
        );
  }

  StarCraftPaddedPaletteColorCopyWith<
    StarCraftPaddedPaletteColor,
    StarCraftPaddedPaletteColor,
    StarCraftPaddedPaletteColor
  >
  get copyWith => _StarCraftPaddedPaletteColorCopyWithImpl<
    StarCraftPaddedPaletteColor,
    StarCraftPaddedPaletteColor
  >(this as StarCraftPaddedPaletteColor, $identity, $identity);
  @override
  String toString() {
    return StarCraftPaddedPaletteColorMapper.ensureInitialized().stringifyValue(
      this as StarCraftPaddedPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return StarCraftPaddedPaletteColorMapper.ensureInitialized().equalsValue(
      this as StarCraftPaddedPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return StarCraftPaddedPaletteColorMapper.ensureInitialized().hashValue(
      this as StarCraftPaddedPaletteColor,
    );
  }
}

extension StarCraftPaddedPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarCraftPaddedPaletteColor, $Out> {
  StarCraftPaddedPaletteColorCopyWith<$R, StarCraftPaddedPaletteColor, $Out>
  get $asStarCraftPaddedPaletteColor => $base.as(
    (v, t, t2) => _StarCraftPaddedPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StarCraftPaddedPaletteColorCopyWith<
  $R,
  $In extends StarCraftPaddedPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  StarCraftPaddedPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StarCraftPaddedPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarCraftPaddedPaletteColor, $Out>
    implements
        StarCraftPaddedPaletteColorCopyWith<
          $R,
          StarCraftPaddedPaletteColor,
          $Out
        > {
  _StarCraftPaddedPaletteColorCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<StarCraftPaddedPaletteColor> $mapper =
      StarCraftPaddedPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
    }),
  );
  @override
  StarCraftPaddedPaletteColor $make(CopyWithData data) =>
      StarCraftPaddedPaletteColor(
        red: data.get(#red, or: $value.red),
        green: data.get(#green, or: $value.green),
        blue: data.get(#blue, or: $value.blue),
      );

  @override
  StarCraftPaddedPaletteColorCopyWith<$R2, StarCraftPaddedPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StarCraftPaddedPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StarCraftPaddedPaletteMapper
    extends ClassMapperBase<StarCraftPaddedPalette> {
  StarCraftPaddedPaletteMapper._();

  static StarCraftPaddedPaletteMapper? _instance;
  static StarCraftPaddedPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarCraftPaddedPaletteMapper._());
      StarCraftPaddedPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StarCraftPaddedPalette';

  static List<StarCraftPaddedPaletteColor> _$colors(StarCraftPaddedPalette v) =>
      v.colors;
  static const Field<StarCraftPaddedPalette, List<StarCraftPaddedPaletteColor>>
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<StarCraftPaddedPalette> fields = const {
    #colors: _f$colors,
  };

  static StarCraftPaddedPalette _instantiate(DecodingData data) {
    return StarCraftPaddedPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static StarCraftPaddedPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarCraftPaddedPalette>(map);
  }

  static StarCraftPaddedPalette fromJson(String json) {
    return ensureInitialized().decodeJson<StarCraftPaddedPalette>(json);
  }
}

mixin StarCraftPaddedPaletteMappable {
  String toJson() {
    return StarCraftPaddedPaletteMapper.ensureInitialized()
        .encodeJson<StarCraftPaddedPalette>(this as StarCraftPaddedPalette);
  }

  Map<String, dynamic> toMap() {
    return StarCraftPaddedPaletteMapper.ensureInitialized()
        .encodeMap<StarCraftPaddedPalette>(this as StarCraftPaddedPalette);
  }

  StarCraftPaddedPaletteCopyWith<
    StarCraftPaddedPalette,
    StarCraftPaddedPalette,
    StarCraftPaddedPalette
  >
  get copyWith => _StarCraftPaddedPaletteCopyWithImpl<
    StarCraftPaddedPalette,
    StarCraftPaddedPalette
  >(this as StarCraftPaddedPalette, $identity, $identity);
  @override
  String toString() {
    return StarCraftPaddedPaletteMapper.ensureInitialized().stringifyValue(
      this as StarCraftPaddedPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return StarCraftPaddedPaletteMapper.ensureInitialized().equalsValue(
      this as StarCraftPaddedPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return StarCraftPaddedPaletteMapper.ensureInitialized().hashValue(
      this as StarCraftPaddedPalette,
    );
  }
}

extension StarCraftPaddedPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarCraftPaddedPalette, $Out> {
  StarCraftPaddedPaletteCopyWith<$R, StarCraftPaddedPalette, $Out>
  get $asStarCraftPaddedPalette => $base.as(
    (v, t, t2) => _StarCraftPaddedPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StarCraftPaddedPaletteCopyWith<
  $R,
  $In extends StarCraftPaddedPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    StarCraftPaddedPaletteColor,
    StarCraftPaddedPaletteColorCopyWith<
      $R,
      StarCraftPaddedPaletteColor,
      StarCraftPaddedPaletteColor
    >
  >
  get colors;
  $R call({List<StarCraftPaddedPaletteColor>? colors});
  StarCraftPaddedPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StarCraftPaddedPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarCraftPaddedPalette, $Out>
    implements
        StarCraftPaddedPaletteCopyWith<$R, StarCraftPaddedPalette, $Out> {
  _StarCraftPaddedPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarCraftPaddedPalette> $mapper =
      StarCraftPaddedPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    StarCraftPaddedPaletteColor,
    StarCraftPaddedPaletteColorCopyWith<
      $R,
      StarCraftPaddedPaletteColor,
      StarCraftPaddedPaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<StarCraftPaddedPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  StarCraftPaddedPalette $make(CopyWithData data) =>
      StarCraftPaddedPalette(colors: data.get(#colors, or: $value.colors));

  @override
  StarCraftPaddedPaletteCopyWith<$R2, StarCraftPaddedPalette, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StarCraftPaddedPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
