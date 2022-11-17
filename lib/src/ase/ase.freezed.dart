// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdobeSwatchExchangeColor _$AdobeSwatchExchangeColorFromJson(
    Map<String, dynamic> json) {
  return _AdobeSwatchExchangeColor.fromJson(json);
}

/// @nodoc
mixin _$AdobeSwatchExchangeColor {
  String get name => throw _privateConstructorUsedError;
  AdobeSwatchExchangeColorModel get model => throw _privateConstructorUsedError;

  /// Color values are in the range [0..1]
  List<double> get values => throw _privateConstructorUsedError;
  AdobeSwatchExchangeColorType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeSwatchExchangeColorCopyWith<AdobeSwatchExchangeColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeSwatchExchangeColorCopyWith<$Res> {
  factory $AdobeSwatchExchangeColorCopyWith(AdobeSwatchExchangeColor value,
          $Res Function(AdobeSwatchExchangeColor) then) =
      _$AdobeSwatchExchangeColorCopyWithImpl<$Res, AdobeSwatchExchangeColor>;
  @useResult
  $Res call(
      {String name,
      AdobeSwatchExchangeColorModel model,
      List<double> values,
      AdobeSwatchExchangeColorType type});
}

/// @nodoc
class _$AdobeSwatchExchangeColorCopyWithImpl<$Res,
        $Val extends AdobeSwatchExchangeColor>
    implements $AdobeSwatchExchangeColorCopyWith<$Res> {
  _$AdobeSwatchExchangeColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? values = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AdobeSwatchExchangeColorModel,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdobeSwatchExchangeColorType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeSwatchExchangeColorCopyWith<$Res>
    implements $AdobeSwatchExchangeColorCopyWith<$Res> {
  factory _$$_AdobeSwatchExchangeColorCopyWith(
          _$_AdobeSwatchExchangeColor value,
          $Res Function(_$_AdobeSwatchExchangeColor) then) =
      __$$_AdobeSwatchExchangeColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      AdobeSwatchExchangeColorModel model,
      List<double> values,
      AdobeSwatchExchangeColorType type});
}

/// @nodoc
class __$$_AdobeSwatchExchangeColorCopyWithImpl<$Res>
    extends _$AdobeSwatchExchangeColorCopyWithImpl<$Res,
        _$_AdobeSwatchExchangeColor>
    implements _$$_AdobeSwatchExchangeColorCopyWith<$Res> {
  __$$_AdobeSwatchExchangeColorCopyWithImpl(_$_AdobeSwatchExchangeColor _value,
      $Res Function(_$_AdobeSwatchExchangeColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? values = null,
    Object? type = null,
  }) {
    return _then(_$_AdobeSwatchExchangeColor(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AdobeSwatchExchangeColorModel,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdobeSwatchExchangeColorType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeSwatchExchangeColor implements _AdobeSwatchExchangeColor {
  const _$_AdobeSwatchExchangeColor(
      {this.name = '',
      required this.model,
      required final List<double> values,
      this.type = AdobeSwatchExchangeColorType.global})
      : _values = values;

  factory _$_AdobeSwatchExchangeColor.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeSwatchExchangeColorFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final AdobeSwatchExchangeColorModel model;

  /// Color values are in the range [0..1]
  final List<double> _values;

  /// Color values are in the range [0..1]
  @override
  List<double> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  @JsonKey()
  final AdobeSwatchExchangeColorType type;

  @override
  String toString() {
    return 'AdobeSwatchExchangeColor(name: $name, model: $model, values: $values, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeSwatchExchangeColor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, model,
      const DeepCollectionEquality().hash(_values), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdobeSwatchExchangeColorCopyWith<_$_AdobeSwatchExchangeColor>
      get copyWith => __$$_AdobeSwatchExchangeColorCopyWithImpl<
          _$_AdobeSwatchExchangeColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeSwatchExchangeColorToJson(
      this,
    );
  }
}

abstract class _AdobeSwatchExchangeColor implements AdobeSwatchExchangeColor {
  const factory _AdobeSwatchExchangeColor(
      {final String name,
      required final AdobeSwatchExchangeColorModel model,
      required final List<double> values,
      final AdobeSwatchExchangeColorType type}) = _$_AdobeSwatchExchangeColor;

  factory _AdobeSwatchExchangeColor.fromJson(Map<String, dynamic> json) =
      _$_AdobeSwatchExchangeColor.fromJson;

  @override
  String get name;
  @override
  AdobeSwatchExchangeColorModel get model;
  @override

  /// Color values are in the range [0..1]
  List<double> get values;
  @override
  AdobeSwatchExchangeColorType get type;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeSwatchExchangeColorCopyWith<_$_AdobeSwatchExchangeColor>
      get copyWith => throw _privateConstructorUsedError;
}

AdobeSwatchExchange _$AdobeSwatchExchangeFromJson(Map<String, dynamic> json) {
  return _AdobeSwatchExchange.fromJson(json);
}

/// @nodoc
mixin _$AdobeSwatchExchange {
  String get version => throw _privateConstructorUsedError;
  List<dynamic> get groups => throw _privateConstructorUsedError;
  List<AdobeSwatchExchangeColor> get colors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeSwatchExchangeCopyWith<AdobeSwatchExchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeSwatchExchangeCopyWith<$Res> {
  factory $AdobeSwatchExchangeCopyWith(
          AdobeSwatchExchange value, $Res Function(AdobeSwatchExchange) then) =
      _$AdobeSwatchExchangeCopyWithImpl<$Res, AdobeSwatchExchange>;
  @useResult
  $Res call(
      {String version,
      List<dynamic> groups,
      List<AdobeSwatchExchangeColor> colors});
}

/// @nodoc
class _$AdobeSwatchExchangeCopyWithImpl<$Res, $Val extends AdobeSwatchExchange>
    implements $AdobeSwatchExchangeCopyWith<$Res> {
  _$AdobeSwatchExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? groups = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeSwatchExchangeColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeSwatchExchangeCopyWith<$Res>
    implements $AdobeSwatchExchangeCopyWith<$Res> {
  factory _$$_AdobeSwatchExchangeCopyWith(_$_AdobeSwatchExchange value,
          $Res Function(_$_AdobeSwatchExchange) then) =
      __$$_AdobeSwatchExchangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      List<dynamic> groups,
      List<AdobeSwatchExchangeColor> colors});
}

/// @nodoc
class __$$_AdobeSwatchExchangeCopyWithImpl<$Res>
    extends _$AdobeSwatchExchangeCopyWithImpl<$Res, _$_AdobeSwatchExchange>
    implements _$$_AdobeSwatchExchangeCopyWith<$Res> {
  __$$_AdobeSwatchExchangeCopyWithImpl(_$_AdobeSwatchExchange _value,
      $Res Function(_$_AdobeSwatchExchange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? groups = null,
    Object? colors = null,
  }) {
    return _then(_$_AdobeSwatchExchange(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeSwatchExchangeColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeSwatchExchange implements _AdobeSwatchExchange {
  const _$_AdobeSwatchExchange(
      {required this.version,
      final List<dynamic> groups = const [],
      required final List<AdobeSwatchExchangeColor> colors})
      : _groups = groups,
        _colors = colors;

  factory _$_AdobeSwatchExchange.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeSwatchExchangeFromJson(json);

  @override
  final String version;
  final List<dynamic> _groups;
  @override
  @JsonKey()
  List<dynamic> get groups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<AdobeSwatchExchangeColor> _colors;
  @override
  List<AdobeSwatchExchangeColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'AdobeSwatchExchange(version: $version, groups: $groups, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeSwatchExchange &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      version,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdobeSwatchExchangeCopyWith<_$_AdobeSwatchExchange> get copyWith =>
      __$$_AdobeSwatchExchangeCopyWithImpl<_$_AdobeSwatchExchange>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeSwatchExchangeToJson(
      this,
    );
  }
}

abstract class _AdobeSwatchExchange implements AdobeSwatchExchange {
  const factory _AdobeSwatchExchange(
          {required final String version,
          final List<dynamic> groups,
          required final List<AdobeSwatchExchangeColor> colors}) =
      _$_AdobeSwatchExchange;

  factory _AdobeSwatchExchange.fromJson(Map<String, dynamic> json) =
      _$_AdobeSwatchExchange.fromJson;

  @override
  String get version;
  @override
  List<dynamic> get groups;
  @override
  List<AdobeSwatchExchangeColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeSwatchExchangeCopyWith<_$_AdobeSwatchExchange> get copyWith =>
      throw _privateConstructorUsedError;
}
