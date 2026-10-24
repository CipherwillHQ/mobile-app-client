// Checks the update layout preserves responsive authentication imagery.
// Owns keyboard visibility when the global bar reserves keyboard space.
// Does not authenticate accounts or alter image and form styling.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../features/auth/auth_layout.dart';
import '../../testing/design_capture.dart';
import '../../testing/fake_app_update.dart';
import 'update_test_app.dart';

void main() {
  setUpAll(loadDesignFonts);
  for (final available in [false, true]) {
    testWidgets(
      'authentication image collapses with keyboard, update $available',
      (tester) async {
        final service = FakeAppUpdates()
          ..offer = available ? testStoreUpdate : null;
        await tester.pumpWidget(
          UpdateTestApp(
            service: service,
            keyboard: 280,
            home: const AuthLayout(
              children: [
                Text('Sign in'),
                TextField(decoration: InputDecoration(labelText: 'Email')),
              ],
            ),
          ),
        );
        await prepareDesignImages(tester);
        await tester.pumpAndSettle();
        final hero = find
            .ancestor(
              of: find.byType(Image).first,
              matching: find.byType(SizedBox),
            )
            .first;
        expect(tester.widget<SizedBox>(hero).height, 104);
        expect(find.byType(TextField).hitTestable(), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
