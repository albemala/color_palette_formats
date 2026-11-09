// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bcs.dart';

class BcsPaletteTypeMapper extends EnumMapper<BcsPaletteType> {
  BcsPaletteTypeMapper._();

  static BcsPaletteTypeMapper? _instance;
  static BcsPaletteTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcsPaletteTypeMapper._());
    }
    return _instance!;
  }

  static BcsPaletteType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BcsPaletteType decode(dynamic value) {
    switch (value) {
      case r'clf':
        return BcsPaletteType.clf;
      case r'atl':
        return BcsPaletteType.atl;
      case r'rgb':
        return BcsPaletteType.rgb;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BcsPaletteType self) {
    switch (self) {
      case BcsPaletteType.clf:
        return r'clf';
      case BcsPaletteType.atl:
        return r'atl';
      case BcsPaletteType.rgb:
        return r'rgb';
    }
  }
}

extension BcsPaletteTypeMapperExtension on BcsPaletteType {
  String toValue() {
    BcsPaletteTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BcsPaletteType>(this) as String;
  }
}

class BcsPaletteColorMapper extends ClassMapperBase<BcsPaletteColor> {
  BcsPaletteColorMapper._();

  static BcsPaletteColorMapper? _instance;
  static BcsPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcsPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BcsPaletteColor';

  static String _$name(BcsPaletteColor v) => v.name;
  static const Field<BcsPaletteColor, String> _f$name = Field('name', _$name);
  static List<double> _$lab(BcsPaletteColor v) => v.lab;
  static const Field<BcsPaletteColor, List<double>> _f$lab = Field(
    'lab',
    _$lab,
  );

  @override
  final MappableFields<BcsPaletteColor> fields = const {
    #name: _f$name,
    #lab: _f$lab,
  };

  static BcsPaletteColor _instantiate(DecodingData data) {
    return BcsPaletteColor(name: data.dec(_f$name), lab: data.dec(_f$lab));
  }

  @override
  final Function instantiate = _instantiate;

  static BcsPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcsPaletteColor>(map);
  }

  static BcsPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<BcsPaletteColor>(json);
  }
}

mixin BcsPaletteColorMappable {
  String toJson() {
    return BcsPaletteColorMapper.ensureInitialized()
        .encodeJson<BcsPaletteColor>(this as BcsPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return BcsPaletteColorMapper.ensureInitialized().encodeMap<BcsPaletteColor>(
      this as BcsPaletteColor,
    );
  }

  BcsPaletteColorCopyWith<BcsPaletteColor, BcsPaletteColor, BcsPaletteColor>
  get copyWith =>
      _BcsPaletteColorCopyWithImpl<BcsPaletteColor, BcsPaletteColor>(
        this as BcsPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcsPaletteColorMapper.ensureInitialized().stringifyValue(
      this as BcsPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcsPaletteColorMapper.ensureInitialized().equalsValue(
      this as BcsPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return BcsPaletteColorMapper.ensureInitialized().hashValue(
      this as BcsPaletteColor,
    );
  }
}

extension BcsPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcsPaletteColor, $Out> {
  BcsPaletteColorCopyWith<$R, BcsPaletteColor, $Out> get $asBcsPaletteColor =>
      $base.as((v, t, t2) => _BcsPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcsPaletteColorCopyWith<$R, $In extends BcsPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get lab;
  $R call({String? name, List<double>? lab});
  BcsPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BcsPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcsPaletteColor, $Out>
    implements BcsPaletteColorCopyWith<$R, BcsPaletteColor, $Out> {
  _BcsPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcsPaletteColor> $mapper =
      BcsPaletteColorMapper.ensureInitialized();
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
  BcsPaletteColor $make(CopyWithData data) => BcsPaletteColor(
    name: data.get(#name, or: $value.name),
    lab: data.get(#lab, or: $value.lab),
  );

  @override
  BcsPaletteColorCopyWith<$R2, BcsPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcsPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BcsPaletteMapper extends ClassMapperBase<BcsPalette> {
  BcsPaletteMapper._();

  static BcsPaletteMapper? _instance;
  static BcsPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcsPaletteMapper._());
      BcsPaletteTypeMapper.ensureInitialized();
      BcsPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BcsPalette';

  static BcsPaletteType _$type(BcsPalette v) => v.type;
  static const Field<BcsPalette, BcsPaletteType> _f$type = Field(
    'type',
    _$type,
  );
  static String _$system(BcsPalette v) => v.system;
  static const Field<BcsPalette, String> _f$system = Field('system', _$system);
  static String? _$germanSystem(BcsPalette v) => v.germanSystem;
  static const Field<BcsPalette, String> _f$germanSystem = Field(
    'germanSystem',
    _$germanSystem,
    opt: true,
  );
  static String _$name(BcsPalette v) => v.name;
  static const Field<BcsPalette, String> _f$name = Field('name', _$name);
  static String? _$germanName(BcsPalette v) => v.germanName;
  static const Field<BcsPalette, String> _f$germanName = Field(
    'germanName',
    _$germanName,
    opt: true,
  );
  static List<BcsPaletteColor> _$colors(BcsPalette v) => v.colors;
  static const Field<BcsPalette, List<BcsPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<BcsPalette> fields = const {
    #type: _f$type,
    #system: _f$system,
    #germanSystem: _f$germanSystem,
    #name: _f$name,
    #germanName: _f$germanName,
    #colors: _f$colors,
  };

  static BcsPalette _instantiate(DecodingData data) {
    return BcsPalette(
      type: data.dec(_f$type),
      system: data.dec(_f$system),
      germanSystem: data.dec(_f$germanSystem),
      name: data.dec(_f$name),
      germanName: data.dec(_f$germanName),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcsPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcsPalette>(map);
  }

  static BcsPalette fromJson(String json) {
    return ensureInitialized().decodeJson<BcsPalette>(json);
  }
}

mixin BcsPaletteMappable {
  String toJson() {
    return BcsPaletteMapper.ensureInitialized().encodeJson<BcsPalette>(
      this as BcsPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return BcsPaletteMapper.ensureInitialized().encodeMap<BcsPalette>(
      this as BcsPalette,
    );
  }

  BcsPaletteCopyWith<BcsPalette, BcsPalette, BcsPalette> get copyWith =>
      _BcsPaletteCopyWithImpl<BcsPalette, BcsPalette>(
        this as BcsPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcsPaletteMapper.ensureInitialized().stringifyValue(
      this as BcsPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcsPaletteMapper.ensureInitialized().equalsValue(
      this as BcsPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return BcsPaletteMapper.ensureInitialized().hashValue(this as BcsPalette);
  }
}

extension BcsPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcsPalette, $Out> {
  BcsPaletteCopyWith<$R, BcsPalette, $Out> get $asBcsPalette =>
      $base.as((v, t, t2) => _BcsPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcsPaletteCopyWith<$R, $In extends BcsPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    BcsPaletteColor,
    BcsPaletteColorCopyWith<$R, BcsPaletteColor, BcsPaletteColor>
  >
  get colors;
  $R call({
    BcsPaletteType? type,
    String? system,
    String? germanSystem,
    String? name,
    String? germanName,
    List<BcsPaletteColor>? colors,
  });
  BcsPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BcsPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcsPalette, $Out>
    implements BcsPaletteCopyWith<$R, BcsPalette, $Out> {
  _BcsPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcsPalette> $mapper =
      BcsPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    BcsPaletteColor,
    BcsPaletteColorCopyWith<$R, BcsPaletteColor, BcsPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    BcsPaletteType? type,
    String? system,
    Object? germanSystem = $none,
    String? name,
    Object? germanName = $none,
    List<BcsPaletteColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (type != null) #type: type,
      if (system != null) #system: system,
      if (germanSystem != $none) #germanSystem: germanSystem,
      if (name != null) #name: name,
      if (germanName != $none) #germanName: germanName,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  BcsPalette $make(CopyWithData data) => BcsPalette(
    type: data.get(#type, or: $value.type),
    system: data.get(#system, or: $value.system),
    germanSystem: data.get(#germanSystem, or: $value.germanSystem),
    name: data.get(#name, or: $value.name),
    germanName: data.get(#germanName, or: $value.germanName),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  BcsPaletteCopyWith<$R2, BcsPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcsPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
