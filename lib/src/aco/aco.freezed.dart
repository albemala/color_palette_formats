// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'aco.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdobeColorSwatchColor _$AdobeColorSwatchColorFromJson(
    Map<String, dynamic> json) {
  return _AdobeColorSwatchColor.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorSwatchColor {
  AdobeColorSwatchColorSpace get colorSpace =>
      throw _privateConstructorUsedError;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - HSB: [0..359, 0..100, 0..100]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  /// - Grayscale: [0..255]
  /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
  List<double> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorSwatchColorCopyWith<AdobeColorSwatchColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorSwatchColorCopyWith<$Res> {
  factory $AdobeColorSwatchColorCopyWith(AdobeColorSwatchColor value,
          $Res Function(AdobeColorSwatchColor) then) =
      _$AdobeColorSwatchColorCopyWithImpl<$Res, AdobeColorSwatchColor>;
  @useResult
  $Res call({AdobeColorSwatchColorSpace colorSpace, List<double> values});
}

/// @nodoc
class _$AdobeColorSwatchColorCopyWithImpl<$Res,
        $Val extends AdobeColorSwatchColor>
    implements $AdobeColorSwatchColorCopyWith<$Res> {
  _$AdobeColorSwatchColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorSpace = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      colorSpace: null == colorSpace
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as AdobeColorSwatchColorSpace,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeColorSwatchColorCopyWith<$Res>
    implements $AdobeColorSwatchColorCopyWith<$Res> {
  factory _$$_AdobeColorSwatchColorCopyWith(_$_AdobeColorSwatchColor value,
          $Res Function(_$_AdobeColorSwatchColor) then) =
      __$$_AdobeColorSwatchColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AdobeColorSwatchColorSpace colorSpace, List<double> values});
}

/// @nodoc
class __$$_AdobeColorSwatchColorCopyWithImpl<$Res>
    extends _$AdobeColorSwatchColorCopyWithImpl<$Res, _$_AdobeColorSwatchColor>
    implements _$$_AdobeColorSwatchColorCopyWith<$Res> {
  __$$_AdobeColorSwatchColorCopyWithImpl(_$_AdobeColorSwatchColor _value,
      $Res Function(_$_AdobeColorSwatchColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorSpace = null,
    Object? values = null,
  }) {
    return _then(_$_AdobeColorSwatchColor(
      colorSpace: null == colorSpace
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as AdobeColorSwatchColorSpace,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorSwatchColor implements _AdobeColorSwatchColor {
  const _$_AdobeColorSwatchColor(
      {required this.colorSpace, required final List<double> values})
      : _values = values;

  factory _$_AdobeColorSwatchColor.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorSwatchColorFromJson(json);

  @override
  final AdobeColorSwatchColorSpace colorSpace;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - HSB: [0..359, 0..100, 0..100]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  /// - Grayscale: [0..255]
  /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
  final List<double> _values;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - HSB: [0..359, 0..100, 0..100]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  /// - Grayscale: [0..255]
  /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
  @override
  List<double> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'AdobeColorSwatchColor(colorSpace: $colorSpace, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorSwatchColor &&
            (identical(other.colorSpace, colorSpace) ||
                other.colorSpace == colorSpace) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, colorSpace, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdobeColorSwatchColorCopyWith<_$_AdobeColorSwatchColor> get copyWith =>
      __$$_AdobeColorSwatchColorCopyWithImpl<_$_AdobeColorSwatchColor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorSwatchColorToJson(
      this,
    );
  }
}

abstract class _AdobeColorSwatchColor implements AdobeColorSwatchColor {
  const factory _AdobeColorSwatchColor(
      {required final AdobeColorSwatchColorSpace colorSpace,
      required final List<double> values}) = _$_AdobeColorSwatchColor;

  factory _AdobeColorSwatchColor.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorSwatchColor.fromJson;

  @override
  AdobeColorSwatchColorSpace get colorSpace;
  @override

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - HSB: [0..359, 0..100, 0..100]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  /// - Grayscale: [0..255]
  /// - Wide CMYK: [0..100, 0..100, 0..100, 0..100]
  List<double> get values;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorSwatchColorCopyWith<_$_AdobeColorSwatchColor> get copyWith =>
      throw _privateConstructorUsedError;
}

AdobeColorSwatch _$AdobeColorSwatchFromJson(Map<String, dynamic> json) {
  return _AdobeColorSwatch.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorSwatch {
  int get version => throw _privateConstructorUsedError;
  List<AdobeColorSwatchColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorSwatchCopyWith<AdobeColorSwatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorSwatchCopyWith<$Res> {
  factory $AdobeColorSwatchCopyWith(
          AdobeColorSwatch value, $Res Function(AdobeColorSwatch) then) =
      _$AdobeColorSwatchCopyWithImpl<$Res, AdobeColorSwatch>;
  @useResult
  $Res call({int version, List<AdobeColorSwatchColor> colors});
}

/// @nodoc
class _$AdobeColorSwatchCopyWithImpl<$Res, $Val extends AdobeColorSwatch>
    implements $AdobeColorSwatchCopyWith<$Res> {
  _$AdobeColorSwatchCopyWithImpl(this._value, this._then);

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
              as List<AdobeColorSwatchColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeColorSwatchCopyWith<$Res>
    implements $AdobeColorSwatchCopyWith<$Res> {
  factory _$$_AdobeColorSwatchCopyWith(
          _$_AdobeColorSwatch value, $Res Function(_$_AdobeColorSwatch) then) =
      __$$_AdobeColorSwatchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int version, List<AdobeColorSwatchColor> colors});
}

/// @nodoc
class __$$_AdobeColorSwatchCopyWithImpl<$Res>
    extends _$AdobeColorSwatchCopyWithImpl<$Res, _$_AdobeColorSwatch>
    implements _$$_AdobeColorSwatchCopyWith<$Res> {
  __$$_AdobeColorSwatchCopyWithImpl(
      _$_AdobeColorSwatch _value, $Res Function(_$_AdobeColorSwatch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? colors = null,
  }) {
    return _then(_$_AdobeColorSwatch(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeColorSwatchColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorSwatch implements _AdobeColorSwatch {
  const _$_AdobeColorSwatch(
      {required this.version,
      required final List<AdobeColorSwatchColor> colors})
      : _colors = colors;

  factory _$_AdobeColorSwatch.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorSwatchFromJson(json);

  @override
  final int version;
  final List<AdobeColorSwatchColor> _colors;
  @override
  List<AdobeColorSwatchColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'AdobeColorSwatch(version: $version, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorSwatch &&
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
  _$$_AdobeColorSwatchCopyWith<_$_AdobeColorSwatch> get copyWith =>
      __$$_AdobeColorSwatchCopyWithImpl<_$_AdobeColorSwatch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorSwatchToJson(
      this,
    );
  }
}

abstract class _AdobeColorSwatch implements AdobeColorSwatch {
  const factory _AdobeColorSwatch(
      {required final int version,
      required final List<AdobeColorSwatchColor> colors}) = _$_AdobeColorSwatch;

  factory _AdobeColorSwatch.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorSwatch.fromJson;

  @override
  int get version;
  @override
  List<AdobeColorSwatchColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorSwatchCopyWith<_$_AdobeColorSwatch> get copyWith =>
      throw _privateConstructorUsedError;
}
