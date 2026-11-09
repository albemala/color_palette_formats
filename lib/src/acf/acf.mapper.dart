// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'acf.dart';

class AcfColorModelMapper extends EnumMapper<AcfColorModel> {
  AcfColorModelMapper._();

  static AcfColorModelMapper? _instance;
  static AcfColorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfColorModelMapper._());
    }
    return _instance!;
  }

  static AcfColorModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AcfColorModel decode(dynamic value) {
    switch (value) {
      case r'rgb':
        return AcfColorModel.rgb;
      case r'cmyk':
        return AcfColorModel.cmyk;
      case r'lab':
        return AcfColorModel.lab;
      case r'hifi':
        return AcfColorModel.hifi;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AcfColorModel self) {
    switch (self) {
      case AcfColorModel.rgb:
        return r'rgb';
      case AcfColorModel.cmyk:
        return r'cmyk';
      case AcfColorModel.lab:
        return r'lab';
      case AcfColorModel.hifi:
        return r'hifi';
    }
  }
}

extension AcfColorModelMapperExtension on AcfColorModel {
  String toValue() {
    AcfColorModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AcfColorModel>(this) as String;
  }
}

class AcfPaletteTypeMapper extends EnumMapper<AcfPaletteType> {
  AcfPaletteTypeMapper._();

  static AcfPaletteTypeMapper? _instance;
  static AcfPaletteTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfPaletteTypeMapper._());
    }
    return _instance!;
  }

  static AcfPaletteType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AcfPaletteType decode(dynamic value) {
    switch (value) {
      case r'hifi':
        return AcfPaletteType.hifi;
      case r'process':
        return AcfPaletteType.process;
      case r'spot':
        return AcfPaletteType.spot;
      case r'mixed':
        return AcfPaletteType.mixed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AcfPaletteType self) {
    switch (self) {
      case AcfPaletteType.hifi:
        return r'hifi';
      case AcfPaletteType.process:
        return r'process';
      case AcfPaletteType.spot:
        return r'spot';
      case AcfPaletteType.mixed:
        return r'mixed';
    }
  }
}

extension AcfPaletteTypeMapperExtension on AcfPaletteType {
  String toValue() {
    AcfPaletteTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AcfPaletteType>(this) as String;
  }
}

class AcfNamesFormatMapper extends EnumMapper<AcfNamesFormat> {
  AcfNamesFormatMapper._();

  static AcfNamesFormatMapper? _instance;
  static AcfNamesFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfNamesFormatMapper._());
    }
    return _instance!;
  }

  static AcfNamesFormat fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AcfNamesFormat decode(dynamic value) {
    switch (value) {
      case r'full':
        return AcfNamesFormat.full;
      case r'partial':
        return AcfNamesFormat.partial;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AcfNamesFormat self) {
    switch (self) {
      case AcfNamesFormat.full:
        return r'full';
      case AcfNamesFormat.partial:
        return r'partial';
    }
  }
}

extension AcfNamesFormatMapperExtension on AcfNamesFormat {
  String toValue() {
    AcfNamesFormatMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AcfNamesFormat>(this) as String;
  }
}

class AcfPaletteColorValueMapper extends ClassMapperBase<AcfPaletteColorValue> {
  AcfPaletteColorValueMapper._();

  static AcfPaletteColorValueMapper? _instance;
  static AcfPaletteColorValueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfPaletteColorValueMapper._());
      AcfColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AcfPaletteColorValue';

  static AcfColorModel _$model(AcfPaletteColorValue v) => v.model;
  static const Field<AcfPaletteColorValue, AcfColorModel> _f$model = Field(
    'model',
    _$model,
  );
  static List<int> _$values(AcfPaletteColorValue v) => v.values;
  static const Field<AcfPaletteColorValue, List<int>> _f$values = Field(
    'values',
    _$values,
  );

  @override
  final MappableFields<AcfPaletteColorValue> fields = const {
    #model: _f$model,
    #values: _f$values,
  };

  static AcfPaletteColorValue _instantiate(DecodingData data) {
    return AcfPaletteColorValue(
      model: data.dec(_f$model),
      values: data.dec(_f$values),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AcfPaletteColorValue fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AcfPaletteColorValue>(map);
  }

  static AcfPaletteColorValue fromJson(String json) {
    return ensureInitialized().decodeJson<AcfPaletteColorValue>(json);
  }
}

mixin AcfPaletteColorValueMappable {
  String toJson() {
    return AcfPaletteColorValueMapper.ensureInitialized()
        .encodeJson<AcfPaletteColorValue>(this as AcfPaletteColorValue);
  }

  Map<String, dynamic> toMap() {
    return AcfPaletteColorValueMapper.ensureInitialized()
        .encodeMap<AcfPaletteColorValue>(this as AcfPaletteColorValue);
  }

  AcfPaletteColorValueCopyWith<
    AcfPaletteColorValue,
    AcfPaletteColorValue,
    AcfPaletteColorValue
  >
  get copyWith => _AcfPaletteColorValueCopyWithImpl<
    AcfPaletteColorValue,
    AcfPaletteColorValue
  >(this as AcfPaletteColorValue, $identity, $identity);
  @override
  String toString() {
    return AcfPaletteColorValueMapper.ensureInitialized().stringifyValue(
      this as AcfPaletteColorValue,
    );
  }

  @override
  bool operator ==(Object other) {
    return AcfPaletteColorValueMapper.ensureInitialized().equalsValue(
      this as AcfPaletteColorValue,
      other,
    );
  }

  @override
  int get hashCode {
    return AcfPaletteColorValueMapper.ensureInitialized().hashValue(
      this as AcfPaletteColorValue,
    );
  }
}

extension AcfPaletteColorValueValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AcfPaletteColorValue, $Out> {
  AcfPaletteColorValueCopyWith<$R, AcfPaletteColorValue, $Out>
  get $asAcfPaletteColorValue => $base.as(
    (v, t, t2) => _AcfPaletteColorValueCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AcfPaletteColorValueCopyWith<
  $R,
  $In extends AcfPaletteColorValue,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values;
  $R call({AcfColorModel? model, List<int>? values});
  AcfPaletteColorValueCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AcfPaletteColorValueCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AcfPaletteColorValue, $Out>
    implements AcfPaletteColorValueCopyWith<$R, AcfPaletteColorValue, $Out> {
  _AcfPaletteColorValueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AcfPaletteColorValue> $mapper =
      AcfPaletteColorValueMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values =>
      ListCopyWith(
        $value.values,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(values: v),
      );
  @override
  $R call({AcfColorModel? model, List<int>? values}) => $apply(
    FieldCopyWithData({
      if (model != null) #model: model,
      if (values != null) #values: values,
    }),
  );
  @override
  AcfPaletteColorValue $make(CopyWithData data) => AcfPaletteColorValue(
    model: data.get(#model, or: $value.model),
    values: data.get(#values, or: $value.values),
  );

  @override
  AcfPaletteColorValueCopyWith<$R2, AcfPaletteColorValue, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AcfPaletteColorValueCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AcfPaletteColorMapper extends ClassMapperBase<AcfPaletteColor> {
  AcfPaletteColorMapper._();

  static AcfPaletteColorMapper? _instance;
  static AcfPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfPaletteColorMapper._());
      AcfPaletteColorValueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AcfPaletteColor';

  static String _$name(AcfPaletteColor v) => v.name;
  static const Field<AcfPaletteColor, String> _f$name = Field('name', _$name);
  static List<AcfPaletteColorValue> _$values(AcfPaletteColor v) => v.values;
  static const Field<AcfPaletteColor, List<AcfPaletteColorValue>> _f$values =
      Field('values', _$values);
  static String? _$type(AcfPaletteColor v) => v.type;
  static const Field<AcfPaletteColor, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );

  @override
  final MappableFields<AcfPaletteColor> fields = const {
    #name: _f$name,
    #values: _f$values,
    #type: _f$type,
  };

  static AcfPaletteColor _instantiate(DecodingData data) {
    return AcfPaletteColor(
      name: data.dec(_f$name),
      values: data.dec(_f$values),
      type: data.dec(_f$type),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AcfPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AcfPaletteColor>(map);
  }

  static AcfPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<AcfPaletteColor>(json);
  }
}

mixin AcfPaletteColorMappable {
  String toJson() {
    return AcfPaletteColorMapper.ensureInitialized()
        .encodeJson<AcfPaletteColor>(this as AcfPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return AcfPaletteColorMapper.ensureInitialized().encodeMap<AcfPaletteColor>(
      this as AcfPaletteColor,
    );
  }

  AcfPaletteColorCopyWith<AcfPaletteColor, AcfPaletteColor, AcfPaletteColor>
  get copyWith =>
      _AcfPaletteColorCopyWithImpl<AcfPaletteColor, AcfPaletteColor>(
        this as AcfPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AcfPaletteColorMapper.ensureInitialized().stringifyValue(
      this as AcfPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return AcfPaletteColorMapper.ensureInitialized().equalsValue(
      this as AcfPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return AcfPaletteColorMapper.ensureInitialized().hashValue(
      this as AcfPaletteColor,
    );
  }
}

extension AcfPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AcfPaletteColor, $Out> {
  AcfPaletteColorCopyWith<$R, AcfPaletteColor, $Out> get $asAcfPaletteColor =>
      $base.as((v, t, t2) => _AcfPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AcfPaletteColorCopyWith<$R, $In extends AcfPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    AcfPaletteColorValue,
    AcfPaletteColorValueCopyWith<$R, AcfPaletteColorValue, AcfPaletteColorValue>
  >
  get values;
  $R call({String? name, List<AcfPaletteColorValue>? values, String? type});
  AcfPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AcfPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AcfPaletteColor, $Out>
    implements AcfPaletteColorCopyWith<$R, AcfPaletteColor, $Out> {
  _AcfPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AcfPaletteColor> $mapper =
      AcfPaletteColorMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    AcfPaletteColorValue,
    AcfPaletteColorValueCopyWith<$R, AcfPaletteColorValue, AcfPaletteColorValue>
  >
  get values => ListCopyWith(
    $value.values,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(values: v),
  );
  @override
  $R call({
    String? name,
    List<AcfPaletteColorValue>? values,
    Object? type = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (values != null) #values: values,
      if (type != $none) #type: type,
    }),
  );
  @override
  AcfPaletteColor $make(CopyWithData data) => AcfPaletteColor(
    name: data.get(#name, or: $value.name),
    values: data.get(#values, or: $value.values),
    type: data.get(#type, or: $value.type),
  );

  @override
  AcfPaletteColorCopyWith<$R2, AcfPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AcfPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AcfPaletteMapper extends ClassMapperBase<AcfPalette> {
  AcfPaletteMapper._();

  static AcfPaletteMapper? _instance;
  static AcfPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AcfPaletteMapper._());
      AcfNamesFormatMapper.ensureInitialized();
      AcfPaletteTypeMapper.ensureInitialized();
      AcfColorModelMapper.ensureInitialized();
      AcfPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AcfPalette';

  static String _$version(AcfPalette v) => v.version;
  static const Field<AcfPalette, String> _f$version = Field(
    'version',
    _$version,
  );
  static String _$name(AcfPalette v) => v.name;
  static const Field<AcfPalette, String> _f$name = Field('name', _$name);
  static String _$libraryVersion(AcfPalette v) => v.libraryVersion;
  static const Field<AcfPalette, String> _f$libraryVersion = Field(
    'libraryVersion',
    _$libraryVersion,
  );
  static String _$copyright(AcfPalette v) => v.copyright;
  static const Field<AcfPalette, String> _f$copyright = Field(
    'copyright',
    _$copyright,
  );
  static String _$description(AcfPalette v) => v.description;
  static const Field<AcfPalette, String> _f$description = Field(
    'description',
    _$description,
  );
  static AcfNamesFormat _$namesFormat(AcfPalette v) => v.namesFormat;
  static const Field<AcfPalette, AcfNamesFormat> _f$namesFormat = Field(
    'namesFormat',
    _$namesFormat,
  );
  static int _$rows(AcfPalette v) => v.rows;
  static const Field<AcfPalette, int> _f$rows = Field('rows', _$rows);
  static int _$columns(AcfPalette v) => v.columns;
  static const Field<AcfPalette, int> _f$columns = Field('columns', _$columns);
  static String _$prefix(AcfPalette v) => v.prefix;
  static const Field<AcfPalette, String> _f$prefix = Field('prefix', _$prefix);
  static String _$suffix(AcfPalette v) => v.suffix;
  static const Field<AcfPalette, String> _f$suffix = Field('suffix', _$suffix);
  static AcfPaletteType _$type(AcfPalette v) => v.type;
  static const Field<AcfPalette, AcfPaletteType> _f$type = Field(
    'type',
    _$type,
  );
  static List<AcfColorModel> _$models(AcfPalette v) => v.models;
  static const Field<AcfPalette, List<AcfColorModel>> _f$models = Field(
    'models',
    _$models,
  );
  static String _$preferredModel(AcfPalette v) => v.preferredModel;
  static const Field<AcfPalette, String> _f$preferredModel = Field(
    'preferredModel',
    _$preferredModel,
  );
  static List<String> _$inks(AcfPalette v) => v.inks;
  static const Field<AcfPalette, List<String>> _f$inks = Field(
    'inks',
    _$inks,
    opt: true,
    def: const [],
  );
  static List<AcfPaletteColor> _$colors(AcfPalette v) => v.colors;
  static const Field<AcfPalette, List<AcfPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );

  @override
  final MappableFields<AcfPalette> fields = const {
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

  static AcfPalette _instantiate(DecodingData data) {
    return AcfPalette(
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

  static AcfPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AcfPalette>(map);
  }

  static AcfPalette fromJson(String json) {
    return ensureInitialized().decodeJson<AcfPalette>(json);
  }
}

mixin AcfPaletteMappable {
  String toJson() {
    return AcfPaletteMapper.ensureInitialized().encodeJson<AcfPalette>(
      this as AcfPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return AcfPaletteMapper.ensureInitialized().encodeMap<AcfPalette>(
      this as AcfPalette,
    );
  }

  AcfPaletteCopyWith<AcfPalette, AcfPalette, AcfPalette> get copyWith =>
      _AcfPaletteCopyWithImpl<AcfPalette, AcfPalette>(
        this as AcfPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AcfPaletteMapper.ensureInitialized().stringifyValue(
      this as AcfPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return AcfPaletteMapper.ensureInitialized().equalsValue(
      this as AcfPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return AcfPaletteMapper.ensureInitialized().hashValue(this as AcfPalette);
  }
}

extension AcfPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AcfPalette, $Out> {
  AcfPaletteCopyWith<$R, AcfPalette, $Out> get $asAcfPalette =>
      $base.as((v, t, t2) => _AcfPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AcfPaletteCopyWith<$R, $In extends AcfPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    AcfColorModel,
    ObjectCopyWith<$R, AcfColorModel, AcfColorModel>
  >
  get models;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get inks;
  ListCopyWith<
    $R,
    AcfPaletteColor,
    AcfPaletteColorCopyWith<$R, AcfPaletteColor, AcfPaletteColor>
  >
  get colors;
  $R call({
    String? version,
    String? name,
    String? libraryVersion,
    String? copyright,
    String? description,
    AcfNamesFormat? namesFormat,
    int? rows,
    int? columns,
    String? prefix,
    String? suffix,
    AcfPaletteType? type,
    List<AcfColorModel>? models,
    String? preferredModel,
    List<String>? inks,
    List<AcfPaletteColor>? colors,
  });
  AcfPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AcfPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AcfPalette, $Out>
    implements AcfPaletteCopyWith<$R, AcfPalette, $Out> {
  _AcfPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AcfPalette> $mapper =
      AcfPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    AcfColorModel,
    ObjectCopyWith<$R, AcfColorModel, AcfColorModel>
  >
  get models => ListCopyWith(
    $value.models,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(models: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get inks =>
      ListCopyWith(
        $value.inks,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(inks: v),
      );
  @override
  ListCopyWith<
    $R,
    AcfPaletteColor,
    AcfPaletteColorCopyWith<$R, AcfPaletteColor, AcfPaletteColor>
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
    AcfNamesFormat? namesFormat,
    int? rows,
    int? columns,
    String? prefix,
    String? suffix,
    AcfPaletteType? type,
    List<AcfColorModel>? models,
    String? preferredModel,
    List<String>? inks,
    List<AcfPaletteColor>? colors,
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
  AcfPalette $make(CopyWithData data) => AcfPalette(
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
  AcfPaletteCopyWith<$R2, AcfPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AcfPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
