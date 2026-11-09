// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'painter.dart';

class PainterPaletteColorMapper extends ClassMapperBase<PainterPaletteColor> {
  PainterPaletteColorMapper._();

  static PainterPaletteColorMapper? _instance;
  static PainterPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PainterPaletteColorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PainterPaletteColor';

  static int _$red(PainterPaletteColor v) => v.red;
  static const Field<PainterPaletteColor, int> _f$red = Field('red', _$red);
  static int _$green(PainterPaletteColor v) => v.green;
  static const Field<PainterPaletteColor, int> _f$green = Field(
    'green',
    _$green,
  );
  static int _$blue(PainterPaletteColor v) => v.blue;
  static const Field<PainterPaletteColor, int> _f$blue = Field('blue', _$blue);
  static double _$hv(PainterPaletteColor v) => v.hv;
  static const Field<PainterPaletteColor, double> _f$hv = Field('hv', _$hv);
  static double _$sv(PainterPaletteColor v) => v.sv;
  static const Field<PainterPaletteColor, double> _f$sv = Field('sv', _$sv);
  static double _$vv(PainterPaletteColor v) => v.vv;
  static const Field<PainterPaletteColor, double> _f$vv = Field('vv', _$vv);
  static String _$name(PainterPaletteColor v) => v.name;
  static const Field<PainterPaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );

  @override
  final MappableFields<PainterPaletteColor> fields = const {
    #red: _f$red,
    #green: _f$green,
    #blue: _f$blue,
    #hv: _f$hv,
    #sv: _f$sv,
    #vv: _f$vv,
    #name: _f$name,
  };

  static PainterPaletteColor _instantiate(DecodingData data) {
    return PainterPaletteColor(
      red: data.dec(_f$red),
      green: data.dec(_f$green),
      blue: data.dec(_f$blue),
      hv: data.dec(_f$hv),
      sv: data.dec(_f$sv),
      vv: data.dec(_f$vv),
      name: data.dec(_f$name),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PainterPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PainterPaletteColor>(map);
  }

  static PainterPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<PainterPaletteColor>(json);
  }
}

mixin PainterPaletteColorMappable {
  String toJson() {
    return PainterPaletteColorMapper.ensureInitialized()
        .encodeJson<PainterPaletteColor>(this as PainterPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return PainterPaletteColorMapper.ensureInitialized()
        .encodeMap<PainterPaletteColor>(this as PainterPaletteColor);
  }

  PainterPaletteColorCopyWith<
    PainterPaletteColor,
    PainterPaletteColor,
    PainterPaletteColor
  >
  get copyWith => _PainterPaletteColorCopyWithImpl<
    PainterPaletteColor,
    PainterPaletteColor
  >(this as PainterPaletteColor, $identity, $identity);
  @override
  String toString() {
    return PainterPaletteColorMapper.ensureInitialized().stringifyValue(
      this as PainterPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return PainterPaletteColorMapper.ensureInitialized().equalsValue(
      this as PainterPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return PainterPaletteColorMapper.ensureInitialized().hashValue(
      this as PainterPaletteColor,
    );
  }
}

extension PainterPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PainterPaletteColor, $Out> {
  PainterPaletteColorCopyWith<$R, PainterPaletteColor, $Out>
  get $asPainterPaletteColor => $base.as(
    (v, t, t2) => _PainterPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PainterPaletteColorCopyWith<
  $R,
  $In extends PainterPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? red,
    int? green,
    int? blue,
    double? hv,
    double? sv,
    double? vv,
    String? name,
  });
  PainterPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PainterPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PainterPaletteColor, $Out>
    implements PainterPaletteColorCopyWith<$R, PainterPaletteColor, $Out> {
  _PainterPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PainterPaletteColor> $mapper =
      PainterPaletteColorMapper.ensureInitialized();
  @override
  $R call({
    int? red,
    int? green,
    int? blue,
    double? hv,
    double? sv,
    double? vv,
    String? name,
  }) => $apply(
    FieldCopyWithData({
      if (red != null) #red: red,
      if (green != null) #green: green,
      if (blue != null) #blue: blue,
      if (hv != null) #hv: hv,
      if (sv != null) #sv: sv,
      if (vv != null) #vv: vv,
      if (name != null) #name: name,
    }),
  );
  @override
  PainterPaletteColor $make(CopyWithData data) => PainterPaletteColor(
    red: data.get(#red, or: $value.red),
    green: data.get(#green, or: $value.green),
    blue: data.get(#blue, or: $value.blue),
    hv: data.get(#hv, or: $value.hv),
    sv: data.get(#sv, or: $value.sv),
    vv: data.get(#vv, or: $value.vv),
    name: data.get(#name, or: $value.name),
  );

  @override
  PainterPaletteColorCopyWith<$R2, PainterPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PainterPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PainterPaletteMapper extends ClassMapperBase<PainterPalette> {
  PainterPaletteMapper._();

  static PainterPaletteMapper? _instance;
  static PainterPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PainterPaletteMapper._());
      PainterPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PainterPalette';

  static int _$rows(PainterPalette v) => v.rows;
  static const Field<PainterPalette, int> _f$rows = Field('rows', _$rows);
  static int _$columns(PainterPalette v) => v.columns;
  static const Field<PainterPalette, int> _f$columns = Field(
    'columns',
    _$columns,
  );
  static int _$width(PainterPalette v) => v.width;
  static const Field<PainterPalette, int> _f$width = Field('width', _$width);
  static int _$height(PainterPalette v) => v.height;
  static const Field<PainterPalette, int> _f$height = Field('height', _$height);
  static int _$textHeight(PainterPalette v) => v.textHeight;
  static const Field<PainterPalette, int> _f$textHeight = Field(
    'textHeight',
    _$textHeight,
  );
  static int _$spacing(PainterPalette v) => v.spacing;
  static const Field<PainterPalette, int> _f$spacing = Field(
    'spacing',
    _$spacing,
  );
  static List<PainterPaletteColor> _$colors(PainterPalette v) => v.colors;
  static const Field<PainterPalette, List<PainterPaletteColor>> _f$colors =
      Field('colors', _$colors);

  @override
  final MappableFields<PainterPalette> fields = const {
    #rows: _f$rows,
    #columns: _f$columns,
    #width: _f$width,
    #height: _f$height,
    #textHeight: _f$textHeight,
    #spacing: _f$spacing,
    #colors: _f$colors,
  };

  static PainterPalette _instantiate(DecodingData data) {
    return PainterPalette(
      rows: data.dec(_f$rows),
      columns: data.dec(_f$columns),
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      textHeight: data.dec(_f$textHeight),
      spacing: data.dec(_f$spacing),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PainterPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PainterPalette>(map);
  }

  static PainterPalette fromJson(String json) {
    return ensureInitialized().decodeJson<PainterPalette>(json);
  }
}

mixin PainterPaletteMappable {
  String toJson() {
    return PainterPaletteMapper.ensureInitialized().encodeJson<PainterPalette>(
      this as PainterPalette,
    );
  }

  Map<String, dynamic> toMap() {
    return PainterPaletteMapper.ensureInitialized().encodeMap<PainterPalette>(
      this as PainterPalette,
    );
  }

  PainterPaletteCopyWith<PainterPalette, PainterPalette, PainterPalette>
  get copyWith => _PainterPaletteCopyWithImpl<PainterPalette, PainterPalette>(
    this as PainterPalette,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PainterPaletteMapper.ensureInitialized().stringifyValue(
      this as PainterPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return PainterPaletteMapper.ensureInitialized().equalsValue(
      this as PainterPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return PainterPaletteMapper.ensureInitialized().hashValue(
      this as PainterPalette,
    );
  }
}

extension PainterPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PainterPalette, $Out> {
  PainterPaletteCopyWith<$R, PainterPalette, $Out> get $asPainterPalette =>
      $base.as((v, t, t2) => _PainterPaletteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PainterPaletteCopyWith<$R, $In extends PainterPalette, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    PainterPaletteColor,
    PainterPaletteColorCopyWith<$R, PainterPaletteColor, PainterPaletteColor>
  >
  get colors;
  $R call({
    int? rows,
    int? columns,
    int? width,
    int? height,
    int? textHeight,
    int? spacing,
    List<PainterPaletteColor>? colors,
  });
  PainterPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PainterPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PainterPalette, $Out>
    implements PainterPaletteCopyWith<$R, PainterPalette, $Out> {
  _PainterPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PainterPalette> $mapper =
      PainterPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    PainterPaletteColor,
    PainterPaletteColorCopyWith<$R, PainterPaletteColor, PainterPaletteColor>
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    int? rows,
    int? columns,
    int? width,
    int? height,
    int? textHeight,
    int? spacing,
    List<PainterPaletteColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (rows != null) #rows: rows,
      if (columns != null) #columns: columns,
      if (width != null) #width: width,
      if (height != null) #height: height,
      if (textHeight != null) #textHeight: textHeight,
      if (spacing != null) #spacing: spacing,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  PainterPalette $make(CopyWithData data) => PainterPalette(
    rows: data.get(#rows, or: $value.rows),
    columns: data.get(#columns, or: $value.columns),
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    textHeight: data.get(#textHeight, or: $value.textHeight),
    spacing: data.get(#spacing, or: $value.spacing),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  PainterPaletteCopyWith<$R2, PainterPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PainterPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
