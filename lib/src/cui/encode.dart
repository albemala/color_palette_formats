part of 'cui.dart';

List<int> _encode(QuarkXPressCui cui) {
  _validatePalette(cui);
  return buildXmlDocument(
    rootElementName: CuiConstants.libraryUISpecs,
    buildContent: (builder) {
      builder.element(
        CuiConstants.editDialogData,
        nest: () {
          builder.element(CuiConstants.rowsPerPage, nest: '${cui.rowsPerPage}');
          builder.element(CuiConstants.colorUiPrefix, nest: cui.prefix);
          if (cui.suffix.isNotEmpty) {
            builder.element(CuiConstants.colorUiSuffix, nest: cui.suffix);
          }
          if (cui.columnBreaks.isNotEmpty) {
            builder.element(
              CuiConstants.columnData,
              nest: () {
                for (final br in cui.columnBreaks) {
                  builder.element(CuiConstants.columnBreak, nest: '$br');
                }
              },
            );
          }
        },
      );
    },
  );
}

void _validatePalette(QuarkXPressCui cui) {
  // The model constructor asserts this range in debug builds; enforce it
  // here with FormatException for release safety. Column-break indices
  // carry no model constraint and are left permissive.
  if (cui.rowsPerPage < 0) {
    throw FormatException(
      'Not a valid $_paletteName. '
      'Invalid <${CuiConstants.rowsPerPage}> "${cui.rowsPerPage}".',
    );
  }
}
