// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'clr.dart';

class ClrGradientTypeMapper extends EnumMapper<ClrGradientType> {
  ClrGradientTypeMapper._();

  static ClrGradientTypeMapper? _instance;
  static ClrGradientTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrGradientTypeMapper._());
    }
    return _instance!;
  }

  static ClrGradientType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ClrGradientType decode(dynamic value) {
    switch (value) {
      case r'linear':
        return ClrGradientType.linear;
      case r'radial':
        return ClrGradientType.radial;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ClrGradientType self) {
    switch (self) {
      case ClrGradientType.linear:
        return r'linear';
      case ClrGradientType.radial:
        return r'radial';
    }
  }
}

extension ClrGradientTypeMapperExtension on ClrGradientType {
  String toValue() {
    ClrGradientTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ClrGradientType>(this) as String;
  }
}

class ClrGradientOverflowMapper extends EnumMapper<ClrGradientOverflow> {
  ClrGradientOverflowMapper._();

  static ClrGradientOverflowMapper? _instance;
  static ClrGradientOverflowMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrGradientOverflowMapper._());
    }
    return _instance!;
  }

  static ClrGradientOverflow fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ClrGradientOverflow decode(dynamic value) {
    switch (value) {
      case r'extend':
        return ClrGradientOverflow.extend;
      case r'reflect':
        return ClrGradientOverflow.reflect;
      case r'repeat':
        return ClrGradientOverflow.repeat;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ClrGradientOverflow self) {
    switch (self) {
      case ClrGradientOverflow.extend:
        return r'extend';
      case ClrGradientOverflow.reflect:
        return r'reflect';
      case ClrGradientOverflow.repeat:
        return r'repeat';
    }
  }
}

extension ClrGradientOverflowMapperExtension on ClrGradientOverflow {
  String toValue() {
    ClrGradientOverflowMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ClrGradientOverflow>(this) as String;
  }
}

class ClrPaletteColorMapper extends ClassMapperBase<ClrPaletteColor> {
  ClrPaletteColorMapper._();

  static ClrPaletteColorMapper? _instance;
  static ClrPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClrPaletteColor';

  static int _$version(ClrPaletteColor v) => v.version;
  static const Field<ClrPaletteColor, int> _f$version = Field(
    'version',
    _$version,
  );
  static int _$red(ClrPaletteColor v) => v.red;
  static const Field<ClrPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(ClrPaletteColor v) => v.green;
  static const Field<ClrPaletteColor, int> _f$green = Field('green', _$green);
  static int _$blue(ClrPaletteColor v) => v.blue;
  static const Field<ClrPaletteColor, int> _f$blue = Field('blue', _$blue);
  static int _$alpha(ClrPaletteColor v) => v.alpha;
  static const Field<ClrPaletteColor, int> _f$alpha = Field('alpha', _$alpha);
  static int _$hue(ClrPaletteColor v) => v.hue;
  static const Field<ClrPaletteColor, int> _f$hue = Field('hue', _$hue);
  static int _$saturation(ClrPaletteColor v) => v.saturation;
  static const Field<ClrPaletteColor, int> _f$saturation = Field(
    'saturation',
    _$saturation,
  );
  static int _$brightness(ClrPaletteColor v) => v.brightness;
  static const Field<ClrPaletteColor, int> _f$brightness = Field(
    'brightness',
    _$brightness,
  );

  @override
  final MappableFields<ClrPaletteColor> fields = const {
    #version: _f$version,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
    #hue: _f$hue,
    #saturation: _f$saturation,
    #brightness: _f$brightness,
  };

  static ClrPaletteColor _instantiate(DecodingData data) {
    return ClrPaletteColor(
      version: data.dec(_f$version),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
      hue: data.dec(_f$hue),
      saturation: data.dec(_f$saturation),
      brightness: data.dec(_f$brightness),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClrPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClrPaletteColor>(map);
  }

  static ClrPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<ClrPaletteColor>(json);
  }
}

mixin ClrPaletteColorMappable {
  String toJson() {
    return ClrPaletteColorMapper.ensureInitialized()
        .encodeJson<ClrPaletteColor>(this as ClrPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return ClrPaletteColorMapper.ensureInitialized().encodeMap<ClrPaletteColor>(
      this as ClrPaletteColor,
    );
  }

  ClrPaletteColorCopyWith<ClrPaletteColor, ClrPaletteColor, ClrPaletteColor>
  get copyWith =>
      _ClrPaletteColorCopyWithImpl<ClrPaletteColor, ClrPaletteColor>(
        this as ClrPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClrPaletteColorMapper.ensureInitialized().stringifyValue(
      this as ClrPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClrPaletteColorMapper.ensureInitialized().equalsValue(
      this as ClrPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return ClrPaletteColorMapper.ensureInitialized().hashValue(
      this as ClrPaletteColor,
    );
  }
}

extension ClrPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClrPaletteColor, $Out> {
  ClrPaletteColorCopyWith<$R, ClrPaletteColor, $Out> get $asClrPaletteColor =>
      $base.as((v, t, t2) => _ClrPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClrPaletteColorCopyWith<$R, $In extends ClrPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? version,
    int? red,
    int? green,
    int? blue,
    int? alpha,
    int? hue,
    int? saturation,
    int? brightness,
  });
  ClrPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ClrPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClrPaletteColor, $Out>
    implements ClrPaletteColorCopyWith<$R, ClrPaletteColor, $Out> {
  _ClrPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClrPaletteColor> $mapper =
      ClrPaletteColorMapper.ensureInitialized();
  @override
  $R call({
    int? version,
    int? red,
    int? green,
    int? blue,
    int? alpha,
    int? hue,
    int? saturation,
    int? brightness,
  }) => $apply(
    FieldCopyWithData({
      if (version != null) #version: version,
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (alpha != null) #alpha: alpha,
      if (hue != null) #hue: hue,
      if (saturation != null) #saturation: saturation,
      if (brightness != null) #brightness: brightness,
    }),
  );
  @override
  ClrPaletteColor $make(CopyWithData data) => ClrPaletteColor(
    version: data.get(#version, or: $value.version),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    alpha: data.get(#alpha, or: $value.alpha),
    hue: data.get(#hue, or: $value.hue),
    saturation: data.get(#saturation, or: $value.saturation),
    brightness: data.get(#brightness, or: $value.brightness),
  );

  @override
  ClrPaletteColorCopyWith<$R2, ClrPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClrPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClrGradientStopMapper extends ClassMapperBase<ClrGradientStop> {
  ClrGradientStopMapper._();

  static ClrGradientStopMapper? _instance;
  static ClrGradientStopMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrGradientStopMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClrGradientStop';

  static int _$offset(ClrGradientStop v) => v.offset;
  static const Field<ClrGradientStop, int> _f$offset = Field(
    'offset',
    _$offset,
  );
  static int _$red(ClrGradientStop v) => v.red;
  static const Field<ClrGradientStop, int> _f$red = Field('red', _$red);
  static int _$green(ClrGradientStop v) => v.green;
  static const Field<ClrGradientStop, int> _f$green = Field('green', _$green);
  static int _$blue(ClrGradientStop v) => v.blue;
  static const Field<ClrGradientStop, int> _f$blue = Field('blue', _$blue);
  static int _$alpha(ClrGradientStop v) => v.alpha;
  static const Field<ClrGradientStop, int> _f$alpha = Field('alpha', _$alpha);

  @override
  final MappableFields<ClrGradientStop> fields = const {
    #offset: _f$offset,
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #alpha: _f$alpha,
  };

  static ClrGradientStop _instantiate(DecodingData data) {
    return ClrGradientStop(
      offset: data.dec(_f$offset),
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      alpha: data.dec(_f$alpha),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClrGradientStop fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClrGradientStop>(map);
  }

  static ClrGradientStop fromJson(String json) {
    return ensureInitialized().decodeJson<ClrGradientStop>(json);
  }
}

mixin ClrGradientStopMappable {
  String toJson() {
    return ClrGradientStopMapper.ensureInitialized()
        .encodeJson<ClrGradientStop>(this as ClrGradientStop);
  }

  Map<String, dynamic> toMap() {
    return ClrGradientStopMapper.ensureInitialized().encodeMap<ClrGradientStop>(
      this as ClrGradientStop,
    );
  }

  ClrGradientStopCopyWith<ClrGradientStop, ClrGradientStop, ClrGradientStop>
  get copyWith =>
      _ClrGradientStopCopyWithImpl<ClrGradientStop, ClrGradientStop>(
        this as ClrGradientStop,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClrGradientStopMapper.ensureInitialized().stringifyValue(
      this as ClrGradientStop,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClrGradientStopMapper.ensureInitialized().equalsValue(
      this as ClrGradientStop,
      other,
    );
  }

  @override
  int get hashCode {
    return ClrGradientStopMapper.ensureInitialized().hashValue(
      this as ClrGradientStop,
    );
  }
}

extension ClrGradientStopValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClrGradientStop, $Out> {
  ClrGradientStopCopyWith<$R, ClrGradientStop, $Out> get $asClrGradientStop =>
      $base.as((v, t, t2) => _ClrGradientStopCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClrGradientStopCopyWith<$R, $In extends ClrGradientStop, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? offset, int? red, int? green, int? blue, int? alpha});
  ClrGradientStopCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ClrGradientStopCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClrGradientStop, $Out>
    implements ClrGradientStopCopyWith<$R, ClrGradientStop, $Out> {
  _ClrGradientStopCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClrGradientStop> $mapper =
      ClrGradientStopMapper.ensureInitialized();
  @override
  $R call({int? offset, int? red, int? green, int? blue, int? alpha}) => $apply(
    FieldCopyWithData({
      if (offset != null) #offset: offset,
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (alpha != null) #alpha: alpha,
    }),
  );
  @override
  ClrGradientStop $make(CopyWithData data) => ClrGradientStop(
    offset: data.get(#offset, or: $value.offset),
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    alpha: data.get(#alpha, or: $value.alpha),
  );

  @override
  ClrGradientStopCopyWith<$R2, ClrGradientStop, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClrGradientStopCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClrGradientMapper extends ClassMapperBase<ClrGradient> {
  ClrGradientMapper._();

  static ClrGradientMapper? _instance;
  static ClrGradientMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrGradientMapper._());
      ClrGradientTypeMapper.ensureInitialized();
      ClrGradientOverflowMapper.ensureInitialized();
      ClrGradientStopMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ClrGradient';

  static int _$version(ClrGradient v) => v.version;
  static const Field<ClrGradient, int> _f$version = Field('version', _$version);
  static int _$baseRed(ClrGradient v) => v.baseRed;
  static const Field<ClrGradient, int> _f$baseRed = Field('baseRed', _$baseRed);
  static int _$baseGreen(ClrGradient v) => v.baseGreen;
  static const Field<ClrGradient, int> _f$baseGreen = Field(
    'baseGreen',
    _$baseGreen,
  );
  static int _$baseBlue(ClrGradient v) => v.baseBlue;
  static const Field<ClrGradient, int> _f$baseBlue = Field(
    'baseBlue',
    _$baseBlue,
  );
  static int _$baseAlpha(ClrGradient v) => v.baseAlpha;
  static const Field<ClrGradient, int> _f$baseAlpha = Field(
    'baseAlpha',
    _$baseAlpha,
  );
  static ClrGradientType _$type(ClrGradient v) => v.type;
  static const Field<ClrGradient, ClrGradientType> _f$type = Field(
    'type',
    _$type,
  );
  static ClrGradientOverflow _$overflow(ClrGradient v) => v.overflow;
  static const Field<ClrGradient, ClrGradientOverflow> _f$overflow = Field(
    'overflow',
    _$overflow,
  );
  static bool _$linearRgb(ClrGradient v) => v.linearRgb;
  static const Field<ClrGradient, bool> _f$linearRgb = Field(
    'linearRgb',
    _$linearRgb,
  );
  static List<ClrGradientStop> _$stops(ClrGradient v) => v.stops;
  static const Field<ClrGradient, List<ClrGradientStop>> _f$stops = Field(
    'stops',
    _$stops,
  );

  @override
  final MappableFields<ClrGradient> fields = const {
    #version: _f$version,
    #baseRed: _f$baseRed,
    #baseGreen: _f$baseGreen,
    #baseBlue: _f$baseBlue,
    #baseAlpha: _f$baseAlpha,
    #type: _f$type,
    #overflow: _f$overflow,
    #linearRgb: _f$linearRgb,
    #stops: _f$stops,
  };

  static ClrGradient _instantiate(DecodingData data) {
    return ClrGradient(
      version: data.dec(_f$version),
      baseRed: data.dec(_f$baseRed),
      baseGreen: data.dec(_f$baseGreen),
      baseBlue: data.dec(_f$baseBlue),
      baseAlpha: data.dec(_f$baseAlpha),
      type: data.dec(_f$type),
      overflow: data.dec(_f$overflow),
      linearRgb: data.dec(_f$linearRgb),
      stops: data.dec(_f$stops),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClrGradient fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClrGradient>(map);
  }

  static ClrGradient fromJson(String json) {
    return ensureInitialized().decodeJson<ClrGradient>(json);
  }
}

mixin ClrGradientMappable {
  String toJson() {
    return ClrGradientMapper.ensureInitialized().encodeJson<ClrGradient>(
      this as ClrGradient,
    );
  }

  Map<String, dynamic> toMap() {
    return ClrGradientMapper.ensureInitialized().encodeMap<ClrGradient>(
      this as ClrGradient,
    );
  }

  ClrGradientCopyWith<ClrGradient, ClrGradient, ClrGradient> get copyWith =>
      _ClrGradientCopyWithImpl<ClrGradient, ClrGradient>(
        this as ClrGradient,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClrGradientMapper.ensureInitialized().stringifyValue(
      this as ClrGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClrGradientMapper.ensureInitialized().equalsValue(
      this as ClrGradient,
      other,
    );
  }

  @override
  int get hashCode {
    return ClrGradientMapper.ensureInitialized().hashValue(this as ClrGradient);
  }
}

extension ClrGradientValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClrGradient, $Out> {
  ClrGradientCopyWith<$R, ClrGradient, $Out> get $asClrGradient =>
      $base.as((v, t, t2) => _ClrGradientCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClrGradientCopyWith<$R, $In extends ClrGradient, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ClrGradientStop,
    ClrGradientStopCopyWith<$R, ClrGradientStop, ClrGradientStop>
  >
  get stops;
  $R call({
    int? version,
    int? baseRed,
    int? baseGreen,
    int? baseBlue,
    int? baseAlpha,
    ClrGradientType? type,
    ClrGradientOverflow? overflow,
    bool? linearRgb,
    List<ClrGradientStop>? stops,
  });
  ClrGradientCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClrGradientCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClrGradient, $Out>
    implements ClrGradientCopyWith<$R, ClrGradient, $Out> {
  _ClrGradientCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClrGradient> $mapper =
      ClrGradientMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ClrGradientStop,
    ClrGradientStopCopyWith<$R, ClrGradientStop, ClrGradientStop>
  >
  get stops => ListCopyWith(
    $value.stops,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(stops: v),
  );
  @override
  $R call({
    int? version,
    int? baseRed,
    int? baseGreen,
    int? baseBlue,
    int? baseAlpha,
    ClrGradientType? type,
    ClrGradientOverflow? overflow,
    bool? linearRgb,
    List<ClrGradientStop>? stops,
  }) => $apply(
    FieldCopyWithData({
      if (version != null) #version: version,
      if (baseRed != null) #baseRed: baseRed,
      if (baseGreen != null) #baseGreen: baseGreen,
      if (baseBlue != null) #baseBlue: baseBlue,
      if (baseAlpha != null) #baseAlpha: baseAlpha,
      if (type != null) #type: type,
      if (overflow != null) #overflow: overflow,
      if (linearRgb != null) #linearRgb: linearRgb,
      if (stops != null) #stops: stops,
    }),
  );
  @override
  ClrGradient $make(CopyWithData data) => ClrGradient(
    version: data.get(#version, or: $value.version),
    baseRed: data.get(#baseRed, or: $value.baseRed),
    baseGreen: data.get(#baseGreen, or: $value.baseGreen),
    baseBlue: data.get(#baseBlue, or: $value.baseBlue),
    baseAlpha: data.get(#baseAlpha, or: $value.baseAlpha),
    type: data.get(#type, or: $value.type),
    overflow: data.get(#overflow, or: $value.overflow),
    linearRgb: data.get(#linearRgb, or: $value.linearRgb),
    stops: data.get(#stops, or: $value.stops),
  );

  @override
  ClrGradientCopyWith<$R2, ClrGradient, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClrGradientCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClrPaletteMapper extends ClassMapperBase<ClrPalette> {
  ClrPaletteMapper._();

  static ClrPaletteMapper? _instance;
  static ClrPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClrPaletteMapper._());
      ClrPaletteColorMapper.ensureInitialized();
      ClrGradientMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ClrPalette';

  static List<ClrPaletteColor> _$colors(ClrPalette v) => v.colors;
  static const Field<ClrPalette, List<ClrPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );
  static List<ClrGradient> _$gradients(ClrPalette v) => v.gradients;
  static const Field<ClrPalette, List<ClrGradient>> _f$gradients = Field(
    'gradients',
    _$gradients,
  );

  @override
  final MappableFields<ClrPalette> fields = const {
    #colors: _f$colors,
    #gradients: _f$gradients,
  };

  static ClrPalette _instantiate(DecodingData data) {
    return ClrPalette(
      colors: data.dec(_f$colors),
      gradients: data.dec(_f$gradients),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ClrPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClrPalette>(map);
  }

  static ClrPalette fromJson(String json) {
    return ensureInitialized().decodeJson<ClrPalette>(json);
  }
}

mixin ClrPaletteMappable {
  String toJson() {
    return ClrPaletteMapper.ensureInitialized().encodeJson<ClrPalette>(
      this as ClrPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return ClrPaletteMapper.ensureInitialized().encodeMap<ClrPalette>(
      this as ClrPalette,
    );
  }

  ClrPaletteCopyWith<ClrPalette, ClrPalette, ClrPalette> get copyWith =>
      _ClrPaletteCopyWithImpl<ClrPalette, ClrPalette>(
        this as ClrPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClrPaletteMapper.ensureInitialized().stringifyValue(
      this as ClrPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClrPaletteMapper.ensureInitialized().equalsValue(
      this as ClrPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return ClrPaletteMapper.ensureInitialized().hashValue(this as ClrPalette);
  }
}

extension ClrPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClrPalette, $Out> {
  ClrPaletteCopyWith<$R, ClrPalette, $Out> get $asClrPalette =>
      $base.as((v, t, t2) => _ClrPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClrPaletteCopyWith<$R, $In extends ClrPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ClrPaletteColor,
    ClrPaletteColorCopyWith<$R, ClrPaletteColor, ClrPaletteColor>
  >
  get colors;
  ListCopyWith<
    $R,
    ClrGradient,
    ClrGradientCopyWith<$R, ClrGradient, ClrGradient>
  >
  get gradients;
  $R call({List<ClrPaletteColor>? colors, List<ClrGradient>? gradients});
  ClrPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClrPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClrPalette, $Out>
    implements ClrPaletteCopyWith<$R, ClrPalette, $Out> {
  _ClrPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClrPalette> $mapper =
      ClrPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ClrPaletteColor,
    ClrPaletteColorCopyWith<$R, ClrPaletteColor, ClrPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  ListCopyWith<
    $R,
    ClrGradient,
    ClrGradientCopyWith<$R, ClrGradient, ClrGradient>
  >
  get gradients => ListCopyWith(
    $value.gradients,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(gradients: v),
  );
  @override
  $R call({List<ClrPaletteColor>? colors, List<ClrGradient>? gradients}) =>
      $apply(
        FieldCopyWithData({
          if (colors != null) #colors: colors,
          if (gradients != null) #gradients: gradients,
        }),
      );
  @override
  ClrPalette $make(CopyWithData data) => ClrPalette(
    colors: data.get(#colors, or: $value.colors),
    gradients: data.get(#gradients, or: $value.gradients),
  );

  @override
  ClrPaletteCopyWith<$R2, ClrPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClrPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
