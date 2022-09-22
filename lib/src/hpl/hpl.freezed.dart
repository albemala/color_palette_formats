// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hpl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomesitePaletteColor _$HomesitePaletteColorFromJson(Map<String, dynamic> json) {
  return _HomesitePaletteColor.fromJson(json);
}

/// @nodoc
mixin _$HomesitePaletteColor {
  /// Value: [0..255]
  int get red => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get blue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomesitePaletteColorCopyWith<HomesitePaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomesitePaletteColorCopyWith<$Res> {
  factory $HomesitePaletteColorCopyWith(HomesitePaletteColor value,
          $Res Function(HomesitePaletteColor) then) =
      _$HomesitePaletteColorCopyWithImpl<$Res>;
  $Res call({int red, int green, int blue});
}

/// @nodoc
class _$HomesitePaletteColorCopyWithImpl<$Res>
    implements $HomesitePaletteColorCopyWith<$Res> {
  _$HomesitePaletteColorCopyWithImpl(this._value, this._then);

  final HomesitePaletteColor _value;
  // ignore: unused_field
  final $Res Function(HomesitePaletteColor) _then;

  @override
  $Res call({
    Object? red = freezed,
    Object? green = freezed,
    Object? blue = freezed,
  }) {
    return _then(_value.copyWith(
      red: red == freezed
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: green == freezed
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: blue == freezed
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HomesitePaletteColorCopyWith<$Res>
    implements $HomesitePaletteColorCopyWith<$Res> {
  factory _$$_HomesitePaletteColorCopyWith(_$_HomesitePaletteColor value,
          $Res Function(_$_HomesitePaletteColor) then) =
      __$$_HomesitePaletteColorCopyWithImpl<$Res>;
  @override
  $Res call({int red, int green, int blue});
}

/// @nodoc
class __$$_HomesitePaletteColorCopyWithImpl<$Res>
    extends _$HomesitePaletteColorCopyWithImpl<$Res>
    implements _$$_HomesitePaletteColorCopyWith<$Res> {
  __$$_HomesitePaletteColorCopyWithImpl(_$_HomesitePaletteColor _value,
      $Res Function(_$_HomesitePaletteColor) _then)
      : super(_value, (v) => _then(v as _$_HomesitePaletteColor));

  @override
  _$_HomesitePaletteColor get _value => super._value as _$_HomesitePaletteColor;

  @override
  $Res call({
    Object? red = freezed,
    Object? green = freezed,
    Object? blue = freezed,
  }) {
    return _then(_$_HomesitePaletteColor(
      red: red == freezed
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: green == freezed
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: blue == freezed
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomesitePaletteColor implements _HomesitePaletteColor {
  const _$_HomesitePaletteColor(
      {required this.red, required this.green, required this.blue});

  factory _$_HomesitePaletteColor.fromJson(Map<String, dynamic> json) =>
      _$$_HomesitePaletteColorFromJson(json);

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
    return 'HomesitePaletteColor(red: $red, green: $green, blue: $blue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomesitePaletteColor &&
            const DeepCollectionEquality().equals(other.red, red) &&
            const DeepCollectionEquality().equals(other.green, green) &&
            const DeepCollectionEquality().equals(other.blue, blue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(green),
      const DeepCollectionEquality().hash(blue));

  @JsonKey(ignore: true)
  @override
  _$$_HomesitePaletteColorCopyWith<_$_HomesitePaletteColor> get copyWith =>
      __$$_HomesitePaletteColorCopyWithImpl<_$_HomesitePaletteColor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomesitePaletteColorToJson(
      this,
    );
  }
}

abstract class _HomesitePaletteColor implements HomesitePaletteColor {
  const factory _HomesitePaletteColor(
      {required final int red,
      required final int green,
      required final int blue}) = _$_HomesitePaletteColor;

  factory _HomesitePaletteColor.fromJson(Map<String, dynamic> json) =
      _$_HomesitePaletteColor.fromJson;

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
  _$$_HomesitePaletteColorCopyWith<_$_HomesitePaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

HomesitePalette _$HomesitePaletteFromJson(Map<String, dynamic> json) {
  return _HomesitePalette.fromJson(json);
}

/// @nodoc
mixin _$HomesitePalette {
  String get version => throw _privateConstructorUsedError;
  List<HomesitePaletteColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomesitePaletteCopyWith<HomesitePalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomesitePaletteCopyWith<$Res> {
  factory $HomesitePaletteCopyWith(
          HomesitePalette value, $Res Function(HomesitePalette) then) =
      _$HomesitePaletteCopyWithImpl<$Res>;
  $Res call({String version, List<HomesitePaletteColor> colors});
}

/// @nodoc
class _$HomesitePaletteCopyWithImpl<$Res>
    implements $HomesitePaletteCopyWith<$Res> {
  _$HomesitePaletteCopyWithImpl(this._value, this._then);

  final HomesitePalette _value;
  // ignore: unused_field
  final $Res Function(HomesitePalette) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<HomesitePaletteColor>,
    ));
  }
}

/// @nodoc
abstract class _$$_HomesitePaletteCopyWith<$Res>
    implements $HomesitePaletteCopyWith<$Res> {
  factory _$$_HomesitePaletteCopyWith(
          _$_HomesitePalette value, $Res Function(_$_HomesitePalette) then) =
      __$$_HomesitePaletteCopyWithImpl<$Res>;
  @override
  $Res call({String version, List<HomesitePaletteColor> colors});
}

/// @nodoc
class __$$_HomesitePaletteCopyWithImpl<$Res>
    extends _$HomesitePaletteCopyWithImpl<$Res>
    implements _$$_HomesitePaletteCopyWith<$Res> {
  __$$_HomesitePaletteCopyWithImpl(
      _$_HomesitePalette _value, $Res Function(_$_HomesitePalette) _then)
      : super(_value, (v) => _then(v as _$_HomesitePalette));

  @override
  _$_HomesitePalette get _value => super._value as _$_HomesitePalette;

  @override
  $Res call({
    Object? version = freezed,
    Object? colors = freezed,
  }) {
    return _then(_$_HomesitePalette(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<HomesitePaletteColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomesitePalette implements _HomesitePalette {
  const _$_HomesitePalette(
      {required this.version, required final List<HomesitePaletteColor> colors})
      : _colors = colors;

  factory _$_HomesitePalette.fromJson(Map<String, dynamic> json) =>
      _$$_HomesitePaletteFromJson(json);

  @override
  final String version;
  final List<HomesitePaletteColor> _colors;
  @override
  List<HomesitePaletteColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'HomesitePalette(version: $version, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomesitePalette &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  _$$_HomesitePaletteCopyWith<_$_HomesitePalette> get copyWith =>
      __$$_HomesitePaletteCopyWithImpl<_$_HomesitePalette>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomesitePaletteToJson(
      this,
    );
  }
}

abstract class _HomesitePalette implements HomesitePalette {
  const factory _HomesitePalette(
      {required final String version,
      required final List<HomesitePaletteColor> colors}) = _$_HomesitePalette;

  factory _HomesitePalette.fromJson(Map<String, dynamic> json) =
      _$_HomesitePalette.fromJson;

  @override
  String get version;
  @override
  List<HomesitePaletteColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_HomesitePaletteCopyWith<_$_HomesitePalette> get copyWith =>
      throw _privateConstructorUsedError;
}
