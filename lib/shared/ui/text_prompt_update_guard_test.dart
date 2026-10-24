// Checks update actions cannot close an in-progress shared text prompt.
// Owns prompt registration, draft retention and release on cancellation.
// Does not persist entered messages or launch a real app store.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../features/updates/update_test_app.dart';
import '../../testing/fake_app_update.dart';
import 'actions.dart';

void main() {
  testWidgets('open text prompt protects entered input until it closes', (
    tester,
  ) async {
    final updates = FakeAppUpdates();
    await tester.pumpWidget(
      UpdateTestApp(
        service: updates,
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => prompt(context, 'Message'),
              child: const Text('Open prompt'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open prompt'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Unsaved message');
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    expect(find.text('Save your changes before updating.'), findsOneWidget);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      'Unsaved message',
    );
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 1);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
