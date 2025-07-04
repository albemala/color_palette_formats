// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cxf.dart';

class CxfColorMapper extends ClassMapperBase<CxfColor> {
  CxfColorMapper._();

  static CxfColorMapper? _instance;
  static CxfColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CxfColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CxfColor';

  static String _$name(CxfColor v) => v.name;
  static const Field<CxfColor, String> _f$name = Field('name', _$name);
  static double _$l(CxfColor v) => v.l;
  static const Field<CxfColor, double> _f$l = Field('l', _$l);
  static double _$a(CxfColor v) => v.a;
  static const Field<CxfColor, double> _f$a = Field('a', _$a);
  static double _$b(CxfColor v) => v.b;
  static const Field<CxfColor, double> _f$b = Field('b', _$b);

  @override
  final MappableFields<CxfColor> fields = const {
    #name: _f$name,
    #l: _f$l,
    #a: _f$a,
    #b: _f$b,
  };

  static CxfColor _instantiate(DecodingData data) {
    return CxfColor(
      name: data.dec(_f$name),
      l: data.dec(_f$l),
      a: data.dec(_f$a),
      b: data.dec(_f$b),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CxfColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CxfColor>(map);
  }

  static CxfColor fromJson(String json) {
    return ensureInitialized().decodeJson<CxfColor>(json);
  }
}

mixin CxfColorMappable {
  String toJson() {
    return CxfColorMapper.ensureInitialized().encodeJson<CxfColor>(
      this as CxfColor,
    );
  }

  Map<String, dynamic> toMap() {
    return CxfColorMapper.ensureInitialized().encodeMap<CxfColor>(
      this as CxfColor,
    );
  }

  CxfColorCopyWith<CxfColor, CxfColor, CxfColor> get copyWith =>
      _CxfColorCopyWithImpl<CxfColor, CxfColor>(
        this as CxfColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CxfColorMapper.ensureInitialized().stringifyValue(this as CxfColor);
  }

  @override
  bool operator ==(Object other) {
    return CxfColorMapper.ensureInitialized().equalsValue(
      this as CxfColor,
      other,
    );
  }

  @override
  int get hashCode {
    return CxfColorMapper.ensureInitialized().hashValue(this as CxfColor);
  }
}

extension CxfColorValueCopy<$R, $Out> on ObjectCopyWith<$R, CxfColor, $Out> {
  CxfColorCopyWith<$R, CxfColor, $Out> get $asCxfColor =>
      $base.as((v, t, t2) => _CxfColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CxfColorCopyWith<$R, $In extends CxfColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, double? l, double? a, double? b});
  CxfColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CxfColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CxfColor, $Out>
    implements CxfColorCopyWith<$R, CxfColor, $Out> {
  _CxfColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CxfColor> $mapper =
      CxfColorMapper.ensureInitialized();
  @override
  $R call({String? name, double? l, double? a, double? b}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (l != null) #l: l,
      if (a != null) #a: a,
      if (b != null) #b: b,
    }),
  );
  @override
  CxfColor $make(CopyWithData data) => CxfColor(
    name: data.get(#name, or: $value.name),
    l: data.get(#l, or: $value.l),
    a: data.get(#a, or: $value.a),
    b: data.get(#b, or: $value.b),
  );

  @override
  CxfColorCopyWith<$R2, CxfColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CxfColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CxfPaletteMapper extends ClassMapperBase<CxfPalette> {
  CxfPaletteMapper._();

  static CxfPaletteMapper? _instance;
  static CxfPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CxfPaletteMapper._());
      CxfColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CxfPalette';

  static List<CxfColor> _$colors(CxfPalette v) => v.colors;
  static const Field<CxfPalette, List<CxfColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<CxfPalette> fields = const {#colors: _f$colors};

  static CxfPalette _instantiate(DecodingData data) {
    return CxfPalette(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static CxfPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CxfPalette>(map);
  }

  static CxfPalette fromJson(String json) {
    return ensureInitialized().decodeJson<CxfPalette>(json);
  }
}

mixin CxfPaletteMappable {
  String toJson() {
    return CxfPaletteMapper.ensureInitialized().encodeJson<CxfPalette>(
      this as CxfPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return CxfPaletteMapper.ensureInitialized().encodeMap<CxfPalette>(
      this as CxfPalette,
    );
  }

  CxfPaletteCopyWith<CxfPalette, CxfPalette, CxfPalette> get copyWith =>
      _CxfPaletteCopyWithImpl<CxfPalette, CxfPalette>(
        this as CxfPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CxfPaletteMapper.ensureInitialized().stringifyValue(
      this as CxfPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return CxfPaletteMapper.ensureInitialized().equalsValue(
      this as CxfPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return CxfPaletteMapper.ensureInitialized().hashValue(this as CxfPalette);
  }
}

extension CxfPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CxfPalette, $Out> {
  CxfPaletteCopyWith<$R, CxfPalette, $Out> get $asCxfPalette =>
      $base.as((v, t, t2) => _CxfPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CxfPaletteCopyWith<$R, $In extends CxfPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CxfColor, CxfColorCopyWith<$R, CxfColor, CxfColor>>
  get colors;
  $R call({List<CxfColor>? colors});
  CxfPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CxfPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CxfPalette, $Out>
    implements CxfPaletteCopyWith<$R, CxfPalette, $Out> {
  _CxfPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CxfPalette> $mapper =
      CxfPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CxfColor, CxfColorCopyWith<$R, CxfColor, CxfColor>>
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<CxfColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  CxfPalette $make(CopyWithData data) =>
      CxfPalette(colors: data.get(#colors, or: $value.colors));

  @override
  CxfPaletteCopyWith<$R2, CxfPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CxfPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
