// Checks navigation scope across donor links, folders and file previews.
// Owns encoded grant IDs and exact execution-menu selection regressions.
// Does not authorize access based on route matching.
import 'package:flutter_test/flutter_test.dart';
import 'executor_location.dart';

void main() {
  test('only executor routes and access-scoped files enter execution mode', () {
    for (final path in [
      '/executor',
      '/executor/grant',
      '/storage?access=grant',
      '/file/item?access=grant',
    ]) {
      expect(isExecutorLocation(path), isTrue, reason: path);
    }
    for (final path in [
      '/home',
      '/granted-access',
      '/storage?folder=folder',
      '/file/item',
      '/storage?access=',
    ]) {
      expect(isExecutorLocation(path), isFalse, reason: path);
    }
  });
  test(
    'selected donor identifiers survive encoded URLs and category links',
    () {
      const id = 'grant/one?&';
      final overview = executorWillLocation(id);
      expect(executorAccessId(overview), id);
      expect(executorAccessId('$overview/category/NOTE'), id);
      expect(executorAccessId(executorCategoryLocation(id, 'FILE')), id);
      expect(executorAccessId('/file/file?access=grant%2Fone%3F%26'), id);
      expect(
        Uri.parse(executorItemLocation(id, 'item/one')).pathSegments.last,
        'item/one',
      );
    },
  );
  test(
    'menu selects only the current overview, category or shared storage',
    () {
      expect(executorSelected('/executor', '/executor/grant'), isFalse);
      expect(
        executorSelected('/executor/grant', '/executor/grant/category/NOTE'),
        isFalse,
      );
      expect(
        executorSelected(
          '/executor/grant/category/NOTE',
          '/executor/grant/category/NOTE',
        ),
        isTrue,
      );
      expect(
        executorSelected(
          '/storage?access=grant',
          '/storage?folder=folder&access=grant',
        ),
        isTrue,
      );
      expect(
        executorSelected('/storage?access=grant', '/file/item?access=grant'),
        isTrue,
      );
      expect(
        executorSelected('/storage?access=other', '/file/item?access=grant'),
        isFalse,
      );
      expect(executorSelected('/executor', '/executor?notice=expired'), isTrue);
    },
  );
}
