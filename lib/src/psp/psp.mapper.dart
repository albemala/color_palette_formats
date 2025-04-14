// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'psp.dart';

class PaintShopProPaletteColorMapper
    extends ClassMapperBase<PaintShopProPaletteColor> {
  PaintShopProPaletteColorMapper._();

  static PaintShopProPaletteColorMapper? _instance;
  static PaintShopProPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = PaintShopProPaletteColorMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'PaintShopProPaletteColor';

  static int _$red(PaintShopProPaletteColor v) => v.red;
  static const Field<PaintShopProPaletteColor, int> _f$red = Field(
    'red',
    _$red,
  );
  static int _$green(PaintShopProPaletteColor v) => v.green;
  static const Field<PaintShopProPaletteColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(PaintShopProPaletteColor v) => v.blue;
  static const Field<PaintShopProPaletteColor, int> _f$blue = Field(
    'blue',
    _$blue,
  );

  @override
  final MappableFields<PaintShopProPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static PaintShopProPaletteColor _instantiate(DecodingData data) {
    return PaintShopProPaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PaintShopProPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaintShopProPaletteColor>(map);
  }

  static PaintShopProPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<PaintShopProPaletteColor>(json);
  }
}

mixin PaintShopProPaletteColorMappable {
  String toJson() {
    return PaintShopProPaletteColorMapper.ensureInitialized()
        .encodeJson<PaintShopProPaletteColor>(this as PaintShopProPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return PaintShopProPaletteColorMapper.ensureInitialized()
        .encodeMap<PaintShopProPaletteColor>(this as PaintShopProPaletteColor);
  }

  PaintShopProPaletteColorCopyWith<
    PaintShopProPaletteColor,
    PaintShopProPaletteColor,
    PaintShopProPaletteColor
  >
  get copyWith => _PaintShopProPaletteColorCopyWithImpl<
    PaintShopProPaletteColor,
    PaintShopProPaletteColor
  >(this as PaintShopProPaletteColor, $identity, $identity);
  @override
  String toString() {
    return PaintShopProPaletteColorMapper.ensureInitialized().stringifyValue(
      this as PaintShopProPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return PaintShopProPaletteColorMapper.ensureInitialized().equalsValue(
      this as PaintShopProPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return PaintShopProPaletteColorMapper.ensureInitialized().hashValue(
      this as PaintShopProPaletteColor,
    );
  }
}

extension PaintShopProPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaintShopProPaletteColor, $Out> {
  PaintShopProPaletteColorCopyWith<$R, PaintShopProPaletteColor, $Out>
  get $asPaintShopProPaletteColor => $base.as(
    (v, t, t2) => _PaintShopProPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PaintShopProPaletteColorCopyWith<
  $R,
  $In extends PaintShopProPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  PaintShopProPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PaintShopProPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaintShopProPaletteColor, $Out>
    implements
        PaintShopProPaletteColorCopyWith<$R, PaintShopProPaletteColor, $Out> {
  _PaintShopProPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaintShopProPaletteColor> $mapper =
      PaintShopProPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
    }),
  );
  @override
  PaintShopProPaletteColor $make(CopyWithData data) => PaintShopProPaletteColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
  );

  @override
  PaintShopProPaletteColorCopyWith<$R2, PaintShopProPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PaintShopProPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PaintShopProPaletteMapper extends ClassMapperBase<PaintShopProPalette> {
  PaintShopProPaletteMapper._();

  static PaintShopProPaletteMapper? _instance;
  static PaintShopProPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaintShopProPaletteMapper._());
      PaintShopProPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaintShopProPalette';

  static List<PaintShopProPaletteColor> _$colors(PaintShopProPalette v) =>
      v.colors;
  static const Field<PaintShopProPalette, List<PaintShopProPaletteColor>>
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<PaintShopProPalette> fields = const {#colors: _f$colors};

  static PaintShopProPalette _instantiate(DecodingData data) {
    return PaintShopProPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static PaintShopProPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaintShopProPalette>(map);
  }

  static PaintShopProPalette fromJson(String json) {
    return ensureInitialized().decodeJson<PaintShopProPalette>(json);
  }
}

mixin PaintShopProPaletteMappable {
  String toJson() {
    return PaintShopProPaletteMapper.ensureInitialized()
        .encodeJson<PaintShopProPalette>(this as PaintShopProPalette);
  }

  Map<String, dynamic> toMap() {
    return PaintShopProPaletteMapper.ensureInitialized()
        .encodeMap<PaintShopProPalette>(this as PaintShopProPalette);
  }

  PaintShopProPaletteCopyWith<
    PaintShopProPalette,
    PaintShopProPalette,
    PaintShopProPalette
  >
  get copyWith => _PaintShopProPaletteCopyWithImpl<
    PaintShopProPalette,
    PaintShopProPalette
  >(this as PaintShopProPalette, $identity, $identity);
  @override
  String toString() {
    return PaintShopProPaletteMapper.ensureInitialized().stringifyValue(
      this as PaintShopProPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return PaintShopProPaletteMapper.ensureInitialized().equalsValue(
      this as PaintShopProPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return PaintShopProPaletteMapper.ensureInitialized().hashValue(
      this as PaintShopProPalette,
    );
  }
}

extension PaintShopProPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaintShopProPalette, $Out> {
  PaintShopProPaletteCopyWith<$R, PaintShopProPalette, $Out>
  get $asPaintShopProPalette => $base.as(
    (v, t, t2) => _PaintShopProPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PaintShopProPaletteCopyWith<
  $R,
  $In extends PaintShopProPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    PaintShopProPaletteColor,
    PaintShopProPaletteColorCopyWith<
      $R,
      PaintShopProPaletteColor,
      PaintShopProPaletteColor
    >
  >
  get colors;
  $R call({List<PaintShopProPaletteColor>? colors});
  PaintShopProPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PaintShopProPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaintShopProPalette, $Out>
    implements PaintShopProPaletteCopyWith<$R, PaintShopProPalette, $Out> {
  _PaintShopProPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaintShopProPalette> $mapper =
      PaintShopProPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    PaintShopProPaletteColor,
    PaintShopProPaletteColorCopyWith<
      $R,
      PaintShopProPaletteColor,
      PaintShopProPaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<PaintShopProPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  PaintShopProPalette $make(CopyWithData data) =>
      PaintShopProPalette(colors: data.get(#colors, or: $value.colors));

  @override
  PaintShopProPaletteCopyWith<$R2, PaintShopProPalette, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PaintShopProPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
