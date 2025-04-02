// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ase.dart';

class AdobeSwatchExchangeColorModelMapper
    extends EnumMapper<AdobeSwatchExchangeColorModel> {
  AdobeSwatchExchangeColorModelMapper._();

  static AdobeSwatchExchangeColorModelMapper? _instance;
  static AdobeSwatchExchangeColorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeSwatchExchangeColorModelMapper._());
    }
    return _instance!;
  }

  static AdobeSwatchExchangeColorModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdobeSwatchExchangeColorModel decode(dynamic value) {
    switch (value) {
      case r'rgb':
        return AdobeSwatchExchangeColorModel.rgb;
      case r'cmyk':
        return AdobeSwatchExchangeColorModel.cmyk;
      case r'gray':
        return AdobeSwatchExchangeColorModel.gray;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdobeSwatchExchangeColorModel self) {
    switch (self) {
      case AdobeSwatchExchangeColorModel.rgb:
        return r'rgb';
      case AdobeSwatchExchangeColorModel.cmyk:
        return r'cmyk';
      case AdobeSwatchExchangeColorModel.gray:
        return r'gray';
    }
  }
}

extension AdobeSwatchExchangeColorModelMapperExtension
    on AdobeSwatchExchangeColorModel {
  String toValue() {
    AdobeSwatchExchangeColorModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdobeSwatchExchangeColorModel>(this)
        as String;
  }
}

class AdobeSwatchExchangeColorTypeMapper
    extends EnumMapper<AdobeSwatchExchangeColorType> {
  AdobeSwatchExchangeColorTypeMapper._();

  static AdobeSwatchExchangeColorTypeMapper? _instance;
  static AdobeSwatchExchangeColorTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeSwatchExchangeColorTypeMapper._());
    }
    return _instance!;
  }

  static AdobeSwatchExchangeColorType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdobeSwatchExchangeColorType decode(dynamic value) {
    switch (value) {
      case r'global':
        return AdobeSwatchExchangeColorType.global;
      case r'spot':
        return AdobeSwatchExchangeColorType.spot;
      case r'normal':
        return AdobeSwatchExchangeColorType.normal;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdobeSwatchExchangeColorType self) {
    switch (self) {
      case AdobeSwatchExchangeColorType.global:
        return r'global';
      case AdobeSwatchExchangeColorType.spot:
        return r'spot';
      case AdobeSwatchExchangeColorType.normal:
        return r'normal';
    }
  }
}

extension AdobeSwatchExchangeColorTypeMapperExtension
    on AdobeSwatchExchangeColorType {
  String toValue() {
    AdobeSwatchExchangeColorTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdobeSwatchExchangeColorType>(this)
        as String;
  }
}

class AdobeSwatchExchangeColorMapper
    extends ClassMapperBase<AdobeSwatchExchangeColor> {
  AdobeSwatchExchangeColorMapper._();

  static AdobeSwatchExchangeColorMapper? _instance;
  static AdobeSwatchExchangeColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeSwatchExchangeColorMapper._());
      AdobeSwatchExchangeColorModelMapper.ensureInitialized();
      AdobeSwatchExchangeColorTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeSwatchExchangeColor';

  static String _$name(AdobeSwatchExchangeColor v) => v.name;
  static const Field<AdobeSwatchExchangeColor, String> _f$name =
      Field('name', _$name);
  static AdobeSwatchExchangeColorModel _$model(AdobeSwatchExchangeColor v) =>
      v.model;
  static const Field<AdobeSwatchExchangeColor, AdobeSwatchExchangeColorModel>
      _f$model = Field('model', _$model);
  static List<double> _$values(AdobeSwatchExchangeColor v) => v.values;
  static const Field<AdobeSwatchExchangeColor, List<double>> _f$values =
      Field('values', _$values);
  static AdobeSwatchExchangeColorType _$type(AdobeSwatchExchangeColor v) =>
      v.type;
  static const Field<AdobeSwatchExchangeColor, AdobeSwatchExchangeColorType>
      _f$type = Field('type', _$type,
          opt: true, def: AdobeSwatchExchangeColorType.global);

  @override
  final MappableFields<AdobeSwatchExchangeColor> fields = const {
    #name: _f$name,
    #model: _f$model,
    #values: _f$values,
    #type: _f$type,
  };

  static AdobeSwatchExchangeColor _instantiate(DecodingData data) {
    return AdobeSwatchExchangeColor(
        name: data.dec(_f$name),
        model: data.dec(_f$model),
        values: data.dec(_f$values),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeSwatchExchangeColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeSwatchExchangeColor>(map);
  }

  static AdobeSwatchExchangeColor fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeSwatchExchangeColor>(json);
  }
}

mixin AdobeSwatchExchangeColorMappable {
  String toJson() {
    return AdobeSwatchExchangeColorMapper.ensureInitialized()
        .encodeJson<AdobeSwatchExchangeColor>(this as AdobeSwatchExchangeColor);
  }

  Map<String, dynamic> toMap() {
    return AdobeSwatchExchangeColorMapper.ensureInitialized()
        .encodeMap<AdobeSwatchExchangeColor>(this as AdobeSwatchExchangeColor);
  }

  AdobeSwatchExchangeColorCopyWith<AdobeSwatchExchangeColor,
          AdobeSwatchExchangeColor, AdobeSwatchExchangeColor>
      get copyWith => _AdobeSwatchExchangeColorCopyWithImpl<
              AdobeSwatchExchangeColor, AdobeSwatchExchangeColor>(
          this as AdobeSwatchExchangeColor, $identity, $identity);
  @override
  String toString() {
    return AdobeSwatchExchangeColorMapper.ensureInitialized()
        .stringifyValue(this as AdobeSwatchExchangeColor);
  }

  @override
  bool operator ==(Object other) {
    return AdobeSwatchExchangeColorMapper.ensureInitialized()
        .equalsValue(this as AdobeSwatchExchangeColor, other);
  }

  @override
  int get hashCode {
    return AdobeSwatchExchangeColorMapper.ensureInitialized()
        .hashValue(this as AdobeSwatchExchangeColor);
  }
}

extension AdobeSwatchExchangeColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeSwatchExchangeColor, $Out> {
  AdobeSwatchExchangeColorCopyWith<$R, AdobeSwatchExchangeColor, $Out>
      get $asAdobeSwatchExchangeColor => $base.as((v, t, t2) =>
          _AdobeSwatchExchangeColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeSwatchExchangeColorCopyWith<
    $R,
    $In extends AdobeSwatchExchangeColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values;
  $R call(
      {String? name,
      AdobeSwatchExchangeColorModel? model,
      List<double>? values,
      AdobeSwatchExchangeColorType? type});
  AdobeSwatchExchangeColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeSwatchExchangeColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeSwatchExchangeColor, $Out>
    implements
        AdobeSwatchExchangeColorCopyWith<$R, AdobeSwatchExchangeColor, $Out> {
  _AdobeSwatchExchangeColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeSwatchExchangeColor> $mapper =
      AdobeSwatchExchangeColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call(
          {String? name,
          AdobeSwatchExchangeColorModel? model,
          List<double>? values,
          AdobeSwatchExchangeColorType? type}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (model != null) #model: model,
        if (values != null) #values: values,
        if (type != null) #type: type
      }));
  @override
  AdobeSwatchExchangeColor $make(CopyWithData data) => AdobeSwatchExchangeColor(
      name: data.get(#name, or: $value.name),
      model: data.get(#model, or: $value.model),
      values: data.get(#values, or: $value.values),
      type: data.get(#type, or: $value.type));

  @override
  AdobeSwatchExchangeColorCopyWith<$R2, AdobeSwatchExchangeColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeSwatchExchangeColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AdobeSwatchExchangeMapper extends ClassMapperBase<AdobeSwatchExchange> {
  AdobeSwatchExchangeMapper._();

  static AdobeSwatchExchangeMapper? _instance;
  static AdobeSwatchExchangeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeSwatchExchangeMapper._());
      AdobeSwatchExchangeColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeSwatchExchange';

  static List<dynamic> _$groups(AdobeSwatchExchange v) => v.groups;
  static const Field<AdobeSwatchExchange, List<dynamic>> _f$groups =
      Field('groups', _$groups, opt: true, def: const []);
  static List<AdobeSwatchExchangeColor> _$colors(AdobeSwatchExchange v) =>
      v.colors;
  static const Field<AdobeSwatchExchange, List<AdobeSwatchExchangeColor>>
      _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<AdobeSwatchExchange> fields = const {
    #groups: _f$groups,
    #colors: _f$colors,
  };

  static AdobeSwatchExchange _instantiate(DecodingData data) {
    return AdobeSwatchExchange(
        groups: data.dec(_f$groups), colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeSwatchExchange fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeSwatchExchange>(map);
  }

  static AdobeSwatchExchange fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeSwatchExchange>(json);
  }
}

mixin AdobeSwatchExchangeMappable {
  String toJson() {
    return AdobeSwatchExchangeMapper.ensureInitialized()
        .encodeJson<AdobeSwatchExchange>(this as AdobeSwatchExchange);
  }

  Map<String, dynamic> toMap() {
    return AdobeSwatchExchangeMapper.ensureInitialized()
        .encodeMap<AdobeSwatchExchange>(this as AdobeSwatchExchange);
  }

  AdobeSwatchExchangeCopyWith<AdobeSwatchExchange, AdobeSwatchExchange,
      AdobeSwatchExchange> get copyWith => _AdobeSwatchExchangeCopyWithImpl<
          AdobeSwatchExchange, AdobeSwatchExchange>(
      this as AdobeSwatchExchange, $identity, $identity);
  @override
  String toString() {
    return AdobeSwatchExchangeMapper.ensureInitialized()
        .stringifyValue(this as AdobeSwatchExchange);
  }

  @override
  bool operator ==(Object other) {
    return AdobeSwatchExchangeMapper.ensureInitialized()
        .equalsValue(this as AdobeSwatchExchange, other);
  }

  @override
  int get hashCode {
    return AdobeSwatchExchangeMapper.ensureInitialized()
        .hashValue(this as AdobeSwatchExchange);
  }
}

extension AdobeSwatchExchangeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeSwatchExchange, $Out> {
  AdobeSwatchExchangeCopyWith<$R, AdobeSwatchExchange, $Out>
      get $asAdobeSwatchExchange => $base.as(
          (v, t, t2) => _AdobeSwatchExchangeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeSwatchExchangeCopyWith<$R, $In extends AdobeSwatchExchange,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get groups;
  ListCopyWith<
      $R,
      AdobeSwatchExchangeColor,
      AdobeSwatchExchangeColorCopyWith<$R, AdobeSwatchExchangeColor,
          AdobeSwatchExchangeColor>> get colors;
  $R call({List<dynamic>? groups, List<AdobeSwatchExchangeColor>? colors});
  AdobeSwatchExchangeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeSwatchExchangeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeSwatchExchange, $Out>
    implements AdobeSwatchExchangeCopyWith<$R, AdobeSwatchExchange, $Out> {
  _AdobeSwatchExchangeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeSwatchExchange> $mapper =
      AdobeSwatchExchangeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get groups =>
      ListCopyWith($value.groups, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(groups: v));
  @override
  ListCopyWith<
      $R,
      AdobeSwatchExchangeColor,
      AdobeSwatchExchangeColorCopyWith<$R, AdobeSwatchExchangeColor,
          AdobeSwatchExchangeColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({List<dynamic>? groups, List<AdobeSwatchExchangeColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (groups != null) #groups: groups,
        if (colors != null) #colors: colors
      }));
  @override
  AdobeSwatchExchange $make(CopyWithData data) => AdobeSwatchExchange(
      groups: data.get(#groups, or: $value.groups),
      colors: data.get(#colors, or: $value.colors));

  @override
  AdobeSwatchExchangeCopyWith<$R2, AdobeSwatchExchange, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeSwatchExchangeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
