// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'autocad_acb.dart';

class AutoCadColorBookPageColorMapper
    extends ClassMapperBase<AutoCadColorBookPageColor> {
  AutoCadColorBookPageColorMapper._();

  static AutoCadColorBookPageColorMapper? _instance;
  static AutoCadColorBookPageColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AutoCadColorBookPageColorMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AutoCadColorBookPageColor';

  static List<int>? _$rgb(AutoCadColorBookPageColor v) => v.rgb;
  static const Field<AutoCadColorBookPageColor, List<int>> _f$rgb = Field(
    'rgb',
    _$rgb,
    opt: true,
  );
  static List<String>? _$encryptedRgb(AutoCadColorBookPageColor v) =>
      v.encryptedRgb;
  static const Field<AutoCadColorBookPageColor, List<String>> _f$encryptedRgb =
      Field('encryptedRgb', _$encryptedRgb, opt: true);

  @override
  final MappableFields<AutoCadColorBookPageColor> fields = const {
    #rgb: _f$rgb,
    #encryptedRgb: _f$encryptedRgb,
  };

  static AutoCadColorBookPageColor _instantiate(DecodingData data) {
    return AutoCadColorBookPageColor(
      rgb: data.dec(_f$rgb),
      encryptedRgb: data.dec(_f$encryptedRgb),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AutoCadColorBookPageColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AutoCadColorBookPageColor>(map);
  }

  static AutoCadColorBookPageColor fromJson(String json) {
    return ensureInitialized().decodeJson<AutoCadColorBookPageColor>(json);
  }
}

mixin AutoCadColorBookPageColorMappable {
  String toJson() {
    return AutoCadColorBookPageColorMapper.ensureInitialized()
        .encodeJson<AutoCadColorBookPageColor>(
          this as AutoCadColorBookPageColor,
        );
  }

  Map<String, dynamic> toMap() {
    return AutoCadColorBookPageColorMapper.ensureInitialized()
        .encodeMap<AutoCadColorBookPageColor>(
          this as AutoCadColorBookPageColor,
        );
  }

  AutoCadColorBookPageColorCopyWith<
    AutoCadColorBookPageColor,
    AutoCadColorBookPageColor,
    AutoCadColorBookPageColor
  >
  get copyWith => _AutoCadColorBookPageColorCopyWithImpl<
    AutoCadColorBookPageColor,
    AutoCadColorBookPageColor
  >(this as AutoCadColorBookPageColor, $identity, $identity);
  @override
  String toString() {
    return AutoCadColorBookPageColorMapper.ensureInitialized().stringifyValue(
      this as AutoCadColorBookPageColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return AutoCadColorBookPageColorMapper.ensureInitialized().equalsValue(
      this as AutoCadColorBookPageColor,
      other,
    );
  }

  @override
  int get hashCode {
    return AutoCadColorBookPageColorMapper.ensureInitialized().hashValue(
      this as AutoCadColorBookPageColor,
    );
  }
}

extension AutoCadColorBookPageColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AutoCadColorBookPageColor, $Out> {
  AutoCadColorBookPageColorCopyWith<$R, AutoCadColorBookPageColor, $Out>
  get $asAutoCadColorBookPageColor => $base.as(
    (v, t, t2) => _AutoCadColorBookPageColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AutoCadColorBookPageColorCopyWith<
  $R,
  $In extends AutoCadColorBookPageColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get rgb;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get encryptedRgb;
  $R call({List<int>? rgb, List<String>? encryptedRgb});
  AutoCadColorBookPageColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AutoCadColorBookPageColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AutoCadColorBookPageColor, $Out>
    implements
        AutoCadColorBookPageColorCopyWith<$R, AutoCadColorBookPageColor, $Out> {
  _AutoCadColorBookPageColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AutoCadColorBookPageColor> $mapper =
      AutoCadColorBookPageColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get rgb =>
      $value.rgb != null
          ? ListCopyWith(
            $value.rgb!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(rgb: v),
          )
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get encryptedRgb =>
      $value.encryptedRgb != null
          ? ListCopyWith(
            $value.encryptedRgb!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(encryptedRgb: v),
          )
          : null;
  @override
  $R call({Object? rgb = $none, Object? encryptedRgb = $none}) => $apply(
    FieldCopyWithData({
      if (rgb != $none) #rgb: rgb,
      if (encryptedRgb != $none) #encryptedRgb: encryptedRgb,
    }),
  );
  @override
  AutoCadColorBookPageColor $make(CopyWithData data) =>
      AutoCadColorBookPageColor(
        rgb: data.get(#rgb, or: $value.rgb),
        encryptedRgb: data.get(#encryptedRgb, or: $value.encryptedRgb),
      );

  @override
  AutoCadColorBookPageColorCopyWith<$R2, AutoCadColorBookPageColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AutoCadColorBookPageColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AutoCadColorBookColorMapper
    extends ClassMapperBase<AutoCadColorBookColor> {
  AutoCadColorBookColorMapper._();

  static AutoCadColorBookColorMapper? _instance;
  static AutoCadColorBookColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AutoCadColorBookColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AutoCadColorBookColor';

  static String _$name(AutoCadColorBookColor v) => v.name;
  static const Field<AutoCadColorBookColor, String> _f$name = Field(
    'name',
    _$name,
  );
  static List<int>? _$rgb(AutoCadColorBookColor v) => v.rgb;
  static const Field<AutoCadColorBookColor, List<int>> _f$rgb = Field(
    'rgb',
    _$rgb,
    opt: true,
  );
  static List<String>? _$encryptedRgb(AutoCadColorBookColor v) =>
      v.encryptedRgb;
  static const Field<AutoCadColorBookColor, List<String>> _f$encryptedRgb =
      Field('encryptedRgb', _$encryptedRgb, opt: true);

  @override
  final MappableFields<AutoCadColorBookColor> fields = const {
    #name: _f$name,
    #rgb: _f$rgb,
    #encryptedRgb: _f$encryptedRgb,
  };

  static AutoCadColorBookColor _instantiate(DecodingData data) {
    return AutoCadColorBookColor(
      name: data.dec(_f$name),
      rgb: data.dec(_f$rgb),
      encryptedRgb: data.dec(_f$encryptedRgb),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AutoCadColorBookColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AutoCadColorBookColor>(map);
  }

  static AutoCadColorBookColor fromJson(String json) {
    return ensureInitialized().decodeJson<AutoCadColorBookColor>(json);
  }
}

mixin AutoCadColorBookColorMappable {
  String toJson() {
    return AutoCadColorBookColorMapper.ensureInitialized()
        .encodeJson<AutoCadColorBookColor>(this as AutoCadColorBookColor);
  }

  Map<String, dynamic> toMap() {
    return AutoCadColorBookColorMapper.ensureInitialized()
        .encodeMap<AutoCadColorBookColor>(this as AutoCadColorBookColor);
  }

  AutoCadColorBookColorCopyWith<
    AutoCadColorBookColor,
    AutoCadColorBookColor,
    AutoCadColorBookColor
  >
  get copyWith => _AutoCadColorBookColorCopyWithImpl<
    AutoCadColorBookColor,
    AutoCadColorBookColor
  >(this as AutoCadColorBookColor, $identity, $identity);
  @override
  String toString() {
    return AutoCadColorBookColorMapper.ensureInitialized().stringifyValue(
      this as AutoCadColorBookColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return AutoCadColorBookColorMapper.ensureInitialized().equalsValue(
      this as AutoCadColorBookColor,
      other,
    );
  }

  @override
  int get hashCode {
    return AutoCadColorBookColorMapper.ensureInitialized().hashValue(
      this as AutoCadColorBookColor,
    );
  }
}

extension AutoCadColorBookColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AutoCadColorBookColor, $Out> {
  AutoCadColorBookColorCopyWith<$R, AutoCadColorBookColor, $Out>
  get $asAutoCadColorBookColor => $base.as(
    (v, t, t2) => _AutoCadColorBookColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AutoCadColorBookColorCopyWith<
  $R,
  $In extends AutoCadColorBookColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get rgb;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get encryptedRgb;
  $R call({String? name, List<int>? rgb, List<String>? encryptedRgb});
  AutoCadColorBookColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AutoCadColorBookColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AutoCadColorBookColor, $Out>
    implements AutoCadColorBookColorCopyWith<$R, AutoCadColorBookColor, $Out> {
  _AutoCadColorBookColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AutoCadColorBookColor> $mapper =
      AutoCadColorBookColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get rgb =>
      $value.rgb != null
          ? ListCopyWith(
            $value.rgb!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(rgb: v),
          )
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get encryptedRgb =>
      $value.encryptedRgb != null
          ? ListCopyWith(
            $value.encryptedRgb!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(encryptedRgb: v),
          )
          : null;
  @override
  $R call({String? name, Object? rgb = $none, Object? encryptedRgb = $none}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (rgb != $none) #rgb: rgb,
          if (encryptedRgb != $none) #encryptedRgb: encryptedRgb,
        }),
      );
  @override
  AutoCadColorBookColor $make(CopyWithData data) => AutoCadColorBookColor(
    name: data.get(#name, or: $value.name),
    rgb: data.get(#rgb, or: $value.rgb),
    encryptedRgb: data.get(#encryptedRgb, or: $value.encryptedRgb),
  );

  @override
  AutoCadColorBookColorCopyWith<$R2, AutoCadColorBookColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AutoCadColorBookColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AutoCadColorBookMapper extends ClassMapperBase<AutoCadColorBook> {
  AutoCadColorBookMapper._();

  static AutoCadColorBookMapper? _instance;
  static AutoCadColorBookMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AutoCadColorBookMapper._());
      AutoCadColorBookPageColorMapper.ensureInitialized();
      AutoCadColorBookColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AutoCadColorBook';

  static String _$bookName(AutoCadColorBook v) => v.bookName;
  static const Field<AutoCadColorBook, String> _f$bookName = Field(
    'bookName',
    _$bookName,
  );
  static int? _$majorVersion(AutoCadColorBook v) => v.majorVersion;
  static const Field<AutoCadColorBook, int> _f$majorVersion = Field(
    'majorVersion',
    _$majorVersion,
    opt: true,
  );
  static int? _$minorVersion(AutoCadColorBook v) => v.minorVersion;
  static const Field<AutoCadColorBook, int> _f$minorVersion = Field(
    'minorVersion',
    _$minorVersion,
    opt: true,
  );
  static AutoCadColorBookPageColor _$pageColor(AutoCadColorBook v) =>
      v.pageColor;
  static const Field<AutoCadColorBook, AutoCadColorBookPageColor> _f$pageColor =
      Field('pageColor', _$pageColor);
  static List<AutoCadColorBookColor> _$colors(AutoCadColorBook v) => v.colors;
  static const Field<AutoCadColorBook, List<AutoCadColorBookColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<AutoCadColorBook> fields = const {
    #bookName: _f$bookName,
    #majorVersion: _f$majorVersion,
    #minorVersion: _f$minorVersion,
    #pageColor: _f$pageColor,
    #colors: _f$colors,
  };

  static AutoCadColorBook _instantiate(DecodingData data) {
    return AutoCadColorBook(
      bookName: data.dec(_f$bookName),
      majorVersion: data.dec(_f$majorVersion),
      minorVersion: data.dec(_f$minorVersion),
      pageColor: data.dec(_f$pageColor),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AutoCadColorBook fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AutoCadColorBook>(map);
  }

  static AutoCadColorBook fromJson(String json) {
    return ensureInitialized().decodeJson<AutoCadColorBook>(json);
  }
}

mixin AutoCadColorBookMappable {
  String toJson() {
    return AutoCadColorBookMapper.ensureInitialized()
        .encodeJson<AutoCadColorBook>(this as AutoCadColorBook);
  }

  Map<String, dynamic> toMap() {
    return AutoCadColorBookMapper.ensureInitialized()
        .encodeMap<AutoCadColorBook>(this as AutoCadColorBook);
  }

  AutoCadColorBookCopyWith<AutoCadColorBook, AutoCadColorBook, AutoCadColorBook>
  get copyWith =>
      _AutoCadColorBookCopyWithImpl<AutoCadColorBook, AutoCadColorBook>(
        this as AutoCadColorBook,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AutoCadColorBookMapper.ensureInitialized().stringifyValue(
      this as AutoCadColorBook,
    );
  }

  @override
  bool operator ==(Object other) {
    return AutoCadColorBookMapper.ensureInitialized().equalsValue(
      this as AutoCadColorBook,
      other,
    );
  }

  @override
  int get hashCode {
    return AutoCadColorBookMapper.ensureInitialized().hashValue(
      this as AutoCadColorBook,
    );
  }
}

extension AutoCadColorBookValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AutoCadColorBook, $Out> {
  AutoCadColorBookCopyWith<$R, AutoCadColorBook, $Out>
  get $asAutoCadColorBook =>
      $base.as((v, t, t2) => _AutoCadColorBookCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AutoCadColorBookCopyWith<$R, $In extends AutoCadColorBook, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AutoCadColorBookPageColorCopyWith<
    $R,
    AutoCadColorBookPageColor,
    AutoCadColorBookPageColor
  >
  get pageColor;
  ListCopyWith<
    $R,
    AutoCadColorBookColor,
    AutoCadColorBookColorCopyWith<
      $R,
      AutoCadColorBookColor,
      AutoCadColorBookColor
    >
  >
  get colors;
  $R call({
    String? bookName,
    int? majorVersion,
    int? minorVersion,
    AutoCadColorBookPageColor? pageColor,
    List<AutoCadColorBookColor>? colors,
  });
  AutoCadColorBookCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AutoCadColorBookCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AutoCadColorBook, $Out>
    implements AutoCadColorBookCopyWith<$R, AutoCadColorBook, $Out> {
  _AutoCadColorBookCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AutoCadColorBook> $mapper =
      AutoCadColorBookMapper.ensureInitialized();
  @override
  AutoCadColorBookPageColorCopyWith<
    $R,
    AutoCadColorBookPageColor,
    AutoCadColorBookPageColor
  >
  get pageColor => $value.pageColor.copyWith.$chain((v) => call(pageColor: v));
  @override
  ListCopyWith<
    $R,
    AutoCadColorBookColor,
    AutoCadColorBookColorCopyWith<
      $R,
      AutoCadColorBookColor,
      AutoCadColorBookColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    String? bookName,
    Object? majorVersion = $none,
    Object? minorVersion = $none,
    AutoCadColorBookPageColor? pageColor,
    List<AutoCadColorBookColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (bookName != null) #bookName: bookName,
      if (majorVersion != $none) #majorVersion: majorVersion,
      if (minorVersion != $none) #minorVersion: minorVersion,
      if (pageColor != null) #pageColor: pageColor,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  AutoCadColorBook $make(CopyWithData data) => AutoCadColorBook(
    bookName: data.get(#bookName, or: $value.bookName),
    majorVersion: data.get(#majorVersion, or: $value.majorVersion),
    minorVersion: data.get(#minorVersion, or: $value.minorVersion),
    pageColor: data.get(#pageColor, or: $value.pageColor),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  AutoCadColorBookCopyWith<$R2, AutoCadColorBook, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AutoCadColorBookCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
