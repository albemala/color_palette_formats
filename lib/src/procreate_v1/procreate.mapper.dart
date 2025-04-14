// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'procreate.dart';

class ProcreateV1ColorSpaceMapper extends EnumMapper<ProcreateV1ColorSpace> {
  ProcreateV1ColorSpaceMapper._();

  static ProcreateV1ColorSpaceMapper? _instance;
  static ProcreateV1ColorSpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV1ColorSpaceMapper._());
    }
    return _instance!;
  }

  static ProcreateV1ColorSpace fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProcreateV1ColorSpace decode(dynamic value) {
    switch (value) {
      case 0:
        return ProcreateV1ColorSpace.hsb;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProcreateV1ColorSpace self) {
    switch (self) {
      case ProcreateV1ColorSpace.hsb:
        return 0;
    }
  }
}

extension ProcreateV1ColorSpaceMapperExtension on ProcreateV1ColorSpace {
  dynamic toValue() {
    ProcreateV1ColorSpaceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProcreateV1ColorSpace>(this);
  }
}

class ProcreateV1SwatchMapper extends ClassMapperBase<ProcreateV1Swatch> {
  ProcreateV1SwatchMapper._();

  static ProcreateV1SwatchMapper? _instance;
  static ProcreateV1SwatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV1SwatchMapper._());
      ProcreateV1ColorSpaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV1Swatch';

  static double _$hue(ProcreateV1Swatch v) => v.hue;
  static const Field<ProcreateV1Swatch, double> _f$hue = Field('hue', _$hue);
  static double _$saturation(ProcreateV1Swatch v) => v.saturation;
  static const Field<ProcreateV1Swatch, double> _f$saturation = Field(
    'saturation',
    _$saturation,
  );
  static double _$brightness(ProcreateV1Swatch v) => v.brightness;
  static const Field<ProcreateV1Swatch, double> _f$brightness = Field(
    'brightness',
    _$brightness,
  );
  static double _$alpha(ProcreateV1Swatch v) => v.alpha;
  static const Field<ProcreateV1Swatch, double> _f$alpha = Field(
    'alpha',
    _$alpha,
  );
  static ProcreateV1ColorSpace _$colorSpace(ProcreateV1Swatch v) =>
      v.colorSpace;
  static const Field<ProcreateV1Swatch, ProcreateV1ColorSpace> _f$colorSpace =
      Field('colorSpace', _$colorSpace);

  @override
  final MappableFields<ProcreateV1Swatch> fields = const {
    #hue: _f$hue,
    #saturation: _f$saturation,
    #brightness: _f$brightness,
    #alpha: _f$alpha,
    #colorSpace: _f$colorSpace,
  };

  static ProcreateV1Swatch _instantiate(DecodingData data) {
    return ProcreateV1Swatch(
      hue: data.dec(_f$hue),
      saturation: data.dec(_f$saturation),
      brightness: data.dec(_f$brightness),
      alpha: data.dec(_f$alpha),
      colorSpace: data.dec(_f$colorSpace),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV1Swatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV1Swatch>(map);
  }

  static ProcreateV1Swatch fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV1Swatch>(json);
  }
}

mixin ProcreateV1SwatchMappable {
  String toJson() {
    return ProcreateV1SwatchMapper.ensureInitialized()
        .encodeJson<ProcreateV1Swatch>(this as ProcreateV1Swatch);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV1SwatchMapper.ensureInitialized()
        .encodeMap<ProcreateV1Swatch>(this as ProcreateV1Swatch);
  }

  ProcreateV1SwatchCopyWith<
    ProcreateV1Swatch,
    ProcreateV1Swatch,
    ProcreateV1Swatch
  >
  get copyWith =>
      _ProcreateV1SwatchCopyWithImpl<ProcreateV1Swatch, ProcreateV1Swatch>(
        this as ProcreateV1Swatch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProcreateV1SwatchMapper.ensureInitialized().stringifyValue(
      this as ProcreateV1Swatch,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV1SwatchMapper.ensureInitialized().equalsValue(
      this as ProcreateV1Swatch,
      other,
    );
  }

  @override
  int get hashCode {
    return ProcreateV1SwatchMapper.ensureInitialized().hashValue(
      this as ProcreateV1Swatch,
    );
  }
}

extension ProcreateV1SwatchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV1Swatch, $Out> {
  ProcreateV1SwatchCopyWith<$R, ProcreateV1Swatch, $Out>
  get $asProcreateV1Swatch => $base.as(
    (v, t, t2) => _ProcreateV1SwatchCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProcreateV1SwatchCopyWith<
  $R,
  $In extends ProcreateV1Swatch,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    double? hue,
    double? saturation,
    double? brightness,
    double? alpha,
    ProcreateV1ColorSpace? colorSpace,
  });
  ProcreateV1SwatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProcreateV1SwatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV1Swatch, $Out>
    implements ProcreateV1SwatchCopyWith<$R, ProcreateV1Swatch, $Out> {
  _ProcreateV1SwatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV1Swatch> $mapper =
      ProcreateV1SwatchMapper.ensureInitialized();
  @override
  $R call({
    double? hue,
    double? saturation,
    double? brightness,
    double? alpha,
    ProcreateV1ColorSpace? colorSpace,
  }) => $apply(
    FieldCopyWithData({
      if (hue != null) #hue: hue,
      if (saturation != null) #saturation: saturation,
      if (brightness != null) #brightness: brightness,
      if (alpha != null) #alpha: alpha,
      if (colorSpace != null) #colorSpace: colorSpace,
    }),
  );
  @override
  ProcreateV1Swatch $make(CopyWithData data) => ProcreateV1Swatch(
    hue: data.get(#hue, or: $value.hue),
    saturation: data.get(#saturation, or: $value.saturation),
    brightness: data.get(#brightness, or: $value.brightness),
    alpha: data.get(#alpha, or: $value.alpha),
    colorSpace: data.get(#colorSpace, or: $value.colorSpace),
  );

  @override
  ProcreateV1SwatchCopyWith<$R2, ProcreateV1Swatch, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProcreateV1SwatchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProcreateV1PaletteMapper extends ClassMapperBase<ProcreateV1Palette> {
  ProcreateV1PaletteMapper._();

  static ProcreateV1PaletteMapper? _instance;
  static ProcreateV1PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV1PaletteMapper._());
      ProcreateV1SwatchMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV1Palette';

  static String _$name(ProcreateV1Palette v) => v.name;
  static const Field<ProcreateV1Palette, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static List<ProcreateV1Swatch> _$swatches(ProcreateV1Palette v) => v.swatches;
  static const Field<ProcreateV1Palette, List<ProcreateV1Swatch>> _f$swatches =
      Field('swatches', _$swatches);

  @override
  final MappableFields<ProcreateV1Palette> fields = const {
    #name: _f$name,
    #swatches: _f$swatches,
  };

  static ProcreateV1Palette _instantiate(DecodingData data) {
    return ProcreateV1Palette(
      name: data.dec(_f$name),
      swatches: data.dec(_f$swatches),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV1Palette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV1Palette>(map);
  }

  static ProcreateV1Palette fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV1Palette>(json);
  }
}

mixin ProcreateV1PaletteMappable {
  String toJson() {
    return ProcreateV1PaletteMapper.ensureInitialized()
        .encodeJson<ProcreateV1Palette>(this as ProcreateV1Palette);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV1PaletteMapper.ensureInitialized()
        .encodeMap<ProcreateV1Palette>(this as ProcreateV1Palette);
  }

  ProcreateV1PaletteCopyWith<
    ProcreateV1Palette,
    ProcreateV1Palette,
    ProcreateV1Palette
  >
  get copyWith =>
      _ProcreateV1PaletteCopyWithImpl<ProcreateV1Palette, ProcreateV1Palette>(
        this as ProcreateV1Palette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProcreateV1PaletteMapper.ensureInitialized().stringifyValue(
      this as ProcreateV1Palette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV1PaletteMapper.ensureInitialized().equalsValue(
      this as ProcreateV1Palette,
      other,
    );
  }

  @override
  int get hashCode {
    return ProcreateV1PaletteMapper.ensureInitialized().hashValue(
      this as ProcreateV1Palette,
    );
  }
}

extension ProcreateV1PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV1Palette, $Out> {
  ProcreateV1PaletteCopyWith<$R, ProcreateV1Palette, $Out>
  get $asProcreateV1Palette => $base.as(
    (v, t, t2) => _ProcreateV1PaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProcreateV1PaletteCopyWith<
  $R,
  $In extends ProcreateV1Palette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ProcreateV1Swatch,
    ProcreateV1SwatchCopyWith<$R, ProcreateV1Swatch, ProcreateV1Swatch>
  >
  get swatches;
  $R call({String? name, List<ProcreateV1Swatch>? swatches});
  ProcreateV1PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProcreateV1PaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV1Palette, $Out>
    implements ProcreateV1PaletteCopyWith<$R, ProcreateV1Palette, $Out> {
  _ProcreateV1PaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV1Palette> $mapper =
      ProcreateV1PaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ProcreateV1Swatch,
    ProcreateV1SwatchCopyWith<$R, ProcreateV1Swatch, ProcreateV1Swatch>
  >
  get swatches => ListCopyWith(
    $value.swatches,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(swatches: v),
  );
  @override
  $R call({String? name, List<ProcreateV1Swatch>? swatches}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (swatches != null) #swatches: swatches,
    }),
  );
  @override
  ProcreateV1Palette $make(CopyWithData data) => ProcreateV1Palette(
    name: data.get(#name, or: $value.name),
    swatches: data.get(#swatches, or: $value.swatches),
  );

  @override
  ProcreateV1PaletteCopyWith<$R2, ProcreateV1Palette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProcreateV1PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
