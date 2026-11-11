/// Runs [decode] and reports reads past the end of truncated input as a
/// [FormatException] instead of leaking [RangeError]/[StateError] from the
/// underlying byte buffer. Other errors pass through untouched.
T decodeWithTruncationGuard<T>(String paletteName, T Function() decode) {
  try {
    return decode();
  } catch (e) {
    if (e is RangeError || e is StateError) {
      throw FormatException('Not a valid $paletteName: truncated input.');
    }
    rethrow;
  }
}

/// Throws a [FormatException] when [value] falls outside [min]..[max].
///
/// Mirrors constructor asserts for release builds, where out-of-range
/// values would otherwise be silently masked by byte writers.
void validateIntRange(
  String paletteName,
  String label,
  int value,
  int max, [
  int min = 0,
]) {
  if (value < min || value > max) {
    throw FormatException(
      'Not a valid $paletteName. $label "$value" out of range $min..$max.',
    );
  }
}
