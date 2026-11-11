part of 'cui.dart';

const _paletteName = 'QuarkXPress UI Specs';

QuarkXPressCui _decode(List<int> bytes) {
  final xmlString = utf8.decode(bytes);
  final document = parseXml(xmlString);
  final root = validateRootElement(document, CuiConstants.libraryUISpecs);

  final data = root.findElements(CuiConstants.editDialogData).firstOrNull;
  if (data == null) {
    throw const FormatException(
      'Not a valid $_paletteName. Missing <${CuiConstants.editDialogData}>.',
    );
  }

  final rowsPerPageText =
      data.findElements(CuiConstants.rowsPerPage).firstOrNull?.innerText.trim();
  final rowsPerPage = int.tryParse(rowsPerPageText ?? '');
  // The model constructor asserts non-negativity in debug builds; enforce
  // it here with FormatException for release safety.
  if (rowsPerPage == null || rowsPerPage < 0) {
    throw const FormatException(
      'Not a valid $_paletteName. Invalid <${CuiConstants.rowsPerPage}>.',
    );
  }

  final columnBreaks = <int>[];
  final columnData = data.findElements(CuiConstants.columnData).firstOrNull;
  if (columnData != null) {
    for (final br in columnData.findElements(CuiConstants.columnBreak)) {
      final value = int.tryParse(br.innerText.trim());
      if (value == null) {
        throw const FormatException(
          'Not a valid $_paletteName. Invalid <${CuiConstants.columnBreak}>.',
        );
      }
      columnBreaks.add(value);
    }
  }

  return QuarkXPressCui(
    rowsPerPage: rowsPerPage,
    prefix:
        data.findElements(CuiConstants.colorUiPrefix).firstOrNull?.innerText ??
        '',
    suffix:
        data.findElements(CuiConstants.colorUiSuffix).firstOrNull?.innerText ??
        '',
    columnBreaks: columnBreaks,
  );
}
