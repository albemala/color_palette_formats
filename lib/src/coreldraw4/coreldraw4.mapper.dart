// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'coreldraw4.dart';

class CorelDraw4PaletteColorMapper
    extends ClassMapperBase<CorelDraw4PaletteColor> {
  CorelDraw4PaletteColorMapper._();

  static CorelDraw4PaletteColorMapper? _instance;
  static CorelDraw4PaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CorelDraw4PaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CorelDraw4PaletteColor';

  static int _$cyan(CorelDraw4PaletteColor v) => v.cyan;
  static const Field<CorelDraw4PaletteColor, int> _f$cyan = Field(
    'cyan',
    _$cyan,
  );
  static int _$magenta(CorelDraw4PaletteColor v) => v.magenta;
  static const Field<CorelDraw4PaletteColor, int> _f$magenta = Field(
    'magenta',
    _$magenta,
  );
  static int _$yellow(CorelDraw4PaletteColor v) => v.yellow;
  static const Field<CorelDraw4PaletteColor, int> _f$yellow = Field(
    'yellow',
    _$yellow,
  );
  static int _$black(CorelDraw4PaletteColor v) => v.black;
  static const Field<CorelDraw4PaletteColor, int> _f$black = Field(
    'black',
    _$black,
  );
  static String _$name(CorelDraw4PaletteColor v) => v.name;
  static const Field<CorelDraw4PaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );

  @override
  final MappableFields<CorelDraw4PaletteColor> fields = const {
    #cyan: _f$cyan,
    #magenta: _f$magenta,
    #yellow: _f$yellow,
    #black: _f$black,
    #name: _f$name,
  };

  static CorelDraw4PaletteColor _instantiate(DecodingData data) {
    return CorelDraw4PaletteColor(
      cyan: data.dec(_f$cyan),
      magenta: data.dec(_f$magenta),
      yellow: data.dec(_f$yellow),
      black: data.dec(_f$black),
      name: data.dec(_f$name),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CorelDraw4PaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CorelDraw4PaletteColor>(map);
  }

  static CorelDraw4PaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<CorelDraw4PaletteColor>(json);
  }
}

mixin CorelDraw4PaletteColorMappable {
  String toJson() {
    return CorelDraw4PaletteColorMapper.ensureInitialized()
        .encodeJson<CorelDraw4PaletteColor>(this as CorelDraw4PaletteColor);
  }

  Map<String, dynamic> toMap() {
    return CorelDraw4PaletteColorMapper.ensureInitialized()
        .encodeMap<CorelDraw4PaletteColor>(this as CorelDraw4PaletteColor);
  }

  CorelDraw4PaletteColorCopyWith<
    CorelDraw4PaletteColor,
    CorelDraw4PaletteColor,
    CorelDraw4PaletteColor
  >
  get copyWith => _CorelDraw4PaletteColorCopyWithImpl<
    CorelDraw4PaletteColor,
    CorelDraw4PaletteColor
  >(this as CorelDraw4PaletteColor, $identity, $identity);
  @override
  String toString() {
    return CorelDraw4PaletteColorMapper.ensureInitialized().stringifyValue(
      this as CorelDraw4PaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return CorelDraw4PaletteColorMapper.ensureInitialized().equalsValue(
      this as CorelDraw4PaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return CorelDraw4PaletteColorMapper.ensureInitialized().hashValue(
      this as CorelDraw4PaletteColor,
    );
  }
}

extension CorelDraw4PaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CorelDraw4PaletteColor, $Out> {
  CorelDraw4PaletteColorCopyWith<$R, CorelDraw4PaletteColor, $Out>
  get $asCorelDraw4PaletteColor => $base.as(
    (v, t, t2) => _CorelDraw4PaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CorelDraw4PaletteColorCopyWith<
  $R,
  $In extends CorelDraw4PaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? cyan, int? magenta, int? yellow, int? black, String? name});
  CorelDraw4PaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CorelDraw4PaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CorelDraw4PaletteColor, $Out>
    implements
        CorelDraw4PaletteColorCopyWith<$R, CorelDraw4PaletteColor, $Out> {
  _CorelDraw4PaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CorelDraw4PaletteColor> $mapper =
      CorelDraw4PaletteColorMapper.ensureInitialized();
  @override
  $R call({int? cyan, int? magenta, int? yellow, int? black, String? name}) =>
      $apply(
        FieldCopyWithData({
          if (cyan != null) #cyan: cyan,
          if (magenta != null) #magenta: magenta,
          if (yellow != null) #yellow: yellow,
          if (black != null) #black: black,
          if (name != null) #name: name,
        }),
      );
  @override
  CorelDraw4PaletteColor $make(CopyWithData data) => CorelDraw4PaletteColor(
    cyan: data.get(#cyan, or: $value.cyan),
    magenta: data.get(#magenta, or: $value.magenta),
    yellow: data.get(#yellow, or: $value.yellow),
    black: data.get(#black, or: $value.black),
    name: data.get(#name, or: $value.name),
  );

  @override
  CorelDraw4PaletteColorCopyWith<$R2, CorelDraw4PaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CorelDraw4PaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CorelDraw4PaletteMapper extends ClassMapperBase<CorelDraw4Palette> {
  CorelDraw4PaletteMapper._();

  static CorelDraw4PaletteMapper? _instance;
  static CorelDraw4PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CorelDraw4PaletteMapper._());
      CorelDraw4PaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CorelDraw4Palette';

  static List<CorelDraw4PaletteColor> _$colors(CorelDraw4Palette v) => v.colors;
  static const Field<CorelDraw4Palette, List<CorelDraw4PaletteColor>>
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<CorelDraw4Palette> fields = const {#colors: _f$colors};

  static CorelDraw4Palette _instantiate(DecodingData data) {
    return CorelDraw4Palette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static CorelDraw4Palette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CorelDraw4Palette>(map);
  }

  static CorelDraw4Palette fromJson(String json) {
    return ensureInitialized().decodeJson<CorelDraw4Palette>(json);
  }
}

mixin CorelDraw4PaletteMappable {
  String toJson() {
    return CorelDraw4PaletteMapper.ensureInitialized()
        .encodeJson<CorelDraw4Palette>(this as CorelDraw4Palette);
  }

  Map<String, dynamic> toMap() {
    return CorelDraw4PaletteMapper.ensureInitialized()
        .encodeMap<CorelDraw4Palette>(this as CorelDraw4Palette);
  }

  CorelDraw4PaletteCopyWith<
    CorelDraw4Palette,
    CorelDraw4Palette,
    CorelDraw4Palette
  >
  get copyWith =>
      _CorelDraw4PaletteCopyWithImpl<CorelDraw4Palette, CorelDraw4Palette>(
        this as CorelDraw4Palette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CorelDraw4PaletteMapper.ensureInitialized().stringifyValue(
      this as CorelDraw4Palette,
    );
  }

  @override
  bool operator ==(Object other) {
    return CorelDraw4PaletteMapper.ensureInitialized().equalsValue(
      this as CorelDraw4Palette,
      other,
    );
  }

  @override
  int get hashCode {
    return CorelDraw4PaletteMapper.ensureInitialized().hashValue(
      this as CorelDraw4Palette,
    );
  }
}

extension CorelDraw4PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CorelDraw4Palette, $Out> {
  CorelDraw4PaletteCopyWith<$R, CorelDraw4Palette, $Out>
  get $asCorelDraw4Palette => $base.as(
    (v, t, t2) => _CorelDraw4PaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CorelDraw4PaletteCopyWith<
  $R,
  $In extends CorelDraw4Palette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    CorelDraw4PaletteColor,
    CorelDraw4PaletteColorCopyWith<
      $R,
      CorelDraw4PaletteColor,
      CorelDraw4PaletteColor
    >
  >
  get colors;
  $R call({List<CorelDraw4PaletteColor>? colors});
  CorelDraw4PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CorelDraw4PaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CorelDraw4Palette, $Out>
    implements CorelDraw4PaletteCopyWith<$R, CorelDraw4Palette, $Out> {
  _CorelDraw4PaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CorelDraw4Palette> $mapper =
      CorelDraw4PaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    CorelDraw4PaletteColor,
    CorelDraw4PaletteColorCopyWith<
      $R,
      CorelDraw4PaletteColor,
      CorelDraw4PaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<CorelDraw4PaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  CorelDraw4Palette $make(CopyWithData data) =>
      CorelDraw4Palette(colors: data.get(#colors, or: $value.colors));

  @override
  CorelDraw4PaletteCopyWith<$R2, CorelDraw4Palette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CorelDraw4PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
