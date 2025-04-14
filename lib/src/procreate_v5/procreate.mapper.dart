// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'procreate.dart';

class ProcreateV5SwatchMapper extends ClassMapperBase<ProcreateV5Swatch> {
  ProcreateV5SwatchMapper._();

  static ProcreateV5SwatchMapper? _instance;
  static ProcreateV5SwatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV5SwatchMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV5Swatch';

  static double _$alpha(ProcreateV5Swatch v) => v.alpha;
  static const Field<ProcreateV5Swatch, double> _f$alpha = Field(
    'alpha',
    _$alpha,
  );
  static int _$origin(ProcreateV5Swatch v) => v.origin;
  static const Field<ProcreateV5Swatch, int> _f$origin = Field(
    'origin',
    _$origin,
  );
  static int _$colorSpace(ProcreateV5Swatch v) => v.colorSpace;
  static const Field<ProcreateV5Swatch, int> _f$colorSpace = Field(
    'colorSpace',
    _$colorSpace,
  );
  static int _$colorModel(ProcreateV5Swatch v) => v.colorModel;
  static const Field<ProcreateV5Swatch, int> _f$colorModel = Field(
    'colorModel',
    _$colorModel,
  );
  static double _$brightness(ProcreateV5Swatch v) => v.brightness;
  static const Field<ProcreateV5Swatch, double> _f$brightness = Field(
    'brightness',
    _$brightness,
  );
  static List<double> _$components(ProcreateV5Swatch v) => v.components;
  static const Field<ProcreateV5Swatch, List<double>> _f$components = Field(
    'components',
    _$components,
  );
  static String _$version(ProcreateV5Swatch v) => v.version;
  static const Field<ProcreateV5Swatch, String> _f$version = Field(
    'version',
    _$version,
  );
  static String _$colorProfile(ProcreateV5Swatch v) => v.colorProfile;
  static const Field<ProcreateV5Swatch, String> _f$colorProfile = Field(
    'colorProfile',
    _$colorProfile,
  );
  static double _$saturation(ProcreateV5Swatch v) => v.saturation;
  static const Field<ProcreateV5Swatch, double> _f$saturation = Field(
    'saturation',
    _$saturation,
  );
  static double _$hue(ProcreateV5Swatch v) => v.hue;
  static const Field<ProcreateV5Swatch, double> _f$hue = Field('hue', _$hue);

  @override
  final MappableFields<ProcreateV5Swatch> fields = const {
    #alpha: _f$alpha,
    #origin: _f$origin,
    #colorSpace: _f$colorSpace,
    #colorModel: _f$colorModel,
    #brightness: _f$brightness,
    #components: _f$components,
    #version: _f$version,
    #colorProfile: _f$colorProfile,
    #saturation: _f$saturation,
    #hue: _f$hue,
  };

  static ProcreateV5Swatch _instantiate(DecodingData data) {
    return ProcreateV5Swatch(
      alpha: data.dec(_f$alpha),
      origin: data.dec(_f$origin),
      colorSpace: data.dec(_f$colorSpace),
      colorModel: data.dec(_f$colorModel),
      brightness: data.dec(_f$brightness),
      components: data.dec(_f$components),
      version: data.dec(_f$version),
      colorProfile: data.dec(_f$colorProfile),
      saturation: data.dec(_f$saturation),
      hue: data.dec(_f$hue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV5Swatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV5Swatch>(map);
  }

  static ProcreateV5Swatch fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV5Swatch>(json);
  }
}

mixin ProcreateV5SwatchMappable {
  String toJson() {
    return ProcreateV5SwatchMapper.ensureInitialized()
        .encodeJson<ProcreateV5Swatch>(this as ProcreateV5Swatch);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV5SwatchMapper.ensureInitialized()
        .encodeMap<ProcreateV5Swatch>(this as ProcreateV5Swatch);
  }

  ProcreateV5SwatchCopyWith<
    ProcreateV5Swatch,
    ProcreateV5Swatch,
    ProcreateV5Swatch
  >
  get copyWith =>
      _ProcreateV5SwatchCopyWithImpl<ProcreateV5Swatch, ProcreateV5Swatch>(
        this as ProcreateV5Swatch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProcreateV5SwatchMapper.ensureInitialized().stringifyValue(
      this as ProcreateV5Swatch,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV5SwatchMapper.ensureInitialized().equalsValue(
      this as ProcreateV5Swatch,
      other,
    );
  }

  @override
  int get hashCode {
    return ProcreateV5SwatchMapper.ensureInitialized().hashValue(
      this as ProcreateV5Swatch,
    );
  }
}

extension ProcreateV5SwatchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV5Swatch, $Out> {
  ProcreateV5SwatchCopyWith<$R, ProcreateV5Swatch, $Out>
  get $asProcreateV5Swatch => $base.as(
    (v, t, t2) => _ProcreateV5SwatchCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProcreateV5SwatchCopyWith<
  $R,
  $In extends ProcreateV5Swatch,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get components;
  $R call({
    double? alpha,
    int? origin,
    int? colorSpace,
    int? colorModel,
    double? brightness,
    List<double>? components,
    String? version,
    String? colorProfile,
    double? saturation,
    double? hue,
  });
  ProcreateV5SwatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProcreateV5SwatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV5Swatch, $Out>
    implements ProcreateV5SwatchCopyWith<$R, ProcreateV5Swatch, $Out> {
  _ProcreateV5SwatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV5Swatch> $mapper =
      ProcreateV5SwatchMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get components =>
      ListCopyWith(
        $value.components,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(components: v),
      );
  @override
  $R call({
    double? alpha,
    int? origin,
    int? colorSpace,
    int? colorModel,
    double? brightness,
    List<double>? components,
    String? version,
    String? colorProfile,
    double? saturation,
    double? hue,
  }) => $apply(
    FieldCopyWithData({
      if (alpha != null) #alpha: alpha,
      if (origin != null) #origin: origin,
      if (colorSpace != null) #colorSpace: colorSpace,
      if (colorModel != null) #colorModel: colorModel,
      if (brightness != null) #brightness: brightness,
      if (components != null) #components: components,
      if (version != null) #version: version,
      if (colorProfile != null) #colorProfile: colorProfile,
      if (saturation != null) #saturation: saturation,
      if (hue != null) #hue: hue,
    }),
  );
  @override
  ProcreateV5Swatch $make(CopyWithData data) => ProcreateV5Swatch(
    alpha: data.get(#alpha, or: $value.alpha),
    origin: data.get(#origin, or: $value.origin),
    colorSpace: data.get(#colorSpace, or: $value.colorSpace),
    colorModel: data.get(#colorModel, or: $value.colorModel),
    brightness: data.get(#brightness, or: $value.brightness),
    components: data.get(#components, or: $value.components),
    version: data.get(#version, or: $value.version),
    colorProfile: data.get(#colorProfile, or: $value.colorProfile),
    saturation: data.get(#saturation, or: $value.saturation),
    hue: data.get(#hue, or: $value.hue),
  );

  @override
  ProcreateV5SwatchCopyWith<$R2, ProcreateV5Swatch, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProcreateV5SwatchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProcreateV5ColorProfileMapper
    extends ClassMapperBase<ProcreateV5ColorProfile> {
  ProcreateV5ColorProfileMapper._();

  static ProcreateV5ColorProfileMapper? _instance;
  static ProcreateV5ColorProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ProcreateV5ColorProfileMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV5ColorProfile';

  static int _$colorSpace(ProcreateV5ColorProfile v) => v.colorSpace;
  static const Field<ProcreateV5ColorProfile, int> _f$colorSpace = Field(
    'colorSpace',
    _$colorSpace,
  );
  static String _$hash(ProcreateV5ColorProfile v) => v.hash;
  static const Field<ProcreateV5ColorProfile, String> _f$hash = Field(
    'hash',
    _$hash,
  );
  static String _$iccData(ProcreateV5ColorProfile v) => v.iccData;
  static const Field<ProcreateV5ColorProfile, String> _f$iccData = Field(
    'iccData',
    _$iccData,
  );
  static String _$iccName(ProcreateV5ColorProfile v) => v.iccName;
  static const Field<ProcreateV5ColorProfile, String> _f$iccName = Field(
    'iccName',
    _$iccName,
  );

  @override
  final MappableFields<ProcreateV5ColorProfile> fields = const {
    #colorSpace: _f$colorSpace,
    #hash: _f$hash,
    #iccData: _f$iccData,
    #iccName: _f$iccName,
  };

  static ProcreateV5ColorProfile _instantiate(DecodingData data) {
    return ProcreateV5ColorProfile(
      colorSpace: data.dec(_f$colorSpace),
      hash: data.dec(_f$hash),
      iccData: data.dec(_f$iccData),
      iccName: data.dec(_f$iccName),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV5ColorProfile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV5ColorProfile>(map);
  }

  static ProcreateV5ColorProfile fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV5ColorProfile>(json);
  }
}

mixin ProcreateV5ColorProfileMappable {
  String toJson() {
    return ProcreateV5ColorProfileMapper.ensureInitialized()
        .encodeJson<ProcreateV5ColorProfile>(this as ProcreateV5ColorProfile);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV5ColorProfileMapper.ensureInitialized()
        .encodeMap<ProcreateV5ColorProfile>(this as ProcreateV5ColorProfile);
  }

  ProcreateV5ColorProfileCopyWith<
    ProcreateV5ColorProfile,
    ProcreateV5ColorProfile,
    ProcreateV5ColorProfile
  >
  get copyWith => _ProcreateV5ColorProfileCopyWithImpl<
    ProcreateV5ColorProfile,
    ProcreateV5ColorProfile
  >(this as ProcreateV5ColorProfile, $identity, $identity);
  @override
  String toString() {
    return ProcreateV5ColorProfileMapper.ensureInitialized().stringifyValue(
      this as ProcreateV5ColorProfile,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV5ColorProfileMapper.ensureInitialized().equalsValue(
      this as ProcreateV5ColorProfile,
      other,
    );
  }

  @override
  int get hashCode {
    return ProcreateV5ColorProfileMapper.ensureInitialized().hashValue(
      this as ProcreateV5ColorProfile,
    );
  }
}

extension ProcreateV5ColorProfileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV5ColorProfile, $Out> {
  ProcreateV5ColorProfileCopyWith<$R, ProcreateV5ColorProfile, $Out>
  get $asProcreateV5ColorProfile => $base.as(
    (v, t, t2) => _ProcreateV5ColorProfileCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProcreateV5ColorProfileCopyWith<
  $R,
  $In extends ProcreateV5ColorProfile,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? colorSpace, String? hash, String? iccData, String? iccName});
  ProcreateV5ColorProfileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProcreateV5ColorProfileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV5ColorProfile, $Out>
    implements
        ProcreateV5ColorProfileCopyWith<$R, ProcreateV5ColorProfile, $Out> {
  _ProcreateV5ColorProfileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV5ColorProfile> $mapper =
      ProcreateV5ColorProfileMapper.ensureInitialized();
  @override
  $R call({int? colorSpace, String? hash, String? iccData, String? iccName}) =>
      $apply(
        FieldCopyWithData({
          if (colorSpace != null) #colorSpace: colorSpace,
          if (hash != null) #hash: hash,
          if (iccData != null) #iccData: iccData,
          if (iccName != null) #iccName: iccName,
        }),
      );
  @override
  ProcreateV5ColorProfile $make(CopyWithData data) => ProcreateV5ColorProfile(
    colorSpace: data.get(#colorSpace, or: $value.colorSpace),
    hash: data.get(#hash, or: $value.hash),
    iccData: data.get(#iccData, or: $value.iccData),
    iccName: data.get(#iccName, or: $value.iccName),
  );

  @override
  ProcreateV5ColorProfileCopyWith<$R2, ProcreateV5ColorProfile, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProcreateV5ColorProfileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProcreateV5PaletteMapper extends ClassMapperBase<ProcreateV5Palette> {
  ProcreateV5PaletteMapper._();

  static ProcreateV5PaletteMapper? _instance;
  static ProcreateV5PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV5PaletteMapper._());
      ProcreateV5SwatchMapper.ensureInitialized();
      ProcreateV5ColorProfileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV5Palette';

  static String _$name(ProcreateV5Palette v) => v.name;
  static const Field<ProcreateV5Palette, String> _f$name = Field(
    'name',
    _$name,
  );
  static List<ProcreateV5Swatch?> _$swatches(ProcreateV5Palette v) =>
      v.swatches;
  static const Field<ProcreateV5Palette, List<ProcreateV5Swatch?>> _f$swatches =
      Field('swatches', _$swatches);
  static List<ProcreateV5ColorProfile> _$colorProfiles(ProcreateV5Palette v) =>
      v.colorProfiles;
  static const Field<ProcreateV5Palette, List<ProcreateV5ColorProfile>>
  _f$colorProfiles = Field('colorProfiles', _$colorProfiles);

  @override
  final MappableFields<ProcreateV5Palette> fields = const {
    #name: _f$name,
    #swatches: _f$swatches,
    #colorProfiles: _f$colorProfiles,
  };

  static ProcreateV5Palette _instantiate(DecodingData data) {
    return ProcreateV5Palette(
      name: data.dec(_f$name),
      swatches: data.dec(_f$swatches),
      colorProfiles: data.dec(_f$colorProfiles),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV5Palette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV5Palette>(map);
  }

  static ProcreateV5Palette fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV5Palette>(json);
  }
}

mixin ProcreateV5PaletteMappable {
  String toJson() {
    return ProcreateV5PaletteMapper.ensureInitialized()
        .encodeJson<ProcreateV5Palette>(this as ProcreateV5Palette);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV5PaletteMapper.ensureInitialized()
        .encodeMap<ProcreateV5Palette>(this as ProcreateV5Palette);
  }

  ProcreateV5PaletteCopyWith<
    ProcreateV5Palette,
    ProcreateV5Palette,
    ProcreateV5Palette
  >
  get copyWith =>
      _ProcreateV5PaletteCopyWithImpl<ProcreateV5Palette, ProcreateV5Palette>(
        this as ProcreateV5Palette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProcreateV5PaletteMapper.ensureInitialized().stringifyValue(
      this as ProcreateV5Palette,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV5PaletteMapper.ensureInitialized().equalsValue(
      this as ProcreateV5Palette,
      other,
    );
  }

  @override
  int get hashCode {
    return ProcreateV5PaletteMapper.ensureInitialized().hashValue(
      this as ProcreateV5Palette,
    );
  }
}

extension ProcreateV5PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV5Palette, $Out> {
  ProcreateV5PaletteCopyWith<$R, ProcreateV5Palette, $Out>
  get $asProcreateV5Palette => $base.as(
    (v, t, t2) => _ProcreateV5PaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProcreateV5PaletteCopyWith<
  $R,
  $In extends ProcreateV5Palette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ProcreateV5Swatch?,
    ProcreateV5SwatchCopyWith<$R, ProcreateV5Swatch, ProcreateV5Swatch>?
  >
  get swatches;
  ListCopyWith<
    $R,
    ProcreateV5ColorProfile,
    ProcreateV5ColorProfileCopyWith<
      $R,
      ProcreateV5ColorProfile,
      ProcreateV5ColorProfile
    >
  >
  get colorProfiles;
  $R call({
    String? name,
    List<ProcreateV5Swatch?>? swatches,
    List<ProcreateV5ColorProfile>? colorProfiles,
  });
  ProcreateV5PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProcreateV5PaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV5Palette, $Out>
    implements ProcreateV5PaletteCopyWith<$R, ProcreateV5Palette, $Out> {
  _ProcreateV5PaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV5Palette> $mapper =
      ProcreateV5PaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ProcreateV5Swatch?,
    ProcreateV5SwatchCopyWith<$R, ProcreateV5Swatch, ProcreateV5Swatch>?
  >
  get swatches => ListCopyWith(
    $value.swatches,
    (v, t) => v?.copyWith.$chain(t),
    (v) => call(swatches: v),
  );
  @override
  ListCopyWith<
    $R,
    ProcreateV5ColorProfile,
    ProcreateV5ColorProfileCopyWith<
      $R,
      ProcreateV5ColorProfile,
      ProcreateV5ColorProfile
    >
  >
  get colorProfiles => ListCopyWith(
    $value.colorProfiles,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colorProfiles: v),
  );
  @override
  $R call({
    String? name,
    List<ProcreateV5Swatch?>? swatches,
    List<ProcreateV5ColorProfile>? colorProfiles,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (swatches != null) #swatches: swatches,
      if (colorProfiles != null) #colorProfiles: colorProfiles,
    }),
  );
  @override
  ProcreateV5Palette $make(CopyWithData data) => ProcreateV5Palette(
    name: data.get(#name, or: $value.name),
    swatches: data.get(#swatches, or: $value.swatches),
    colorProfiles: data.get(#colorProfiles, or: $value.colorProfiles),
  );

  @override
  ProcreateV5PaletteCopyWith<$R2, ProcreateV5Palette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProcreateV5PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
