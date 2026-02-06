// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'afpalette.dart';

class AffinityDesignerPaletteColorMapper
    extends ClassMapperBase<AffinityDesignerPaletteColor> {
  AffinityDesignerPaletteColorMapper._();

  static AffinityDesignerPaletteColorMapper? _instance;
  static AffinityDesignerPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AffinityDesignerPaletteColorMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AffinityDesignerPaletteColor';

  static String _$name(AffinityDesignerPaletteColor v) => v.name;
  static const Field<AffinityDesignerPaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );
  static double _$red(AffinityDesignerPaletteColor v) => v.red;
  static const Field<AffinityDesignerPaletteColor, double> _f$red = Field(
    'red',
    _$red,
  );
  static double _$green(AffinityDesignerPaletteColor v) => v.green;
  static const Field<AffinityDesignerPaletteColor, double> _f$green = Field(
    'green',
    _$green,
  );
  static double _$blue(AffinityDesignerPaletteColor v) => v.blue;
  static const Field<AffinityDesignerPaletteColor, double> _f$blue = Field(
    'blue',
    _$blue,
  );
  static double _$alpha(AffinityDesignerPaletteColor v) => v.alpha;
  static const Field<AffinityDesignerPaletteColor, double> _f$alpha = Field(
    'alpha',
    _$alpha,
    opt: true,
    def: 1.0,
  );

  @override
  final MappableFields<AffinityDesignerPaletteColor> fields = const {
    #name: _f$name,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static AffinityDesignerPaletteColor _instantiate(DecodingData data) {
    return AffinityDesignerPaletteColor(
      name: data.dec(_f$name),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AffinityDesignerPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AffinityDesignerPaletteColor>(map);
  }

  static AffinityDesignerPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<AffinityDesignerPaletteColor>(json);
  }
}

mixin AffinityDesignerPaletteColorMappable {
  String toJson() {
    return AffinityDesignerPaletteColorMapper.ensureInitialized()
        .encodeJson<AffinityDesignerPaletteColor>(
          this as AffinityDesignerPaletteColor,
        );
  }

  Map<String, dynamic> toMap() {
    return AffinityDesignerPaletteColorMapper.ensureInitialized()
        .encodeMap<AffinityDesignerPaletteColor>(
          this as AffinityDesignerPaletteColor,
        );
  }

  AffinityDesignerPaletteColorCopyWith<
    AffinityDesignerPaletteColor,
    AffinityDesignerPaletteColor,
    AffinityDesignerPaletteColor
  >
  get copyWith => _AffinityDesignerPaletteColorCopyWithImpl<
    AffinityDesignerPaletteColor,
    AffinityDesignerPaletteColor
  >(this as AffinityDesignerPaletteColor, $identity, $identity);
  @override
  String toString() {
    return AffinityDesignerPaletteColorMapper.ensureInitialized()
        .stringifyValue(this as AffinityDesignerPaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return AffinityDesignerPaletteColorMapper.ensureInitialized().equalsValue(
      this as AffinityDesignerPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return AffinityDesignerPaletteColorMapper.ensureInitialized().hashValue(
      this as AffinityDesignerPaletteColor,
    );
  }
}

extension AffinityDesignerPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AffinityDesignerPaletteColor, $Out> {
  AffinityDesignerPaletteColorCopyWith<$R, AffinityDesignerPaletteColor, $Out>
  get $asAffinityDesignerPaletteColor => $base.as(
    (v, t, t2) => _AffinityDesignerPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AffinityDesignerPaletteColorCopyWith<
  $R,
  $In extends AffinityDesignerPaletteColor,
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
  AffinityDesignerPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AffinityDesignerPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AffinityDesignerPaletteColor, $Out>
    implements
        AffinityDesignerPaletteColorCopyWith<
          $R,
          AffinityDesignerPaletteColor,
          $Out
        > {
  _AffinityDesignerPaletteColorCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<AffinityDesignerPaletteColor> $mapper =
      AffinityDesignerPaletteColorMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    double? red,
    double? green,
    double? blue,
    double? alpha,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (alpha != null) #alpha: alpha,
    }),
  );
  @override
  AffinityDesignerPaletteColor $make(CopyWithData data) =>
      AffinityDesignerPaletteColor(
        name: data.get(#name, or: $value.name),
        red: data.get(#red, or: $value.red),
        green: data.get(#green, or: $value.green),
        blue: data.get(#blue, or: $value.blue),
        alpha: data.get(#alpha, or: $value.alpha),
      );

  @override
  AffinityDesignerPaletteColorCopyWith<$R2, AffinityDesignerPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AffinityDesignerPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AffinityDesignerPaletteMapper
    extends ClassMapperBase<AffinityDesignerPalette> {
  AffinityDesignerPaletteMapper._();

  static AffinityDesignerPaletteMapper? _instance;
  static AffinityDesignerPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AffinityDesignerPaletteMapper._(),
      );
      AffinityDesignerPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AffinityDesignerPalette';

  static String? _$fileName(AffinityDesignerPalette v) => v.fileName;
  static const Field<AffinityDesignerPalette, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static List<AffinityDesignerPaletteColor> _$colors(
    AffinityDesignerPalette v,
  ) => v.colors;
  static const Field<
    AffinityDesignerPalette,
    List<AffinityDesignerPaletteColor>
  >
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<AffinityDesignerPalette> fields = const {
    #fileName: _f$fileName,
    #colors: _f$colors,
  };

  static AffinityDesignerPalette _instantiate(DecodingData data) {
    return AffinityDesignerPalette(
      fileName: data.dec(_f$fileName),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AffinityDesignerPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AffinityDesignerPalette>(map);
  }

  static AffinityDesignerPalette fromJson(String json) {
    return ensureInitialized().decodeJson<AffinityDesignerPalette>(json);
  }
}

mixin AffinityDesignerPaletteMappable {
  String toJson() {
    return AffinityDesignerPaletteMapper.ensureInitialized()
        .encodeJson<AffinityDesignerPalette>(this as AffinityDesignerPalette);
  }

  Map<String, dynamic> toMap() {
    return AffinityDesignerPaletteMapper.ensureInitialized()
        .encodeMap<AffinityDesignerPalette>(this as AffinityDesignerPalette);
  }

  AffinityDesignerPaletteCopyWith<
    AffinityDesignerPalette,
    AffinityDesignerPalette,
    AffinityDesignerPalette
  >
  get copyWith => _AffinityDesignerPaletteCopyWithImpl<
    AffinityDesignerPalette,
    AffinityDesignerPalette
  >(this as AffinityDesignerPalette, $identity, $identity);
  @override
  String toString() {
    return AffinityDesignerPaletteMapper.ensureInitialized().stringifyValue(
      this as AffinityDesignerPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return AffinityDesignerPaletteMapper.ensureInitialized().equalsValue(
      this as AffinityDesignerPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return AffinityDesignerPaletteMapper.ensureInitialized().hashValue(
      this as AffinityDesignerPalette,
    );
  }
}

extension AffinityDesignerPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AffinityDesignerPalette, $Out> {
  AffinityDesignerPaletteCopyWith<$R, AffinityDesignerPalette, $Out>
  get $asAffinityDesignerPalette => $base.as(
    (v, t, t2) => _AffinityDesignerPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AffinityDesignerPaletteCopyWith<
  $R,
  $In extends AffinityDesignerPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    AffinityDesignerPaletteColor,
    AffinityDesignerPaletteColorCopyWith<
      $R,
      AffinityDesignerPaletteColor,
      AffinityDesignerPaletteColor
    >
  >
  get colors;
  $R call({String? fileName, List<AffinityDesignerPaletteColor>? colors});
  AffinityDesignerPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AffinityDesignerPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AffinityDesignerPalette, $Out>
    implements
        AffinityDesignerPaletteCopyWith<$R, AffinityDesignerPalette, $Out> {
  _AffinityDesignerPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AffinityDesignerPalette> $mapper =
      AffinityDesignerPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    AffinityDesignerPaletteColor,
    AffinityDesignerPaletteColorCopyWith<
      $R,
      AffinityDesignerPaletteColor,
      AffinityDesignerPaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    Object? fileName = $none,
    List<AffinityDesignerPaletteColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (fileName != $none) #fileName: fileName,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  AffinityDesignerPalette $make(CopyWithData data) => AffinityDesignerPalette(
    fileName: data.get(#fileName, or: $value.fileName),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  AffinityDesignerPaletteCopyWith<$R2, AffinityDesignerPalette, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AffinityDesignerPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
