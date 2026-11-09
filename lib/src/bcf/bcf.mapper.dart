// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bcf.dart';

class BcfColorModelMapper extends EnumMapper<BcfColorModel> {
  BcfColorModelMapper._();

  static BcfColorModelMapper? _instance;
  static BcfColorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfColorModelMapper._());
    }
    return _instance!;
  }

  static BcfColorModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BcfColorModel decode(dynamic value) {
    switch (value) {
      case r'xyz':
        return BcfColorModel.xyz;
      case r'cmyk':
        return BcfColorModel.cmyk;
      case r'rgb':
        return BcfColorModel.rgb;
      case r'lab':
        return BcfColorModel.lab;
      case r'hifi':
        return BcfColorModel.hifi;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BcfColorModel self) {
    switch (self) {
      case BcfColorModel.xyz:
        return r'xyz';
      case BcfColorModel.cmyk:
        return r'cmyk';
      case BcfColorModel.rgb:
        return r'rgb';
      case BcfColorModel.lab:
        return r'lab';
      case BcfColorModel.hifi:
        return r'hifi';
    }
  }
}

extension BcfColorModelMapperExtension on BcfColorModel {
  String toValue() {
    BcfColorModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BcfColorModel>(this) as String;
  }
}

class BcfPaletteTypeMapper extends EnumMapper<BcfPaletteType> {
  BcfPaletteTypeMapper._();

  static BcfPaletteTypeMapper? _instance;
  static BcfPaletteTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfPaletteTypeMapper._());
    }
    return _instance!;
  }

  static BcfPaletteType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BcfPaletteType decode(dynamic value) {
    switch (value) {
      case r'spot':
        return BcfPaletteType.spot;
      case r'process':
        return BcfPaletteType.process;
      case r'mixed':
        return BcfPaletteType.mixed;
      case r'hifi':
        return BcfPaletteType.hifi;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BcfPaletteType self) {
    switch (self) {
      case BcfPaletteType.spot:
        return r'spot';
      case BcfPaletteType.process:
        return r'process';
      case BcfPaletteType.mixed:
        return r'mixed';
      case BcfPaletteType.hifi:
        return r'hifi';
    }
  }
}

extension BcfPaletteTypeMapperExtension on BcfPaletteType {
  String toValue() {
    BcfPaletteTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BcfPaletteType>(this) as String;
  }
}

class BcfNamesFormatMapper extends EnumMapper<BcfNamesFormat> {
  BcfNamesFormatMapper._();

  static BcfNamesFormatMapper? _instance;
  static BcfNamesFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfNamesFormatMapper._());
    }
    return _instance!;
  }

  static BcfNamesFormat fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BcfNamesFormat decode(dynamic value) {
    switch (value) {
      case r'full':
        return BcfNamesFormat.full;
      case r'partial':
        return BcfNamesFormat.partial;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BcfNamesFormat self) {
    switch (self) {
      case BcfNamesFormat.full:
        return r'full';
      case BcfNamesFormat.partial:
        return r'partial';
    }
  }
}

extension BcfNamesFormatMapperExtension on BcfNamesFormat {
  String toValue() {
    BcfNamesFormatMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BcfNamesFormat>(this) as String;
  }
}

class BcfHiFiInkMapper extends ClassMapperBase<BcfHiFiInk> {
  BcfHiFiInkMapper._();

  static BcfHiFiInkMapper? _instance;
  static BcfHiFiInkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfHiFiInkMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BcfHiFiInk';

  static String _$angle(BcfHiFiInk v) => v.angle;
  static const Field<BcfHiFiInk, String> _f$angle = Field('angle', _$angle);
  static String _$frequency(BcfHiFiInk v) => v.frequency;
  static const Field<BcfHiFiInk, String> _f$frequency = Field(
    'frequency',
    _$frequency,
  );
  static int _$density(BcfHiFiInk v) => v.density;
  static const Field<BcfHiFiInk, int> _f$density = Field('density', _$density);
  static String _$name(BcfHiFiInk v) => v.name;
  static const Field<BcfHiFiInk, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<BcfHiFiInk> fields = const {
    #angle: _f$angle,
    #frequency: _f$frequency,
    #density: _f$density,
    #name: _f$name,
  };

  static BcfHiFiInk _instantiate(DecodingData data) {
    return BcfHiFiInk(
      angle: data.dec(_f$angle),
      frequency: data.dec(_f$frequency),
      density: data.dec(_f$density),
      name: data.dec(_f$name),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcfHiFiInk fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcfHiFiInk>(map);
  }

  static BcfHiFiInk fromJson(String json) {
    return ensureInitialized().decodeJson<BcfHiFiInk>(json);
  }
}

mixin BcfHiFiInkMappable {
  String toJson() {
    return BcfHiFiInkMapper.ensureInitialized().encodeJson<BcfHiFiInk>(
      this as BcfHiFiInk,
    );
  }

  Map<String, dynamic> toMap() {
    return BcfHiFiInkMapper.ensureInitialized().encodeMap<BcfHiFiInk>(
      this as BcfHiFiInk,
    );
  }

  BcfHiFiInkCopyWith<BcfHiFiInk, BcfHiFiInk, BcfHiFiInk> get copyWith =>
      _BcfHiFiInkCopyWithImpl<BcfHiFiInk, BcfHiFiInk>(
        this as BcfHiFiInk,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcfHiFiInkMapper.ensureInitialized().stringifyValue(
      this as BcfHiFiInk,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcfHiFiInkMapper.ensureInitialized().equalsValue(
      this as BcfHiFiInk,
      other,
    );
  }

  @override
  int get hashCode {
    return BcfHiFiInkMapper.ensureInitialized().hashValue(this as BcfHiFiInk);
  }
}

extension BcfHiFiInkValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcfHiFiInk, $Out> {
  BcfHiFiInkCopyWith<$R, BcfHiFiInk, $Out> get $asBcfHiFiInk =>
      $base.as((v, t, t2) => _BcfHiFiInkCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcfHiFiInkCopyWith<$R, $In extends BcfHiFiInk, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? angle, String? frequency, int? density, String? name});
  BcfHiFiInkCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BcfHiFiInkCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcfHiFiInk, $Out>
    implements BcfHiFiInkCopyWith<$R, BcfHiFiInk, $Out> {
  _BcfHiFiInkCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcfHiFiInk> $mapper =
      BcfHiFiInkMapper.ensureInitialized();
  @override
  $R call({String? angle, String? frequency, int? density, String? name}) =>
      $apply(
        FieldCopyWithData({
          if (angle != null) #angle: angle,
          if (frequency != null) #frequency: frequency,
          if (density != null) #density: density,
          if (name != null) #name: name,
        }),
      );
  @override
  BcfHiFiInk $make(CopyWithData data) => BcfHiFiInk(
    angle: data.get(#angle, or: $value.angle),
    frequency: data.get(#frequency, or: $value.frequency),
    density: data.get(#density, or: $value.density),
    name: data.get(#name, or: $value.name),
  );

  @override
  BcfHiFiInkCopyWith<$R2, BcfHiFiInk, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcfHiFiInkCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BcfPaletteColorValueMapper extends ClassMapperBase<BcfPaletteColorValue> {
  BcfPaletteColorValueMapper._();

  static BcfPaletteColorValueMapper? _instance;
  static BcfPaletteColorValueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfPaletteColorValueMapper._());
      BcfColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BcfPaletteColorValue';

  static BcfColorModel _$model(BcfPaletteColorValue v) => v.model;
  static const Field<BcfPaletteColorValue, BcfColorModel> _f$model = Field(
    'model',
    _$model,
  );
  static List<int> _$values(BcfPaletteColorValue v) => v.values;
  static const Field<BcfPaletteColorValue, List<int>> _f$values = Field(
    'values',
    _$values,
  );

  @override
  final MappableFields<BcfPaletteColorValue> fields = const {
    #model: _f$model,
    #values: _f$values,
  };

  static BcfPaletteColorValue _instantiate(DecodingData data) {
    return BcfPaletteColorValue(
      model: data.dec(_f$model),
      values: data.dec(_f$values),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcfPaletteColorValue fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcfPaletteColorValue>(map);
  }

  static BcfPaletteColorValue fromJson(String json) {
    return ensureInitialized().decodeJson<BcfPaletteColorValue>(json);
  }
}

mixin BcfPaletteColorValueMappable {
  String toJson() {
    return BcfPaletteColorValueMapper.ensureInitialized()
        .encodeJson<BcfPaletteColorValue>(this as BcfPaletteColorValue);
  }

  Map<String, dynamic> toMap() {
    return BcfPaletteColorValueMapper.ensureInitialized()
        .encodeMap<BcfPaletteColorValue>(this as BcfPaletteColorValue);
  }

  BcfPaletteColorValueCopyWith<
    BcfPaletteColorValue,
    BcfPaletteColorValue,
    BcfPaletteColorValue
  >
  get copyWith => _BcfPaletteColorValueCopyWithImpl<
    BcfPaletteColorValue,
    BcfPaletteColorValue
  >(this as BcfPaletteColorValue, $identity, $identity);
  @override
  String toString() {
    return BcfPaletteColorValueMapper.ensureInitialized().stringifyValue(
      this as BcfPaletteColorValue,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcfPaletteColorValueMapper.ensureInitialized().equalsValue(
      this as BcfPaletteColorValue,
      other,
    );
  }

  @override
  int get hashCode {
    return BcfPaletteColorValueMapper.ensureInitialized().hashValue(
      this as BcfPaletteColorValue,
    );
  }
}

extension BcfPaletteColorValueValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcfPaletteColorValue, $Out> {
  BcfPaletteColorValueCopyWith<$R, BcfPaletteColorValue, $Out>
  get $asBcfPaletteColorValue => $base.as(
    (v, t, t2) => _BcfPaletteColorValueCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class BcfPaletteColorValueCopyWith<
  $R,
  $In extends BcfPaletteColorValue,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values;
  $R call({BcfColorModel? model, List<int>? values});
  BcfPaletteColorValueCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BcfPaletteColorValueCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcfPaletteColorValue, $Out>
    implements BcfPaletteColorValueCopyWith<$R, BcfPaletteColorValue, $Out> {
  _BcfPaletteColorValueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcfPaletteColorValue> $mapper =
      BcfPaletteColorValueMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values =>
      ListCopyWith(
        $value.values,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(values: v),
      );
  @override
  $R call({BcfColorModel? model, List<int>? values}) => $apply(
    FieldCopyWithData({
      if (model != null) #model: model,
      if (values != null) #values: values,
    }),
  );
  @override
  BcfPaletteColorValue $make(CopyWithData data) => BcfPaletteColorValue(
    model: data.get(#model, or: $value.model),
    values: data.get(#values, or: $value.values),
  );

  @override
  BcfPaletteColorValueCopyWith<$R2, BcfPaletteColorValue, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BcfPaletteColorValueCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BcfPaletteColorMapper extends ClassMapperBase<BcfPaletteColor> {
  BcfPaletteColorMapper._();

  static BcfPaletteColorMapper? _instance;
  static BcfPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfPaletteColorMapper._());
      BcfPaletteColorValueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BcfPaletteColor';

  static String _$name(BcfPaletteColor v) => v.name;
  static const Field<BcfPaletteColor, String> _f$name = Field('name', _$name);
  static List<BcfPaletteColorValue> _$values(BcfPaletteColor v) => v.values;
  static const Field<BcfPaletteColor, List<BcfPaletteColorValue>> _f$values =
      Field('values', _$values);
  static int _$type(BcfPaletteColor v) => v.type;
  static const Field<BcfPaletteColor, int> _f$type = Field('type', _$type);
  static String? _$preferredModel(BcfPaletteColor v) => v.preferredModel;
  static const Field<BcfPaletteColor, String> _f$preferredModel = Field(
    'preferredModel',
    _$preferredModel,
    opt: true,
  );

  @override
  final MappableFields<BcfPaletteColor> fields = const {
    #name: _f$name,
    #values: _f$values,
    #type: _f$type,
    #preferredModel: _f$preferredModel,
  };

  static BcfPaletteColor _instantiate(DecodingData data) {
    return BcfPaletteColor(
      name: data.dec(_f$name),
      values: data.dec(_f$values),
      type: data.dec(_f$type),
      preferredModel: data.dec(_f$preferredModel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcfPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcfPaletteColor>(map);
  }

  static BcfPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<BcfPaletteColor>(json);
  }
}

mixin BcfPaletteColorMappable {
  String toJson() {
    return BcfPaletteColorMapper.ensureInitialized()
        .encodeJson<BcfPaletteColor>(this as BcfPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return BcfPaletteColorMapper.ensureInitialized().encodeMap<BcfPaletteColor>(
      this as BcfPaletteColor,
    );
  }

  BcfPaletteColorCopyWith<BcfPaletteColor, BcfPaletteColor, BcfPaletteColor>
  get copyWith =>
      _BcfPaletteColorCopyWithImpl<BcfPaletteColor, BcfPaletteColor>(
        this as BcfPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcfPaletteColorMapper.ensureInitialized().stringifyValue(
      this as BcfPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcfPaletteColorMapper.ensureInitialized().equalsValue(
      this as BcfPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return BcfPaletteColorMapper.ensureInitialized().hashValue(
      this as BcfPaletteColor,
    );
  }
}

extension BcfPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcfPaletteColor, $Out> {
  BcfPaletteColorCopyWith<$R, BcfPaletteColor, $Out> get $asBcfPaletteColor =>
      $base.as((v, t, t2) => _BcfPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcfPaletteColorCopyWith<$R, $In extends BcfPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    BcfPaletteColorValue,
    BcfPaletteColorValueCopyWith<$R, BcfPaletteColorValue, BcfPaletteColorValue>
  >
  get values;
  $R call({
    String? name,
    List<BcfPaletteColorValue>? values,
    int? type,
    String? preferredModel,
  });
  BcfPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BcfPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcfPaletteColor, $Out>
    implements BcfPaletteColorCopyWith<$R, BcfPaletteColor, $Out> {
  _BcfPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcfPaletteColor> $mapper =
      BcfPaletteColorMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    BcfPaletteColorValue,
    BcfPaletteColorValueCopyWith<$R, BcfPaletteColorValue, BcfPaletteColorValue>
  >
  get values => ListCopyWith(
    $value.values,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(values: v),
  );
  @override
  $R call({
    String? name,
    List<BcfPaletteColorValue>? values,
    int? type,
    Object? preferredModel = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (values != null) #values: values,
      if (type != null) #type: type,
      if (preferredModel != $none) #preferredModel: preferredModel,
    }),
  );
  @override
  BcfPaletteColor $make(CopyWithData data) => BcfPaletteColor(
    name: data.get(#name, or: $value.name),
    values: data.get(#values, or: $value.values),
    type: data.get(#type, or: $value.type),
    preferredModel: data.get(#preferredModel, or: $value.preferredModel),
  );

  @override
  BcfPaletteColorCopyWith<$R2, BcfPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcfPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BcfPaletteMapper extends ClassMapperBase<BcfPalette> {
  BcfPaletteMapper._();

  static BcfPaletteMapper? _instance;
  static BcfPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcfPaletteMapper._());
      BcfNamesFormatMapper.ensureInitialized();
      BcfPaletteTypeMapper.ensureInitialized();
      BcfColorModelMapper.ensureInitialized();
      BcfHiFiInkMapper.ensureInitialized();
      BcfPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BcfPalette';

  static String _$version(BcfPalette v) => v.version;
  static const Field<BcfPalette, String> _f$version = Field(
    'version',
    _$version,
  );
  static String _$name(BcfPalette v) => v.name;
  static const Field<BcfPalette, String> _f$name = Field('name', _$name);
  static String _$libraryVersion(BcfPalette v) => v.libraryVersion;
  static const Field<BcfPalette, String> _f$libraryVersion = Field(
    'libraryVersion',
    _$libraryVersion,
  );
  static String _$copyright(BcfPalette v) => v.copyright;
  static const Field<BcfPalette, String> _f$copyright = Field(
    'copyright',
    _$copyright,
  );
  static String _$description(BcfPalette v) => v.description;
  static const Field<BcfPalette, String> _f$description = Field(
    'description',
    _$description,
  );
  static BcfNamesFormat _$namesFormat(BcfPalette v) => v.namesFormat;
  static const Field<BcfPalette, BcfNamesFormat> _f$namesFormat = Field(
    'namesFormat',
    _$namesFormat,
  );
  static int _$rows(BcfPalette v) => v.rows;
  static const Field<BcfPalette, int> _f$rows = Field('rows', _$rows);
  static int _$columns(BcfPalette v) => v.columns;
  static const Field<BcfPalette, int> _f$columns = Field('columns', _$columns);
  static String _$prefix(BcfPalette v) => v.prefix;
  static const Field<BcfPalette, String> _f$prefix = Field('prefix', _$prefix);
  static String _$suffix(BcfPalette v) => v.suffix;
  static const Field<BcfPalette, String> _f$suffix = Field('suffix', _$suffix);
  static BcfPaletteType _$type(BcfPalette v) => v.type;
  static const Field<BcfPalette, BcfPaletteType> _f$type = Field(
    'type',
    _$type,
  );
  static List<BcfColorModel> _$models(BcfPalette v) => v.models;
  static const Field<BcfPalette, List<BcfColorModel>> _f$models = Field(
    'models',
    _$models,
  );
  static String _$preferredModel(BcfPalette v) => v.preferredModel;
  static const Field<BcfPalette, String> _f$preferredModel = Field(
    'preferredModel',
    _$preferredModel,
  );
  static List<BcfHiFiInk> _$inks(BcfPalette v) => v.inks;
  static const Field<BcfPalette, List<BcfHiFiInk>> _f$inks = Field(
    'inks',
    _$inks,
    opt: true,
    def: const [],
  );
  static List<BcfPaletteColor> _$colors(BcfPalette v) => v.colors;
  static const Field<BcfPalette, List<BcfPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<BcfPalette> fields = const {
    #version: _f$version,
    #name: _f$name,
    #libraryVersion: _f$libraryVersion,
    #copyright: _f$copyright,
    #description: _f$description,
    #namesFormat: _f$namesFormat,
    #rows: _f$rows,
    #columns: _f$columns,
    #prefix: _f$prefix,
    #suffix: _f$suffix,
    #type: _f$type,
    #models: _f$models,
    #preferredModel: _f$preferredModel,
    #inks: _f$inks,
    #colors: _f$colors,
  };

  static BcfPalette _instantiate(DecodingData data) {
    return BcfPalette(
      version: data.dec(_f$version),
      name: data.dec(_f$name),
      libraryVersion: data.dec(_f$libraryVersion),
      copyright: data.dec(_f$copyright),
      description: data.dec(_f$description),
      namesFormat: data.dec(_f$namesFormat),
      rows: data.dec(_f$rows),
      columns: data.dec(_f$columns),
      prefix: data.dec(_f$prefix),
      suffix: data.dec(_f$suffix),
      type: data.dec(_f$type),
      models: data.dec(_f$models),
      preferredModel: data.dec(_f$preferredModel),
      inks: data.dec(_f$inks),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcfPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcfPalette>(map);
  }

  static BcfPalette fromJson(String json) {
    return ensureInitialized().decodeJson<BcfPalette>(json);
  }
}

mixin BcfPaletteMappable {
  String toJson() {
    return BcfPaletteMapper.ensureInitialized().encodeJson<BcfPalette>(
      this as BcfPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return BcfPaletteMapper.ensureInitialized().encodeMap<BcfPalette>(
      this as BcfPalette,
    );
  }

  BcfPaletteCopyWith<BcfPalette, BcfPalette, BcfPalette> get copyWith =>
      _BcfPaletteCopyWithImpl<BcfPalette, BcfPalette>(
        this as BcfPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcfPaletteMapper.ensureInitialized().stringifyValue(
      this as BcfPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcfPaletteMapper.ensureInitialized().equalsValue(
      this as BcfPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return BcfPaletteMapper.ensureInitialized().hashValue(this as BcfPalette);
  }
}

extension BcfPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcfPalette, $Out> {
  BcfPaletteCopyWith<$R, BcfPalette, $Out> get $asBcfPalette =>
      $base.as((v, t, t2) => _BcfPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcfPaletteCopyWith<$R, $In extends BcfPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    BcfColorModel,
    ObjectCopyWith<$R, BcfColorModel, BcfColorModel>
  >
  get models;
  ListCopyWith<$R, BcfHiFiInk, BcfHiFiInkCopyWith<$R, BcfHiFiInk, BcfHiFiInk>>
  get inks;
  ListCopyWith<
    $R,
    BcfPaletteColor,
    BcfPaletteColorCopyWith<$R, BcfPaletteColor, BcfPaletteColor>
  >
  get colors;
  $R call({
    String? version,
    String? name,
    String? libraryVersion,
    String? copyright,
    String? description,
    BcfNamesFormat? namesFormat,
    int? rows,
    int? columns,
    String? prefix,
    String? suffix,
    BcfPaletteType? type,
    List<BcfColorModel>? models,
    String? preferredModel,
    List<BcfHiFiInk>? inks,
    List<BcfPaletteColor>? colors,
  });
  BcfPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BcfPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcfPalette, $Out>
    implements BcfPaletteCopyWith<$R, BcfPalette, $Out> {
  _BcfPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcfPalette> $mapper =
      BcfPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    BcfColorModel,
    ObjectCopyWith<$R, BcfColorModel, BcfColorModel>
  >
  get models => ListCopyWith(
    $value.models,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(models: v),
  );
  @override
  ListCopyWith<$R, BcfHiFiInk, BcfHiFiInkCopyWith<$R, BcfHiFiInk, BcfHiFiInk>>
  get inks => ListCopyWith(
    $value.inks,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(inks: v),
  );
  @override
  ListCopyWith<
    $R,
    BcfPaletteColor,
    BcfPaletteColorCopyWith<$R, BcfPaletteColor, BcfPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    String? version,
    String? name,
    String? libraryVersion,
    String? copyright,
    String? description,
    BcfNamesFormat? namesFormat,
    int? rows,
    int? columns,
    String? prefix,
    String? suffix,
    BcfPaletteType? type,
    List<BcfColorModel>? models,
    String? preferredModel,
    List<BcfHiFiInk>? inks,
    List<BcfPaletteColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (version != null) #version: version,
      if (name != null) #name: name,
      if (libraryVersion != null) #libraryVersion: libraryVersion,
      if (copyright != null) #copyright: copyright,
      if (description != null) #description: description,
      if (namesFormat != null) #namesFormat: namesFormat,
      if (rows != null) #rows: rows,
      if (columns != null) #columns: columns,
      if (prefix != null) #prefix: prefix,
      if (suffix != null) #suffix: suffix,
      if (type != null) #type: type,
      if (models != null) #models: models,
      if (preferredModel != null) #preferredModel: preferredModel,
      if (inks != null) #inks: inks,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  BcfPalette $make(CopyWithData data) => BcfPalette(
    version: data.get(#version, or: $value.version),
    name: data.get(#name, or: $value.name),
    libraryVersion: data.get(#libraryVersion, or: $value.libraryVersion),
    copyright: data.get(#copyright, or: $value.copyright),
    description: data.get(#description, or: $value.description),
    namesFormat: data.get(#namesFormat, or: $value.namesFormat),
    rows: data.get(#rows, or: $value.rows),
    columns: data.get(#columns, or: $value.columns),
    prefix: data.get(#prefix, or: $value.prefix),
    suffix: data.get(#suffix, or: $value.suffix),
    type: data.get(#type, or: $value.type),
    models: data.get(#models, or: $value.models),
    preferredModel: data.get(#preferredModel, or: $value.preferredModel),
    inks: data.get(#inks, or: $value.inks),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  BcfPaletteCopyWith<$R2, BcfPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcfPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
