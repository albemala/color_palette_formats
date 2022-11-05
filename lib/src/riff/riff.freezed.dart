// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'riff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResourceInterchangeFileFormatColor _$ResourceInterchangeFileFormatColorFromJson(
    Map<String, dynamic> json) {
  return _ResourceInterchangeFileFormatColor.fromJson(json);
}

/// @nodoc
mixin _$ResourceInterchangeFileFormatColor {
  /// Value: [0..255]
  int get red => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get blue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceInterchangeFileFormatColorCopyWith<
          ResourceInterchangeFileFormatColor>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceInterchangeFileFormatColorCopyWith<$Res> {
  factory $ResourceInterchangeFileFormatColorCopyWith(
          ResourceInterchangeFileFormatColor value,
          $Res Function(ResourceInterchangeFileFormatColor) then) =
      _$ResourceInterchangeFileFormatColorCopyWithImpl<$Res,
          ResourceInterchangeFileFormatColor>;
  @useResult
  $Res call({int red, int green, int blue});
}

/// @nodoc
class _$ResourceInterchangeFileFormatColorCopyWithImpl<$Res,
        $Val extends ResourceInterchangeFileFormatColor>
    implements $ResourceInterchangeFileFormatColorCopyWith<$Res> {
  _$ResourceInterchangeFileFormatColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? blue = null,
  }) {
    return _then(_value.copyWith(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResourceInterchangeFileFormatColorCopyWith<$Res>
    implements $ResourceInterchangeFileFormatColorCopyWith<$Res> {
  factory _$$_ResourceInterchangeFileFormatColorCopyWith(
          _$_ResourceInterchangeFileFormatColor value,
          $Res Function(_$_ResourceInterchangeFileFormatColor) then) =
      __$$_ResourceInterchangeFileFormatColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int red, int green, int blue});
}

/// @nodoc
class __$$_ResourceInterchangeFileFormatColorCopyWithImpl<$Res>
    extends _$ResourceInterchangeFileFormatColorCopyWithImpl<$Res,
        _$_ResourceInterchangeFileFormatColor>
    implements _$$_ResourceInterchangeFileFormatColorCopyWith<$Res> {
  __$$_ResourceInterchangeFileFormatColorCopyWithImpl(
      _$_ResourceInterchangeFileFormatColor _value,
      $Res Function(_$_ResourceInterchangeFileFormatColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? blue = null,
  }) {
    return _then(_$_ResourceInterchangeFileFormatColor(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResourceInterchangeFileFormatColor
    implements _ResourceInterchangeFileFormatColor {
  const _$_ResourceInterchangeFileFormatColor(
      {required this.red, required this.green, required this.blue});

  factory _$_ResourceInterchangeFileFormatColor.fromJson(
          Map<String, dynamic> json) =>
      _$$_ResourceInterchangeFileFormatColorFromJson(json);

  /// Value: [0..255]
  @override
  final int red;

  /// Value: [0..255]
  @override
  final int green;

  /// Value: [0..255]
  @override
  final int blue;

  @override
  String toString() {
    return 'ResourceInterchangeFileFormatColor(red: $red, green: $green, blue: $blue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResourceInterchangeFileFormatColor &&
            (identical(other.red, red) || other.red == red) &&
            (identical(other.green, green) || other.green == green) &&
            (identical(other.blue, blue) || other.blue == blue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, red, green, blue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResourceInterchangeFileFormatColorCopyWith<
          _$_ResourceInterchangeFileFormatColor>
      get copyWith => __$$_ResourceInterchangeFileFormatColorCopyWithImpl<
          _$_ResourceInterchangeFileFormatColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResourceInterchangeFileFormatColorToJson(
      this,
    );
  }
}

abstract class _ResourceInterchangeFileFormatColor
    implements ResourceInterchangeFileFormatColor {
  const factory _ResourceInterchangeFileFormatColor(
      {required final int red,
      required final int green,
      required final int blue}) = _$_ResourceInterchangeFileFormatColor;

  factory _ResourceInterchangeFileFormatColor.fromJson(
          Map<String, dynamic> json) =
      _$_ResourceInterchangeFileFormatColor.fromJson;

  @override

  /// Value: [0..255]
  int get red;
  @override

  /// Value: [0..255]
  int get green;
  @override

  /// Value: [0..255]
  int get blue;
  @override
  @JsonKey(ignore: true)
  _$$_ResourceInterchangeFileFormatColorCopyWith<
          _$_ResourceInterchangeFileFormatColor>
      get copyWith => throw _privateConstructorUsedError;
}

ResourceInterchangeFileFormat _$ResourceInterchangeFileFormatFromJson(
    Map<String, dynamic> json) {
  return _ResourceInterchangeFileFormat.fromJson(json);
}

/// @nodoc
mixin _$ResourceInterchangeFileFormat {
  int get version => throw _privateConstructorUsedError;
  List<ResourceInterchangeFileFormatColor> get colors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceInterchangeFileFormatCopyWith<ResourceInterchangeFileFormat>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceInterchangeFileFormatCopyWith<$Res> {
  factory $ResourceInterchangeFileFormatCopyWith(
          ResourceInterchangeFileFormat value,
          $Res Function(ResourceInterchangeFileFormat) then) =
      _$ResourceInterchangeFileFormatCopyWithImpl<$Res,
          ResourceInterchangeFileFormat>;
  @useResult
  $Res call({int version, List<ResourceInterchangeFileFormatColor> colors});
}

/// @nodoc
class _$ResourceInterchangeFileFormatCopyWithImpl<$Res,
        $Val extends ResourceInterchangeFileFormat>
    implements $ResourceInterchangeFileFormatCopyWith<$Res> {
  _$ResourceInterchangeFileFormatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ResourceInterchangeFileFormatColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResourceInterchangeFileFormatCopyWith<$Res>
    implements $ResourceInterchangeFileFormatCopyWith<$Res> {
  factory _$$_ResourceInterchangeFileFormatCopyWith(
          _$_ResourceInterchangeFileFormat value,
          $Res Function(_$_ResourceInterchangeFileFormat) then) =
      __$$_ResourceInterchangeFileFormatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int version, List<ResourceInterchangeFileFormatColor> colors});
}

/// @nodoc
class __$$_ResourceInterchangeFileFormatCopyWithImpl<$Res>
    extends _$ResourceInterchangeFileFormatCopyWithImpl<$Res,
        _$_ResourceInterchangeFileFormat>
    implements _$$_ResourceInterchangeFileFormatCopyWith<$Res> {
  __$$_ResourceInterchangeFileFormatCopyWithImpl(
      _$_ResourceInterchangeFileFormat _value,
      $Res Function(_$_ResourceInterchangeFileFormat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? colors = null,
  }) {
    return _then(_$_ResourceInterchangeFileFormat(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ResourceInterchangeFileFormatColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResourceInterchangeFileFormat
    implements _ResourceInterchangeFileFormat {
  const _$_ResourceInterchangeFileFormat(
      {required this.version,
      required final List<ResourceInterchangeFileFormatColor> colors})
      : _colors = colors;

  factory _$_ResourceInterchangeFileFormat.fromJson(
          Map<String, dynamic> json) =>
      _$$_ResourceInterchangeFileFormatFromJson(json);

  @override
  final int version;
  final List<ResourceInterchangeFileFormatColor> _colors;
  @override
  List<ResourceInterchangeFileFormatColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'ResourceInterchangeFileFormat(version: $version, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResourceInterchangeFileFormat &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResourceInterchangeFileFormatCopyWith<_$_ResourceInterchangeFileFormat>
      get copyWith => __$$_ResourceInterchangeFileFormatCopyWithImpl<
          _$_ResourceInterchangeFileFormat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResourceInterchangeFileFormatToJson(
      this,
    );
  }
}

abstract class _ResourceInterchangeFileFormat
    implements ResourceInterchangeFileFormat {
  const factory _ResourceInterchangeFileFormat(
          {required final int version,
          required final List<ResourceInterchangeFileFormatColor> colors}) =
      _$_ResourceInterchangeFileFormat;

  factory _ResourceInterchangeFileFormat.fromJson(Map<String, dynamic> json) =
      _$_ResourceInterchangeFileFormat.fromJson;

  @override
  int get version;
  @override
  List<ResourceInterchangeFileFormatColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_ResourceInterchangeFileFormatCopyWith<_$_ResourceInterchangeFileFormat>
      get copyWith => throw _privateConstructorUsedError;
}
