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

class ProcreateV1PaletteColorMapper
    extends ClassMapperBase<ProcreateV1PaletteColor> {
  ProcreateV1PaletteColorMapper._();

  static ProcreateV1PaletteColorMapper? _instance;
  static ProcreateV1PaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProcreateV1PaletteColorMapper._());
      ProcreateV1ColorSpaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV1PaletteColor';

  static double _$hue(ProcreateV1PaletteColor v) => v.hue;
  static const Field<ProcreateV1PaletteColor, double> _f$hue =
      Field('hue', _$hue);
  static double _$saturation(ProcreateV1PaletteColor v) => v.saturation;
  static const Field<ProcreateV1PaletteColor, double> _f$saturation =
      Field('saturation', _$saturation);
  static double _$brightness(ProcreateV1PaletteColor v) => v.brightness;
  static const Field<ProcreateV1PaletteColor, double> _f$brightness =
      Field('brightness', _$brightness);
  static double _$alpha(ProcreateV1PaletteColor v) => v.alpha;
  static const Field<ProcreateV1PaletteColor, double> _f$alpha =
      Field('alpha', _$alpha);
  static ProcreateV1ColorSpace _$colorSpace(ProcreateV1PaletteColor v) =>
      v.colorSpace;
  static const Field<ProcreateV1PaletteColor, ProcreateV1ColorSpace>
      _f$colorSpace = Field('colorSpace', _$colorSpace);

  @override
  final MappableFields<ProcreateV1PaletteColor> fields = const {
    #hue: _f$hue,
    #saturation: _f$saturation,
    #brightness: _f$brightness,
    #alpha: _f$alpha,
    #colorSpace: _f$colorSpace,
  };

  static ProcreateV1PaletteColor _instantiate(DecodingData data) {
    return ProcreateV1PaletteColor(
        hue: data.dec(_f$hue),
        saturation: data.dec(_f$saturation),
        brightness: data.dec(_f$brightness),
        alpha: data.dec(_f$alpha),
        colorSpace: data.dec(_f$colorSpace));
  }

  @override
  final Function instantiate = _instantiate;

  static ProcreateV1PaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProcreateV1PaletteColor>(map);
  }

  static ProcreateV1PaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<ProcreateV1PaletteColor>(json);
  }
}

mixin ProcreateV1PaletteColorMappable {
  String toJson() {
    return ProcreateV1PaletteColorMapper.ensureInitialized()
        .encodeJson<ProcreateV1PaletteColor>(this as ProcreateV1PaletteColor);
  }

  Map<String, dynamic> toMap() {
    return ProcreateV1PaletteColorMapper.ensureInitialized()
        .encodeMap<ProcreateV1PaletteColor>(this as ProcreateV1PaletteColor);
  }

  ProcreateV1PaletteColorCopyWith<ProcreateV1PaletteColor,
          ProcreateV1PaletteColor, ProcreateV1PaletteColor>
      get copyWith => _ProcreateV1PaletteColorCopyWithImpl<
              ProcreateV1PaletteColor, ProcreateV1PaletteColor>(
          this as ProcreateV1PaletteColor, $identity, $identity);
  @override
  String toString() {
    return ProcreateV1PaletteColorMapper.ensureInitialized()
        .stringifyValue(this as ProcreateV1PaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV1PaletteColorMapper.ensureInitialized()
        .equalsValue(this as ProcreateV1PaletteColor, other);
  }

  @override
  int get hashCode {
    return ProcreateV1PaletteColorMapper.ensureInitialized()
        .hashValue(this as ProcreateV1PaletteColor);
  }
}

extension ProcreateV1PaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV1PaletteColor, $Out> {
  ProcreateV1PaletteColorCopyWith<$R, ProcreateV1PaletteColor, $Out>
      get $asProcreateV1PaletteColor => $base.as((v, t, t2) =>
          _ProcreateV1PaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProcreateV1PaletteColorCopyWith<
    $R,
    $In extends ProcreateV1PaletteColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {double? hue,
      double? saturation,
      double? brightness,
      double? alpha,
      ProcreateV1ColorSpace? colorSpace});
  ProcreateV1PaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProcreateV1PaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProcreateV1PaletteColor, $Out>
    implements
        ProcreateV1PaletteColorCopyWith<$R, ProcreateV1PaletteColor, $Out> {
  _ProcreateV1PaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProcreateV1PaletteColor> $mapper =
      ProcreateV1PaletteColorMapper.ensureInitialized();
  @override
  $R call(
          {double? hue,
          double? saturation,
          double? brightness,
          double? alpha,
          ProcreateV1ColorSpace? colorSpace}) =>
      $apply(FieldCopyWithData({
        if (hue != null) #hue: hue,
        if (saturation != null) #saturation: saturation,
        if (brightness != null) #brightness: brightness,
        if (alpha != null) #alpha: alpha,
        if (colorSpace != null) #colorSpace: colorSpace
      }));
  @override
  ProcreateV1PaletteColor $make(CopyWithData data) => ProcreateV1PaletteColor(
      hue: data.get(#hue, or: $value.hue),
      saturation: data.get(#saturation, or: $value.saturation),
      brightness: data.get(#brightness, or: $value.brightness),
      alpha: data.get(#alpha, or: $value.alpha),
      colorSpace: data.get(#colorSpace, or: $value.colorSpace));

  @override
  ProcreateV1PaletteColorCopyWith<$R2, ProcreateV1PaletteColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProcreateV1PaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProcreateV1PaletteMapper extends ClassMapperBase<ProcreateV1Palette> {
  ProcreateV1PaletteMapper._();

  static ProcreateV1PaletteMapper? _instance;
  static ProcreateV1PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcreateV1PaletteMapper._());
      ProcreateV1PaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProcreateV1Palette';

  static String _$name(ProcreateV1Palette v) => v.name;
  static const Field<ProcreateV1Palette, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static List<ProcreateV1PaletteColor> _$colors(ProcreateV1Palette v) =>
      v.colors;
  static const Field<ProcreateV1Palette, List<ProcreateV1PaletteColor>>
      _f$colors = Field('colors', _$colors, key: r'swatches');

  @override
  final MappableFields<ProcreateV1Palette> fields = const {
    #name: _f$name,
    #colors: _f$colors,
  };

  static ProcreateV1Palette _instantiate(DecodingData data) {
    return ProcreateV1Palette(
        name: data.dec(_f$name), colors: data.dec(_f$colors));
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

  ProcreateV1PaletteCopyWith<ProcreateV1Palette, ProcreateV1Palette,
          ProcreateV1Palette>
      get copyWith => _ProcreateV1PaletteCopyWithImpl<ProcreateV1Palette,
          ProcreateV1Palette>(this as ProcreateV1Palette, $identity, $identity);
  @override
  String toString() {
    return ProcreateV1PaletteMapper.ensureInitialized()
        .stringifyValue(this as ProcreateV1Palette);
  }

  @override
  bool operator ==(Object other) {
    return ProcreateV1PaletteMapper.ensureInitialized()
        .equalsValue(this as ProcreateV1Palette, other);
  }

  @override
  int get hashCode {
    return ProcreateV1PaletteMapper.ensureInitialized()
        .hashValue(this as ProcreateV1Palette);
  }
}

extension ProcreateV1PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProcreateV1Palette, $Out> {
  ProcreateV1PaletteCopyWith<$R, ProcreateV1Palette, $Out>
      get $asProcreateV1Palette => $base.as(
          (v, t, t2) => _ProcreateV1PaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProcreateV1PaletteCopyWith<$R, $In extends ProcreateV1Palette,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ProcreateV1PaletteColor,
      ProcreateV1PaletteColorCopyWith<$R, ProcreateV1PaletteColor,
          ProcreateV1PaletteColor>> get colors;
  $R call({String? name, List<ProcreateV1PaletteColor>? colors});
  ProcreateV1PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
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
      ProcreateV1PaletteColor,
      ProcreateV1PaletteColorCopyWith<$R, ProcreateV1PaletteColor,
          ProcreateV1PaletteColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({String? name, List<ProcreateV1PaletteColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (colors != null) #colors: colors
      }));
  @override
  ProcreateV1Palette $make(CopyWithData data) => ProcreateV1Palette(
      name: data.get(#name, or: $value.name),
      colors: data.get(#colors, or: $value.colors));

  @override
  ProcreateV1PaletteCopyWith<$R2, ProcreateV1Palette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProcreateV1PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
