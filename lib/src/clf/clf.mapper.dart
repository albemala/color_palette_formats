// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'clf.dart';

class ClfPaletteColorMapper extends ClassMapperBase<ClfPaletteColor> {
  ClfPaletteColorMapper._();

  static ClfPaletteColorMapper? _instance;
  static ClfPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClfPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClfPaletteColor';

  static String _$name(ClfPaletteColor v) => v.name;
  static const Field<ClfPaletteColor, String> _f$name = Field('name', _$name);
  static List<double> _$lab(ClfPaletteColor v) => v.lab;
  static const Field<ClfPaletteColor, List<double>> _f$lab = Field(
    'lab',
    _$lab,
  );

  @override
  final MappableFields<ClfPaletteColor> fields = const {
    #name: _f$name,
    #lab: _f$lab,
  };

  static ClfPaletteColor _instantiate(DecodingData data) {
    return ClfPaletteColor(name: data.dec(_f$name), lab: data.dec(_f$lab));
  }

  @override
  final Function instantiate = _instantiate;

  static ClfPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClfPaletteColor>(map);
  }

  static ClfPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<ClfPaletteColor>(json);
  }
}

mixin ClfPaletteColorMappable {
  String toJson() {
    return ClfPaletteColorMapper.ensureInitialized()
        .encodeJson<ClfPaletteColor>(this as ClfPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return ClfPaletteColorMapper.ensureInitialized().encodeMap<ClfPaletteColor>(
      this as ClfPaletteColor,
    );
  }

  ClfPaletteColorCopyWith<ClfPaletteColor, ClfPaletteColor, ClfPaletteColor>
  get copyWith =>
      _ClfPaletteColorCopyWithImpl<ClfPaletteColor, ClfPaletteColor>(
        this as ClfPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClfPaletteColorMapper.ensureInitialized().stringifyValue(
      this as ClfPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClfPaletteColorMapper.ensureInitialized().equalsValue(
      this as ClfPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return ClfPaletteColorMapper.ensureInitialized().hashValue(
      this as ClfPaletteColor,
    );
  }
}

extension ClfPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClfPaletteColor, $Out> {
  ClfPaletteColorCopyWith<$R, ClfPaletteColor, $Out> get $asClfPaletteColor =>
      $base.as((v, t, t2) => _ClfPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClfPaletteColorCopyWith<$R, $In extends ClfPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get lab;
  $R call({String? name, List<double>? lab});
  ClfPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ClfPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClfPaletteColor, $Out>
    implements ClfPaletteColorCopyWith<$R, ClfPaletteColor, $Out> {
  _ClfPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClfPaletteColor> $mapper =
      ClfPaletteColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get lab =>
      ListCopyWith(
        $value.lab,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(lab: v),
      );
  @override
  $R call({String? name, List<double>? lab}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (lab != null) #lab: lab,
    }),
  );
  @override
  ClfPaletteColor $make(CopyWithData data) => ClfPaletteColor(
    name: data.get(#name, or: $value.name),
    lab: data.get(#lab, or: $value.lab),
  );

  @override
  ClfPaletteColorCopyWith<$R2, ClfPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClfPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClfPaletteMapper extends ClassMapperBase<ClfPalette> {
  ClfPaletteMapper._();

  static ClfPaletteMapper? _instance;
  static ClfPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClfPaletteMapper._());
      ClfPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ClfPalette';

  static List<ClfPaletteColor> _$colors(ClfPalette v) => v.colors;
  static const Field<ClfPalette, List<ClfPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<ClfPalette> fields = const {#colors: _f$colors};

  static ClfPalette _instantiate(DecodingData data) {
    return ClfPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static ClfPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClfPalette>(map);
  }

  static ClfPalette fromJson(String json) {
    return ensureInitialized().decodeJson<ClfPalette>(json);
  }
}

mixin ClfPaletteMappable {
  String toJson() {
    return ClfPaletteMapper.ensureInitialized().encodeJson<ClfPalette>(
      this as ClfPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return ClfPaletteMapper.ensureInitialized().encodeMap<ClfPalette>(
      this as ClfPalette,
    );
  }

  ClfPaletteCopyWith<ClfPalette, ClfPalette, ClfPalette> get copyWith =>
      _ClfPaletteCopyWithImpl<ClfPalette, ClfPalette>(
        this as ClfPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClfPaletteMapper.ensureInitialized().stringifyValue(
      this as ClfPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClfPaletteMapper.ensureInitialized().equalsValue(
      this as ClfPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return ClfPaletteMapper.ensureInitialized().hashValue(this as ClfPalette);
  }
}

extension ClfPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClfPalette, $Out> {
  ClfPaletteCopyWith<$R, ClfPalette, $Out> get $asClfPalette =>
      $base.as((v, t, t2) => _ClfPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClfPaletteCopyWith<$R, $In extends ClfPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ClfPaletteColor,
    ClfPaletteColorCopyWith<$R, ClfPaletteColor, ClfPaletteColor>
  >
  get colors;
  $R call({List<ClfPaletteColor>? colors});
  ClfPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClfPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClfPalette, $Out>
    implements ClfPaletteCopyWith<$R, ClfPalette, $Out> {
  _ClfPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClfPalette> $mapper =
      ClfPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ClfPaletteColor,
    ClfPaletteColorCopyWith<$R, ClfPaletteColor, ClfPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<ClfPaletteColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  ClfPalette $make(CopyWithData data) =>
      ClfPalette(colors: data.get(#colors, or: $value.colors));

  @override
  ClfPaletteCopyWith<$R2, ClfPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClfPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
