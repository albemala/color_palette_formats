part of 'hpl.dart';

List<int> _encode(HomesitePalette palette) {
  final lines = <String>[];
  lines.add(HomesitePalette.validFileSignature);
  lines.add('Version ${HomesitePalette.validVersion}');
  lines.add('');
  lines.addAll(
    palette.colors.map((color) => '${color.red} ${color.green} ${color.blue}'),
  );
  final contents = lines.join('\n');
  return utf8.encode(contents);
}
