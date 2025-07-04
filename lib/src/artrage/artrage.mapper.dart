// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'artrage.dart';

class Artrage6ColorMapper extends ClassMapperBase<Artrage6Color> {
  Artrage6ColorMapper._();

  static Artrage6ColorMapper? _instance;
  static Artrage6ColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Artrage6ColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Artrage6Color';

  static String _$name(Artrage6Color v) => v.name;
  static const Field<Artrage6Color, String> _f$name = Field('name', _$name);
  static int _$red(Artrage6Color v) => v.red;
  static const Field<Artrage6Color, int> _f$red = Field('red', _$red);
  static int _$green(Artrage6Color v) => v.green;
  static const Field<Artrage6Color, int> _f$green = Field('green', _$green);
  static int _$blue(Artrage6Color v) => v.blue;
  static const Field<Artrage6Color, int> _f$blue = Field('blue', _$blue);
  static int _$alpha(Artrage6Color v) => v.alpha;
  static const Field<Artrage6Color, int> _f$alpha = Field(
    'alpha',
    _$alpha,
    opt: true,
    def: 255,
  );

  @override
  final MappableFields<Artrage6Color> fields = const {
    #name: _f$name,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static Artrage6Color _instantiate(DecodingData data) {
    return Artrage6Color(
      name: data.dec(_f$name),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Artrage6Color fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Artrage6Color>(map);
  }

  static Artrage6Color fromJson(String json) {
    return ensureInitialized().decodeJson<Artrage6Color>(json);
  }
}

mixin Artrage6ColorMappable {
  String toJson() {
    return Artrage6ColorMapper.ensureInitialized().encodeJson<Artrage6Color>(
      this as Artrage6Color,
    );
  }

  Map<String, dynamic> toMap() {
    return Artrage6ColorMapper.ensureInitialized().encodeMap<Artrage6Color>(
      this as Artrage6Color,
    );
  }

  Artrage6ColorCopyWith<Artrage6Color, Artrage6Color, Artrage6Color>
  get copyWith => _Artrage6ColorCopyWithImpl<Artrage6Color, Artrage6Color>(
    this as Artrage6Color,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return Artrage6ColorMapper.ensureInitialized().stringifyValue(
      this as Artrage6Color,
    );
  }

  @override
  bool operator ==(Object other) {
    return Artrage6ColorMapper.ensureInitialized().equalsValue(
      this as Artrage6Color,
      other,
    );
  }

  @override
  int get hashCode {
    return Artrage6ColorMapper.ensureInitialized().hashValue(
      this as Artrage6Color,
    );
  }
}

extension Artrage6ColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Artrage6Color, $Out> {
  Artrage6ColorCopyWith<$R, Artrage6Color, $Out> get $asArtrage6Color =>
      $base.as((v, t, t2) => _Artrage6ColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Artrage6ColorCopyWith<$R, $In extends Artrage6Color, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? red, int? green, int? blue, int? alpha});
  Artrage6ColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Artrage6ColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Artrage6Color, $Out>
    implements Artrage6ColorCopyWith<$R, Artrage6Color, $Out> {
  _Artrage6ColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Artrage6Color> $mapper =
      Artrage6ColorMapper.ensureInitialized();
  @override
  $R call({String? name, int? red, int? green, int? blue, int? alpha}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (red != null) #red: red,
          if (green != null) #green: green,
          if (blue != null) #blue: blue,
          if (alpha != null) #alpha: alpha,
        }),
      );
  @override
  Artrage6Color $make(CopyWithData data) => Artrage6Color(
    name: data.get(#name, or: $value.name),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    alpha: data.get(#alpha, or: $value.alpha),
  );

  @override
  Artrage6ColorCopyWith<$R2, Artrage6Color, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _Artrage6ColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class Artrage6PaletteMapper extends ClassMapperBase<Artrage6Palette> {
  Artrage6PaletteMapper._();

  static Artrage6PaletteMapper? _instance;
  static Artrage6PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Artrage6PaletteMapper._());
      Artrage6ColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Artrage6Palette';

  static String? _$name(Artrage6Palette v) => v.name;
  static const Field<Artrage6Palette, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static List<Artrage6Color> _$colors(Artrage6Palette v) => v.colors;
  static const Field<Artrage6Palette, List<Artrage6Color>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<Artrage6Palette> fields = const {
    #name: _f$name,
    #colors: _f$colors,
  };

  static Artrage6Palette _instantiate(DecodingData data) {
    return Artrage6Palette(
      name: data.dec(_f$name),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Artrage6Palette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Artrage6Palette>(map);
  }

  static Artrage6Palette fromJson(String json) {
    return ensureInitialized().decodeJson<Artrage6Palette>(json);
  }
}

mixin Artrage6PaletteMappable {
  String toJson() {
    return Artrage6PaletteMapper.ensureInitialized()
        .encodeJson<Artrage6Palette>(this as Artrage6Palette);
  }

  Map<String, dynamic> toMap() {
    return Artrage6PaletteMapper.ensureInitialized().encodeMap<Artrage6Palette>(
      this as Artrage6Palette,
    );
  }

  Artrage6PaletteCopyWith<Artrage6Palette, Artrage6Palette, Artrage6Palette>
  get copyWith =>
      _Artrage6PaletteCopyWithImpl<Artrage6Palette, Artrage6Palette>(
        this as Artrage6Palette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return Artrage6PaletteMapper.ensureInitialized().stringifyValue(
      this as Artrage6Palette,
    );
  }

  @override
  bool operator ==(Object other) {
    return Artrage6PaletteMapper.ensureInitialized().equalsValue(
      this as Artrage6Palette,
      other,
    );
  }

  @override
  int get hashCode {
    return Artrage6PaletteMapper.ensureInitialized().hashValue(
      this as Artrage6Palette,
    );
  }
}

extension Artrage6PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Artrage6Palette, $Out> {
  Artrage6PaletteCopyWith<$R, Artrage6Palette, $Out> get $asArtrage6Palette =>
      $base.as((v, t, t2) => _Artrage6PaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Artrage6PaletteCopyWith<$R, $In extends Artrage6Palette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    Artrage6Color,
    Artrage6ColorCopyWith<$R, Artrage6Color, Artrage6Color>
  >
  get colors;
  $R call({String? name, List<Artrage6Color>? colors});
  Artrage6PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _Artrage6PaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Artrage6Palette, $Out>
    implements Artrage6PaletteCopyWith<$R, Artrage6Palette, $Out> {
  _Artrage6PaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Artrage6Palette> $mapper =
      Artrage6PaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    Artrage6Color,
    Artrage6ColorCopyWith<$R, Artrage6Color, Artrage6Color>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({Object? name = $none, List<Artrage6Color>? colors}) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  Artrage6Palette $make(CopyWithData data) => Artrage6Palette(
    name: data.get(#name, or: $value.name),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  Artrage6PaletteCopyWith<$R2, Artrage6Palette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _Artrage6PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
