// Checks background locking also invalidates factorless-account operations.
// Owns return-authentication state and account-bound leases.
// Does not approve native or Firebase authentication prompts.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../testing/fake_auth.dart';
import '../../app/providers.dart';
import 'session_controller.dart';
import 'return_authentication.dart';

void main() {
  test(
    'a factorless session remains locked until account authentication succeeds',
    () {
      final auth = FakeAuth();
      final container = ProviderContainer(
        overrides: [firebaseProvider.overrideWithValue(auth)],
      );
      final session = container.read(sessionProvider.notifier);
      final before = session.lease();
      before.check();
      session.lock();
      expect(container.read(returnAuthenticationProvider), true);
      expect(before.check, throwsStateError);
      expect(session.lease().check, throwsStateError);
      container.read(returnAuthenticationProvider.notifier).require(false);
      session.lease().check();
      container.dispose();
    },
  );
  test(
    'account changes invalidate operations even without an unlocked factor',
    () {
      final auth = FakeAuth();
      final container = ProviderContainer(
        overrides: [firebaseProvider.overrideWithValue(auth)],
      );
      final lease = container.read(sessionProvider.notifier).lease();
      auth.user = FakeUser('another_account');
      expect(lease.check, throwsStateError);
      container.dispose();
    },
  );
}
