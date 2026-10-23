// Verifies factorless accounts reopen without treating account passwords as keys.
// Owns operation invalidation on background locks and account switching.
// Does not skip online account/factor validation or approve biometric prompts.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../testing/fake_auth.dart';
import '../../app/providers.dart';
import 'session_controller.dart';

void main() {
  test(
    'factorless accounts get a fresh lease without password authentication',
    () {
      final container = ProviderContainer(
        overrides: [firebaseProvider.overrideWithValue(FakeAuth())],
      );
      final session = container.read(sessionProvider.notifier);
      final before = session.lease();
      before.check();
      session.lock();
      expect(before.check, throwsStateError);
      expect(session.lease().key, isNull);
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
