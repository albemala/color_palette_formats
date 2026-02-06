// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'colorschemer.dart';

class ColorSchemerColorMapper extends ClassMapperBase<ColorSchemerColor> {
  ColorSchemerColorMapper._();

  static ColorSchemerColorMapper? _instance;
  static ColorSchemerColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ColorSchemerColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ColorSchemerColor';

  static String _$name(ColorSchemerColor v) => v.name;
  static const Field<ColorSchemerColor, String> _f$name = Field('name', _$name);
  static int _$red(ColorSchemerColor v) => v.red;
  static const Field<ColorSchemerColor, int> _f$red = Field('red', _$red);
  static int _$green(ColorSchemerColor v) => v.green;
  static const Field<ColorSchemerColor, int> _f$green = Field('green', _$green);
  static int _$blue(ColorSchemerColor v) => v.blue;
  static const Field<ColorSchemerColor, int> _f$blue = Field('blue', _$blue);
  static String _$hexValue(ColorSchemerColor v) => v.hexValue;
  static const Field<ColorSchemerColor, String> _f$hexValue = Field(
    'hexValue',
    _$hexValue,
  );
  static bool _$developed(ColorSchemerColor v) => v.developed;
  static const Field<ColorSchemerColor, bool> _f$developed = Field(
    'developed',
    _$developed,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ColorSchemerColor> fields = const {
    #name: _f$name,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #hexValue: _f$hexValue,
    #developed: _f$developed,
  };

  static ColorSchemerColor _instantiate(DecodingData data) {
    return ColorSchemerColor(
      name: data.dec(_f$name),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      hexValue: data.dec(_f$hexValue),
      developed: data.dec(_f$developed),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ColorSchemerColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ColorSchemerColor>(map);
  }

  static ColorSchemerColor fromJson(String json) {
    return ensureInitialized().decodeJson<ColorSchemerColor>(json);
  }
}

mixin ColorSchemerColorMappable {
  String toJson() {
    return ColorSchemerColorMapper.ensureInitialized()
        .encodeJson<ColorSchemerColor>(this as ColorSchemerColor);
  }

  Map<String, dynamic> toMap() {
    return ColorSchemerColorMapper.ensureInitialized()
        .encodeMap<ColorSchemerColor>(this as ColorSchemerColor);
  }

  ColorSchemerColorCopyWith<
    ColorSchemerColor,
    ColorSchemerColor,
    ColorSchemerColor
  >
  get copyWith =>
      _ColorSchemerColorCopyWithImpl<ColorSchemerColor, ColorSchemerColor>(
        this as ColorSchemerColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ColorSchemerColorMapper.ensureInitialized().stringifyValue(
      this as ColorSchemerColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return ColorSchemerColorMapper.ensureInitialized().equalsValue(
      this as ColorSchemerColor,
      other,
    );
  }

  @override
  int get hashCode {
    return ColorSchemerColorMapper.ensureInitialized().hashValue(
      this as ColorSchemerColor,
    );
  }
}

extension ColorSchemerColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ColorSchemerColor, $Out> {
  ColorSchemerColorCopyWith<$R, ColorSchemerColor, $Out>
  get $asColorSchemerColor => $base.as(
    (v, t, t2) => _ColorSchemerColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ColorSchemerColorCopyWith<
  $R,
  $In extends ColorSchemerColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    int? red,
    int? green,
    int? blue,
    String? hexValue,
    bool? developed,
  });
  ColorSchemerColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ColorSchemerColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ColorSchemerColor, $Out>
    implements ColorSchemerColorCopyWith<$R, ColorSchemerColor, $Out> {
  _ColorSchemerColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ColorSchemerColor> $mapper =
      ColorSchemerColorMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    int? red,
    int? green,
    int? blue,
    String? hexValue,
    bool? developed,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (hexValue != null) #hexValue: hexValue,
      if (developed != null) #developed: developed,
    }),
  );
  @override
  ColorSchemerColor $make(CopyWithData data) => ColorSchemerColor(
    name: data.get(#name, or: $value.name),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    hexValue: data.get(#hexValue, or: $value.hexValue),
    developed: data.get(#developed, or: $value.developed),
  );

  @override
  ColorSchemerColorCopyWith<$R2, ColorSchemerColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ColorSchemerColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ColorSchemerPaletteMapper extends ClassMapperBase<ColorSchemerPalette> {
  ColorSchemerPaletteMapper._();

  static ColorSchemerPaletteMapper? _instance;
  static ColorSchemerPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ColorSchemerPaletteMapper._());
      ColorSchemerColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ColorSchemerPalette';

  static int _$version(ColorSchemerPalette v) => v.version;
  static const Field<ColorSchemerPalette, int> _f$version = Field(
    'version',
    _$version,
  );
  static List<int> _$baseColor(ColorSchemerPalette v) => v.baseColor;
  static const Field<ColorSchemerPalette, List<int>> _f$baseColor = Field(
    'baseColor',
    _$baseColor,
  );
  static List<ColorSchemerColor> _$colors(ColorSchemerPalette v) => v.colors;
  static const Field<ColorSchemerPalette, List<ColorSchemerColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<ColorSchemerPalette> fields = const {
    #version: _f$version,
    #baseColor: _f$baseColor,
    #colors: _f$colors,
  };

  static ColorSchemerPalette _instantiate(DecodingData data) {
    return ColorSchemerPalette(
      version: data.dec(_f$version),
      baseColor: data.dec(_f$baseColor),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ColorSchemerPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ColorSchemerPalette>(map);
  }

  static ColorSchemerPalette fromJson(String json) {
    return ensureInitialized().decodeJson<ColorSchemerPalette>(json);
  }
}

mixin ColorSchemerPaletteMappable {
  String toJson() {
    return ColorSchemerPaletteMapper.ensureInitialized()
        .encodeJson<ColorSchemerPalette>(this as ColorSchemerPalette);
  }

  Map<String, dynamic> toMap() {
    return ColorSchemerPaletteMapper.ensureInitialized()
        .encodeMap<ColorSchemerPalette>(this as ColorSchemerPalette);
  }

  ColorSchemerPaletteCopyWith<
    ColorSchemerPalette,
    ColorSchemerPalette,
    ColorSchemerPalette
  >
  get copyWith => _ColorSchemerPaletteCopyWithImpl<
    ColorSchemerPalette,
    ColorSchemerPalette
  >(this as ColorSchemerPalette, $identity, $identity);
  @override
  String toString() {
    return ColorSchemerPaletteMapper.ensureInitialized().stringifyValue(
      this as ColorSchemerPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ColorSchemerPaletteMapper.ensureInitialized().equalsValue(
      this as ColorSchemerPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return ColorSchemerPaletteMapper.ensureInitialized().hashValue(
      this as ColorSchemerPalette,
    );
  }
}

extension ColorSchemerPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ColorSchemerPalette, $Out> {
  ColorSchemerPaletteCopyWith<$R, ColorSchemerPalette, $Out>
  get $asColorSchemerPalette => $base.as(
    (v, t, t2) => _ColorSchemerPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ColorSchemerPaletteCopyWith<
  $R,
  $In extends ColorSchemerPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get baseColor;
  ListCopyWith<
    $R,
    ColorSchemerColor,
    ColorSchemerColorCopyWith<$R, ColorSchemerColor, ColorSchemerColor>
  >
  get colors;
  $R call({
    int? version,
    List<int>? baseColor,
    List<ColorSchemerColor>? colors,
  });
  ColorSchemerPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ColorSchemerPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ColorSchemerPalette, $Out>
    implements ColorSchemerPaletteCopyWith<$R, ColorSchemerPalette, $Out> {
  _ColorSchemerPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ColorSchemerPalette> $mapper =
      ColorSchemerPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get baseColor =>
      ListCopyWith(
        $value.baseColor,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(baseColor: v),
      );
  @override
  ListCopyWith<
    $R,
    ColorSchemerColor,
    ColorSchemerColorCopyWith<$R, ColorSchemerColor, ColorSchemerColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    int? version,
    List<int>? baseColor,
    List<ColorSchemerColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (version != null) #version: version,
      if (baseColor != null) #baseColor: baseColor,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  ColorSchemerPalette $make(CopyWithData data) => ColorSchemerPalette(
    version: data.get(#version, or: $value.version),
    baseColor: data.get(#baseColor, or: $value.baseColor),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  ColorSchemerPaletteCopyWith<$R2, ColorSchemerPalette, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ColorSchemerPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
