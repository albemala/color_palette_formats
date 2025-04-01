part of 'hpl.dart';

List<int> _encode(HomesitePalette palette) {
  final lines = <String>[];
  lines.add(_fileSignature);
  lines.add('Version ${palette.version}');
  lines.add('');
  lines.addAll(
    palette.colors.map(
      (color) => '${color.red} ${color.green} ${color.blue}',
    ),
  );
  final contents = lines.join('\n');
  return utf8.encode(contents);
}
