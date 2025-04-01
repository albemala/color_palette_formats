// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'acbl.dart';

class AdobeColorBookLegacyPrefixPostfixMapper
    extends ClassMapperBase<AdobeColorBookLegacyPrefixPostfix> {
  AdobeColorBookLegacyPrefixPostfixMapper._();

  static AdobeColorBookLegacyPrefixPostfixMapper? _instance;
  static AdobeColorBookLegacyPrefixPostfixMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeColorBookLegacyPrefixPostfixMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBookLegacyPrefixPostfix';

  static String _$prefix(AdobeColorBookLegacyPrefixPostfix v) => v.prefix;
  static const Field<AdobeColorBookLegacyPrefixPostfix, String> _f$prefix =
      Field('prefix', _$prefix);
  static String _$postfix(AdobeColorBookLegacyPrefixPostfix v) => v.postfix;
  static const Field<AdobeColorBookLegacyPrefixPostfix, String> _f$postfix =
      Field('postfix', _$postfix);
  static String? _$id(AdobeColorBookLegacyPrefixPostfix v) => v.id;
  static const Field<AdobeColorBookLegacyPrefixPostfix, String> _f$id =
      Field('id', _$id, opt: true);

  @override
  final MappableFields<AdobeColorBookLegacyPrefixPostfix> fields = const {
    #prefix: _f$prefix,
    #postfix: _f$postfix,
    #id: _f$id,
  };

  static AdobeColorBookLegacyPrefixPostfix _instantiate(DecodingData data) {
    return AdobeColorBookLegacyPrefixPostfix(
        prefix: data.dec(_f$prefix),
        postfix: data.dec(_f$postfix),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBookLegacyPrefixPostfix fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<AdobeColorBookLegacyPrefixPostfix>(map);
  }

  static AdobeColorBookLegacyPrefixPostfix fromJson(String json) {
    return ensureInitialized()
        .decodeJson<AdobeColorBookLegacyPrefixPostfix>(json);
  }
}

mixin AdobeColorBookLegacyPrefixPostfixMappable {
  String toJson() {
    return AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized()
        .encodeJson<AdobeColorBookLegacyPrefixPostfix>(
            this as AdobeColorBookLegacyPrefixPostfix);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized()
        .encodeMap<AdobeColorBookLegacyPrefixPostfix>(
            this as AdobeColorBookLegacyPrefixPostfix);
  }

  AdobeColorBookLegacyPrefixPostfixCopyWith<AdobeColorBookLegacyPrefixPostfix,
          AdobeColorBookLegacyPrefixPostfix, AdobeColorBookLegacyPrefixPostfix>
      get copyWith => _AdobeColorBookLegacyPrefixPostfixCopyWithImpl<
              AdobeColorBookLegacyPrefixPostfix,
              AdobeColorBookLegacyPrefixPostfix>(
          this as AdobeColorBookLegacyPrefixPostfix, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBookLegacyPrefixPostfix);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBookLegacyPrefixPostfix, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized()
        .hashValue(this as AdobeColorBookLegacyPrefixPostfix);
  }
}

extension AdobeColorBookLegacyPrefixPostfixValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBookLegacyPrefixPostfix, $Out> {
  AdobeColorBookLegacyPrefixPostfixCopyWith<$R,
          AdobeColorBookLegacyPrefixPostfix, $Out>
      get $asAdobeColorBookLegacyPrefixPostfix => $base.as((v, t, t2) =>
          _AdobeColorBookLegacyPrefixPostfixCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeColorBookLegacyPrefixPostfixCopyWith<
    $R,
    $In extends AdobeColorBookLegacyPrefixPostfix,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? prefix, String? postfix, String? id});
  AdobeColorBookLegacyPrefixPostfixCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookLegacyPrefixPostfixCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBookLegacyPrefixPostfix, $Out>
    implements
        AdobeColorBookLegacyPrefixPostfixCopyWith<$R,
            AdobeColorBookLegacyPrefixPostfix, $Out> {
  _AdobeColorBookLegacyPrefixPostfixCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBookLegacyPrefixPostfix> $mapper =
      AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized();
  @override
  $R call({String? prefix, String? postfix, Object? id = $none}) =>
      $apply(FieldCopyWithData({
        if (prefix != null) #prefix: prefix,
        if (postfix != null) #postfix: postfix,
        if (id != $none) #id: id
      }));
  @override
  AdobeColorBookLegacyPrefixPostfix $make(CopyWithData data) =>
      AdobeColorBookLegacyPrefixPostfix(
          prefix: data.get(#prefix, or: $value.prefix),
          postfix: data.get(#postfix, or: $value.postfix),
          id: data.get(#id, or: $value.id));

  @override
  AdobeColorBookLegacyPrefixPostfixCopyWith<$R2,
      AdobeColorBookLegacyPrefixPostfix, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdobeColorBookLegacyPrefixPostfixCopyWithImpl<$R2, $Out2>(
          $value, $cast, t);
}

class AdobeColorBookLegacyFormatMapper
    extends ClassMapperBase<AdobeColorBookLegacyFormat> {
  AdobeColorBookLegacyFormatMapper._();

  static AdobeColorBookLegacyFormatMapper? _instance;
  static AdobeColorBookLegacyFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeColorBookLegacyFormatMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBookLegacyFormat';

  static String _$colorSpace(AdobeColorBookLegacyFormat v) => v.colorSpace;
  static const Field<AdobeColorBookLegacyFormat, String> _f$colorSpace =
      Field('colorSpace', _$colorSpace);
  static String _$encoding(AdobeColorBookLegacyFormat v) => v.encoding;
  static const Field<AdobeColorBookLegacyFormat, String> _f$encoding =
      Field('encoding', _$encoding);
  static int _$channels(AdobeColorBookLegacyFormat v) => v.channels;
  static const Field<AdobeColorBookLegacyFormat, int> _f$channels =
      Field('channels', _$channels);
  static String _$id(AdobeColorBookLegacyFormat v) => v.id;
  static const Field<AdobeColorBookLegacyFormat, String> _f$id =
      Field('id', _$id);

  @override
  final MappableFields<AdobeColorBookLegacyFormat> fields = const {
    #colorSpace: _f$colorSpace,
    #encoding: _f$encoding,
    #channels: _f$channels,
    #id: _f$id,
  };

  static AdobeColorBookLegacyFormat _instantiate(DecodingData data) {
    return AdobeColorBookLegacyFormat(
        colorSpace: data.dec(_f$colorSpace),
        encoding: data.dec(_f$encoding),
        channels: data.dec(_f$channels),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBookLegacyFormat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorBookLegacyFormat>(map);
  }

  static AdobeColorBookLegacyFormat fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorBookLegacyFormat>(json);
  }
}

mixin AdobeColorBookLegacyFormatMappable {
  String toJson() {
    return AdobeColorBookLegacyFormatMapper.ensureInitialized()
        .encodeJson<AdobeColorBookLegacyFormat>(
            this as AdobeColorBookLegacyFormat);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookLegacyFormatMapper.ensureInitialized()
        .encodeMap<AdobeColorBookLegacyFormat>(
            this as AdobeColorBookLegacyFormat);
  }

  AdobeColorBookLegacyFormatCopyWith<AdobeColorBookLegacyFormat,
          AdobeColorBookLegacyFormat, AdobeColorBookLegacyFormat>
      get copyWith => _AdobeColorBookLegacyFormatCopyWithImpl<
              AdobeColorBookLegacyFormat, AdobeColorBookLegacyFormat>(
          this as AdobeColorBookLegacyFormat, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookLegacyFormatMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBookLegacyFormat);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookLegacyFormatMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBookLegacyFormat, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookLegacyFormatMapper.ensureInitialized()
        .hashValue(this as AdobeColorBookLegacyFormat);
  }
}

extension AdobeColorBookLegacyFormatValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBookLegacyFormat, $Out> {
  AdobeColorBookLegacyFormatCopyWith<$R, AdobeColorBookLegacyFormat, $Out>
      get $asAdobeColorBookLegacyFormat => $base.as((v, t, t2) =>
          _AdobeColorBookLegacyFormatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeColorBookLegacyFormatCopyWith<
    $R,
    $In extends AdobeColorBookLegacyFormat,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? colorSpace, String? encoding, int? channels, String? id});
  AdobeColorBookLegacyFormatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookLegacyFormatCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBookLegacyFormat, $Out>
    implements
        AdobeColorBookLegacyFormatCopyWith<$R, AdobeColorBookLegacyFormat,
            $Out> {
  _AdobeColorBookLegacyFormatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBookLegacyFormat> $mapper =
      AdobeColorBookLegacyFormatMapper.ensureInitialized();
  @override
  $R call({String? colorSpace, String? encoding, int? channels, String? id}) =>
      $apply(FieldCopyWithData({
        if (colorSpace != null) #colorSpace: colorSpace,
        if (encoding != null) #encoding: encoding,
        if (channels != null) #channels: channels,
        if (id != null) #id: id
      }));
  @override
  AdobeColorBookLegacyFormat $make(CopyWithData data) =>
      AdobeColorBookLegacyFormat(
          colorSpace: data.get(#colorSpace, or: $value.colorSpace),
          encoding: data.get(#encoding, or: $value.encoding),
          channels: data.get(#channels, or: $value.channels),
          id: data.get(#id, or: $value.id));

  @override
  AdobeColorBookLegacyFormatCopyWith<$R2, AdobeColorBookLegacyFormat, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeColorBookLegacyFormatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AdobeColorBookLegacyColorMapper
    extends ClassMapperBase<AdobeColorBookLegacyColor> {
  AdobeColorBookLegacyColorMapper._();

  static AdobeColorBookLegacyColorMapper? _instance;
  static AdobeColorBookLegacyColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeColorBookLegacyColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBookLegacyColor';

  static String _$name(AdobeColorBookLegacyColor v) => v.name;
  static const Field<AdobeColorBookLegacyColor, String> _f$name =
      Field('name', _$name);
  static List<double> _$values(AdobeColorBookLegacyColor v) => v.values;
  static const Field<AdobeColorBookLegacyColor, List<double>> _f$values =
      Field('values', _$values);

  @override
  final MappableFields<AdobeColorBookLegacyColor> fields = const {
    #name: _f$name,
    #values: _f$values,
  };

  static AdobeColorBookLegacyColor _instantiate(DecodingData data) {
    return AdobeColorBookLegacyColor(
        name: data.dec(_f$name), values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBookLegacyColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorBookLegacyColor>(map);
  }

  static AdobeColorBookLegacyColor fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorBookLegacyColor>(json);
  }
}

mixin AdobeColorBookLegacyColorMappable {
  String toJson() {
    return AdobeColorBookLegacyColorMapper.ensureInitialized()
        .encodeJson<AdobeColorBookLegacyColor>(
            this as AdobeColorBookLegacyColor);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookLegacyColorMapper.ensureInitialized()
        .encodeMap<AdobeColorBookLegacyColor>(
            this as AdobeColorBookLegacyColor);
  }

  AdobeColorBookLegacyColorCopyWith<AdobeColorBookLegacyColor,
          AdobeColorBookLegacyColor, AdobeColorBookLegacyColor>
      get copyWith => _AdobeColorBookLegacyColorCopyWithImpl<
              AdobeColorBookLegacyColor, AdobeColorBookLegacyColor>(
          this as AdobeColorBookLegacyColor, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookLegacyColorMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBookLegacyColor);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookLegacyColorMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBookLegacyColor, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookLegacyColorMapper.ensureInitialized()
        .hashValue(this as AdobeColorBookLegacyColor);
  }
}

extension AdobeColorBookLegacyColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBookLegacyColor, $Out> {
  AdobeColorBookLegacyColorCopyWith<$R, AdobeColorBookLegacyColor, $Out>
      get $asAdobeColorBookLegacyColor => $base.as((v, t, t2) =>
          _AdobeColorBookLegacyColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeColorBookLegacyColorCopyWith<
    $R,
    $In extends AdobeColorBookLegacyColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values;
  $R call({String? name, List<double>? values});
  AdobeColorBookLegacyColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookLegacyColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBookLegacyColor, $Out>
    implements
        AdobeColorBookLegacyColorCopyWith<$R, AdobeColorBookLegacyColor, $Out> {
  _AdobeColorBookLegacyColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBookLegacyColor> $mapper =
      AdobeColorBookLegacyColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call({String? name, List<double>? values}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (values != null) #values: values}));
  @override
  AdobeColorBookLegacyColor $make(CopyWithData data) =>
      AdobeColorBookLegacyColor(
          name: data.get(#name, or: $value.name),
          values: data.get(#values, or: $value.values));

  @override
  AdobeColorBookLegacyColorCopyWith<$R2, AdobeColorBookLegacyColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeColorBookLegacyColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AdobeColorBookLegacyMapper extends ClassMapperBase<AdobeColorBookLegacy> {
  AdobeColorBookLegacyMapper._();

  static AdobeColorBookLegacyMapper? _instance;
  static AdobeColorBookLegacyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorBookLegacyMapper._());
      AdobeColorBookLegacyPrefixPostfixMapper.ensureInitialized();
      AdobeColorBookLegacyFormatMapper.ensureInitialized();
      AdobeColorBookLegacyColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBookLegacy';

  static int _$version(AdobeColorBookLegacy v) => v.version;
  static const Field<AdobeColorBookLegacy, int> _f$version =
      Field('version', _$version);
  static int _$bookId(AdobeColorBookLegacy v) => v.bookId;
  static const Field<AdobeColorBookLegacy, int> _f$bookId =
      Field('bookId', _$bookId);
  static List<AdobeColorBookLegacyPrefixPostfix> _$prefixPostfixPairs(
          AdobeColorBookLegacy v) =>
      v.prefixPostfixPairs;
  static const Field<AdobeColorBookLegacy,
          List<AdobeColorBookLegacyPrefixPostfix>> _f$prefixPostfixPairs =
      Field('prefixPostfixPairs', _$prefixPostfixPairs);
  static List<AdobeColorBookLegacyFormat> _$formats(AdobeColorBookLegacy v) =>
      v.formats;
  static const Field<AdobeColorBookLegacy, List<AdobeColorBookLegacyFormat>>
      _f$formats = Field('formats', _$formats);
  static List<AdobeColorBookLegacyColor> _$colors(AdobeColorBookLegacy v) =>
      v.colors;
  static const Field<AdobeColorBookLegacy, List<AdobeColorBookLegacyColor>>
      _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<AdobeColorBookLegacy> fields = const {
    #version: _f$version,
    #bookId: _f$bookId,
    #prefixPostfixPairs: _f$prefixPostfixPairs,
    #formats: _f$formats,
    #colors: _f$colors,
  };

  static AdobeColorBookLegacy _instantiate(DecodingData data) {
    return AdobeColorBookLegacy(
        version: data.dec(_f$version),
        bookId: data.dec(_f$bookId),
        prefixPostfixPairs: data.dec(_f$prefixPostfixPairs),
        formats: data.dec(_f$formats),
        colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBookLegacy fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorBookLegacy>(map);
  }

  static AdobeColorBookLegacy fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorBookLegacy>(json);
  }
}

mixin AdobeColorBookLegacyMappable {
  String toJson() {
    return AdobeColorBookLegacyMapper.ensureInitialized()
        .encodeJson<AdobeColorBookLegacy>(this as AdobeColorBookLegacy);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookLegacyMapper.ensureInitialized()
        .encodeMap<AdobeColorBookLegacy>(this as AdobeColorBookLegacy);
  }

  AdobeColorBookLegacyCopyWith<AdobeColorBookLegacy, AdobeColorBookLegacy,
      AdobeColorBookLegacy> get copyWith => _AdobeColorBookLegacyCopyWithImpl<
          AdobeColorBookLegacy, AdobeColorBookLegacy>(
      this as AdobeColorBookLegacy, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookLegacyMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBookLegacy);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookLegacyMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBookLegacy, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookLegacyMapper.ensureInitialized()
        .hashValue(this as AdobeColorBookLegacy);
  }
}

extension AdobeColorBookLegacyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBookLegacy, $Out> {
  AdobeColorBookLegacyCopyWith<$R, AdobeColorBookLegacy, $Out>
      get $asAdobeColorBookLegacy => $base.as(
          (v, t, t2) => _AdobeColorBookLegacyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeColorBookLegacyCopyWith<
    $R,
    $In extends AdobeColorBookLegacy,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      AdobeColorBookLegacyPrefixPostfix,
      AdobeColorBookLegacyPrefixPostfixCopyWith<
          $R,
          AdobeColorBookLegacyPrefixPostfix,
          AdobeColorBookLegacyPrefixPostfix>> get prefixPostfixPairs;
  ListCopyWith<
      $R,
      AdobeColorBookLegacyFormat,
      AdobeColorBookLegacyFormatCopyWith<$R, AdobeColorBookLegacyFormat,
          AdobeColorBookLegacyFormat>> get formats;
  ListCopyWith<
      $R,
      AdobeColorBookLegacyColor,
      AdobeColorBookLegacyColorCopyWith<$R, AdobeColorBookLegacyColor,
          AdobeColorBookLegacyColor>> get colors;
  $R call(
      {int? version,
      int? bookId,
      List<AdobeColorBookLegacyPrefixPostfix>? prefixPostfixPairs,
      List<AdobeColorBookLegacyFormat>? formats,
      List<AdobeColorBookLegacyColor>? colors});
  AdobeColorBookLegacyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookLegacyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBookLegacy, $Out>
    implements AdobeColorBookLegacyCopyWith<$R, AdobeColorBookLegacy, $Out> {
  _AdobeColorBookLegacyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBookLegacy> $mapper =
      AdobeColorBookLegacyMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      AdobeColorBookLegacyPrefixPostfix,
      AdobeColorBookLegacyPrefixPostfixCopyWith<
          $R,
          AdobeColorBookLegacyPrefixPostfix,
          AdobeColorBookLegacyPrefixPostfix>> get prefixPostfixPairs =>
      ListCopyWith($value.prefixPostfixPairs, (v, t) => v.copyWith.$chain(t),
          (v) => call(prefixPostfixPairs: v));
  @override
  ListCopyWith<
      $R,
      AdobeColorBookLegacyFormat,
      AdobeColorBookLegacyFormatCopyWith<$R, AdobeColorBookLegacyFormat,
          AdobeColorBookLegacyFormat>> get formats => ListCopyWith(
      $value.formats, (v, t) => v.copyWith.$chain(t), (v) => call(formats: v));
  @override
  ListCopyWith<
      $R,
      AdobeColorBookLegacyColor,
      AdobeColorBookLegacyColorCopyWith<$R, AdobeColorBookLegacyColor,
          AdobeColorBookLegacyColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call(
          {int? version,
          int? bookId,
          List<AdobeColorBookLegacyPrefixPostfix>? prefixPostfixPairs,
          List<AdobeColorBookLegacyFormat>? formats,
          List<AdobeColorBookLegacyColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (bookId != null) #bookId: bookId,
        if (prefixPostfixPairs != null) #prefixPostfixPairs: prefixPostfixPairs,
        if (formats != null) #formats: formats,
        if (colors != null) #colors: colors
      }));
  @override
  AdobeColorBookLegacy $make(CopyWithData data) => AdobeColorBookLegacy(
      version: data.get(#version, or: $value.version),
      bookId: data.get(#bookId, or: $value.bookId),
      prefixPostfixPairs:
          data.get(#prefixPostfixPairs, or: $value.prefixPostfixPairs),
      formats: data.get(#formats, or: $value.formats),
      colors: data.get(#colors, or: $value.colors));

  @override
  AdobeColorBookLegacyCopyWith<$R2, AdobeColorBookLegacy, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeColorBookLegacyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
