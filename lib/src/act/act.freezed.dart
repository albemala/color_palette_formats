// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'act.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdobeColorTableColor _$AdobeColorTableColorFromJson(Map<String, dynamic> json) {
  return _AdobeColorTableColor.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorTableColor {
  /// Value [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value [0..255]
  int get blue => throw _privateConstructorUsedError;

  /// Value [0..255]
  int get red => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorTableColorCopyWith<AdobeColorTableColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorTableColorCopyWith<$Res> {
  factory $AdobeColorTableColorCopyWith(AdobeColorTableColor value,
          $Res Function(AdobeColorTableColor) then) =
      _$AdobeColorTableColorCopyWithImpl<$Res, AdobeColorTableColor>;
  @useResult
  $Res call({int green, int blue, int red});
}

/// @nodoc
class _$AdobeColorTableColorCopyWithImpl<$Res,
        $Val extends AdobeColorTableColor>
    implements $AdobeColorTableColorCopyWith<$Res> {
  _$AdobeColorTableColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? green = null,
    Object? blue = null,
    Object? red = null,
  }) {
    return _then(_value.copyWith(
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeColorTableColorCopyWith<$Res>
    implements $AdobeColorTableColorCopyWith<$Res> {
  factory _$$_AdobeColorTableColorCopyWith(_$_AdobeColorTableColor value,
          $Res Function(_$_AdobeColorTableColor) then) =
      __$$_AdobeColorTableColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int green, int blue, int red});
}

/// @nodoc
class __$$_AdobeColorTableColorCopyWithImpl<$Res>
    extends _$AdobeColorTableColorCopyWithImpl<$Res, _$_AdobeColorTableColor>
    implements _$$_AdobeColorTableColorCopyWith<$Res> {
  __$$_AdobeColorTableColorCopyWithImpl(_$_AdobeColorTableColor _value,
      $Res Function(_$_AdobeColorTableColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? green = null,
    Object? blue = null,
    Object? red = null,
  }) {
    return _then(_$_AdobeColorTableColor(
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as int,
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorTableColor implements _AdobeColorTableColor {
  const _$_AdobeColorTableColor(
      {required this.green, required this.blue, required this.red});

  factory _$_AdobeColorTableColor.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorTableColorFromJson(json);

  /// Value [0..255]
  @override
  final int green;

  /// Value [0..255]
  @override
  final int blue;

  /// Value [0..255]
  @override
  final int red;

  @override
  String toString() {
    return 'AdobeColorTableColor(green: $green, blue: $blue, red: $red)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorTableColor &&
            (identical(other.green, green) || other.green == green) &&
            (identical(other.blue, blue) || other.blue == blue) &&
            (identical(other.red, red) || other.red == red));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, green, blue, red);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdobeColorTableColorCopyWith<_$_AdobeColorTableColor> get copyWith =>
      __$$_AdobeColorTableColorCopyWithImpl<_$_AdobeColorTableColor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorTableColorToJson(
      this,
    );
  }
}

abstract class _AdobeColorTableColor implements AdobeColorTableColor {
  const factory _AdobeColorTableColor(
      {required final int green,
      required final int blue,
      required final int red}) = _$_AdobeColorTableColor;

  factory _AdobeColorTableColor.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorTableColor.fromJson;

  @override

  /// Value [0..255]
  int get green;
  @override

  /// Value [0..255]
  int get blue;
  @override

  /// Value [0..255]
  int get red;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorTableColorCopyWith<_$_AdobeColorTableColor> get copyWith =>
      throw _privateConstructorUsedError;
}

AdobeColorTable _$AdobeColorTableFromJson(Map<String, dynamic> json) {
  return _AdobeColorTable.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorTable {
  List<AdobeColorTableColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorTableCopyWith<AdobeColorTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorTableCopyWith<$Res> {
  factory $AdobeColorTableCopyWith(
          AdobeColorTable value, $Res Function(AdobeColorTable) then) =
      _$AdobeColorTableCopyWithImpl<$Res, AdobeColorTable>;
  @useResult
  $Res call({List<AdobeColorTableColor> colors});
}

/// @nodoc
class _$AdobeColorTableCopyWithImpl<$Res, $Val extends AdobeColorTable>
    implements $AdobeColorTableCopyWith<$Res> {
  _$AdobeColorTableCopyWithImpl(this._value, this._then);

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
              as List<AdobeColorTableColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdobeColorTableCopyWith<$Res>
    implements $AdobeColorTableCopyWith<$Res> {
  factory _$$_AdobeColorTableCopyWith(
          _$_AdobeColorTable value, $Res Function(_$_AdobeColorTable) then) =
      __$$_AdobeColorTableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AdobeColorTableColor> colors});
}

/// @nodoc
class __$$_AdobeColorTableCopyWithImpl<$Res>
    extends _$AdobeColorTableCopyWithImpl<$Res, _$_AdobeColorTable>
    implements _$$_AdobeColorTableCopyWith<$Res> {
  __$$_AdobeColorTableCopyWithImpl(
      _$_AdobeColorTable _value, $Res Function(_$_AdobeColorTable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
  }) {
    return _then(_$_AdobeColorTable(
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeColorTableColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorTable implements _AdobeColorTable {
  const _$_AdobeColorTable({required final List<AdobeColorTableColor> colors})
      : _colors = colors;

  factory _$_AdobeColorTable.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorTableFromJson(json);

  final List<AdobeColorTableColor> _colors;
  @override
  List<AdobeColorTableColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'AdobeColorTable(colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorTable &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdobeColorTableCopyWith<_$_AdobeColorTable> get copyWith =>
      __$$_AdobeColorTableCopyWithImpl<_$_AdobeColorTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorTableToJson(
      this,
    );
  }
}

abstract class _AdobeColorTable implements AdobeColorTable {
  const factory _AdobeColorTable(
      {required final List<AdobeColorTableColor> colors}) = _$_AdobeColorTable;

  factory _AdobeColorTable.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorTable.fromJson;

  @override
  List<AdobeColorTableColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorTableCopyWith<_$_AdobeColorTable> get copyWith =>
      throw _privateConstructorUsedError;
}
