// Exercises factor actions after moving them into a compact web-style menu.
// Owns correct callback dispatch and disabled-during-save behavior.
// Does not perform migrations or native biometric authentication.
import 'package:flutter_test/flutter_test.dart';
import '../../shared/ui/page_frame.dart';
import '../../testing/design_harness.dart';
import '../../testing/design_fixtures.dart';
import 'factor_card.dart';

void main() {
  testWidgets('factor menu dispatches only the selected explicit action', (
    tester,
  ) async {
    String? selected;
    await tester.pumpWidget(
      DesignHarness(
        location: '/factors',
        screen: PageFrame(
          title: 'Security Factors',
          children: [
            FactorCard(
              factor: previewFactor,
              count: 24,
              busy: false,
              rename: () => selected = 'Rename',
              migrate: () => selected = 'Migrate keys',
              enable: () => selected = 'Enable biometrics',
              disable: () => selected = 'Disable biometrics',
              remove: () => selected = 'Remove factor',
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(selected, isNull);
    for (final label in [
      'Rename',
      'Migrate keys',
      'Enable biometrics',
      'Disable biometrics',
      'Remove factor',
    ]) {
      await tester.tap(find.byTooltip('Factor options'));
      await tester.pumpAndSettle();
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
      expect(selected, label);
    }
    expect(tester.takeException(), isNull);
  });
  testWidgets('busy factors cannot open their action menu', (tester) async {
    bool invoked = false;
    void action() => invoked = true;
    await tester.pumpWidget(
      DesignHarness(
        location: '/factors',
        screen: PageFrame(
          title: 'Security Factors',
          children: [
            FactorCard(
              factor: previewFactor,
              count: 24,
              busy: true,
              rename: action,
              migrate: action,
              enable: action,
              disable: action,
              remove: action,
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Factor options'));
    await tester.pumpAndSettle();
    expect(find.text('Remove factor'), findsNothing);
    expect(invoked, isFalse);
    expect(tester.takeException(), isNull);
  });
}
