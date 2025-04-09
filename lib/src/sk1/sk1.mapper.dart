// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sk1.dart';

class Sk1ColorSpaceMapper extends EnumMapper<Sk1ColorSpace> {
  Sk1ColorSpaceMapper._();

  static Sk1ColorSpaceMapper? _instance;
  static Sk1ColorSpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Sk1ColorSpaceMapper._());
    }
    return _instance!;
  }

  static Sk1ColorSpace fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Sk1ColorSpace decode(dynamic value) {
    switch (value) {
      case r'rgb':
        return Sk1ColorSpace.rgb;
      case r'cmyk':
        return Sk1ColorSpace.cmyk;
      case r'gray':
        return Sk1ColorSpace.gray;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Sk1ColorSpace self) {
    switch (self) {
      case Sk1ColorSpace.rgb:
        return r'rgb';
      case Sk1ColorSpace.cmyk:
        return r'cmyk';
      case Sk1ColorSpace.gray:
        return r'gray';
    }
  }
}

extension Sk1ColorSpaceMapperExtension on Sk1ColorSpace {
  String toValue() {
    Sk1ColorSpaceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Sk1ColorSpace>(this) as String;
  }
}

class Sk1ColorMapper extends ClassMapperBase<Sk1Color> {
  Sk1ColorMapper._();

  static Sk1ColorMapper? _instance;
  static Sk1ColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Sk1ColorMapper._());
      Sk1ColorSpaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Sk1Color';

  static Sk1ColorSpace _$colorSpace(Sk1Color v) => v.colorSpace;
  static const Field<Sk1Color, Sk1ColorSpace> _f$colorSpace =
      Field('colorSpace', _$colorSpace);
  static List<double> _$values(Sk1Color v) => v.values;
  static const Field<Sk1Color, List<double>> _f$values =
      Field('values', _$values);
  static double _$alpha(Sk1Color v) => v.alpha;
  static const Field<Sk1Color, double> _f$alpha = Field('alpha', _$alpha);
  static String _$name(Sk1Color v) => v.name;
  static const Field<Sk1Color, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Sk1Color> fields = const {
    #colorSpace: _f$colorSpace,
    #values: _f$values,
    #alpha: _f$alpha,
    #name: _f$name,
  };

  static Sk1Color _instantiate(DecodingData data) {
    return Sk1Color(
        colorSpace: data.dec(_f$colorSpace),
        values: data.dec(_f$values),
        alpha: data.dec(_f$alpha),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Sk1Color fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Sk1Color>(map);
  }

  static Sk1Color fromJson(String json) {
    return ensureInitialized().decodeJson<Sk1Color>(json);
  }
}

mixin Sk1ColorMappable {
  String toJson() {
    return Sk1ColorMapper.ensureInitialized()
        .encodeJson<Sk1Color>(this as Sk1Color);
  }

  Map<String, dynamic> toMap() {
    return Sk1ColorMapper.ensureInitialized()
        .encodeMap<Sk1Color>(this as Sk1Color);
  }

  Sk1ColorCopyWith<Sk1Color, Sk1Color, Sk1Color> get copyWith =>
      _Sk1ColorCopyWithImpl<Sk1Color, Sk1Color>(
          this as Sk1Color, $identity, $identity);
  @override
  String toString() {
    return Sk1ColorMapper.ensureInitialized().stringifyValue(this as Sk1Color);
  }

  @override
  bool operator ==(Object other) {
    return Sk1ColorMapper.ensureInitialized()
        .equalsValue(this as Sk1Color, other);
  }

  @override
  int get hashCode {
    return Sk1ColorMapper.ensureInitialized().hashValue(this as Sk1Color);
  }
}

extension Sk1ColorValueCopy<$R, $Out> on ObjectCopyWith<$R, Sk1Color, $Out> {
  Sk1ColorCopyWith<$R, Sk1Color, $Out> get $asSk1Color =>
      $base.as((v, t, t2) => _Sk1ColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Sk1ColorCopyWith<$R, $In extends Sk1Color, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values;
  $R call(
      {Sk1ColorSpace? colorSpace,
      List<double>? values,
      double? alpha,
      String? name});
  Sk1ColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Sk1ColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Sk1Color, $Out>
    implements Sk1ColorCopyWith<$R, Sk1Color, $Out> {
  _Sk1ColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Sk1Color> $mapper =
      Sk1ColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call(
          {Sk1ColorSpace? colorSpace,
          List<double>? values,
          double? alpha,
          String? name}) =>
      $apply(FieldCopyWithData({
        if (colorSpace != null) #colorSpace: colorSpace,
        if (values != null) #values: values,
        if (alpha != null) #alpha: alpha,
        if (name != null) #name: name
      }));
  @override
  Sk1Color $make(CopyWithData data) => Sk1Color(
      colorSpace: data.get(#colorSpace, or: $value.colorSpace),
      values: data.get(#values, or: $value.values),
      alpha: data.get(#alpha, or: $value.alpha),
      name: data.get(#name, or: $value.name));

  @override
  Sk1ColorCopyWith<$R2, Sk1Color, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Sk1ColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class Sk1PaletteMapper extends ClassMapperBase<Sk1Palette> {
  Sk1PaletteMapper._();

  static Sk1PaletteMapper? _instance;
  static Sk1PaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Sk1PaletteMapper._());
      Sk1ColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Sk1Palette';

  static String _$name(Sk1Palette v) => v.name;
  static const Field<Sk1Palette, String> _f$name = Field('name', _$name);
  static String? _$source(Sk1Palette v) => v.source;
  static const Field<Sk1Palette, String> _f$source =
      Field('source', _$source, opt: true);
  static List<String> _$comments(Sk1Palette v) => v.comments;
  static const Field<Sk1Palette, List<String>> _f$comments =
      Field('comments', _$comments, opt: true, def: const []);
  static int _$columns(Sk1Palette v) => v.columns;
  static const Field<Sk1Palette, int> _f$columns = Field('columns', _$columns);
  static List<Sk1Color> _$colors(Sk1Palette v) => v.colors;
  static const Field<Sk1Palette, List<Sk1Color>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<Sk1Palette> fields = const {
    #name: _f$name,
    #source: _f$source,
    #comments: _f$comments,
    #columns: _f$columns,
    #colors: _f$colors,
  };

  static Sk1Palette _instantiate(DecodingData data) {
    return Sk1Palette(
        name: data.dec(_f$name),
        source: data.dec(_f$source),
        comments: data.dec(_f$comments),
        columns: data.dec(_f$columns),
        colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static Sk1Palette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Sk1Palette>(map);
  }

  static Sk1Palette fromJson(String json) {
    return ensureInitialized().decodeJson<Sk1Palette>(json);
  }
}

mixin Sk1PaletteMappable {
  String toJson() {
    return Sk1PaletteMapper.ensureInitialized()
        .encodeJson<Sk1Palette>(this as Sk1Palette);
  }

  Map<String, dynamic> toMap() {
    return Sk1PaletteMapper.ensureInitialized()
        .encodeMap<Sk1Palette>(this as Sk1Palette);
  }

  Sk1PaletteCopyWith<Sk1Palette, Sk1Palette, Sk1Palette> get copyWith =>
      _Sk1PaletteCopyWithImpl<Sk1Palette, Sk1Palette>(
          this as Sk1Palette, $identity, $identity);
  @override
  String toString() {
    return Sk1PaletteMapper.ensureInitialized()
        .stringifyValue(this as Sk1Palette);
  }

  @override
  bool operator ==(Object other) {
    return Sk1PaletteMapper.ensureInitialized()
        .equalsValue(this as Sk1Palette, other);
  }

  @override
  int get hashCode {
    return Sk1PaletteMapper.ensureInitialized().hashValue(this as Sk1Palette);
  }
}

extension Sk1PaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Sk1Palette, $Out> {
  Sk1PaletteCopyWith<$R, Sk1Palette, $Out> get $asSk1Palette =>
      $base.as((v, t, t2) => _Sk1PaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Sk1PaletteCopyWith<$R, $In extends Sk1Palette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get comments;
  ListCopyWith<$R, Sk1Color, Sk1ColorCopyWith<$R, Sk1Color, Sk1Color>>
      get colors;
  $R call(
      {String? name,
      String? source,
      List<String>? comments,
      int? columns,
      List<Sk1Color>? colors});
  Sk1PaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Sk1PaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Sk1Palette, $Out>
    implements Sk1PaletteCopyWith<$R, Sk1Palette, $Out> {
  _Sk1PaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Sk1Palette> $mapper =
      Sk1PaletteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get comments =>
      ListCopyWith($value.comments, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(comments: v));
  @override
  ListCopyWith<$R, Sk1Color, Sk1ColorCopyWith<$R, Sk1Color, Sk1Color>>
      get colors => ListCopyWith($value.colors, (v, t) => v.copyWith.$chain(t),
          (v) => call(colors: v));
  @override
  $R call(
          {String? name,
          Object? source = $none,
          List<String>? comments,
          int? columns,
          List<Sk1Color>? colors}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (source != $none) #source: source,
        if (comments != null) #comments: comments,
        if (columns != null) #columns: columns,
        if (colors != null) #colors: colors
      }));
  @override
  Sk1Palette $make(CopyWithData data) => Sk1Palette(
      name: data.get(#name, or: $value.name),
      source: data.get(#source, or: $value.source),
      comments: data.get(#comments, or: $value.comments),
      columns: data.get(#columns, or: $value.columns),
      colors: data.get(#colors, or: $value.colors));

  @override
  Sk1PaletteCopyWith<$R2, Sk1Palette, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Sk1PaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
