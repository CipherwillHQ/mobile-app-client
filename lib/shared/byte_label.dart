// Formats backend byte strings for storage and file views.
// Owns exact input validation and human-readable units.
// Does not calculate subscription quotas.
String byteLabel(Object? value) {
  final bytes = int.tryParse(value?.toString() ?? '');
  if (bytes == null || bytes < 0) return 'Unavailable';
  if (bytes < 1024) return '$bytes B';
  double size = bytes.toDouble();
  final units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  var index = 0;
  while (size >= 1024 && index < units.length - 1) {
    size /= 1024;
    index++;
  }
  return '${size.toStringAsFixed(size >= 10 ? 1 : 2)} ${units[index]}';
}
