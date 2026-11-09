// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cpl.dart';

class CplVersionMapper extends EnumMapper<CplVersion> {
  CplVersionMapper._();

  static CplVersionMapper? _instance;
  static CplVersionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CplVersionMapper._());
    }
    return _instance!;
  }

  static CplVersion fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CplVersion decode(dynamic value) {
    switch (value) {
      case r'ccbc':
        return CplVersion.ccbc;
      case r'ccdc':
        return CplVersion.ccdc;
      case r'cdbc':
        return CplVersion.cdbc;
      case r'cddc':
        return CplVersion.cddc;
      case r'dddc':
        return CplVersion.dddc;
      case r'cddd':
        return CplVersion.cddd;
      case r'dcdc':
        return CplVersion.dcdc;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CplVersion self) {
    switch (self) {
      case CplVersion.ccbc:
        return r'ccbc';
      case CplVersion.ccdc:
        return r'ccdc';
      case CplVersion.cdbc:
        return r'cdbc';
      case CplVersion.cddc:
        return r'cddc';
      case CplVersion.dddc:
        return r'dddc';
      case CplVersion.cddd:
        return r'cddd';
      case CplVersion.dcdc:
        return r'dcdc';
    }
  }
}

extension CplVersionMapperExtension on CplVersion {
  String toValue() {
    CplVersionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CplVersion>(this) as String;
  }
}

class CplPaletteColorMapper extends ClassMapperBase<CplPaletteColor> {
  CplPaletteColorMapper._();

  static CplPaletteColorMapper? _instance;
  static CplPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CplPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CplPaletteColor';

  static int? _$id(CplPaletteColor v) => v.id;
  static const Field<CplPaletteColor, int> _f$id = Field('id', _$id, opt: true);
  static int _$model(CplPaletteColor v) => v.model;
  static const Field<CplPaletteColor, int> _f$model = Field('model', _$model);
  static int _$type(CplPaletteColor v) => v.type;
  static const Field<CplPaletteColor, int> _f$type = Field('type', _$type);
  static List<int> _$values(CplPaletteColor v) => v.values;
  static const Field<CplPaletteColor, List<int>> _f$values = Field(
    'values',
    _$values,
  );
  static int? _$secondModel(CplPaletteColor v) => v.secondModel;
  static const Field<CplPaletteColor, int> _f$secondModel = Field(
    'secondModel',
    _$secondModel,
    opt: true,
  );
  static int? _$secondType(CplPaletteColor v) => v.secondType;
  static const Field<CplPaletteColor, int> _f$secondType = Field(
    'secondType',
    _$secondType,
    opt: true,
  );
  static List<int>? _$secondValues(CplPaletteColor v) => v.secondValues;
  static const Field<CplPaletteColor, List<int>> _f$secondValues = Field(
    'secondValues',
    _$secondValues,
    opt: true,
  );
  static String _$name(CplPaletteColor v) => v.name;
  static const Field<CplPaletteColor, String> _f$name = Field('name', _$name);
  static int? _$row(CplPaletteColor v) => v.row;
  static const Field<CplPaletteColor, int> _f$row = Field(
    'row',
    _$row,
    opt: true,
  );
  static int? _$column(CplPaletteColor v) => v.column;
  static const Field<CplPaletteColor, int> _f$column = Field(
    'column',
    _$column,
    opt: true,
  );
  static int? _$unknown(CplPaletteColor v) => v.unknown;
  static const Field<CplPaletteColor, int> _f$unknown = Field(
    'unknown',
    _$unknown,
    opt: true,
  );

  @override
  final MappableFields<CplPaletteColor> fields = const {
    #id: _f$id,
    #model: _f$model,
    #type: _f$type,
    #values: _f$values,
    #secondModel: _f$secondModel,
    #secondType: _f$secondType,
    #secondValues: _f$secondValues,
    #name: _f$name,
    #row: _f$row,
    #column: _f$column,
    #unknown: _f$unknown,
  };

  static CplPaletteColor _instantiate(DecodingData data) {
    return CplPaletteColor(
      id: data.dec(_f$id),
      model: data.dec(_f$model),
      type: data.dec(_f$type),
      values: data.dec(_f$values),
      secondModel: data.dec(_f$secondModel),
      secondType: data.dec(_f$secondType),
      secondValues: data.dec(_f$secondValues),
      name: data.dec(_f$name),
      row: data.dec(_f$row),
      column: data.dec(_f$column),
      unknown: data.dec(_f$unknown),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CplPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CplPaletteColor>(map);
  }

  static CplPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<CplPaletteColor>(json);
  }
}

mixin CplPaletteColorMappable {
  String toJson() {
    return CplPaletteColorMapper.ensureInitialized()
        .encodeJson<CplPaletteColor>(this as CplPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return CplPaletteColorMapper.ensureInitialized().encodeMap<CplPaletteColor>(
      this as CplPaletteColor,
    );
  }

  CplPaletteColorCopyWith<CplPaletteColor, CplPaletteColor, CplPaletteColor>
  get copyWith =>
      _CplPaletteColorCopyWithImpl<CplPaletteColor, CplPaletteColor>(
        this as CplPaletteColor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CplPaletteColorMapper.ensureInitialized().stringifyValue(
      this as CplPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return CplPaletteColorMapper.ensureInitialized().equalsValue(
      this as CplPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return CplPaletteColorMapper.ensureInitialized().hashValue(
      this as CplPaletteColor,
    );
  }
}

extension CplPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CplPaletteColor, $Out> {
  CplPaletteColorCopyWith<$R, CplPaletteColor, $Out> get $asCplPaletteColor =>
      $base.as((v, t, t2) => _CplPaletteColorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CplPaletteColorCopyWith<$R, $In extends CplPaletteColor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get secondValues;
  $R call({
    int? id,
    int? model,
    int? type,
    List<int>? values,
    int? secondModel,
    int? secondType,
    List<int>? secondValues,
    String? name,
    int? row,
    int? column,
    int? unknown,
  });
  CplPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CplPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CplPaletteColor, $Out>
    implements CplPaletteColorCopyWith<$R, CplPaletteColor, $Out> {
  _CplPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CplPaletteColor> $mapper =
      CplPaletteColorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get values =>
      ListCopyWith(
        $value.values,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(values: v),
      );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get secondValues =>
      $value.secondValues != null
          ? ListCopyWith(
            $value.secondValues!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(secondValues: v),
          )
          : null;
  @override
  $R call({
    Object? id = $none,
    int? model,
    int? type,
    List<int>? values,
    Object? secondModel = $none,
    Object? secondType = $none,
    Object? secondValues = $none,
    String? name,
    Object? row = $none,
    Object? column = $none,
    Object? unknown = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (model != null) #model: model,
      if (type != null) #type: type,
      if (values != null) #values: values,
      if (secondModel != $none) #secondModel: secondModel,
      if (secondType != $none) #secondType: secondType,
      if (secondValues != $none) #secondValues: secondValues,
      if (name != null) #name: name,
      if (row != $none) #row: row,
      if (column != $none) #column: column,
      if (unknown != $none) #unknown: unknown,
    }),
  );
  @override
  CplPaletteColor $make(CopyWithData data) => CplPaletteColor(
    id: data.get(#id, or: $value.id),
    model: data.get(#model, or: $value.model),
    type: data.get(#type, or: $value.type),
    values: data.get(#values, or: $value.values),
    secondModel: data.get(#secondModel, or: $value.secondModel),
    secondType: data.get(#secondType, or: $value.secondType),
    secondValues: data.get(#secondValues, or: $value.secondValues),
    name: data.get(#name, or: $value.name),
    row: data.get(#row, or: $value.row),
    column: data.get(#column, or: $value.column),
    unknown: data.get(#unknown, or: $value.unknown),
  );

  @override
  CplPaletteColorCopyWith<$R2, CplPaletteColor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CplPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CplPaletteMapper extends ClassMapperBase<CplPalette> {
  CplPaletteMapper._();

  static CplPaletteMapper? _instance;
  static CplPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CplPaletteMapper._());
      CplVersionMapper.ensureInitialized();
      CplPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CplPalette';

  static CplVersion _$version(CplPalette v) => v.version;
  static const Field<CplPalette, CplVersion> _f$version = Field(
    'version',
    _$version,
  );
  static String _$name(CplPalette v) => v.name;
  static const Field<CplPalette, String> _f$name = Field('name', _$name);
  static int _$type(CplPalette v) => v.type;
  static const Field<CplPalette, int> _f$type = Field('type', _$type);
  static List<CplPaletteColor> _$colors(CplPalette v) => v.colors;
  static const Field<CplPalette, List<CplPaletteColor>> _f$colors = Field(
    'colors',
    _$colors,
  );
  static List<int> _$specialInks(CplPalette v) => v.specialInks;
  static const Field<CplPalette, List<int>> _f$specialInks = Field(
    'specialInks',
    _$specialInks,
    opt: true,
    def: const [],
  );
  static List<int> _$uiColorModels(CplPalette v) => v.uiColorModels;
  static const Field<CplPalette, List<int>> _f$uiColorModels = Field(
    'uiColorModels',
    _$uiColorModels,
    opt: true,
    def: const [],
  );
  static int? _$displayColumns(CplPalette v) => v.displayColumns;
  static const Field<CplPalette, int> _f$displayColumns = Field(
    'displayColumns',
    _$displayColumns,
    opt: true,
  );
  static int? _$displayRows(CplPalette v) => v.displayRows;
  static const Field<CplPalette, int> _f$displayRows = Field(
    'displayRows',
    _$displayRows,
    opt: true,
  );
  static int? _$totalColumns(CplPalette v) => v.totalColumns;
  static const Field<CplPalette, int> _f$totalColumns = Field(
    'totalColumns',
    _$totalColumns,
    opt: true,
  );
  static int? _$totalRows(CplPalette v) => v.totalRows;
  static const Field<CplPalette, int> _f$totalRows = Field(
    'totalRows',
    _$totalRows,
    opt: true,
  );

  @override
  final MappableFields<CplPalette> fields = const {
    #version: _f$version,
    #name: _f$name,
    #type: _f$type,
    #colors: _f$colors,
    #specialInks: _f$specialInks,
    #uiColorModels: _f$uiColorModels,
    #displayColumns: _f$displayColumns,
    #displayRows: _f$displayRows,
    #totalColumns: _f$totalColumns,
    #totalRows: _f$totalRows,
  };

  static CplPalette _instantiate(DecodingData data) {
    return CplPalette(
      version: data.dec(_f$version),
      name: data.dec(_f$name),
      type: data.dec(_f$type),
      colors: data.dec(_f$colors),
      specialInks: data.dec(_f$specialInks),
      uiColorModels: data.dec(_f$uiColorModels),
      displayColumns: data.dec(_f$displayColumns),
      displayRows: data.dec(_f$displayRows),
      totalColumns: data.dec(_f$totalColumns),
      totalRows: data.dec(_f$totalRows),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CplPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CplPalette>(map);
  }

  static CplPalette fromJson(String json) {
    return ensureInitialized().decodeJson<CplPalette>(json);
  }
}

mixin CplPaletteMappable {
  String toJson() {
    return CplPaletteMapper.ensureInitialized().encodeJson<CplPalette>(
      this as CplPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return CplPaletteMapper.ensureInitialized().encodeMap<CplPalette>(
      this as CplPalette,
    );
  }

  CplPaletteCopyWith<CplPalette, CplPalette, CplPalette> get copyWith =>
      _CplPaletteCopyWithImpl<CplPalette, CplPalette>(
        this as CplPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CplPaletteMapper.ensureInitialized().stringifyValue(
      this as CplPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return CplPaletteMapper.ensureInitialized().equalsValue(
      this as CplPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return CplPaletteMapper.ensureInitialized().hashValue(this as CplPalette);
  }
}

extension CplPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CplPalette, $Out> {
  CplPaletteCopyWith<$R, CplPalette, $Out> get $asCplPalette =>
      $base.as((v, t, t2) => _CplPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CplPaletteCopyWith<$R, $In extends CplPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    CplPaletteColor,
    CplPaletteColorCopyWith<$R, CplPaletteColor, CplPaletteColor>
  >
  get colors;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get specialInks;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get uiColorModels;
  $R call({
    CplVersion? version,
    String? name,
    int? type,
    List<CplPaletteColor>? colors,
    List<int>? specialInks,
    List<int>? uiColorModels,
    int? displayColumns,
    int? displayRows,
    int? totalColumns,
    int? totalRows,
  });
  CplPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CplPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CplPalette, $Out>
    implements CplPaletteCopyWith<$R, CplPalette, $Out> {
  _CplPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CplPalette> $mapper =
      CplPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    CplPaletteColor,
    CplPaletteColorCopyWith<$R, CplPaletteColor, CplPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get specialInks =>
      ListCopyWith(
        $value.specialInks,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(specialInks: v),
      );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get uiColorModels =>
      ListCopyWith(
        $value.uiColorModels,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(uiColorModels: v),
      );
  @override
  $R call({
    CplVersion? version,
    String? name,
    int? type,
    List<CplPaletteColor>? colors,
    List<int>? specialInks,
    List<int>? uiColorModels,
    Object? displayColumns = $none,
    Object? displayRows = $none,
    Object? totalColumns = $none,
    Object? totalRows = $none,
  }) => $apply(
    FieldCopyWithData({
      if (version != null) #version: version,
      if (name != null) #name: name,
      if (type != null) #type: type,
      if (colors != null) #colors: colors,
      if (specialInks != null) #specialInks: specialInks,
      if (uiColorModels != null) #uiColorModels: uiColorModels,
      if (displayColumns != $none) #displayColumns: displayColumns,
      if (displayRows != $none) #displayRows: displayRows,
      if (totalColumns != $none) #totalColumns: totalColumns,
      if (totalRows != $none) #totalRows: totalRows,
    }),
  );
  @override
  CplPalette $make(CopyWithData data) => CplPalette(
    version: data.get(#version, or: $value.version),
    name: data.get(#name, or: $value.name),
    type: data.get(#type, or: $value.type),
    colors: data.get(#colors, or: $value.colors),
    specialInks: data.get(#specialInks, or: $value.specialInks),
    uiColorModels: data.get(#uiColorModels, or: $value.uiColorModels),
    displayColumns: data.get(#displayColumns, or: $value.displayColumns),
    displayRows: data.get(#displayRows, or: $value.displayRows),
    totalColumns: data.get(#totalColumns, or: $value.totalColumns),
    totalRows: data.get(#totalRows, or: $value.totalRows),
  );

  @override
  CplPaletteCopyWith<$R2, CplPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CplPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
