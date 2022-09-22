// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'acb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdobeColorBookColor _$AdobeColorBookColorFromJson(Map<String, dynamic> json) {
  return _AdobeColorBookColor.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorBookColor {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  List<int> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorBookColorCopyWith<AdobeColorBookColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorBookColorCopyWith<$Res> {
  factory $AdobeColorBookColorCopyWith(
          AdobeColorBookColor value, $Res Function(AdobeColorBookColor) then) =
      _$AdobeColorBookColorCopyWithImpl<$Res>;
  $Res call({String name, String code, List<int> values});
}

/// @nodoc
class _$AdobeColorBookColorCopyWithImpl<$Res>
    implements $AdobeColorBookColorCopyWith<$Res> {
  _$AdobeColorBookColorCopyWithImpl(this._value, this._then);

  final AdobeColorBookColor _value;
  // ignore: unused_field
  final $Res Function(AdobeColorBookColor) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$$_AdobeColorBookColorCopyWith<$Res>
    implements $AdobeColorBookColorCopyWith<$Res> {
  factory _$$_AdobeColorBookColorCopyWith(_$_AdobeColorBookColor value,
          $Res Function(_$_AdobeColorBookColor) then) =
      __$$_AdobeColorBookColorCopyWithImpl<$Res>;
  @override
  $Res call({String name, String code, List<int> values});
}

/// @nodoc
class __$$_AdobeColorBookColorCopyWithImpl<$Res>
    extends _$AdobeColorBookColorCopyWithImpl<$Res>
    implements _$$_AdobeColorBookColorCopyWith<$Res> {
  __$$_AdobeColorBookColorCopyWithImpl(_$_AdobeColorBookColor _value,
      $Res Function(_$_AdobeColorBookColor) _then)
      : super(_value, (v) => _then(v as _$_AdobeColorBookColor));

  @override
  _$_AdobeColorBookColor get _value => super._value as _$_AdobeColorBookColor;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? values = freezed,
  }) {
    return _then(_$_AdobeColorBookColor(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorBookColor implements _AdobeColorBookColor {
  const _$_AdobeColorBookColor(
      {required this.name, required this.code, required final List<int> values})
      : _values = values;

  factory _$_AdobeColorBookColor.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorBookColorFromJson(json);

  @override
  final String name;
  @override
  final String code;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  final List<int> _values;

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  @override
  List<int> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'AdobeColorBookColor(name: $name, code: $code, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorBookColor &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  _$$_AdobeColorBookColorCopyWith<_$_AdobeColorBookColor> get copyWith =>
      __$$_AdobeColorBookColorCopyWithImpl<_$_AdobeColorBookColor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorBookColorToJson(
      this,
    );
  }
}

abstract class _AdobeColorBookColor implements AdobeColorBookColor {
  const factory _AdobeColorBookColor(
      {required final String name,
      required final String code,
      required final List<int> values}) = _$_AdobeColorBookColor;

  factory _AdobeColorBookColor.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorBookColor.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override

  /// Color values depend on color space:
  /// - RGB: [0..255, 0..255, 0..255]
  /// - CMYK: [0..100, 0..100, 0..100, 0..100]
  /// - LAB: [0..100, -128..127, -128..127]
  List<int> get values;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorBookColorCopyWith<_$_AdobeColorBookColor> get copyWith =>
      throw _privateConstructorUsedError;
}

AdobeColorBook _$AdobeColorBookFromJson(Map<String, dynamic> json) {
  return _AdobeColorBook.fromJson(json);
}

/// @nodoc
mixin _$AdobeColorBook {
  int get version => throw _privateConstructorUsedError;
  int get identifier => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get colorNamePrefix => throw _privateConstructorUsedError;
  String get colorNameSuffix => throw _privateConstructorUsedError;
  int get colorCount => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get pageSelectorOffset => throw _privateConstructorUsedError;
  AdobeColorBookColorSpace get colorSpace => throw _privateConstructorUsedError;
  List<AdobeColorBookColor> get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdobeColorBookCopyWith<AdobeColorBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdobeColorBookCopyWith<$Res> {
  factory $AdobeColorBookCopyWith(
          AdobeColorBook value, $Res Function(AdobeColorBook) then) =
      _$AdobeColorBookCopyWithImpl<$Res>;
  $Res call(
      {int version,
      int identifier,
      String title,
      String description,
      String colorNamePrefix,
      String colorNameSuffix,
      int colorCount,
      int pageSize,
      int pageSelectorOffset,
      AdobeColorBookColorSpace colorSpace,
      List<AdobeColorBookColor> colors});
}

/// @nodoc
class _$AdobeColorBookCopyWithImpl<$Res>
    implements $AdobeColorBookCopyWith<$Res> {
  _$AdobeColorBookCopyWithImpl(this._value, this._then);

  final AdobeColorBook _value;
  // ignore: unused_field
  final $Res Function(AdobeColorBook) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? identifier = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? colorNamePrefix = freezed,
    Object? colorNameSuffix = freezed,
    Object? colorCount = freezed,
    Object? pageSize = freezed,
    Object? pageSelectorOffset = freezed,
    Object? colorSpace = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      colorNamePrefix: colorNamePrefix == freezed
          ? _value.colorNamePrefix
          : colorNamePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      colorNameSuffix: colorNameSuffix == freezed
          ? _value.colorNameSuffix
          : colorNameSuffix // ignore: cast_nullable_to_non_nullable
              as String,
      colorCount: colorCount == freezed
          ? _value.colorCount
          : colorCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageSelectorOffset: pageSelectorOffset == freezed
          ? _value.pageSelectorOffset
          : pageSelectorOffset // ignore: cast_nullable_to_non_nullable
              as int,
      colorSpace: colorSpace == freezed
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as AdobeColorBookColorSpace,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeColorBookColor>,
    ));
  }
}

/// @nodoc
abstract class _$$_AdobeColorBookCopyWith<$Res>
    implements $AdobeColorBookCopyWith<$Res> {
  factory _$$_AdobeColorBookCopyWith(
          _$_AdobeColorBook value, $Res Function(_$_AdobeColorBook) then) =
      __$$_AdobeColorBookCopyWithImpl<$Res>;
  @override
  $Res call(
      {int version,
      int identifier,
      String title,
      String description,
      String colorNamePrefix,
      String colorNameSuffix,
      int colorCount,
      int pageSize,
      int pageSelectorOffset,
      AdobeColorBookColorSpace colorSpace,
      List<AdobeColorBookColor> colors});
}

/// @nodoc
class __$$_AdobeColorBookCopyWithImpl<$Res>
    extends _$AdobeColorBookCopyWithImpl<$Res>
    implements _$$_AdobeColorBookCopyWith<$Res> {
  __$$_AdobeColorBookCopyWithImpl(
      _$_AdobeColorBook _value, $Res Function(_$_AdobeColorBook) _then)
      : super(_value, (v) => _then(v as _$_AdobeColorBook));

  @override
  _$_AdobeColorBook get _value => super._value as _$_AdobeColorBook;

  @override
  $Res call({
    Object? version = freezed,
    Object? identifier = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? colorNamePrefix = freezed,
    Object? colorNameSuffix = freezed,
    Object? colorCount = freezed,
    Object? pageSize = freezed,
    Object? pageSelectorOffset = freezed,
    Object? colorSpace = freezed,
    Object? colors = freezed,
  }) {
    return _then(_$_AdobeColorBook(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      colorNamePrefix: colorNamePrefix == freezed
          ? _value.colorNamePrefix
          : colorNamePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      colorNameSuffix: colorNameSuffix == freezed
          ? _value.colorNameSuffix
          : colorNameSuffix // ignore: cast_nullable_to_non_nullable
              as String,
      colorCount: colorCount == freezed
          ? _value.colorCount
          : colorCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageSelectorOffset: pageSelectorOffset == freezed
          ? _value.pageSelectorOffset
          : pageSelectorOffset // ignore: cast_nullable_to_non_nullable
              as int,
      colorSpace: colorSpace == freezed
          ? _value.colorSpace
          : colorSpace // ignore: cast_nullable_to_non_nullable
              as AdobeColorBookColorSpace,
      colors: colors == freezed
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<AdobeColorBookColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdobeColorBook implements _AdobeColorBook {
  const _$_AdobeColorBook(
      {required this.version,
      required this.identifier,
      required this.title,
      required this.description,
      required this.colorNamePrefix,
      required this.colorNameSuffix,
      required this.colorCount,
      required this.pageSize,
      required this.pageSelectorOffset,
      required this.colorSpace,
      required final List<AdobeColorBookColor> colors})
      : _colors = colors;

  factory _$_AdobeColorBook.fromJson(Map<String, dynamic> json) =>
      _$$_AdobeColorBookFromJson(json);

  @override
  final int version;
  @override
  final int identifier;
  @override
  final String title;
  @override
  final String description;
  @override
  final String colorNamePrefix;
  @override
  final String colorNameSuffix;
  @override
  final int colorCount;
  @override
  final int pageSize;
  @override
  final int pageSelectorOffset;
  @override
  final AdobeColorBookColorSpace colorSpace;
  final List<AdobeColorBookColor> _colors;
  @override
  List<AdobeColorBookColor> get colors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'AdobeColorBook(version: $version, identifier: $identifier, title: $title, description: $description, colorNamePrefix: $colorNamePrefix, colorNameSuffix: $colorNameSuffix, colorCount: $colorCount, pageSize: $pageSize, pageSelectorOffset: $pageSelectorOffset, colorSpace: $colorSpace, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdobeColorBook &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.identifier, identifier) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.colorNamePrefix, colorNamePrefix) &&
            const DeepCollectionEquality()
                .equals(other.colorNameSuffix, colorNameSuffix) &&
            const DeepCollectionEquality()
                .equals(other.colorCount, colorCount) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality()
                .equals(other.pageSelectorOffset, pageSelectorOffset) &&
            const DeepCollectionEquality()
                .equals(other.colorSpace, colorSpace) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(identifier),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(colorNamePrefix),
      const DeepCollectionEquality().hash(colorNameSuffix),
      const DeepCollectionEquality().hash(colorCount),
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(pageSelectorOffset),
      const DeepCollectionEquality().hash(colorSpace),
      const DeepCollectionEquality().hash(_colors));

  @JsonKey(ignore: true)
  @override
  _$$_AdobeColorBookCopyWith<_$_AdobeColorBook> get copyWith =>
      __$$_AdobeColorBookCopyWithImpl<_$_AdobeColorBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdobeColorBookToJson(
      this,
    );
  }
}

abstract class _AdobeColorBook implements AdobeColorBook {
  const factory _AdobeColorBook(
      {required final int version,
      required final int identifier,
      required final String title,
      required final String description,
      required final String colorNamePrefix,
      required final String colorNameSuffix,
      required final int colorCount,
      required final int pageSize,
      required final int pageSelectorOffset,
      required final AdobeColorBookColorSpace colorSpace,
      required final List<AdobeColorBookColor> colors}) = _$_AdobeColorBook;

  factory _AdobeColorBook.fromJson(Map<String, dynamic> json) =
      _$_AdobeColorBook.fromJson;

  @override
  int get version;
  @override
  int get identifier;
  @override
  String get title;
  @override
  String get description;
  @override
  String get colorNamePrefix;
  @override
  String get colorNameSuffix;
  @override
  int get colorCount;
  @override
  int get pageSize;
  @override
  int get pageSelectorOffset;
  @override
  AdobeColorBookColorSpace get colorSpace;
  @override
  List<AdobeColorBookColor> get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AdobeColorBookCopyWith<_$_AdobeColorBook> get copyWith =>
      throw _privateConstructorUsedError;
}
