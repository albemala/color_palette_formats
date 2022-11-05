// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paint-dot-net.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaintDotNetPaletteColor _$PaintDotNetPaletteColorFromJson(
    Map<String, dynamic> json) {
  return _PaintDotNetPaletteColor.fromJson(json);
}

/// @nodoc
mixin _$PaintDotNetPaletteColor {
  /// Value: [0..255]
  int get red => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get blue => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get alpha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaintDotNetPaletteColorCopyWith<PaintDotNetPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintDotNetPaletteColorCopyWith<$Res> {
  factory $PaintDotNetPaletteColorCopyWith(PaintDotNetPaletteColor value,
          $Res Function(PaintDotNetPaletteColor) then) =
      _$PaintDotNetPaletteColorCopyWithImpl<$Res, PaintDotNetPaletteColor>;
  @useResult
  $Res call({int red, int green, int blue, int alpha});
}

/// @nodoc
class _$PaintDotNetPaletteColorCopyWithImpl<$Res,
        $Val extends PaintDotNetPaletteColor>
    implements $PaintDotNetPaletteColorCopyWith<$Res> {
  _$PaintDotNetPaletteColorCopyWithImpl(this._value, this._then);

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
              as int,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaintDotNetPaletteColorCopyWith<$Res>
    implements $PaintDotNetPaletteColorCopyWith<$Res> {
  factory _$$_PaintDotNetPaletteColorCopyWith(_$_PaintDotNetPaletteColor value,
          $Res Function(_$_PaintDotNetPaletteColor) then) =
      __$$_PaintDotNetPaletteColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int red, int green, int blue, int alpha});
}

/// @nodoc
class __$$_PaintDotNetPaletteColorCopyWithImpl<$Res>
    extends _$PaintDotNetPaletteColorCopyWithImpl<$Res,
        _$_PaintDotNetPaletteColor>
    implements _$$_PaintDotNetPaletteColorCopyWith<$Res> {
  __$$_PaintDotNetPaletteColorCopyWithImpl(_$_PaintDotNetPaletteColor _value,
      $Res Function(_$_PaintDotNetPaletteColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? blue = null,
    Object? alpha = null,
  }) {
    return _then(_$_PaintDotNetPaletteColor(
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
      alpha: null == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaintDotNetPaletteColor implements _PaintDotNetPaletteColor {
  const _$_PaintDotNetPaletteColor(
      {required this.red,
      required this.green,
      required this.blue,
      required this.alpha});

  factory _$_PaintDotNetPaletteColor.fromJson(Map<String, dynamic> json) =>
      _$$_PaintDotNetPaletteColorFromJson(json);

  /// Value: [0..255]
  @override
  final int red;

  /// Value: [0..255]
  @override
  final int green;

  /// Value: [0..255]
  @override
  final int blue;

  /// Value: [0..255]
  @override
  final int alpha;

  @override
  String toString() {
    return 'PaintDotNetPaletteColor(red: $red, green: $green, blue: $blue, alpha: $alpha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaintDotNetPaletteColor &&
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
  _$$_PaintDotNetPaletteColorCopyWith<_$_PaintDotNetPaletteColor>
      get copyWith =>
          __$$_PaintDotNetPaletteColorCopyWithImpl<_$_PaintDotNetPaletteColor>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaintDotNetPaletteColorToJson(
      this,
    );
  }
}

abstract class _PaintDotNetPaletteColor implements PaintDotNetPaletteColor {
  const factory _PaintDotNetPaletteColor(
      {required final int red,
      required final int green,
      required final int blue,
      required final int alpha}) = _$_PaintDotNetPaletteColor;

  factory _PaintDotNetPaletteColor.fromJson(Map<String, dynamic> json) =
      _$_PaintDotNetPaletteColor.fromJson;

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

  /// Value: [0..255]
  int get alpha;
  @override
  @JsonKey(ignore: true)
  _$$_PaintDotNetPaletteColorCopyWith<_$_PaintDotNetPaletteColor>
      get copyWith => throw _privateConstructorUsedError;
}

PaintDotNetPalette _$PaintDotNetPaletteFromJson(Map<String, dynamic> json) {
  return _PaintDotNetPalette.fromJson(json);
}

/// @nodoc
mixin _$PaintDotNetPalette {
  List<PaintDotNetPaletteColor> get colors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaintDotNetPaletteCopyWith<PaintDotNetPalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintDotNetPaletteCopyWith<$Res> {
  factory $PaintDotNetPaletteCopyWith(
          PaintDotNetPalette value, $Res Function(PaintDotNetPalette) then) =
      _$PaintDotNetPaletteCopyWithImpl<$Res, PaintDotNetPalette>;
  @useResult
  $Res call({List<PaintDotNetPaletteColor> colors});
}

/// @nodoc
class _$PaintDotNetPaletteCopyWithImpl<$Res, $Val extends PaintDotNetPalette>
    implements $PaintDotNetPaletteCopyWith<$Res> {
  _$PaintDotNetPaletteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<PaintDotNetPaletteColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaintDotNetPaletteCopyWith<$Res>
    implements $PaintDotNetPaletteCopyWith<$Res> {
  factory _$$_PaintDotNetPaletteCopyWith(_$_PaintDotNetPalette value,
          $Res Function(_$_PaintDotNetPalette) then) =
      __$$_PaintDotNetPaletteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaintDotNetPaletteColor> colors});
}

/// @nodoc
class __$$_PaintDotNetPaletteCopyWithImpl<$Res>
    extends _$PaintDotNetPaletteCopyWithImpl<$Res, _$_PaintDotNetPalette>
    implements _$$_PaintDotNetPaletteCopyWith<$Res> {
  __$$_PaintDotNetPaletteCopyWithImpl(
      _$_PaintDotNetPalette _value, $Res Function(_$_PaintDotNetPalette) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
  }) {
    return _then(_$_PaintDotNetPalette(
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<PaintDotNetPaletteColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaintDotNetPalette implements _PaintDotNetPalette {
  const _$_PaintDotNetPalette(
      {required final List<PaintDotNetPaletteColor> colors})
      : _colors = colors;

  factory _$_PaintDotNetPalette.fromJson(Map<String, dynamic> json) =>
      _$$_PaintDotNetPaletteFromJson(json);

  final List<PaintDotNetPaletteColor> _colors;
  @override
  List<PaintDotNetPaletteColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'PaintDotNetPalette(colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaintDotNetPalette &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaintDotNetPaletteCopyWith<_$_PaintDotNetPalette> get copyWith =>
      __$$_PaintDotNetPaletteCopyWithImpl<_$_PaintDotNetPalette>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaintDotNetPaletteToJson(
      this,
    );
  }
}

abstract class _PaintDotNetPalette implements PaintDotNetPalette {
  const factory _PaintDotNetPalette(
          {required final List<PaintDotNetPaletteColor> colors}) =
      _$_PaintDotNetPalette;

  factory _PaintDotNetPalette.fromJson(Map<String, dynamic> json) =
      _$_PaintDotNetPalette.fromJson;

  @override
  List<PaintDotNetPaletteColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_PaintDotNetPaletteCopyWith<_$_PaintDotNetPalette> get copyWith =>
      throw _privateConstructorUsedError;
}
