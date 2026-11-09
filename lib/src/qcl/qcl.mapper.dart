// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qcl.dart';

class QuarkXPressNameFormatMapper
    extends ClassMapperBase<QuarkXPressNameFormat> {
  QuarkXPressNameFormatMapper._();

  static QuarkXPressNameFormatMapper? _instance;
  static QuarkXPressNameFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuarkXPressNameFormatMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'QuarkXPressNameFormat';

  static int _$formatId(QuarkXPressNameFormat v) => v.formatId;
  static const Field<QuarkXPressNameFormat, int> _f$formatId = Field(
    'formatId',
    _$formatId,
  );
  static String _$longForm(QuarkXPressNameFormat v) => v.longForm;
  static const Field<QuarkXPressNameFormat, String> _f$longForm = Field(
    'longForm',
    _$longForm,
  );
  static String _$shortForm(QuarkXPressNameFormat v) => v.shortForm;
  static const Field<QuarkXPressNameFormat, String> _f$shortForm = Field(
    'shortForm',
    _$shortForm,
  );

  @override
  final MappableFields<QuarkXPressNameFormat> fields = const {
    #formatId: _f$formatId,
    #longForm: _f$longForm,
    #shortForm: _f$shortForm,
  };

  static QuarkXPressNameFormat _instantiate(DecodingData data) {
    return QuarkXPressNameFormat(
      formatId: data.dec(_f$formatId),
      longForm: data.dec(_f$longForm),
      shortForm: data.dec(_f$shortForm),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static QuarkXPressNameFormat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuarkXPressNameFormat>(map);
  }

  static QuarkXPressNameFormat fromJson(String json) {
    return ensureInitialized().decodeJson<QuarkXPressNameFormat>(json);
  }
}

mixin QuarkXPressNameFormatMappable {
  String toJson() {
    return QuarkXPressNameFormatMapper.ensureInitialized()
        .encodeJson<QuarkXPressNameFormat>(this as QuarkXPressNameFormat);
  }

  Map<String, dynamic> toMap() {
    return QuarkXPressNameFormatMapper.ensureInitialized()
        .encodeMap<QuarkXPressNameFormat>(this as QuarkXPressNameFormat);
  }

  QuarkXPressNameFormatCopyWith<
    QuarkXPressNameFormat,
    QuarkXPressNameFormat,
    QuarkXPressNameFormat
  >
  get copyWith => _QuarkXPressNameFormatCopyWithImpl<
    QuarkXPressNameFormat,
    QuarkXPressNameFormat
  >(this as QuarkXPressNameFormat, $identity, $identity);
  @override
  String toString() {
    return QuarkXPressNameFormatMapper.ensureInitialized().stringifyValue(
      this as QuarkXPressNameFormat,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuarkXPressNameFormatMapper.ensureInitialized().equalsValue(
      this as QuarkXPressNameFormat,
      other,
    );
  }

  @override
  int get hashCode {
    return QuarkXPressNameFormatMapper.ensureInitialized().hashValue(
      this as QuarkXPressNameFormat,
    );
  }
}

extension QuarkXPressNameFormatValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuarkXPressNameFormat, $Out> {
  QuarkXPressNameFormatCopyWith<$R, QuarkXPressNameFormat, $Out>
  get $asQuarkXPressNameFormat => $base.as(
    (v, t, t2) => _QuarkXPressNameFormatCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class QuarkXPressNameFormatCopyWith<
  $R,
  $In extends QuarkXPressNameFormat,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? formatId, String? longForm, String? shortForm});
  QuarkXPressNameFormatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuarkXPressNameFormatCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuarkXPressNameFormat, $Out>
    implements QuarkXPressNameFormatCopyWith<$R, QuarkXPressNameFormat, $Out> {
  _QuarkXPressNameFormatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuarkXPressNameFormat> $mapper =
      QuarkXPressNameFormatMapper.ensureInitialized();
  @override
  $R call({int? formatId, String? longForm, String? shortForm}) => $apply(
    FieldCopyWithData({
      if (formatId != null) #formatId: formatId,
      if (longForm != null) #longForm: longForm,
      if (shortForm != null) #shortForm: shortForm,
    }),
  );
  @override
  QuarkXPressNameFormat $make(CopyWithData data) => QuarkXPressNameFormat(
    formatId: data.get(#formatId, or: $value.formatId),
    longForm: data.get(#longForm, or: $value.longForm),
    shortForm: data.get(#shortForm, or: $value.shortForm),
  );

  @override
  QuarkXPressNameFormatCopyWith<$R2, QuarkXPressNameFormat, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _QuarkXPressNameFormatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class QuarkXPressPaletteColorMapper
    extends ClassMapperBase<QuarkXPressPaletteColor> {
  QuarkXPressPaletteColorMapper._();

  static QuarkXPressPaletteColorMapper? _instance;
  static QuarkXPressPaletteColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = QuarkXPressPaletteColorMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'QuarkXPressPaletteColor';

  static String _$sampleId(QuarkXPressPaletteColor v) => v.sampleId;
  static const Field<QuarkXPressPaletteColor, String> _f$sampleId = Field(
    'sampleId',
    _$sampleId,
  );
  static int? _$nameFormatId(QuarkXPressPaletteColor v) => v.nameFormatId;
  static const Field<QuarkXPressPaletteColor, int> _f$nameFormatId = Field(
    'nameFormatId',
    _$nameFormatId,
    opt: true,
  );
  static String _$name(QuarkXPressPaletteColor v) => v.name;
  static const Field<QuarkXPressPaletteColor, String> _f$name = Field(
    'name',
    _$name,
  );
  static List<int>? _$rgb(QuarkXPressPaletteColor v) => v.rgb;
  static const Field<QuarkXPressPaletteColor, List<int>> _f$rgb = Field(
    'rgb',
    _$rgb,
    opt: true,
  );
  static List<double>? _$cmyk(QuarkXPressPaletteColor v) => v.cmyk;
  static const Field<QuarkXPressPaletteColor, List<double>> _f$cmyk = Field(
    'cmyk',
    _$cmyk,
    opt: true,
  );
  static List<double>? _$lab(QuarkXPressPaletteColor v) => v.lab;
  static const Field<QuarkXPressPaletteColor, List<double>> _f$lab = Field(
    'lab',
    _$lab,
    opt: true,
  );
  static List<double>? _$hexachrome(QuarkXPressPaletteColor v) => v.hexachrome;
  static const Field<QuarkXPressPaletteColor, List<double>> _f$hexachrome =
      Field('hexachrome', _$hexachrome, opt: true);

  @override
  final MappableFields<QuarkXPressPaletteColor> fields = const {
    #sampleId: _f$sampleId,
    #nameFormatId: _f$nameFormatId,
    #name: _f$name,
    #rgb: _f$rgb,
    #cmyk: _f$cmyk,
    #lab: _f$lab,
    #hexachrome: _f$hexachrome,
  };

  static QuarkXPressPaletteColor _instantiate(DecodingData data) {
    return QuarkXPressPaletteColor(
      sampleId: data.dec(_f$sampleId),
      nameFormatId: data.dec(_f$nameFormatId),
      name: data.dec(_f$name),
      rgb: data.dec(_f$rgb),
      cmyk: data.dec(_f$cmyk),
      lab: data.dec(_f$lab),
      hexachrome: data.dec(_f$hexachrome),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static QuarkXPressPaletteColor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuarkXPressPaletteColor>(map);
  }

  static QuarkXPressPaletteColor fromJson(String json) {
    return ensureInitialized().decodeJson<QuarkXPressPaletteColor>(json);
  }
}

mixin QuarkXPressPaletteColorMappable {
  String toJson() {
    return QuarkXPressPaletteColorMapper.ensureInitialized()
        .encodeJson<QuarkXPressPaletteColor>(this as QuarkXPressPaletteColor);
  }

  Map<String, dynamic> toMap() {
    return QuarkXPressPaletteColorMapper.ensureInitialized()
        .encodeMap<QuarkXPressPaletteColor>(this as QuarkXPressPaletteColor);
  }

  QuarkXPressPaletteColorCopyWith<
    QuarkXPressPaletteColor,
    QuarkXPressPaletteColor,
    QuarkXPressPaletteColor
  >
  get copyWith => _QuarkXPressPaletteColorCopyWithImpl<
    QuarkXPressPaletteColor,
    QuarkXPressPaletteColor
  >(this as QuarkXPressPaletteColor, $identity, $identity);
  @override
  String toString() {
    return QuarkXPressPaletteColorMapper.ensureInitialized().stringifyValue(
      this as QuarkXPressPaletteColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuarkXPressPaletteColorMapper.ensureInitialized().equalsValue(
      this as QuarkXPressPaletteColor,
      other,
    );
  }

  @override
  int get hashCode {
    return QuarkXPressPaletteColorMapper.ensureInitialized().hashValue(
      this as QuarkXPressPaletteColor,
    );
  }
}

extension QuarkXPressPaletteColorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuarkXPressPaletteColor, $Out> {
  QuarkXPressPaletteColorCopyWith<$R, QuarkXPressPaletteColor, $Out>
  get $asQuarkXPressPaletteColor => $base.as(
    (v, t, t2) => _QuarkXPressPaletteColorCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class QuarkXPressPaletteColorCopyWith<
  $R,
  $In extends QuarkXPressPaletteColor,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get rgb;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>? get cmyk;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>? get lab;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>? get hexachrome;
  $R call({
    String? sampleId,
    int? nameFormatId,
    String? name,
    List<int>? rgb,
    List<double>? cmyk,
    List<double>? lab,
    List<double>? hexachrome,
  });
  QuarkXPressPaletteColorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuarkXPressPaletteColorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuarkXPressPaletteColor, $Out>
    implements
        QuarkXPressPaletteColorCopyWith<$R, QuarkXPressPaletteColor, $Out> {
  _QuarkXPressPaletteColorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuarkXPressPaletteColor> $mapper =
      QuarkXPressPaletteColorMapper.ensureInitialized();
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
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>? get cmyk =>
      $value.cmyk != null
          ? ListCopyWith(
            $value.cmyk!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(cmyk: v),
          )
          : null;
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>? get lab =>
      $value.lab != null
          ? ListCopyWith(
            $value.lab!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(lab: v),
          )
          : null;
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>?
  get hexachrome =>
      $value.hexachrome != null
          ? ListCopyWith(
            $value.hexachrome!,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(hexachrome: v),
          )
          : null;
  @override
  $R call({
    String? sampleId,
    Object? nameFormatId = $none,
    String? name,
    Object? rgb = $none,
    Object? cmyk = $none,
    Object? lab = $none,
    Object? hexachrome = $none,
  }) => $apply(
    FieldCopyWithData({
      if (sampleId != null) #sampleId: sampleId,
      if (nameFormatId != $none) #nameFormatId: nameFormatId,
      if (name != null) #name: name,
      if (rgb != $none) #rgb: rgb,
      if (cmyk != $none) #cmyk: cmyk,
      if (lab != $none) #lab: lab,
      if (hexachrome != $none) #hexachrome: hexachrome,
    }),
  );
  @override
  QuarkXPressPaletteColor $make(CopyWithData data) => QuarkXPressPaletteColor(
    sampleId: data.get(#sampleId, or: $value.sampleId),
    nameFormatId: data.get(#nameFormatId, or: $value.nameFormatId),
    name: data.get(#name, or: $value.name),
    rgb: data.get(#rgb, or: $value.rgb),
    cmyk: data.get(#cmyk, or: $value.cmyk),
    lab: data.get(#lab, or: $value.lab),
    hexachrome: data.get(#hexachrome, or: $value.hexachrome),
  );

  @override
  QuarkXPressPaletteColorCopyWith<$R2, QuarkXPressPaletteColor, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _QuarkXPressPaletteColorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class QuarkXPressPaletteMapper extends ClassMapperBase<QuarkXPressPalette> {
  QuarkXPressPaletteMapper._();

  static QuarkXPressPaletteMapper? _instance;
  static QuarkXPressPaletteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuarkXPressPaletteMapper._());
      QuarkXPressNameFormatMapper.ensureInitialized();
      QuarkXPressPaletteColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuarkXPressPalette';

  static String _$stdVersion(QuarkXPressPalette v) => v.stdVersion;
  static const Field<QuarkXPressPalette, String> _f$stdVersion = Field(
    'stdVersion',
    _$stdVersion,
  );
  static String _$dtdVersion(QuarkXPressPalette v) => v.dtdVersion;
  static const Field<QuarkXPressPalette, String> _f$dtdVersion = Field(
    'dtdVersion',
    _$dtdVersion,
  );
  static String _$standard(QuarkXPressPalette v) => v.standard;
  static const Field<QuarkXPressPalette, String> _f$standard = Field(
    'standard',
    _$standard,
  );
  static String _$originator(QuarkXPressPalette v) => v.originator;
  static const Field<QuarkXPressPalette, String> _f$originator = Field(
    'originator',
    _$originator,
  );
  static String _$fileDescriptor(QuarkXPressPalette v) => v.fileDescriptor;
  static const Field<QuarkXPressPalette, String> _f$fileDescriptor = Field(
    'fileDescriptor',
    _$fileDescriptor,
  );
  static String _$createdDate(QuarkXPressPalette v) => v.createdDate;
  static const Field<QuarkXPressPalette, String> _f$createdDate = Field(
    'createdDate',
    _$createdDate,
  );
  static String _$createdText(QuarkXPressPalette v) => v.createdText;
  static const Field<QuarkXPressPalette, String> _f$createdText = Field(
    'createdText',
    _$createdText,
  );
  static String _$manufacturer(QuarkXPressPalette v) => v.manufacturer;
  static const Field<QuarkXPressPalette, String> _f$manufacturer = Field(
    'manufacturer',
    _$manufacturer,
  );
  static String _$headerComment(QuarkXPressPalette v) => v.headerComment;
  static const Field<QuarkXPressPalette, String> _f$headerComment = Field(
    'headerComment',
    _$headerComment,
  );
  static List<QuarkXPressNameFormat> _$nameFormats(QuarkXPressPalette v) =>
      v.nameFormats;
  static const Field<QuarkXPressPalette, List<QuarkXPressNameFormat>>
  _f$nameFormats = Field('nameFormats', _$nameFormats);
  static String _$libraryIdentifier(QuarkXPressPalette v) =>
      v.libraryIdentifier;
  static const Field<QuarkXPressPalette, String> _f$libraryIdentifier = Field(
    'libraryIdentifier',
    _$libraryIdentifier,
  );
  static String _$defaultColorSpace(QuarkXPressPalette v) =>
      v.defaultColorSpace;
  static const Field<QuarkXPressPalette, String> _f$defaultColorSpace = Field(
    'defaultColorSpace',
    _$defaultColorSpace,
  );
  static String _$colorUsageRecommendation(QuarkXPressPalette v) =>
      v.colorUsageRecommendation;
  static const Field<QuarkXPressPalette, String> _f$colorUsageRecommendation =
      Field('colorUsageRecommendation', _$colorUsageRecommendation);
  static String _$uiSpec(QuarkXPressPalette v) => v.uiSpec;
  static const Field<QuarkXPressPalette, String> _f$uiSpec = Field(
    'uiSpec',
    _$uiSpec,
  );
  static List<QuarkXPressPaletteColor> _$colors(QuarkXPressPalette v) =>
      v.colors;
  static const Field<QuarkXPressPalette, List<QuarkXPressPaletteColor>>
  _f$colors = Field('colors', _$colors);

  @override
  final MappableFields<QuarkXPressPalette> fields = const {
    #stdVersion: _f$stdVersion,
    #dtdVersion: _f$dtdVersion,
    #standard: _f$standard,
    #originator: _f$originator,
    #fileDescriptor: _f$fileDescriptor,
    #createdDate: _f$createdDate,
    #createdText: _f$createdText,
    #manufacturer: _f$manufacturer,
    #headerComment: _f$headerComment,
    #nameFormats: _f$nameFormats,
    #libraryIdentifier: _f$libraryIdentifier,
    #defaultColorSpace: _f$defaultColorSpace,
    #colorUsageRecommendation: _f$colorUsageRecommendation,
    #uiSpec: _f$uiSpec,
    #colors: _f$colors,
  };

  static QuarkXPressPalette _instantiate(DecodingData data) {
    return QuarkXPressPalette(
      stdVersion: data.dec(_f$stdVersion),
      dtdVersion: data.dec(_f$dtdVersion),
      standard: data.dec(_f$standard),
      originator: data.dec(_f$originator),
      fileDescriptor: data.dec(_f$fileDescriptor),
      createdDate: data.dec(_f$createdDate),
      createdText: data.dec(_f$createdText),
      manufacturer: data.dec(_f$manufacturer),
      headerComment: data.dec(_f$headerComment),
      nameFormats: data.dec(_f$nameFormats),
      libraryIdentifier: data.dec(_f$libraryIdentifier),
      defaultColorSpace: data.dec(_f$defaultColorSpace),
      colorUsageRecommendation: data.dec(_f$colorUsageRecommendation),
      uiSpec: data.dec(_f$uiSpec),
      colors: data.dec(_f$colors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static QuarkXPressPalette fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuarkXPressPalette>(map);
  }

  static QuarkXPressPalette fromJson(String json) {
    return ensureInitialized().decodeJson<QuarkXPressPalette>(json);
  }
}

mixin QuarkXPressPaletteMappable {
  String toJson() {
    return QuarkXPressPaletteMapper.ensureInitialized()
        .encodeJson<QuarkXPressPalette>(this as QuarkXPressPalette);
  }

  Map<String, dynamic> toMap() {
    return QuarkXPressPaletteMapper.ensureInitialized()
        .encodeMap<QuarkXPressPalette>(this as QuarkXPressPalette);
  }

  QuarkXPressPaletteCopyWith<
    QuarkXPressPalette,
    QuarkXPressPalette,
    QuarkXPressPalette
  >
  get copyWith =>
      _QuarkXPressPaletteCopyWithImpl<QuarkXPressPalette, QuarkXPressPalette>(
        this as QuarkXPressPalette,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return QuarkXPressPaletteMapper.ensureInitialized().stringifyValue(
      this as QuarkXPressPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuarkXPressPaletteMapper.ensureInitialized().equalsValue(
      this as QuarkXPressPalette,
      other,
    );
  }

  @override
  int get hashCode {
    return QuarkXPressPaletteMapper.ensureInitialized().hashValue(
      this as QuarkXPressPalette,
    );
  }
}

extension QuarkXPressPaletteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuarkXPressPalette, $Out> {
  QuarkXPressPaletteCopyWith<$R, QuarkXPressPalette, $Out>
  get $asQuarkXPressPalette => $base.as(
    (v, t, t2) => _QuarkXPressPaletteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class QuarkXPressPaletteCopyWith<
  $R,
  $In extends QuarkXPressPalette,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    QuarkXPressNameFormat,
    QuarkXPressNameFormatCopyWith<
      $R,
      QuarkXPressNameFormat,
      QuarkXPressNameFormat
    >
  >
  get nameFormats;
  ListCopyWith<
    $R,
    QuarkXPressPaletteColor,
    QuarkXPressPaletteColorCopyWith<
      $R,
      QuarkXPressPaletteColor,
      QuarkXPressPaletteColor
    >
  >
  get colors;
  $R call({
    String? stdVersion,
    String? dtdVersion,
    String? standard,
    String? originator,
    String? fileDescriptor,
    String? createdDate,
    String? createdText,
    String? manufacturer,
    String? headerComment,
    List<QuarkXPressNameFormat>? nameFormats,
    String? libraryIdentifier,
    String? defaultColorSpace,
    String? colorUsageRecommendation,
    String? uiSpec,
    List<QuarkXPressPaletteColor>? colors,
  });
  QuarkXPressPaletteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuarkXPressPaletteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuarkXPressPalette, $Out>
    implements QuarkXPressPaletteCopyWith<$R, QuarkXPressPalette, $Out> {
  _QuarkXPressPaletteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuarkXPressPalette> $mapper =
      QuarkXPressPaletteMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    QuarkXPressNameFormat,
    QuarkXPressNameFormatCopyWith<
      $R,
      QuarkXPressNameFormat,
      QuarkXPressNameFormat
    >
  >
  get nameFormats => ListCopyWith(
    $value.nameFormats,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(nameFormats: v),
  );
  @override
  ListCopyWith<
    $R,
    QuarkXPressPaletteColor,
    QuarkXPressPaletteColorCopyWith<
      $R,
      QuarkXPressPaletteColor,
      QuarkXPressPaletteColor
    >
  >
  get colors => ListCopyWith(
    $value.colors,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(colors: v),
  );
  @override
  $R call({
    String? stdVersion,
    String? dtdVersion,
    String? standard,
    String? originator,
    String? fileDescriptor,
    String? createdDate,
    String? createdText,
    String? manufacturer,
    String? headerComment,
    List<QuarkXPressNameFormat>? nameFormats,
    String? libraryIdentifier,
    String? defaultColorSpace,
    String? colorUsageRecommendation,
    String? uiSpec,
    List<QuarkXPressPaletteColor>? colors,
  }) => $apply(
    FieldCopyWithData({
      if (stdVersion != null) #stdVersion: stdVersion,
      if (dtdVersion != null) #dtdVersion: dtdVersion,
      if (standard != null) #standard: standard,
      if (originator != null) #originator: originator,
      if (fileDescriptor != null) #fileDescriptor: fileDescriptor,
      if (createdDate != null) #createdDate: createdDate,
      if (createdText != null) #createdText: createdText,
      if (manufacturer != null) #manufacturer: manufacturer,
      if (headerComment != null) #headerComment: headerComment,
      if (nameFormats != null) #nameFormats: nameFormats,
      if (libraryIdentifier != null) #libraryIdentifier: libraryIdentifier,
      if (defaultColorSpace != null) #defaultColorSpace: defaultColorSpace,
      if (colorUsageRecommendation != null)
        #colorUsageRecommendation: colorUsageRecommendation,
      if (uiSpec != null) #uiSpec: uiSpec,
      if (colors != null) #colors: colors,
    }),
  );
  @override
  QuarkXPressPalette $make(CopyWithData data) => QuarkXPressPalette(
    stdVersion: data.get(#stdVersion, or: $value.stdVersion),
    dtdVersion: data.get(#dtdVersion, or: $value.dtdVersion),
    standard: data.get(#standard, or: $value.standard),
    originator: data.get(#originator, or: $value.originator),
    fileDescriptor: data.get(#fileDescriptor, or: $value.fileDescriptor),
    createdDate: data.get(#createdDate, or: $value.createdDate),
    createdText: data.get(#createdText, or: $value.createdText),
    manufacturer: data.get(#manufacturer, or: $value.manufacturer),
    headerComment: data.get(#headerComment, or: $value.headerComment),
    nameFormats: data.get(#nameFormats, or: $value.nameFormats),
    libraryIdentifier: data.get(
      #libraryIdentifier,
      or: $value.libraryIdentifier,
    ),
    defaultColorSpace: data.get(
      #defaultColorSpace,
      or: $value.defaultColorSpace,
    ),
    colorUsageRecommendation: data.get(
      #colorUsageRecommendation,
      or: $value.colorUsageRecommendation,
    ),
    uiSpec: data.get(#uiSpec, or: $value.uiSpec),
    colors: data.get(#colors, or: $value.colors),
  );

  @override
  QuarkXPressPaletteCopyWith<$R2, QuarkXPressPalette, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuarkXPressPaletteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
