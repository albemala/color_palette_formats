// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gpl.dart';

class GimpPaletteColorMapper extends ClassMapperBase<GimpPaletteColor> {
  GimpPaletteColorMapper._();

  static GimpPaletteColorMapper? _instance;
  static GimpPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GimpPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GimpPaletteColor';

  static int _$red(GimpPaletteColor v) => v.red;
  static const Field<GimpPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(GimpPaletteColor v) => v.green;
  static const Field<GimpPaletteColor, int> _f$green = Field('green', _$green);
  static int _$blue(GimpPaletteColor v) => v.blue;
  static const Field<GimpPaletteColor, int> _f$blue = Field('blue', _$blue);
  static String _$name(GimpPaletteColor v) => v.name;
  static const Field<GimpPaletteColor, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<GimpPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #name: _f$name,
  };

  static GimpPaletteColor _instantiate(DecodingData data) {
    return GimpPaletteColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static GimpPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GimpPaletteColor>(map);
  }

  static GimpPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<GimpPaletteColor>(json);
  }
}

mixin GimpPaletteColorMappable {
  String toJson() {
    return GimpPaletteColorMapper.ensureInitialized()
        .encodeJson<GimpPaletteColor>(this as GimpPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return GimpPaletteColorMapper.ensureInitialized()
        .encodeMap<GimpPaletteColor>(this as GimpPaletteColor);
  }

  GimpPaletteColorCopyWith<GimpPaletteColor, GimpPaletteColor, GimpPaletteColor>
      get copyWith =>
          _GimpPaletteColorCopyWithImpl<GimpPaletteColor, GimpPaletteColor>(
              this as GimpPaletteColor, $identity, $identity);
  @override
  String toString() {
    return GimpPaletteColorMapper.ensureInitialized()
        .stringifyValue(this as GimpPaletteColor);
  }

  @override
  bool operator ==(Object other) {
    return GimpPaletteColorMapper.ensureInitialized()
        .equalsValue(this as GimpPaletteColor, other);
  }

  @override
  int get hashCode {
    return GimpPaletteColorMapper.ensureInitialized()
        .hashValue(this as GimpPaletteColor);
  }
}

extension GimpPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GimpPaletteColor, $Out> {
  GimpPaletteColorCopyWith<$R, GimpPaletteColor, $Out>
      get $asGimpPaletteColor => $base
          .as((v, t, t2) => _GimpPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GimpPaletteColorCopyWith<$R, $In extends GimpPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue, String? name});
  GimpPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GimpPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GimpPaletteColor, $Out>
    implements GimpPaletteColorCopyWith<$R, GimpPaletteColor, $Out> {
  _GimpPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GimpPaletteColor> $mapper =
      GimpPaletteColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue, String? name}) =>
      $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue,
        if (name != null) #name: name
      }));
  @override
  GimpPaletteColor $make(CopyWithData data) => GimpPaletteColor(
      red: data.get(#red, or: $value.red),
      green: data.get(#green, or: $value.green),
      blue: data.get(#blue, or: $value.blue),
      name: data.get(#name, or: $value.name));

  @override
  GimpPaletteColorCopyWith<$R2, GimpPaletteColor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GimpPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GimpPaletteMapper extends ClassMapperBase<GimpPalette> {
  GimpPaletteMapper._();

  static GimpPaletteMapper? _instance;
  static GimpPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GimpPaletteMapper._());
      GimpPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GimpPalette';

  static List<GimpPaletteColor> _$colors(GimpPalette v) => v.colors;
  static const Field<GimpPalette, List<GimpPaletteColor>> _f$colors =
      Field('colors', _$colors);
  static List<String> _$info(GimpPalette v) => v.info;
  static const Field<GimpPalette, List<String>> _f$info =
      Field('info', _$info, opt: true, def: const []);
  static List<String> _$comments(GimpPalette v) => v.comments;
  static const Field<GimpPalette, List<String>> _f$comments =
      Field('comments', _$comments, opt: true, def: const []);

  @override
  final MappableFields<GimpPalette> fields = const {
    #colors: _f$colors,
    #info: _f$info,
    #comments: _f$comments,
  };

  static GimpPalette _instantiate(DecodingData data) {
    return GimpPalette(
        colors: data.dec(_f$colors),
        info: data.dec(_f$info),
        comments: data.dec(_f$comments));
  }

  @override
  final Function instantiate = _instantiate;

  static GimpPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GimpPalette>(map);
  }

  static GimpPalette fromJson(String json) {
    return ensureInitialized().decodeJson<GimpPalette>(json);
  }
}

mixin GimpPaletteMappable {
  String toJson() {
    return GimpPaletteMapper.ensureInitialized()
        .encodeJson<GimpPalette>(this as GimpPalette);
  }

  Map<String, dynamic> toMap() {
    return GimpPaletteMapper.ensureInitialized()
        .encodeMap<GimpPalette>(this as GimpPalette);
  }

  GimpPaletteCopyWith<GimpPalette, GimpPalette, GimpPalette> get copyWith =>
      _GimpPaletteCopyWithImpl<GimpPalette, GimpPalette>(
          this as GimpPalette, $identity, $identity);
  @override
  String toString() {
    return GimpPaletteMapper.ensureInitialized()
        .stringifyValue(this as GimpPalette);
  }

  @override
  bool operator ==(Object other) {
    return GimpPaletteMapper.ensureInitialized()
        .equalsValue(this as GimpPalette, other);
  }

  @override
  int get hashCode {
    return GimpPaletteMapper.ensureInitialized().hashValue(this as GimpPalette);
  }
}

extension GimpPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GimpPalette, $Out> {
  GimpPaletteCopyWith<$R, GimpPalette, $Out> get $asGimpPalette =>
      $base.as((v, t, t2) => _GimpPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GimpPaletteCopyWith<$R, $In extends GimpPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GimpPaletteColor,
          GimpPaletteColorCopyWith<$R, GimpPaletteColor, GimpPaletteColor>>
      get colors;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get info;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get comments;
  $R call(
      {List<GimpPaletteColor>? colors,
      List<String>? info,
      List<String>? comments});
  GimpPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GimpPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GimpPalette, $Out>
    implements GimpPaletteCopyWith<$R, GimpPalette, $Out> {
  _GimpPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GimpPalette> $mapper =
      GimpPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GimpPaletteColor,
          GimpPaletteColorCopyWith<$R, GimpPaletteColor, GimpPaletteColor>>
      get colors => ListCopyWith($value.colors, (v, t) => v.copyWith.$chain(t),
          (v) => call(colors: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get info =>
      ListCopyWith($value.info, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(info: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get comments =>
      ListCopyWith($value.comments, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(comments: v));
  @override
  $R call(
          {List<GimpPaletteColor>? colors,
          List<String>? info,
          List<String>? comments}) =>
      $apply(FieldCopyWithData({
        if (colors != null) #colors: colors,
        if (info != null) #info: info,
        if (comments != null) #comments: comments
      }));
  @override
  GimpPalette $make(CopyWithData data) => GimpPalette(
      colors: data.get(#colors, or: $value.colors),
      info: data.get(#info, or: $value.info),
      comments: data.get(#comments, or: $value.comments));

  @override
  GimpPaletteCopyWith<$R2, GimpPalette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GimpPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
