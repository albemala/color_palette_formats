// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scribus.dart';

class ScribusColorMapper extends ClassMapperBase<ScribusColor> {
  ScribusColorMapper._();

  static ScribusColorMapper? _instance;
  static ScribusColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScribusColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ScribusColor';

  static String _$name(ScribusColor v) => v.name;
  static const Field<ScribusColor, String> _f$name = Field('name', _$name);
  static String _$rgb(ScribusColor v) => v.rgb;
  static const Field<ScribusColor, String> _f$rgb = Field('rgb', _$rgb);
  static String _$spot(ScribusColor v) => v.spot;
  static const Field<ScribusColor, String> _f$spot = Field('spot', _$spot);
  static String _$register(ScribusColor v) => v.register;
  static const Field<ScribusColor, String> _f$register = Field(
    'register',
    _$register,
  );

  @override
  final MappableFields<ScribusColor> fields = const {
    #name: _f$name,
    #rgb: _f$rgb,
    #spot: _f$spot,
    #register: _f$register,
  };

  static ScribusColor _instantiate(DecodingData data) {
    return ScribusColor(
      name: data.dec(_f$name),
      rgb: data.dec(_f$rgb),
      spot: data.dec(_f$spot),
      register: data.dec(_f$register),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ScribusColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScribusColor>(map);
  }

  static ScribusColor fromJson(String json) {
    return ensureInitialized().decodeJson<ScribusColor>(json);
  }
}

mixin ScribusColorMappable {
  String toJson() {
    return ScribusColorMapper.ensureInitialized().encodeJson<ScribusColor>(
      this as ScribusColor,
    );
  }

  Map<String, dynamic> toMap() {
    return ScribusColorMapper.ensureInitialized().encodeMap<ScribusColor>(
      this as ScribusColor,
    );
  }

  ScribusColorCopyWith<ScribusColor, ScribusColor, ScribusColor> get copyWith =>
      _ScribusColorCopyWithImpl<ScribusColor, ScribusColor>(
        this as ScribusColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ScribusColorMapper.ensureInitialized().stringifyValue(
      this as ScribusColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return ScribusColorMapper.ensureInitialized().equalsValue(
      this as ScribusColor,
      other,
    );
  }

  @override
  int get hashCode {
    return ScribusColorMapper.ensureInitialized().hashValue(
      this as ScribusColor,
    );
  }
}

extension ScribusColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ScribusColor, $Out> {
  ScribusColorCopyWith<$R, ScribusColor, $Out> get $asScribusColor =>
      $base.as((v, t, t2) => _ScribusColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ScribusColorCopyWith<$R, $In extends ScribusColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? rgb, String? spot, String? register});
  ScribusColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScribusColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ScribusColor, $Out>
    implements ScribusColorCopyWith<$R, ScribusColor, $Out> {
  _ScribusColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ScribusColor> $mapper =
      ScribusColorMapper.ensureInitialized();
  @override
  $R call({String? name, String? rgb, String? spot, String? register}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (rgb != null) #rgb: rgb,
          if (spot != null) #spot: spot,
          if (register != null) #register: register,
        }),
      );
  @override
  ScribusColor $make(CopyWithData data) => ScribusColor(
    name: data.get(#name, or: $value.name),
    rgb: data.get(#rgb, or: $value.rgb),
    spot: data.get(#spot, or: $value.spot),
    register: data.get(#register, or: $value.register),
  );

  @override
  ScribusColorCopyWith<$R2, ScribusColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ScribusColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ScribusPaletteMapper extends ClassMapperBase<ScribusPalette> {
  ScribusPaletteMapper._();

  static ScribusPaletteMapper? _instance;
  static ScribusPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScribusPaletteMapper._());
      ScribusColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ScribusPalette';

  static String _$name(ScribusPalette v) => v.name;
  static const Field<ScribusPalette, String> _f$name = Field('name', _$name);
  static List<ScribusColor> _$colors(ScribusPalette v) => v.colors;
  static const Field<ScribusPalette, List<ScribusColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<ScribusPalette> fields = const {
    #name: _f$name,
    #colors: _f$colors,
  };

  static ScribusPalette _instantiate(DecodingData data) {
    return ScribusPalette(name: data.dec(_f$name), colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static ScribusPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScribusPalette>(map);
  }

  static ScribusPalette fromJson(String json) {
    return ensureInitialized().decodeJson<ScribusPalette>(json);
  }
}

mixin ScribusPaletteMappable {
  String toJson() {
    return ScribusPaletteMapper.ensureInitialized().encodeJson<ScribusPalette>(
      this as ScribusPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return ScribusPaletteMapper.ensureInitialized().encodeMap<ScribusPalette>(
      this as ScribusPalette,
    );
  }

  ScribusPaletteCopyWith<ScribusPalette, ScribusPalette, ScribusPalette>
  get copyWith => _ScribusPaletteCopyWithImpl<ScribusPalette, ScribusPalette>(
    this as ScribusPalette,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ScribusPaletteMapper.ensureInitialized().stringifyValue(
      this as ScribusPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ScribusPaletteMapper.ensureInitialized().equalsValue(
      this as ScribusPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return ScribusPaletteMapper.ensureInitialized().hashValue(
      this as ScribusPalette,
    );
  }
}

extension ScribusPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ScribusPalette, $Out> {
  ScribusPaletteCopyWith<$R, ScribusPalette, $Out> get $asScribusPalette =>
      $base.as((v, t, t2) => _ScribusPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ScribusPaletteCopyWith<$R, $In extends ScribusPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ScribusColor,
    ScribusColorCopyWith<$R, ScribusColor, ScribusColor>
  >
  get colors;
  $R call({String? name, List<ScribusColor>? colors});
  ScribusPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ScribusPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ScribusPalette, $Out>
    implements ScribusPaletteCopyWith<$R, ScribusPalette, $Out> {
  _ScribusPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ScribusPalette> $mapper =
      ScribusPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ScribusColor,
    ScribusColorCopyWith<$R, ScribusColor, ScribusColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({String? name, List<ScribusColor>? colors}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  ScribusPalette $make(CopyWithData data) => ScribusPalette(
    name: data.get(#name, or: $value.name),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  ScribusPaletteCopyWith<$R2, ScribusPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ScribusPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
