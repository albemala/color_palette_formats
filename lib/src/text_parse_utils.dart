import 'dart:convert';

List<String> splitLines(List<int> bytes) {
  return utf8.decode(bytes).split(RegExp(r'\r?\n'));
}

int parseIntValue(RegExpMatch? match, int groupIndex, [int defaultValue = 0]) {
  return int.tryParse(match?.group(groupIndex) ?? '') ?? defaultValue;
}

double parseDoubleValue(
  RegExpMatch? match,
  int groupIndex, [
  double defaultValue = 0.0,
]) {
  return double.tryParse(match?.group(groupIndex) ?? '') ?? defaultValue;
}

String parseStringValue(
  RegExpMatch? match,
  int groupIndex, [
  String defaultValue = '',
]) {
  return match?.group(groupIndex)?.trim() ?? defaultValue;
}

void validateHeader(
  String header,
  String expectedSignature,
  String paletteName,
) {
  if (header != expectedSignature) {
    throw FormatException(
      '''
Not a valid $paletteName. Expected header "$expectedSignature" but found "$header".''',
    );
  }
}

void validateVersion(
  String version,
  String expectedVersion,
  String paletteName,
) {
  if (version != expectedVersion) {
    throw FormatException(
      '''
Unsupported $paletteName version. Expected "$expectedVersion" but found "$version".''',
    );
  }
}
