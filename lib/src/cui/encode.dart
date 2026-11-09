part of 'cui.dart';

List<int> _encode(QuarkXPressCui cui) {
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
