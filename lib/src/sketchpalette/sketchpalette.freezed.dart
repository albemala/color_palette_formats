// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sketchpalette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SketchPaletteColor _$SketchPaletteColorFromJson(Map<String, dynamic> json) {
  return _SketchPaletteColor.fromJson(json);
}

/// @nodoc
mixin _$SketchPaletteColor {
  /// Value: [0..1]
  double get red => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get green => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get blue => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get alpha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SketchPaletteColorCopyWith<SketchPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SketchPaletteColorCopyWith<$Res> {
  factory $SketchPaletteColorCopyWith(
          SketchPaletteColor value, $Res Function(SketchPaletteColor) then) =
      _$SketchPaletteColorCopyWithImpl<$Res, SketchPaletteColor>;
  @useResult
  $Res call({double red, double green, double blue, double alpha});
}

/// @nodoc
class _$SketchPaletteColorCopyWithImpl<$Res, $Val extends SketchPaletteColor>
    implements $SketchPaletteColorCopyWith<$Res> {
  _$SketchPaletteColorCopyWithImpl(this._value, this._then);

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
    Object? alpha = null,
  }) {
    return _then(_value.copyWith(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as double,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as double,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as double,
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SketchPaletteColorCopyWith<$Res>
    implements $SketchPaletteColorCopyWith<$Res> {
  factory _$$_SketchPaletteColorCopyWith(_$_SketchPaletteColor value,
          $Res Function(_$_SketchPaletteColor) then) =
      __$$_SketchPaletteColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double red, double green, double blue, double alpha});
}

/// @nodoc
class __$$_SketchPaletteColorCopyWithImpl<$Res>
    extends _$SketchPaletteColorCopyWithImpl<$Res, _$_SketchPaletteColor>
    implements _$$_SketchPaletteColorCopyWith<$Res> {
  __$$_SketchPaletteColorCopyWithImpl(
      _$_SketchPaletteColor _value, $Res Function(_$_SketchPaletteColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? blue = null,
    Object? alpha = null,
  }) {
    return _then(_$_SketchPaletteColor(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as double,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as double,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as double,
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SketchPaletteColor implements _SketchPaletteColor {
  const _$_SketchPaletteColor(
      {required this.red,
      required this.green,
      required this.blue,
      required this.alpha});

  factory _$_SketchPaletteColor.fromJson(Map<String, dynamic> json) =>
      _$$_SketchPaletteColorFromJson(json);

  /// Value: [0..1]
  @override
  final double red;

  /// Value: [0..1]
  @override
  final double green;

  /// Value: [0..1]
  @override
  final double blue;

  /// Value: [0..1]
  @override
  final double alpha;

  @override
  String toString() {
    return 'SketchPaletteColor(red: $red, green: $green, blue: $blue, alpha: $alpha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SketchPaletteColor &&
            (identical(other.red, red) || other.red == red) &&
            (identical(other.green, green) || other.green == green) &&
            (identical(other.blue, blue) || other.blue == blue) &&
            (identical(other.alpha, alpha) || other.alpha == alpha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, red, green, blue, alpha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SketchPaletteColorCopyWith<_$_SketchPaletteColor> get copyWith =>
      __$$_SketchPaletteColorCopyWithImpl<_$_SketchPaletteColor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SketchPaletteColorToJson(
      this,
    );
  }
}

abstract class _SketchPaletteColor implements SketchPaletteColor {
  const factory _SketchPaletteColor(
      {required final double red,
      required final double green,
      required final double blue,
      required final double alpha}) = _$_SketchPaletteColor;

  factory _SketchPaletteColor.fromJson(Map<String, dynamic> json) =
      _$_SketchPaletteColor.fromJson;

  @override

  /// Value: [0..1]
  double get red;
  @override

  /// Value: [0..1]
  double get green;
  @override

  /// Value: [0..1]
  double get blue;
  @override

  /// Value: [0..1]
  double get alpha;
  @override
  @JsonKey(ignore: true)
  _$$_SketchPaletteColorCopyWith<_$_SketchPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

SketchPalette _$SketchPaletteFromJson(Map<String, dynamic> json) {
  return _SketchPalette.fromJson(json);
}

/// @nodoc
mixin _$SketchPalette {
  String get compatibleVersion => throw _privateConstructorUsedError;
  String get pluginVersion => throw _privateConstructorUsedError;
  List<SketchPaletteColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SketchPaletteCopyWith<SketchPalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SketchPaletteCopyWith<$Res> {
  factory $SketchPaletteCopyWith(
          SketchPalette value, $Res Function(SketchPalette) then) =
      _$SketchPaletteCopyWithImpl<$Res, SketchPalette>;
  @useResult
  $Res call(
      {String compatibleVersion,
      String pluginVersion,
      List<SketchPaletteColor> colors});
}

/// @nodoc
class _$SketchPaletteCopyWithImpl<$Res, $Val extends SketchPalette>
    implements $SketchPaletteCopyWith<$Res> {
  _$SketchPaletteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compatibleVersion = null,
    Object? pluginVersion = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      compatibleVersion: null == compatibleVersion
          ? _value.compatibleVersion
          : compatibleVersion // ignore: cast_nullable_to_non_nullable
              as String,
      pluginVersion: null == pluginVersion
          ? _value.pluginVersion
          : pluginVersion // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<SketchPaletteColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SketchPaletteCopyWith<$Res>
    implements $SketchPaletteCopyWith<$Res> {
  factory _$$_SketchPaletteCopyWith(
          _$_SketchPalette value, $Res Function(_$_SketchPalette) then) =
      __$$_SketchPaletteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String compatibleVersion,
      String pluginVersion,
      List<SketchPaletteColor> colors});
}

/// @nodoc
class __$$_SketchPaletteCopyWithImpl<$Res>
    extends _$SketchPaletteCopyWithImpl<$Res, _$_SketchPalette>
    implements _$$_SketchPaletteCopyWith<$Res> {
  __$$_SketchPaletteCopyWithImpl(
      _$_SketchPalette _value, $Res Function(_$_SketchPalette) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compatibleVersion = null,
    Object? pluginVersion = null,
    Object? colors = null,
  }) {
    return _then(_$_SketchPalette(
      compatibleVersion: null == compatibleVersion
          ? _value.compatibleVersion
          : compatibleVersion // ignore: cast_nullable_to_non_nullable
              as String,
      pluginVersion: null == pluginVersion
          ? _value.pluginVersion
          : pluginVersion // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<SketchPaletteColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SketchPalette implements _SketchPalette {
  const _$_SketchPalette(
      {required this.compatibleVersion,
      required this.pluginVersion,
      required final List<SketchPaletteColor> colors})
      : _colors = colors;

  factory _$_SketchPalette.fromJson(Map<String, dynamic> json) =>
      _$$_SketchPaletteFromJson(json);

  @override
  final String compatibleVersion;
  @override
  final String pluginVersion;
  final List<SketchPaletteColor> _colors;
  @override
  List<SketchPaletteColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'SketchPalette(compatibleVersion: $compatibleVersion, pluginVersion: $pluginVersion, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SketchPalette &&
            (identical(other.compatibleVersion, compatibleVersion) ||
                other.compatibleVersion == compatibleVersion) &&
            (identical(other.pluginVersion, pluginVersion) ||
                other.pluginVersion == pluginVersion) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, compatibleVersion, pluginVersion,
      const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SketchPaletteCopyWith<_$_SketchPalette> get copyWith =>
      __$$_SketchPaletteCopyWithImpl<_$_SketchPalette>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SketchPaletteToJson(
      this,
    );
  }
}

abstract class _SketchPalette implements SketchPalette {
  const factory _SketchPalette(
      {required final String compatibleVersion,
      required final String pluginVersion,
      required final List<SketchPaletteColor> colors}) = _$_SketchPalette;

  factory _SketchPalette.fromJson(Map<String, dynamic> json) =
      _$_SketchPalette.fromJson;

  @override
  String get compatibleVersion;
  @override
  String get pluginVersion;
  @override
  List<SketchPaletteColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_SketchPaletteCopyWith<_$_SketchPalette> get copyWith =>
      throw _privateConstructorUsedError;
}
