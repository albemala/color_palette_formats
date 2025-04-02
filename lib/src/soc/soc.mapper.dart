// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'soc.dart';

class StarOfficeColorMapper extends ClassMapperBase<StarOfficeColor> {
  StarOfficeColorMapper._();

  static StarOfficeColorMapper? _instance;
  static StarOfficeColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarOfficeColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StarOfficeColor';

  static String _$name(StarOfficeColor v) => v.name;
  static const Field<StarOfficeColor, String> _f$name = Field('name', _$name);
  static String _$color(StarOfficeColor v) => v.color;
  static const Field<StarOfficeColor, String> _f$color =
      Field('color', _$color);

  @override
  final MappableFields<StarOfficeColor> fields = const {
    #name: _f$name,
    #color: _f$color,
  };

  static StarOfficeColor _instantiate(DecodingData data) {
    return StarOfficeColor(name: data.dec(_f$name), color: data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static StarOfficeColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarOfficeColor>(map);
  }

  static StarOfficeColor fromJson(String json) {
    return ensureInitialized().decodeJson<StarOfficeColor>(json);
  }
}

mixin StarOfficeColorMappable {
  String toJson() {
    return StarOfficeColorMapper.ensureInitialized()
        .encodeJson<StarOfficeColor>(this as StarOfficeColor);
  }

  Map<String, dynamic> toMap() {
    return StarOfficeColorMapper.ensureInitialized()
        .encodeMap<StarOfficeColor>(this as StarOfficeColor);
  }

  StarOfficeColorCopyWith<StarOfficeColor, StarOfficeColor, StarOfficeColor>
      get copyWith =>
          _StarOfficeColorCopyWithImpl<StarOfficeColor, StarOfficeColor>(
              this as StarOfficeColor, $identity, $identity);
  @override
  String toString() {
    return StarOfficeColorMapper.ensureInitialized()
        .stringifyValue(this as StarOfficeColor);
  }

  @override
  bool operator ==(Object other) {
    return StarOfficeColorMapper.ensureInitialized()
        .equalsValue(this as StarOfficeColor, other);
  }

  @override
  int get hashCode {
    return StarOfficeColorMapper.ensureInitialized()
        .hashValue(this as StarOfficeColor);
  }
}

extension StarOfficeColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarOfficeColor, $Out> {
  StarOfficeColorCopyWith<$R, StarOfficeColor, $Out> get $asStarOfficeColor =>
      $base.as((v, t, t2) => _StarOfficeColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StarOfficeColorCopyWith<$R, $In extends StarOfficeColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? color});
  StarOfficeColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StarOfficeColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarOfficeColor, $Out>
    implements StarOfficeColorCopyWith<$R, StarOfficeColor, $Out> {
  _StarOfficeColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarOfficeColor> $mapper =
      StarOfficeColorMapper.ensureInitialized();
  @override
  $R call({String? name, String? color}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (color != null) #color: color}));
  @override
  StarOfficeColor $make(CopyWithData data) => StarOfficeColor(
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color));

  @override
  StarOfficeColorCopyWith<$R2, StarOfficeColor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StarOfficeColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StarOfficeColorTableMapper extends ClassMapperBase<StarOfficeColorTable> {
  StarOfficeColorTableMapper._();

  static StarOfficeColorTableMapper? _instance;
  static StarOfficeColorTableMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarOfficeColorTableMapper._());
      StarOfficeColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StarOfficeColorTable';

  static List<StarOfficeColor> _$colors(StarOfficeColorTable v) => v.colors;
  static const Field<StarOfficeColorTable, List<StarOfficeColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<StarOfficeColorTable> fields = const {
    #colors: _f$colors,
  };

  static StarOfficeColorTable _instantiate(DecodingData data) {
    return StarOfficeColorTable(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static StarOfficeColorTable fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarOfficeColorTable>(map);
  }

  static StarOfficeColorTable fromJson(String json) {
    return ensureInitialized().decodeJson<StarOfficeColorTable>(json);
  }
}

mixin StarOfficeColorTableMappable {
  String toJson() {
    return StarOfficeColorTableMapper.ensureInitialized()
        .encodeJson<StarOfficeColorTable>(this as StarOfficeColorTable);
  }

  Map<String, dynamic> toMap() {
    return StarOfficeColorTableMapper.ensureInitialized()
        .encodeMap<StarOfficeColorTable>(this as StarOfficeColorTable);
  }

  StarOfficeColorTableCopyWith<StarOfficeColorTable, StarOfficeColorTable,
      StarOfficeColorTable> get copyWith => _StarOfficeColorTableCopyWithImpl<
          StarOfficeColorTable, StarOfficeColorTable>(
      this as StarOfficeColorTable, $identity, $identity);
  @override
  String toString() {
    return StarOfficeColorTableMapper.ensureInitialized()
        .stringifyValue(this as StarOfficeColorTable);
  }

  @override
  bool operator ==(Object other) {
    return StarOfficeColorTableMapper.ensureInitialized()
        .equalsValue(this as StarOfficeColorTable, other);
  }

  @override
  int get hashCode {
    return StarOfficeColorTableMapper.ensureInitialized()
        .hashValue(this as StarOfficeColorTable);
  }
}

extension StarOfficeColorTableValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarOfficeColorTable, $Out> {
  StarOfficeColorTableCopyWith<$R, StarOfficeColorTable, $Out>
      get $asStarOfficeColorTable => $base.as(
          (v, t, t2) => _StarOfficeColorTableCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StarOfficeColorTableCopyWith<
    $R,
    $In extends StarOfficeColorTable,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, StarOfficeColor,
      StarOfficeColorCopyWith<$R, StarOfficeColor, StarOfficeColor>> get colors;
  $R call({List<StarOfficeColor>? colors});
  StarOfficeColorTableCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StarOfficeColorTableCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarOfficeColorTable, $Out>
    implements StarOfficeColorTableCopyWith<$R, StarOfficeColorTable, $Out> {
  _StarOfficeColorTableCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarOfficeColorTable> $mapper =
      StarOfficeColorTableMapper.ensureInitialized();
  @override
  ListCopyWith<$R, StarOfficeColor,
          StarOfficeColorCopyWith<$R, StarOfficeColor, StarOfficeColor>>
      get colors => ListCopyWith($value.colors, (v, t) => v.copyWith.$chain(t),
          (v) => call(colors: v));
  @override
  $R call({List<StarOfficeColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  StarOfficeColorTable $make(CopyWithData data) =>
      StarOfficeColorTable(colors: data.get(#colors, or: $value.colors));

  @override
  StarOfficeColorTableCopyWith<$R2, StarOfficeColorTable, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StarOfficeColorTableCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
