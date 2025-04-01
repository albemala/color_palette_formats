// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'riff.dart';

class ResourceInterchangeFileFormatColorMapper
    extends ClassMapperBase<ResourceInterchangeFileFormatColor> {
  ResourceInterchangeFileFormatColorMapper._();

  static ResourceInterchangeFileFormatColorMapper? _instance;
  static ResourceInterchangeFileFormatColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ResourceInterchangeFileFormatColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResourceInterchangeFileFormatColor';

  static int _$red(ResourceInterchangeFileFormatColor v) => v.red;
  static const Field<ResourceInterchangeFileFormatColor, int> _f$red =
      Field('red', _$red);
  static int _$green(ResourceInterchangeFileFormatColor v) => v.green;
  static const Field<ResourceInterchangeFileFormatColor, int> _f$green =
      Field('green', _$green);
  static int _$blue(ResourceInterchangeFileFormatColor v) => v.blue;
  static const Field<ResourceInterchangeFileFormatColor, int> _f$blue =
      Field('blue', _$blue);

  @override
  final MappableFields<ResourceInterchangeFileFormatColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static ResourceInterchangeFileFormatColor _instantiate(DecodingData data) {
    return ResourceInterchangeFileFormatColor(
        red: data.dec(_f$red),
        green: data.dec(_f$green),
        blue: data.dec(_f$blue));
  }

  @override
  final Function instantiate = _instantiate;

  static ResourceInterchangeFileFormatColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ResourceInterchangeFileFormatColor>(map);
  }

  static ResourceInterchangeFileFormatColor fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ResourceInterchangeFileFormatColor>(json);
  }
}

mixin ResourceInterchangeFileFormatColorMappable {
  String toJson() {
    return ResourceInterchangeFileFormatColorMapper.ensureInitialized()
        .encodeJson<ResourceInterchangeFileFormatColor>(
            this as ResourceInterchangeFileFormatColor);
  }

  Map<String, dynamic> toMap() {
    return ResourceInterchangeFileFormatColorMapper.ensureInitialized()
        .encodeMap<ResourceInterchangeFileFormatColor>(
            this as ResourceInterchangeFileFormatColor);
  }

  ResourceInterchangeFileFormatColorCopyWith<
          ResourceInterchangeFileFormatColor,
          ResourceInterchangeFileFormatColor,
          ResourceInterchangeFileFormatColor>
      get copyWith => _ResourceInterchangeFileFormatColorCopyWithImpl<
              ResourceInterchangeFileFormatColor,
              ResourceInterchangeFileFormatColor>(
          this as ResourceInterchangeFileFormatColor, $identity, $identity);
  @override
  String toString() {
    return ResourceInterchangeFileFormatColorMapper.ensureInitialized()
        .stringifyValue(this as ResourceInterchangeFileFormatColor);
  }

  @override
  bool operator ==(Object other) {
    return ResourceInterchangeFileFormatColorMapper.ensureInitialized()
        .equalsValue(this as ResourceInterchangeFileFormatColor, other);
  }

  @override
  int get hashCode {
    return ResourceInterchangeFileFormatColorMapper.ensureInitialized()
        .hashValue(this as ResourceInterchangeFileFormatColor);
  }
}

extension ResourceInterchangeFileFormatColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResourceInterchangeFileFormatColor, $Out> {
  ResourceInterchangeFileFormatColorCopyWith<$R,
          ResourceInterchangeFileFormatColor, $Out>
      get $asResourceInterchangeFileFormatColor => $base.as((v, t, t2) =>
          _ResourceInterchangeFileFormatColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResourceInterchangeFileFormatColorCopyWith<
    $R,
    $In extends ResourceInterchangeFileFormatColor,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  ResourceInterchangeFileFormatColorCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResourceInterchangeFileFormatColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResourceInterchangeFileFormatColor, $Out>
    implements
        ResourceInterchangeFileFormatColorCopyWith<$R,
            ResourceInterchangeFileFormatColor, $Out> {
  _ResourceInterchangeFileFormatColorCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResourceInterchangeFileFormatColor> $mapper =
      ResourceInterchangeFileFormatColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(FieldCopyWithData({
        if (red != null) #red: red,
        if (green != null) #green: green,
        if (blue != null) #blue: blue
      }));
  @override
  ResourceInterchangeFileFormatColor $make(CopyWithData data) =>
      ResourceInterchangeFileFormatColor(
          red: data.get(#red, or: $value.red),
          green: data.get(#green, or: $value.green),
          blue: data.get(#blue, or: $value.blue));

  @override
  ResourceInterchangeFileFormatColorCopyWith<$R2,
      ResourceInterchangeFileFormatColor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ResourceInterchangeFileFormatColorCopyWithImpl<$R2, $Out2>(
          $value, $cast, t);
}

class ResourceInterchangeFileFormatMapper
    extends ClassMapperBase<ResourceInterchangeFileFormat> {
  ResourceInterchangeFileFormatMapper._();

  static ResourceInterchangeFileFormatMapper? _instance;
  static ResourceInterchangeFileFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ResourceInterchangeFileFormatMapper._());
      ResourceInterchangeFileFormatColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ResourceInterchangeFileFormat';

  static int _$version(ResourceInterchangeFileFormat v) => v.version;
  static const Field<ResourceInterchangeFileFormat, int> _f$version =
      Field('version', _$version);
  static List<ResourceInterchangeFileFormatColor> _$colors(
          ResourceInterchangeFileFormat v) =>
      v.colors;
  static const Field<ResourceInterchangeFileFormat,
          List<ResourceInterchangeFileFormatColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<ResourceInterchangeFileFormat> fields = const {
    #version: _f$version,
    #colors: _f$colors,
  };

  static ResourceInterchangeFileFormat _instantiate(DecodingData data) {
    return ResourceInterchangeFileFormat(
        version: data.dec(_f$version), colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static ResourceInterchangeFileFormat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResourceInterchangeFileFormat>(map);
  }

  static ResourceInterchangeFileFormat fromJson(String json) {
    return ensureInitialized().decodeJson<ResourceInterchangeFileFormat>(json);
  }
}

mixin ResourceInterchangeFileFormatMappable {
  String toJson() {
    return ResourceInterchangeFileFormatMapper.ensureInitialized()
        .encodeJson<ResourceInterchangeFileFormat>(
            this as ResourceInterchangeFileFormat);
  }

  Map<String, dynamic> toMap() {
    return ResourceInterchangeFileFormatMapper.ensureInitialized()
        .encodeMap<ResourceInterchangeFileFormat>(
            this as ResourceInterchangeFileFormat);
  }

  ResourceInterchangeFileFormatCopyWith<ResourceInterchangeFileFormat,
          ResourceInterchangeFileFormat, ResourceInterchangeFileFormat>
      get copyWith => _ResourceInterchangeFileFormatCopyWithImpl<
              ResourceInterchangeFileFormat, ResourceInterchangeFileFormat>(
          this as ResourceInterchangeFileFormat, $identity, $identity);
  @override
  String toString() {
    return ResourceInterchangeFileFormatMapper.ensureInitialized()
        .stringifyValue(this as ResourceInterchangeFileFormat);
  }

  @override
  bool operator ==(Object other) {
    return ResourceInterchangeFileFormatMapper.ensureInitialized()
        .equalsValue(this as ResourceInterchangeFileFormat, other);
  }

  @override
  int get hashCode {
    return ResourceInterchangeFileFormatMapper.ensureInitialized()
        .hashValue(this as ResourceInterchangeFileFormat);
  }
}

extension ResourceInterchangeFileFormatValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResourceInterchangeFileFormat, $Out> {
  ResourceInterchangeFileFormatCopyWith<$R, ResourceInterchangeFileFormat, $Out>
      get $asResourceInterchangeFileFormat => $base.as((v, t, t2) =>
          _ResourceInterchangeFileFormatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResourceInterchangeFileFormatCopyWith<
    $R,
    $In extends ResourceInterchangeFileFormat,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ResourceInterchangeFileFormatColor,
      ResourceInterchangeFileFormatColorCopyWith<
          $R,
          ResourceInterchangeFileFormatColor,
          ResourceInterchangeFileFormatColor>> get colors;
  $R call({int? version, List<ResourceInterchangeFileFormatColor>? colors});
  ResourceInterchangeFileFormatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ResourceInterchangeFileFormatCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResourceInterchangeFileFormat, $Out>
    implements
        ResourceInterchangeFileFormatCopyWith<$R, ResourceInterchangeFileFormat,
            $Out> {
  _ResourceInterchangeFileFormatCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResourceInterchangeFileFormat> $mapper =
      ResourceInterchangeFileFormatMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ResourceInterchangeFileFormatColor,
      ResourceInterchangeFileFormatColorCopyWith<
          $R,
          ResourceInterchangeFileFormatColor,
          ResourceInterchangeFileFormatColor>> get colors => ListCopyWith(
      $value.colors, (v, t) => v.copyWith.$chain(t), (v) => call(colors: v));
  @override
  $R call({int? version, List<ResourceInterchangeFileFormatColor>? colors}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (colors != null) #colors: colors
      }));
  @override
  ResourceInterchangeFileFormat $make(CopyWithData data) =>
      ResourceInterchangeFileFormat(
          version: data.get(#version, or: $value.version),
          colors: data.get(#colors, or: $value.colors));

  @override
  ResourceInterchangeFileFormatCopyWith<$R2, ResourceInterchangeFileFormat,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ResourceInterchangeFileFormatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
