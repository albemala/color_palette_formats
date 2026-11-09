// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'act.dart';

class AdobeColorTableColorMapper extends ClassMapperBase<AdobeColorTableColor> {
  AdobeColorTableColorMapper._();

  static AdobeColorTableColorMapper? _instance;
  static AdobeColorTableColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorTableColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorTableColor';

  static int _$red(AdobeColorTableColor v) => v.red;
  static const Field<AdobeColorTableColor, int> _f$red = Field('red', _$red);
  static int _$green(AdobeColorTableColor v) => v.green;
  static const Field<AdobeColorTableColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(AdobeColorTableColor v) => v.blue;
  static const Field<AdobeColorTableColor, int> _f$blue = Field('blue', _$blue);

  @override
  final MappableFields<AdobeColorTableColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
  };

  static AdobeColorTableColor _instantiate(DecodingData data) {
    return AdobeColorTableColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorTableColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorTableColor>(map);
  }

  static AdobeColorTableColor fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorTableColor>(json);
  }
}

mixin AdobeColorTableColorMappable {
  String toJson() {
    return AdobeColorTableColorMapper.ensureInitialized()
        .encodeJson<AdobeColorTableColor>(this as AdobeColorTableColor);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorTableColorMapper.ensureInitialized()
        .encodeMap<AdobeColorTableColor>(this as AdobeColorTableColor);
  }

  AdobeColorTableColorCopyWith<
    AdobeColorTableColor,
    AdobeColorTableColor,
    AdobeColorTableColor
  >
  get copyWith => _AdobeColorTableColorCopyWithImpl<
    AdobeColorTableColor,
    AdobeColorTableColor
  >(this as AdobeColorTableColor, $identity, $identity);
  @override
  String toString() {
    return AdobeColorTableColorMapper.ensureInitialized().stringifyValue(
      this as AdobeColorTableColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorTableColorMapper.ensureInitialized().equalsValue(
      this as AdobeColorTableColor,
      other,
    );
  }

  @override
  int get hashCode {
    return AdobeColorTableColorMapper.ensureInitialized().hashValue(
      this as AdobeColorTableColor,
    );
  }
}

extension AdobeColorTableColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorTableColor, $Out> {
  AdobeColorTableColorCopyWith<$R, AdobeColorTableColor, $Out>
  get $asAdobeColorTableColor => $base.as(
    (v, t, t2) => _AdobeColorTableColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AdobeColorTableColorCopyWith<
  $R,
  $In extends AdobeColorTableColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? red, int? green, int? blue});
  AdobeColorTableColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AdobeColorTableColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorTableColor, $Out>
    implements AdobeColorTableColorCopyWith<$R, AdobeColorTableColor, $Out> {
  _AdobeColorTableColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorTableColor> $mapper =
      AdobeColorTableColorMapper.ensureInitialized();
  @override
  $R call({int? red, int? green, int? blue}) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
    }),
  );
  @override
  AdobeColorTableColor $make(CopyWithData data) => AdobeColorTableColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
  );

  @override
  AdobeColorTableColorCopyWith<$R2, AdobeColorTableColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AdobeColorTableColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AdobeColorTableMapper extends ClassMapperBase<AdobeColorTable> {
  AdobeColorTableMapper._();

  static AdobeColorTableMapper? _instance;
  static AdobeColorTableMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdobeColorTableMapper._());
      AdobeColorTableColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdobeColorTable';

  static List<AdobeColorTableColor> _$colors(AdobeColorTable v) => v.colors;
  static const Field<AdobeColorTable, List<AdobeColorTableColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<AdobeColorTable> fields = const {#colors: _f$colors};

  static AdobeColorTable _instantiate(DecodingData data) {
    return AdobeColorTable(colors: data.dec(_f$colors));
  }

  @override
  final Function instantiate = _instantiate;

  static AdobeColorTable fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdobeColorTable>(map);
  }

  static AdobeColorTable fromJson(String json) {
    return ensureInitialized().decodeJson<AdobeColorTable>(json);
  }
}

mixin AdobeColorTableMappable {
  String toJson() {
    return AdobeColorTableMapper.ensureInitialized()
        .encodeJson<AdobeColorTable>(this as AdobeColorTable);
  }

  Map<String, dynamic> toMap() {
    return AdobeColorTableMapper.ensureInitialized().encodeMap<AdobeColorTable>(
      this as AdobeColorTable,
    );
  }

  AdobeColorTableCopyWith<AdobeColorTable, AdobeColorTable, AdobeColorTable>
  get copyWith =>
      _AdobeColorTableCopyWithImpl<AdobeColorTable, AdobeColorTable>(
        this as AdobeColorTable,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AdobeColorTableMapper.ensureInitialized().stringifyValue(
      this as AdobeColorTable,
    );
  }

  @override
  bool operator ==(Object other) {
    return AdobeColorTableMapper.ensureInitialized().equalsValue(
      this as AdobeColorTable,
      other,
    );
  }

  @override
  int get hashCode {
    return AdobeColorTableMapper.ensureInitialized().hashValue(
      this as AdobeColorTable,
    );
  }
}

extension AdobeColorTableValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdobeColorTable, $Out> {
  AdobeColorTableCopyWith<$R, AdobeColorTable, $Out> get $asAdobeColorTable =>
      $base.as((v, t, t2) => _AdobeColorTableCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdobeColorTableCopyWith<$R, $In extends AdobeColorTable, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    AdobeColorTableColor,
    AdobeColorTableColorCopyWith<$R, AdobeColorTableColor, AdobeColorTableColor>
  >
  get colors;
  $R call({List<AdobeColorTableColor>? colors});
  AdobeColorTableCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AdobeColorTableCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdobeColorTable, $Out>
    implements AdobeColorTableCopyWith<$R, AdobeColorTable, $Out> {
  _AdobeColorTableCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdobeColorTable> $mapper =
      AdobeColorTableMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    AdobeColorTableColor,
    AdobeColorTableColorCopyWith<$R, AdobeColorTableColor, AdobeColorTableColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({List<AdobeColorTableColor>? colors}) =>
      $apply(FieldCopyWithData({if (colors != null) #colors: colors}));
  @override
  AdobeColorTable $make(CopyWithData data) =>
      AdobeColorTable(colors: data.get(#colors, or: $value.colors));

  @override
  AdobeColorTableCopyWith<$R2, AdobeColorTable, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AdobeColorTableCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
