// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cui.dart';

class QuarkXPressCuiMapper extends ClassMapperBase<QuarkXPressCui> {
  QuarkXPressCuiMapper._();

  static QuarkXPressCuiMapper? _instance;
  static QuarkXPressCuiMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuarkXPressCuiMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'QuarkXPressCui';

  static int _$rowsPerPage(QuarkXPressCui v) => v.rowsPerPage;
  static const Field<QuarkXPressCui, int> _f$rowsPerPage = Field(
    'rowsPerPage',
    _$rowsPerPage,
  );
  static String _$prefix(QuarkXPressCui v) => v.prefix;
  static const Field<QuarkXPressCui, String> _f$prefix = Field(
    'prefix',
    _$prefix,
  );
  static String _$suffix(QuarkXPressCui v) => v.suffix;
  static const Field<QuarkXPressCui, String> _f$suffix = Field(
    'suffix',
    _$suffix,
  );
  static List<int> _$columnBreaks(QuarkXPressCui v) => v.columnBreaks;
  static const Field<QuarkXPressCui, List<int>> _f$columnBreaks = Field(
    'columnBreaks',
    _$columnBreaks,
  );

  @override
  final MappableFields<QuarkXPressCui> fields = const {
    #rowsPerPage: _f$rowsPerPage,
    #prefix: _f$prefix,
    #suffix: _f$suffix,
    #columnBreaks: _f$columnBreaks,
  };

  static QuarkXPressCui _instantiate(DecodingData data) {
    return QuarkXPressCui(
      rowsPerPage: data.dec(_f$rowsPerPage),
      prefix: data.dec(_f$prefix),
      suffix: data.dec(_f$suffix),
      columnBreaks: data.dec(_f$columnBreaks),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static QuarkXPressCui fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuarkXPressCui>(map);
  }

  static QuarkXPressCui fromJson(String json) {
    return ensureInitialized().decodeJson<QuarkXPressCui>(json);
  }
}

mixin QuarkXPressCuiMappable {
  String toJson() {
    return QuarkXPressCuiMapper.ensureInitialized().encodeJson<QuarkXPressCui>(
      this as QuarkXPressCui,
    );
  }

  Map<String, dynamic> toMap() {
    return QuarkXPressCuiMapper.ensureInitialized().encodeMap<QuarkXPressCui>(
      this as QuarkXPressCui,
    );
  }

  QuarkXPressCuiCopyWith<QuarkXPressCui, QuarkXPressCui, QuarkXPressCui>
  get copyWith => _QuarkXPressCuiCopyWithImpl<QuarkXPressCui, QuarkXPressCui>(
    this as QuarkXPressCui,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return QuarkXPressCuiMapper.ensureInitialized().stringifyValue(
      this as QuarkXPressCui,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuarkXPressCuiMapper.ensureInitialized().equalsValue(
      this as QuarkXPressCui,
      other,
    );
  }

  @override
  int get hashCode {
    return QuarkXPressCuiMapper.ensureInitialized().hashValue(
      this as QuarkXPressCui,
    );
  }
}

extension QuarkXPressCuiValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuarkXPressCui, $Out> {
  QuarkXPressCuiCopyWith<$R, QuarkXPressCui, $Out> get $asQuarkXPressCui =>
      $base.as((v, t, t2) => _QuarkXPressCuiCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class QuarkXPressCuiCopyWith<$R, $In extends QuarkXPressCui, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get columnBreaks;
  $R call({
    int? rowsPerPage,
    String? prefix,
    String? suffix,
    List<int>? columnBreaks,
  });
  QuarkXPressCuiCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuarkXPressCuiCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuarkXPressCui, $Out>
    implements QuarkXPressCuiCopyWith<$R, QuarkXPressCui, $Out> {
  _QuarkXPressCuiCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuarkXPressCui> $mapper =
      QuarkXPressCuiMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get columnBreaks =>
      ListCopyWith(
        $value.columnBreaks,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(columnBreaks: v),
      );
  @override
  $R call({
    int? rowsPerPage,
    String? prefix,
    String? suffix,
    List<int>? columnBreaks,
  }) => $apply(
    FieldCopyWithData({
      if (rowsPerPage != null) #rowsPerPage: rowsPerPage,
      if (prefix != null) #prefix: prefix,
      if (suffix != null) #suffix: suffix,
      if (columnBreaks != null) #columnBreaks: columnBreaks,
    }),
  );
  @override
  QuarkXPressCui $make(CopyWithData data) => QuarkXPressCui(
    rowsPerPage: data.get(#rowsPerPage, or: $value.rowsPerPage),
    prefix: data.get(#prefix, or: $value.prefix),
    suffix: data.get(#suffix, or: $value.suffix),
    columnBreaks: data.get(#columnBreaks, or: $value.columnBreaks),
  );

  @override
  QuarkXPressCuiCopyWith<$R2, QuarkXPressCui, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuarkXPressCuiCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
