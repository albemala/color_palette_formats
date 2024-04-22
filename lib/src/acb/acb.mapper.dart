// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'acb.dart';

class AdobeColorBookColorSpaceMapper
    extends EnumMapper<AdobeColorBookColorSpace> {
  AdobeColorBookColorSpaceMapper._();

  static AdobeColorBookColorSpaceMapper? _instance;
  static AdobeColorBookColorSpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AdobeColorBookColorSpaceMapper._());
    }
    return _instance!;
  }

  static AdobeColorBookColorSpace fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdobeColorBookColorSpace decode(dynamic value) {
    switch (value) {
      case 'rgb':
        return AdobeColorBookColorSpace.rgb;
      case 'hsb':
        return AdobeColorBookColorSpace.hsb;
      case 'cmyk':
        return AdobeColorBookColorSpace.cmyk;
      case 'pantone':
        return AdobeColorBookColorSpace.pantone;
      case 'focoltone':
        return AdobeColorBookColorSpace.focoltone;
      case 'trumatch':
        return AdobeColorBookColorSpace.trumatch;
      case 'toyo':
        return AdobeColorBookColorSpace.toyo;
      case 'lab':
        return AdobeColorBookColorSpace.lab;
      case 'grayscale':
        return AdobeColorBookColorSpace.grayscale;
      case 'hks':
        return AdobeColorBookColorSpace.hks;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdobeColorBookColorSpace self) {
    switch (self) {
      case AdobeColorBookColorSpace.rgb:
        return 'rgb';
      case AdobeColorBookColorSpace.hsb:
        return 'hsb';
      case AdobeColorBookColorSpace.cmyk:
        return 'cmyk';
      case AdobeColorBookColorSpace.pantone:
        return 'pantone';
      case AdobeColorBookColorSpace.focoltone:
        return 'focoltone';
      case AdobeColorBookColorSpace.trumatch:
        return 'trumatch';
      case AdobeColorBookColorSpace.toyo:
        return 'toyo';
      case AdobeColorBookColorSpace.lab:
        return 'lab';
      case AdobeColorBookColorSpace.grayscale:
        return 'grayscale';
      case AdobeColorBookColorSpace.hks:
        return 'hks';
    }
  }
}

extension AdobeColorBookColorSpaceMapperExtension on AdobeColorBookColorSpace {
  String toValue() {
    AdobeColorBookColorSpaceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdobeColorBookColorSpace>(this)
        as String;
  }
}

class AdobeColorBookColorMapper extends ClassMapperBase<AdobeColorBookColor> {
  AdobeColorBookColorMapper._();

  static AdobeColorBookColorMapper? _instance;
  static AdobeColorBookColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorBookColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBookColor';

  static String _$name(AdobeColorBookColor v) => v.name;
  static const Field<AdobeColorBookColor, String> _f$name =
      Field('name', _$name);
  static String _$code(AdobeColorBookColor v) => v.code;
  static const Field<AdobeColorBookColor, String> _f$code =
      Field('code', _$code);
  static List<int> _$values(AdobeColorBookColor v) => v.values;
  static const Field<AdobeColorBookColor, List<int>> _f$values =
      Field('values', _$values);

  @override
  final MappableFields<AdobeColorBookColor> fields = const {
    #name: _f$name,
    #code: _f$code,
    #values: _f$values,
  };

  static AdobeColorBookColor _instantiate(DecodingData data) {
    return AdobeColorBookColor(
        name: data.dec(_f$name),
        code: data.dec(_f$code),
        values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBookColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorBookColor>(map);
  }

  static AdobeColorBookColor fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorBookColor>(json);
  }
}

mixin AdobeColorBookColorMappable {
  String toJson() {
    return AdobeColorBookColorMapper.ensureInitialized()
        .encodeJson<AdobeColorBookColor>(this as AdobeColorBookColor);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookColorMapper.ensureInitialized()
        .encodeMap<AdobeColorBookColor>(this as AdobeColorBookColor);
  }

  AdobeColorBookColorCopyWith<AdobeColorBookColor, AdobeColorBookColor,
          AdobeColorBookColor>
      get copyWith => _AdobeColorBookColorCopyWithImpl(
          this as AdobeColorBookColor, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookColorMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBookColor);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookColorMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBookColor, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookColorMapper.ensureInitialized()
        .hashValue(this as AdobeColorBookColor);
  }
}

extension AdobeColorBookColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBookColor, $Out> {
  AdobeColorBookColorCopyWith<$R, AdobeColorBookColor, $Out>
      get $asAdobeColorBookColor =>
          $base.as((v, t, t2) => _AdobeColorBookColorCopyWithImpl(v, t, t2));
}

abstract class AdobeColorBookColorCopyWith<$R, $In extends AdobeColorBookColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values;
  $R call({String? name, String? code, List<int>? values});
  AdobeColorBookColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBookColor, $Out>
    implements AdobeColorBookColorCopyWith<$R, AdobeColorBookColor, $Out> {
  _AdobeColorBookColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBookColor> $mapper =
      AdobeColorBookColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call({String? name, String? code, List<int>? values}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (code != null) #code: code,
        if (values != null) #values: values
      }));
  @override
  AdobeColorBookColor $make(CopyWithData data) => AdobeColorBookColor(
      name: data.get(#name, or: $value.name),
      code: data.get(#code, or: $value.code),
      values: data.get(#values, or: $value.values));

  @override
  AdobeColorBookColorCopyWith<$R2, AdobeColorBookColor, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AdobeColorBookColorCopyWithImpl($value, $cast, t);
}

class AdobeColorBookMapper extends ClassMapperBase<AdobeColorBook> {
  AdobeColorBookMapper._();

  static AdobeColorBookMapper? _instance;
  static AdobeColorBookMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorBookMapper._());
      AdobeColorBookColorSpaceMapper.ensureInitialized();
      AdobeColorBookColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorBook';

  static int _$version(AdobeColorBook v) => v.version;
  static const Field<AdobeColorBook, int> _f$version =
      Field('version', _$version);
  static int _$identifier(AdobeColorBook v) => v.identifier;
  static const Field<AdobeColorBook, int> _f$identifier =
      Field('identifier', _$identifier);
  static String _$title(AdobeColorBook v) => v.title;
  static const Field<AdobeColorBook, String> _f$title = Field('title', _$title);
  static String _$description(AdobeColorBook v) => v.description;
  static const Field<AdobeColorBook, String> _f$description =
      Field('description', _$description);
  static String _$colorNamePrefix(AdobeColorBook v) => v.colorNamePrefix;
  static const Field<AdobeColorBook, String> _f$colorNamePrefix =
      Field('colorNamePrefix', _$colorNamePrefix);
  static String _$colorNameSuffix(AdobeColorBook v) => v.colorNameSuffix;
  static const Field<AdobeColorBook, String> _f$colorNameSuffix =
      Field('colorNameSuffix', _$colorNameSuffix);
  static int _$colorCount(AdobeColorBook v) => v.colorCount;
  static const Field<AdobeColorBook, int> _f$colorCount =
      Field('colorCount', _$colorCount);
  static int _$pageSize(AdobeColorBook v) => v.pageSize;
  static const Field<AdobeColorBook, int> _f$pageSize =
      Field('pageSize', _$pageSize);
  static int _$pageSelectorOffset(AdobeColorBook v) => v.pageSelectorOffset;
  static const Field<AdobeColorBook, int> _f$pageSelectorOffset =
      Field('pageSelectorOffset', _$pageSelectorOffset);
  static AdobeColorBookColorSpace _$colorSpace(AdobeColorBook v) =>
      v.colorSpace;
  static const Field<AdobeColorBook, AdobeColorBookColorSpace> _f$colorSpace =
      Field('colorSpace', _$colorSpace);
  static List<AdobeColorBookColor> _$colors(AdobeColorBook v) => v.colors;
  static const Field<AdobeColorBook, List<AdobeColorBookColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<AdobeColorBook> fields = const {
    #version: _f$version,
    #identifier: _f$identifier,
    #title: _f$title,
    #description: _f$description,
    #colorNamePrefix: _f$colorNamePrefix,
    #colorNameSuffix: _f$colorNameSuffix,
    #colorCount: _f$colorCount,
    #pageSize: _f$pageSize,
    #pageSelectorOffset: _f$pageSelectorOffset,
    #colorSpace: _f$colorSpace,
    #colors: _f$colors,
  };

  static AdobeColorBook _instantiate(DecodingData data) {
    return AdobeColorBook(
        version: data.dec(_f$version),
        identifier: data.dec(_f$identifier),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        colorNamePrefix: data.dec(_f$colorNamePrefix),
        colorNameSuffix: data.dec(_f$colorNameSuffix),
        colorCount: data.dec(_f$colorCount),
        pageSize: data.dec(_f$pageSize),
        pageSelectorOffset: data.dec(_f$pageSelectorOffset),
        colorSpace: data.dec(_f$colorSpace),
        colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorBook fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorBook>(map);
  }

  static AdobeColorBook fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorBook>(json);
  }
}

mixin AdobeColorBookMappable {
  String toJson() {
    return AdobeColorBookMapper.ensureInitialized()
        .encodeJson<AdobeColorBook>(this as AdobeColorBook);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorBookMapper.ensureInitialized()
        .encodeMap<AdobeColorBook>(this as AdobeColorBook);
  }

  AdobeColorBookCopyWith<AdobeColorBook, AdobeColorBook, AdobeColorBook>
      get copyWith => _AdobeColorBookCopyWithImpl(
          this as AdobeColorBook, $identity, $identity);
  @override
  String toString() {
    return AdobeColorBookMapper.ensureInitialized()
        .stringifyValue(this as AdobeColorBook);
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorBookMapper.ensureInitialized()
        .equalsValue(this as AdobeColorBook, other);
  }

  @override
  int get hashCode {
    return AdobeColorBookMapper.ensureInitialized()
        .hashValue(this as AdobeColorBook);
  }
}

extension AdobeColorBookValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorBook, $Out> {
  AdobeColorBookCopyWith<$R, AdobeColorBook, $Out> get $asAdobeColorBook =>
      $base.as((v, t, t2) => _AdobeColorBookCopyWithImpl(v, t, t2));
}

abstract class AdobeColorBookCopyWith<$R, $In extends AdobeColorBook, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      AdobeColorBookColor,
      AdobeColorBookColorCopyWith<$R, AdobeColorBookColor,
          AdobeColorBookColor>> get colors;
  $R call(
      {int? version,
      int? identifier,
      String? title,
      String? description,
      String? colorNamePrefix,
      String? colorNameSuffix,
      int? colorCount,
      int? pageSize,
      int? pageSelectorOffset,
      AdobeColorBookColorSpace? colorSpace,
      List<AdobeColorBookColor>? colors});
  AdobeColorBookCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdobeColorBookCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorBook, $Out>
    implements AdobeColorBookCopyWith<$R, AdobeColorBook, $Out> {
  _AdobeColorBookCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorBook> $mapper =
      AdobeColorBookMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      AdobeColorBookColor,
      AdobeColorBookColorCopyWith<$R, AdobeColorBookColor,
          AdobeColorBookColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call(
          {int? version,
          int? identifier,
          String? title,
          String? description,
          String? colorNamePrefix,
          String? colorNameSuffix,
          int? colorCount,
          int? pageSize,
          int? pageSelectorOffset,
          AdobeColorBookColorSpace? colorSpace,
          List<AdobeColorBookColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (identifier != null) #identifier: identifier,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (colorNamePrefix != null) #colorNamePrefix: colorNamePrefix,
        if (colorNameSuffix != null) #colorNameSuffix: colorNameSuffix,
        if (colorCount != null) #colorCount: colorCount,
        if (pageSize != null) #pageSize: pageSize,
        if (pageSelectorOffset != null) #pageSelectorOffset: pageSelectorOffset,
        if (colorSpace != null) #colorSpace: colorSpace,
        if (colors != null) #colors: colors
      }));
  @override
  AdobeColorBook $make(CopyWithData data) => AdobeColorBook(
      version: data.get(#version, or: $value.version),
      identifier: data.get(#identifier, or: $value.identifier),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      colorNamePrefix: data.get(#colorNamePrefix, or: $value.colorNamePrefix),
      colorNameSuffix: data.get(#colorNameSuffix, or: $value.colorNameSuffix),
      colorCount: data.get(#colorCount, or: $value.colorCount),
      pageSize: data.get(#pageSize, or: $value.pageSize),
      pageSelectorOffset:
          data.get(#pageSelectorOffset, or: $value.pageSelectorOffset),
      colorSpace: data.get(#colorSpace, or: $value.colorSpace),
      colors: data.get(#colors, or: $value.colors));

  @override
  AdobeColorBookCopyWith<$R2, AdobeColorBook, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdobeColorBookCopyWithImpl($value, $cast, t);
}
