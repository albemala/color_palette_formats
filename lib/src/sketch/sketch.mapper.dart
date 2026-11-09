// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sketch.dart';

class SketchDocumentColorMapper extends ClassMapperBase<SketchDocumentColor> {
  SketchDocumentColorMapper._();

  static SketchDocumentColorMapper? _instance;
  static SketchDocumentColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchDocumentColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SketchDocumentColor';

  static String? _$name(SketchDocumentColor v) => v.name;
  static const Field<SketchDocumentColor, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static double _$red(SketchDocumentColor v) => v.red;
  static const Field<SketchDocumentColor, double> _f$red = Field('red', _$red);
  static double _$green(SketchDocumentColor v) => v.green;
  static const Field<SketchDocumentColor, double> _f$green = Field(
    'green',
    _$green,
  );
  static double _$blue(SketchDocumentColor v) => v.blue;
  static const Field<SketchDocumentColor, double> _f$blue = Field(
    'blue',
    _$blue,
  );
  static double _$alpha(SketchDocumentColor v) => v.alpha;
  static const Field<SketchDocumentColor, double> _f$alpha = Field(
    'alpha',
    _$alpha,
  );

  @override
  final MappableFields<SketchDocumentColor> fields = const {
    #name: _f$name,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static SketchDocumentColor _instantiate(DecodingData data) {
    return SketchDocumentColor(
      name: data.dec(_f$name),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SketchDocumentColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchDocumentColor>(map);
  }

  static SketchDocumentColor fromJson(String json) {
    return ensureInitialized().decodeJson<SketchDocumentColor>(json);
  }
}

mixin SketchDocumentColorMappable {
  String toJson() {
    return SketchDocumentColorMapper.ensureInitialized()
        .encodeJson<SketchDocumentColor>(this as SketchDocumentColor);
  }

  Map<String, dynamic> toMap() {
    return SketchDocumentColorMapper.ensureInitialized()
        .encodeMap<SketchDocumentColor>(this as SketchDocumentColor);
  }

  SketchDocumentColorCopyWith<
    SketchDocumentColor,
    SketchDocumentColor,
    SketchDocumentColor
  >
  get copyWith => _SketchDocumentColorCopyWithImpl<
    SketchDocumentColor,
    SketchDocumentColor
  >(this as SketchDocumentColor, $identity, $identity);
  @override
  String toString() {
    return SketchDocumentColorMapper.ensureInitialized().stringifyValue(
      this as SketchDocumentColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return SketchDocumentColorMapper.ensureInitialized().equalsValue(
      this as SketchDocumentColor,
      other,
    );
  }

  @override
  int get hashCode {
    return SketchDocumentColorMapper.ensureInitialized().hashValue(
      this as SketchDocumentColor,
    );
  }
}

extension SketchDocumentColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchDocumentColor, $Out> {
  SketchDocumentColorCopyWith<$R, SketchDocumentColor, $Out>
  get $asSketchDocumentColor => $base.as(
    (v, t, t2) => _SketchDocumentColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SketchDocumentColorCopyWith<
  $R,
  $In extends SketchDocumentColor,
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
  SketchDocumentColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SketchDocumentColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchDocumentColor, $Out>
    implements SketchDocumentColorCopyWith<$R, SketchDocumentColor, $Out> {
  _SketchDocumentColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchDocumentColor> $mapper =
      SketchDocumentColorMapper.ensureInitialized();
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
  SketchDocumentColor $make(CopyWithData data) => SketchDocumentColor(
    name: data.get(#name, or: $value.name),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    alpha: data.get(#alpha, or: $value.alpha),
  );

  @override
  SketchDocumentColorCopyWith<$R2, SketchDocumentColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SketchDocumentColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SketchDocumentPaletteMapper
    extends ClassMapperBase<SketchDocumentPalette> {
  SketchDocumentPaletteMapper._();

  static SketchDocumentPaletteMapper? _instance;
  static SketchDocumentPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SketchDocumentPaletteMapper._());
      SketchDocumentColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SketchDocumentPalette';

  static List<SketchDocumentColor> _$colors(SketchDocumentPalette v) =>
      v.colors;
  static const Field<SketchDocumentPalette, List<SketchDocumentColor>>
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<SketchDocumentPalette> fields = const {
    #colors: _f$colors,
  };

  static SketchDocumentPalette _instantiate(DecodingData data) {
    return SketchDocumentPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static SketchDocumentPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SketchDocumentPalette>(map);
  }

  static SketchDocumentPalette fromJson(String json) {
    return ensureInitialized().decodeJson<SketchDocumentPalette>(json);
  }
}

mixin SketchDocumentPaletteMappable {
  String toJson() {
    return SketchDocumentPaletteMapper.ensureInitialized()
        .encodeJson<SketchDocumentPalette>(this as SketchDocumentPalette);
  }

  Map<String, dynamic> toMap() {
    return SketchDocumentPaletteMapper.ensureInitialized()
        .encodeMap<SketchDocumentPalette>(this as SketchDocumentPalette);
  }

  SketchDocumentPaletteCopyWith<
    SketchDocumentPalette,
    SketchDocumentPalette,
    SketchDocumentPalette
  >
  get copyWith => _SketchDocumentPaletteCopyWithImpl<
    SketchDocumentPalette,
    SketchDocumentPalette
  >(this as SketchDocumentPalette, $identity, $identity);
  @override
  String toString() {
    return SketchDocumentPaletteMapper.ensureInitialized().stringifyValue(
      this as SketchDocumentPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return SketchDocumentPaletteMapper.ensureInitialized().equalsValue(
      this as SketchDocumentPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return SketchDocumentPaletteMapper.ensureInitialized().hashValue(
      this as SketchDocumentPalette,
    );
  }
}

extension SketchDocumentPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SketchDocumentPalette, $Out> {
  SketchDocumentPaletteCopyWith<$R, SketchDocumentPalette, $Out>
  get $asSketchDocumentPalette => $base.as(
    (v, t, t2) => _SketchDocumentPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SketchDocumentPaletteCopyWith<
  $R,
  $In extends SketchDocumentPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    SketchDocumentColor,
    SketchDocumentColorCopyWith<$R, SketchDocumentColor, SketchDocumentColor>
  >
  get colors;
  $R call({List<SketchDocumentColor>? colors});
  SketchDocumentPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SketchDocumentPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SketchDocumentPalette, $Out>
    implements SketchDocumentPaletteCopyWith<$R, SketchDocumentPalette, $Out> {
  _SketchDocumentPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SketchDocumentPalette> $mapper =
      SketchDocumentPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    SketchDocumentColor,
    SketchDocumentColorCopyWith<$R, SketchDocumentColor, SketchDocumentColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<SketchDocumentColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  SketchDocumentPalette $make(CopyWithData data) =>
      SketchDocumentPalette(colors: data.get(#colors, or: $value.colors));

  @override
  SketchDocumentPaletteCopyWith<$R2, SketchDocumentPalette, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SketchDocumentPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
