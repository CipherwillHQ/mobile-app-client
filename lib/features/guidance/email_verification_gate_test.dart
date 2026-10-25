// Verifies independent setup still requires existing encryption factors.
// Owns unverified-account lock coverage through the routed account gate.
// Does not unlock factors or contact authentication services.
import 'package:flutter_test/flutter_test.dart';
import '../../features/security/lock_screen.dart';
import '../../testing/design_fixtures.dart';
import 'email_verification_test_app.dart';

void main() {
  testWidgets(
    'unverified accounts with a locked factor cannot enter guidance',
    (tester) async {
      final api = VerificationApi(VerificationUser());
      addTearDown(api.dispose);
      await tester.pumpWidget(
        VerificationTestApp(api: api, factors: const [previewFactor]),
      );
      await tester.pumpAndSettle();
      expect(find.byType(LockScreen), findsOneWidget);
      expect(find.text('Continue Cipherwill Setup'), findsNothing);
      expect(
        api.calls.where((call) => call.$1 == 'GUIDANCE_BOOTSTRAP'),
        isEmpty,
      );
    },
  );
}
