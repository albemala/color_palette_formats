// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gpl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GimpPaletteColor _$GimpPaletteColorFromJson(Map<String, dynamic> json) {
  return _GimpPaletteColor.fromJson(json);
}

/// @nodoc
mixin _$GimpPaletteColor {
  /// Value: [0..255]
  int get red => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get green => throw _privateConstructorUsedError;

  /// Value: [0..255]
  int get blue => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GimpPaletteColorCopyWith<GimpPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GimpPaletteColorCopyWith<$Res> {
  factory $GimpPaletteColorCopyWith(
          GimpPaletteColor value, $Res Function(GimpPaletteColor) then) =
      _$GimpPaletteColorCopyWithImpl<$Res>;
  $Res call({int red, int green, int blue, String name});
}

/// @nodoc
class _$GimpPaletteColorCopyWithImpl<$Res>
    implements $GimpPaletteColorCopyWith<$Res> {
  _$GimpPaletteColorCopyWithImpl(this._value, this._then);

  final GimpPaletteColor _value;
  // ignore: unused_field
  final $Res Function(GimpPaletteColor) _then;

  @override
  $Res call({
    Object? red = freezed,
    Object? green = freezed,
    Object? blue = freezed,
    Object? name = freezed,
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GimpPaletteColorCopyWith<$Res>
    implements $GimpPaletteColorCopyWith<$Res> {
  factory _$$_GimpPaletteColorCopyWith(
          _$_GimpPaletteColor value, $Res Function(_$_GimpPaletteColor) then) =
      __$$_GimpPaletteColorCopyWithImpl<$Res>;
  @override
  $Res call({int red, int green, int blue, String name});
}

/// @nodoc
class __$$_GimpPaletteColorCopyWithImpl<$Res>
    extends _$GimpPaletteColorCopyWithImpl<$Res>
    implements _$$_GimpPaletteColorCopyWith<$Res> {
  __$$_GimpPaletteColorCopyWithImpl(
      _$_GimpPaletteColor _value, $Res Function(_$_GimpPaletteColor) _then)
      : super(_value, (v) => _then(v as _$_GimpPaletteColor));

  @override
  _$_GimpPaletteColor get _value => super._value as _$_GimpPaletteColor;

  @override
  $Res call({
    Object? red = freezed,
    Object? green = freezed,
    Object? blue = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_GimpPaletteColor(
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GimpPaletteColor implements _GimpPaletteColor {
  const _$_GimpPaletteColor(
      {required this.red,
      required this.green,
      required this.blue,
      required this.name});

  factory _$_GimpPaletteColor.fromJson(Map<String, dynamic> json) =>
      _$$_GimpPaletteColorFromJson(json);

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
  final String name;

  @override
  String toString() {
    return 'GimpPaletteColor(red: $red, green: $green, blue: $blue, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GimpPaletteColor &&
            const DeepCollectionEquality().equals(other.red, red) &&
            const DeepCollectionEquality().equals(other.green, green) &&
            const DeepCollectionEquality().equals(other.blue, blue) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(green),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_GimpPaletteColorCopyWith<_$_GimpPaletteColor> get copyWith =>
      __$$_GimpPaletteColorCopyWithImpl<_$_GimpPaletteColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GimpPaletteColorToJson(
      this,
    );
  }
}

abstract class _GimpPaletteColor implements GimpPaletteColor {
  const factory _GimpPaletteColor(
      {required final int red,
      required final int green,
      required final int blue,
      required final String name}) = _$_GimpPaletteColor;

  factory _GimpPaletteColor.fromJson(Map<String, dynamic> json) =
      _$_GimpPaletteColor.fromJson;

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
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_GimpPaletteColorCopyWith<_$_GimpPaletteColor> get copyWith =>
      throw _privateConstructorUsedError;
}

GimpPalette _$GimpPaletteFromJson(Map<String, dynamic> json) {
  return _GimpPalette.fromJson(json);
}

/// @nodoc
mixin _$GimpPalette {
  String get name => throw _privateConstructorUsedError;
  int? get columns => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  List<GimpPaletteColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GimpPaletteCopyWith<GimpPalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GimpPaletteCopyWith<$Res> {
  factory $GimpPaletteCopyWith(
          GimpPalette value, $Res Function(GimpPalette) then) =
      _$GimpPaletteCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int? columns,
      String comments,
      List<GimpPaletteColor> colors});
}

/// @nodoc
class _$GimpPaletteCopyWithImpl<$Res> implements $GimpPaletteCopyWith<$Res> {
  _$GimpPaletteCopyWithImpl(this._value, this._then);

  final GimpPalette _value;
  // ignore: unused_field
  final $Res Function(GimpPalette) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? columns = freezed,
    Object? comments = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<GimpPaletteColor>,
    ));
  }
}

/// @nodoc
abstract class _$$_GimpPaletteCopyWith<$Res>
    implements $GimpPaletteCopyWith<$Res> {
  factory _$$_GimpPaletteCopyWith(
          _$_GimpPalette value, $Res Function(_$_GimpPalette) then) =
      __$$_GimpPaletteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int? columns,
      String comments,
      List<GimpPaletteColor> colors});
}

/// @nodoc
class __$$_GimpPaletteCopyWithImpl<$Res> extends _$GimpPaletteCopyWithImpl<$Res>
    implements _$$_GimpPaletteCopyWith<$Res> {
  __$$_GimpPaletteCopyWithImpl(
      _$_GimpPalette _value, $Res Function(_$_GimpPalette) _then)
      : super(_value, (v) => _then(v as _$_GimpPalette));

  @override
  _$_GimpPalette get _value => super._value as _$_GimpPalette;

  @override
  $Res call({
    Object? name = freezed,
    Object? columns = freezed,
    Object? comments = freezed,
    Object? colors = freezed,
  }) {
    return _then(_$_GimpPalette(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<GimpPaletteColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GimpPalette implements _GimpPalette {
  const _$_GimpPalette(
      {required this.name,
      required this.columns,
      required this.comments,
      required final List<GimpPaletteColor> colors})
      : _colors = colors;

  factory _$_GimpPalette.fromJson(Map<String, dynamic> json) =>
      _$$_GimpPaletteFromJson(json);

  @override
  final String name;
  @override
  final int? columns;
  @override
  final String comments;
  final List<GimpPaletteColor> _colors;
  @override
  List<GimpPaletteColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'GimpPalette(name: $name, columns: $columns, comments: $comments, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GimpPalette &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.columns, columns) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(columns),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  _$$_GimpPaletteCopyWith<_$_GimpPalette> get copyWith =>
      __$$_GimpPaletteCopyWithImpl<_$_GimpPalette>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GimpPaletteToJson(
      this,
    );
  }
}

abstract class _GimpPalette implements GimpPalette {
  const factory _GimpPalette(
      {required final String name,
      required final int? columns,
      required final String comments,
      required final List<GimpPaletteColor> colors}) = _$_GimpPalette;

  factory _GimpPalette.fromJson(Map<String, dynamic> json) =
      _$_GimpPalette.fromJson;

  @override
  String get name;
  @override
  int? get columns;
  @override
  String get comments;
  @override
  List<GimpPaletteColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_GimpPaletteCopyWith<_$_GimpPalette> get copyWith =>
      throw _privateConstructorUsedError;
}