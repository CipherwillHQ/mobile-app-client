// Exercises page-wide refresh through real paginated metadata widgets.
// Owns multiple-list refresh, first-page replacement and cursor reset coverage.
// Does not save vault content or replace the backend pagination contract.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../testing/fake_api.dart';
import 'page_frame.dart';
import 'paged_list.dart';

void main() {
  testWidgets('pull refresh replaces both first pages without stale cursors', (
    tester,
  ) async {
    final generations = <String, int>{};
    final api = FakeApi((operation, variables) async {
      final generation = generations.update(
        operation,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
      return {
        'result': {
          'items': [
            {'id': '$operation-$generation', 'label': '$operation $generation'},
          ],
          'has_more': false,
        },
      };
    });
    addTearDown(api.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [apiProvider.overrideWithValue(api)],
        child: MaterialApp(
          home: PageFrame(
            title: 'Files',
            children: [
              for (final operation in ['Folders', 'Files'])
                PagedList(
                  operation: operation,
                  field: 'result',
                  itemsField: 'items',
                  itemBuilder: (item) => ListTile(title: Text(item['label'])),
                ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Folders 1'), findsOneWidget);
    expect(find.text('Files 1'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, 350));
    await tester.pumpAndSettle();
    expect(find.text('Folders 2'), findsOneWidget);
    expect(find.text('Files 2'), findsOneWidget);
    expect(find.text('Folders 1'), findsNothing);
    expect(find.text('Files 1'), findsNothing);
    expect(api.calls, hasLength(4));
    expect(api.calls.every((call) => !call.$2.containsKey('cursor')), isTrue);
    expect(tester.takeException(), isNull);
  });
}
