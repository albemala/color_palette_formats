// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jasc-pal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JascPaletteColor _$JascPaletteColorFromJson(Map<String, dynamic> json) {
  return _JascPaletteColor.fromJson(json);
}

/// @nodoc
mixin _$JascPaletteColor {
  /// Value: [0..255]
  int get red => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get blue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JascPaletteColorCopyWith<JascPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JascPaletteColorCopyWith<$Res> {
  factory $JascPaletteColorCopyWith(
          JascPaletteColor value, $Res Function(JascPaletteColor) then) =
      _$JascPaletteColorCopyWithImpl<$Res, JascPaletteColor>;
  @useResult
  $Res call({int red, int green, int blue});
}

/// @nodoc
class _$JascPaletteColorCopyWithImpl<$Res, $Val extends JascPaletteColor>
    implements $JascPaletteColorCopyWith<$Res> {
  _$JascPaletteColorCopyWithImpl(this._value, this._then);

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
abstract class _$$_JascPaletteColorCopyWith<$Res>
    implements $JascPaletteColorCopyWith<$Res> {
  factory _$$_JascPaletteColorCopyWith(
          _$_JascPaletteColor value, $Res Function(_$_JascPaletteColor) then) =
      __$$_JascPaletteColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int red, int green, int blue});
}

/// @nodoc
class __$$_JascPaletteColorCopyWithImpl<$Res>
    extends _$JascPaletteColorCopyWithImpl<$Res, _$_JascPaletteColor>
    implements _$$_JascPaletteColorCopyWith<$Res> {
  __$$_JascPaletteColorCopyWithImpl(
      _$_JascPaletteColor _value, $Res Function(_$_JascPaletteColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? blue = null,
  }) {
    return _then(_$_JascPaletteColor(
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
class _$_JascPaletteColor implements _JascPaletteColor {
  const _$_JascPaletteColor(
      {required this.red, required this.green, required this.blue});

  factory _$_JascPaletteColor.fromJson(Map<String, dynamic> json) =>
      _$$_JascPaletteColorFromJson(json);

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
    return 'JascPaletteColor(red: $red, green: $green, blue: $blue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JascPaletteColor &&
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
  _$$_JascPaletteColorCopyWith<_$_JascPaletteColor> get copyWith =>
      __$$_JascPaletteColorCopyWithImpl<_$_JascPaletteColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JascPaletteColorToJson(
      this,
    );
  }
}

abstract class _JascPaletteColor implements JascPaletteColor {
  const factory _JascPaletteColor(
      {required final int red,
      required final int green,
      required final int blue}) = _$_JascPaletteColor;

  factory _JascPaletteColor.fromJson(Map<String, dynamic> json) =
      _$_JascPaletteColor.fromJson;

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
  _$$_JascPaletteColorCopyWith<_$_JascPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

JascPalette _$JascPaletteFromJson(Map<String, dynamic> json) {
  return _JascPalette.fromJson(json);
}

/// @nodoc
mixin _$JascPalette {
  String get version => throw _privateConstructorUsedError;
  List<JascPaletteColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JascPaletteCopyWith<JascPalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JascPaletteCopyWith<$Res> {
  factory $JascPaletteCopyWith(
          JascPalette value, $Res Function(JascPalette) then) =
      _$JascPaletteCopyWithImpl<$Res, JascPalette>;
  @useResult
  $Res call({String version, List<JascPaletteColor> colors});
}

/// @nodoc
class _$JascPaletteCopyWithImpl<$Res, $Val extends JascPalette>
    implements $JascPaletteCopyWith<$Res> {
  _$JascPaletteCopyWithImpl(this._value, this._then);

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
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<JascPaletteColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JascPaletteCopyWith<$Res>
    implements $JascPaletteCopyWith<$Res> {
  factory _$$_JascPaletteCopyWith(
          _$_JascPalette value, $Res Function(_$_JascPalette) then) =
      __$$_JascPaletteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, List<JascPaletteColor> colors});
}

/// @nodoc
class __$$_JascPaletteCopyWithImpl<$Res>
    extends _$JascPaletteCopyWithImpl<$Res, _$_JascPalette>
    implements _$$_JascPaletteCopyWith<$Res> {
  __$$_JascPaletteCopyWithImpl(
      _$_JascPalette _value, $Res Function(_$_JascPalette) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? colors = null,
  }) {
    return _then(_$_JascPalette(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<JascPaletteColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JascPalette implements _JascPalette {
  const _$_JascPalette(
      {required this.version, required final List<JascPaletteColor> colors})
      : _colors = colors;

  factory _$_JascPalette.fromJson(Map<String, dynamic> json) =>
      _$$_JascPaletteFromJson(json);

  @override
  final String version;
  final List<JascPaletteColor> _colors;
  @override
  List<JascPaletteColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'JascPalette(version: $version, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JascPalette &&
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
  _$$_JascPaletteCopyWith<_$_JascPalette> get copyWith =>
      __$$_JascPaletteCopyWithImpl<_$_JascPalette>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JascPaletteToJson(
      this,
    );
  }
}

abstract class _JascPalette implements JascPalette {
  const factory _JascPalette(
      {required final String version,
      required final List<JascPaletteColor> colors}) = _$_JascPalette;

  factory _JascPalette.fromJson(Map<String, dynamic> json) =
      _$_JascPalette.fromJson;

  @override
  String get version;
  @override
  List<JascPaletteColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_JascPaletteCopyWith<_$_JascPalette> get copyWith =>
      throw _privateConstructorUsedError;
}
