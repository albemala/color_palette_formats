// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'procreate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcreateSwatchesSwatch _$ProcreateSwatchesSwatchFromJson(
    Map<String, dynamic> json) {
  return _ProcreateSwatchesSwatch.fromJson(json);
}

/// @nodoc
mixin _$ProcreateSwatchesSwatch {
  /// Value: [0..1]
  double get hue => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get saturation => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get brightness => throw _privateConstructorUsedError;

  /// Value: [0..1]
  double get alpha => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
  ProcreateSwatchesColorSpace get colorSpace =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcreateSwatchesSwatchCopyWith<ProcreateSwatchesSwatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcreateSwatchesSwatchCopyWith<$Res> {
  factory $ProcreateSwatchesSwatchCopyWith(ProcreateSwatchesSwatch value,
          $Res Function(ProcreateSwatchesSwatch) then) =
      _$ProcreateSwatchesSwatchCopyWithImpl<$Res>;
  $Res call(
      {double hue,
      double saturation,
      double brightness,
      double alpha,
      @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
          ProcreateSwatchesColorSpace colorSpace});
}

/// @nodoc
class _$ProcreateSwatchesSwatchCopyWithImpl<$Res>
    implements $ProcreateSwatchesSwatchCopyWith<$Res> {
  _$ProcreateSwatchesSwatchCopyWithImpl(this._value, this._then);

  final ProcreateSwatchesSwatch _value;
  // ignore: unused_field
  final $Res Function(ProcreateSwatchesSwatch) _then;

  @override
  $Res call({
    Object? hue = freezed,
    Object? saturation = freezed,
    Object? brightness = freezed,
    Object? alpha = freezed,
    Object? colorSpace = freezed,
  }) {
    return _then(_value.copyWith(
      hue: hue == freezed
          ? _value.hue
          : hue // ignore: cast_nullable_to_non_nullable
              as double,
      saturation: saturation == freezed
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double,
      alpha: alpha == freezed
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as double,
      colorSpace: colorSpace == freezed
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as ProcreateSwatchesColorSpace,
    ));
  }
}

/// @nodoc
abstract class _$$_ProcreateSwatchesSwatchCopyWith<$Res>
    implements $ProcreateSwatchesSwatchCopyWith<$Res> {
  factory _$$_ProcreateSwatchesSwatchCopyWith(_$_ProcreateSwatchesSwatch value,
          $Res Function(_$_ProcreateSwatchesSwatch) then) =
      __$$_ProcreateSwatchesSwatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {double hue,
      double saturation,
      double brightness,
      double alpha,
      @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
          ProcreateSwatchesColorSpace colorSpace});
}

/// @nodoc
class __$$_ProcreateSwatchesSwatchCopyWithImpl<$Res>
    extends _$ProcreateSwatchesSwatchCopyWithImpl<$Res>
    implements _$$_ProcreateSwatchesSwatchCopyWith<$Res> {
  __$$_ProcreateSwatchesSwatchCopyWithImpl(_$_ProcreateSwatchesSwatch _value,
      $Res Function(_$_ProcreateSwatchesSwatch) _then)
      : super(_value, (v) => _then(v as _$_ProcreateSwatchesSwatch));

  @override
  _$_ProcreateSwatchesSwatch get _value =>
      super._value as _$_ProcreateSwatchesSwatch;

  @override
  $Res call({
    Object? hue = freezed,
    Object? saturation = freezed,
    Object? brightness = freezed,
    Object? alpha = freezed,
    Object? colorSpace = freezed,
  }) {
    return _then(_$_ProcreateSwatchesSwatch(
      hue: hue == freezed
          ? _value.hue
          : hue // ignore: cast_nullable_to_non_nullable
              as double,
      saturation: saturation == freezed
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double,
      alpha: alpha == freezed
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as double,
      colorSpace: colorSpace == freezed
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as ProcreateSwatchesColorSpace,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcreateSwatchesSwatch implements _ProcreateSwatchesSwatch {
  const _$_ProcreateSwatchesSwatch(
      {required this.hue,
      required this.saturation,
      required this.brightness,
      required this.alpha,
      @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
          required this.colorSpace});

  factory _$_ProcreateSwatchesSwatch.fromJson(Map<String, dynamic> json) =>
      _$$_ProcreateSwatchesSwatchFromJson(json);

  /// Value: [0..1]
  @override
  final double hue;

  /// Value: [0..1]
  @override
  final double saturation;

  /// Value: [0..1]
  @override
  final double brightness;

  /// Value: [0..1]
  @override
  final double alpha;
  @override
  @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
  final ProcreateSwatchesColorSpace colorSpace;

  @override
  String toString() {
    return 'ProcreateSwatchesSwatch(hue: $hue, saturation: $saturation, brightness: $brightness, alpha: $alpha, colorSpace: $colorSpace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcreateSwatchesSwatch &&
            const DeepCollectionEquality().equals(other.hue, hue) &&
            const DeepCollectionEquality()
                .equals(other.saturation, saturation) &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness) &&
            const DeepCollectionEquality().equals(other.alpha, alpha) &&
            const DeepCollectionEquality()
                .equals(other.colorSpace, colorSpace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hue),
      const DeepCollectionEquality().hash(saturation),
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(alpha),
      const DeepCollectionEquality().hash(colorSpace));

  @JsonKey(ignore: true)
  @override
  _$$_ProcreateSwatchesSwatchCopyWith<_$_ProcreateSwatchesSwatch>
      get copyWith =>
          __$$_ProcreateSwatchesSwatchCopyWithImpl<_$_ProcreateSwatchesSwatch>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcreateSwatchesSwatchToJson(
      this,
    );
  }
}

abstract class _ProcreateSwatchesSwatch implements ProcreateSwatchesSwatch {
  const factory _ProcreateSwatchesSwatch(
          {required final double hue,
          required final double saturation,
          required final double brightness,
          required final double alpha,
          @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
              required final ProcreateSwatchesColorSpace colorSpace}) =
      _$_ProcreateSwatchesSwatch;

  factory _ProcreateSwatchesSwatch.fromJson(Map<String, dynamic> json) =
      _$_ProcreateSwatchesSwatch.fromJson;

  @override

  /// Value: [0..1]
  double get hue;
  @override

  /// Value: [0..1]
  double get saturation;
  @override

  /// Value: [0..1]
  double get brightness;
  @override

  /// Value: [0..1]
  double get alpha;
  @override
  @JsonKey(fromJson: _toColorSpace, toJson: _fromColorSpace)
  ProcreateSwatchesColorSpace get colorSpace;
  @override
  @JsonKey(ignore: true)
  _$$_ProcreateSwatchesSwatchCopyWith<_$_ProcreateSwatchesSwatch>
      get copyWith => throw _privateConstructorUsedError;
}

ProcreateSwatches _$ProcreateSwatchesFromJson(Map<String, dynamic> json) {
  return _ProcreateSwatches.fromJson(json);
}

/// @nodoc
mixin _$ProcreateSwatches {
  String get name => throw _privateConstructorUsedError;
  List<ProcreateSwatchesSwatch> get swatches =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcreateSwatchesCopyWith<ProcreateSwatches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcreateSwatchesCopyWith<$Res> {
  factory $ProcreateSwatchesCopyWith(
          ProcreateSwatches value, $Res Function(ProcreateSwatches) then) =
      _$ProcreateSwatchesCopyWithImpl<$Res>;
  $Res call({String name, List<ProcreateSwatchesSwatch> swatches});
}

/// @nodoc
class _$ProcreateSwatchesCopyWithImpl<$Res>
    implements $ProcreateSwatchesCopyWith<$Res> {
  _$ProcreateSwatchesCopyWithImpl(this._value, this._then);

  final ProcreateSwatches _value;
  // ignore: unused_field
  final $Res Function(ProcreateSwatches) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? swatches = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      swatches: swatches == freezed
          ? _value.swatches
          : swatches // ignore: cast_nullable_to_non_nullable
              as List<ProcreateSwatchesSwatch>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProcreateSwatchesCopyWith<$Res>
    implements $ProcreateSwatchesCopyWith<$Res> {
  factory _$$_ProcreateSwatchesCopyWith(_$_ProcreateSwatches value,
          $Res Function(_$_ProcreateSwatches) then) =
      __$$_ProcreateSwatchesCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<ProcreateSwatchesSwatch> swatches});
}

/// @nodoc
class __$$_ProcreateSwatchesCopyWithImpl<$Res>
    extends _$ProcreateSwatchesCopyWithImpl<$Res>
    implements _$$_ProcreateSwatchesCopyWith<$Res> {
  __$$_ProcreateSwatchesCopyWithImpl(
      _$_ProcreateSwatches _value, $Res Function(_$_ProcreateSwatches) _then)
      : super(_value, (v) => _then(v as _$_ProcreateSwatches));

  @override
  _$_ProcreateSwatches get _value => super._value as _$_ProcreateSwatches;

  @override
  $Res call({
    Object? name = freezed,
    Object? swatches = freezed,
  }) {
    return _then(_$_ProcreateSwatches(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      swatches: swatches == freezed
          ? _value._swatches
          : swatches // ignore: cast_nullable_to_non_nullable
              as List<ProcreateSwatchesSwatch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcreateSwatches implements _ProcreateSwatches {
  const _$_ProcreateSwatches(
      {required this.name,
      required final List<ProcreateSwatchesSwatch> swatches})
      : _swatches = swatches;

  factory _$_ProcreateSwatches.fromJson(Map<String, dynamic> json) =>
      _$$_ProcreateSwatchesFromJson(json);

  @override
  final String name;
  final List<ProcreateSwatchesSwatch> _swatches;
  @override
  List<ProcreateSwatchesSwatch> get swatches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_swatches);
  }

  @override
  String toString() {
    return 'ProcreateSwatches(name: $name, swatches: $swatches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcreateSwatches &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._swatches, _swatches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_swatches));

  @JsonKey(ignore: true)
  @override
  _$$_ProcreateSwatchesCopyWith<_$_ProcreateSwatches> get copyWith =>
      __$$_ProcreateSwatchesCopyWithImpl<_$_ProcreateSwatches>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcreateSwatchesToJson(
      this,
    );
  }
}

abstract class _ProcreateSwatches implements ProcreateSwatches {
  const factory _ProcreateSwatches(
          {required final String name,
          required final List<ProcreateSwatchesSwatch> swatches}) =
      _$_ProcreateSwatches;

  factory _ProcreateSwatches.fromJson(Map<String, dynamic> json) =
      _$_ProcreateSwatches.fromJson;

  @override
  String get name;
  @override
  List<ProcreateSwatchesSwatch> get swatches;
  @override
  @JsonKey(ignore: true)
  _$$_ProcreateSwatchesCopyWith<_$_ProcreateSwatches> get copyWith =>
      throw _privateConstructorUsedError;
}