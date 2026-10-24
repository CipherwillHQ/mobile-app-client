// Resolves the selected will across executor pages and shared files.
// Owns encoded native routes and executor navigation selection.
// Does not infer permissions from a URL.

String? executorAccessId(String location) {
  final uri = Uri.parse(location);
  if (uri.pathSegments.firstOrNull == 'executor') {
    return uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
  }
  if (uri.path == '/storage' || uri.pathSegments.firstOrNull == 'file') {
    final access = uri.queryParameters['access'];
    return access?.isNotEmpty == true ? access : null;
  }
  return null;
}

bool isExecutorLocation(String location) =>
    Uri.parse(location).pathSegments.firstOrNull == 'executor' ||
    executorAccessId(location) != null;

String executorWillLocation(String id) =>
    '/executor/${Uri.encodeComponent(id)}';

String executorCategoryLocation(String id, String type) => type == 'FILE'
    ? Uri(path: '/storage', queryParameters: {'access': id}).toString()
    : '${executorWillLocation(id)}/category/${Uri.encodeComponent(type)}';

String executorItemLocation(String id, String item) =>
    '${executorWillLocation(id)}/item/${Uri.encodeComponent(item)}';

bool executorSelected(String destination, String location) {
  final uri = Uri.parse(location);
  if (destination == '/executor') return uri.path == '/executor';
  return Uri.parse(destination) == uri ||
      (uri.pathSegments.firstOrNull == 'file' &&
          Uri.parse(destination).path == '/storage' &&
          executorAccessId(location) == executorAccessId(destination)) ||
      (uri.path == '/storage' &&
          Uri.parse(destination).path == '/storage' &&
          executorAccessId(location) == executorAccessId(destination));
}
