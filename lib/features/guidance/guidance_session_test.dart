// Exercises guidance save failures and catalog-driven step execution.
// Owns completion status, recovery acknowledgements and capability regressions.
// Does not save real assets or use Firebase services.
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../core/api/api_failure.dart';
import '../security/session_controller.dart';
import 'guidance_session.dart';
import 'guidance_test_data.dart';

void main() {
  test(
    'a pending completion is retried and never presented as success',
    () async {
      var attempts = 0;
      final api = FakeApi(
        (name, args) async => {
          'completeGuidedAction': {
            'status': ++attempts == 1 ? 'pending' : 'complete',
          },
        },
      );
      final session = GuidanceSession(api, VaultLease(null, () {}))
        ..flow = guidanceDefinition();
      await expectLater(session.advance(), throwsStateError);
      expect(session.completion, isNull);
      await session.advance();
      expect(session.completion?['status'], 'complete');
      expect(attempts, 2);
      api.dispose();
    },
  );
  test(
    'an input-bearing effect executes once and waits for the next input',
    () async {
      final api = FakeApi((name, args) async => {});
      final session = GuidanceSession(api, VaultLease(null, () {}))
        ..flow = guidanceDefinition(
          steps: [
            {
              'id': 'first',
              'input': {'key': 'name', 'type': 'single_line_text'},
              'effect': {'id': 'itemId', 'type': 'create_item_id'},
            },
            {
              'id': 'second',
              'input': {'key': 'other', 'type': 'single_line_text'},
              'effect': {'id': 'otherId', 'type': 'create_item_id'},
            },
          ],
        );
      await session.advance(answer: 'Sam', submitted: true);
      expect(session.answers['name'], 'Sam');
      expect(session.effects['itemId'], startsWith('guided_'));
      expect(session.effects.containsKey('otherId'), false);
      expect(session.step?['id'], 'second');
      api.dispose();
    },
  );
  test('catalog changes refresh the flow and require review', () async {
    final changed = guidanceDefinition()..['version'] = 2;
    final api = FakeApi((name, args) async {
      if (name == 'COMPLETE_GUIDED_ACTION') {
        throw const ApiFailure('GUIDANCE_CATALOG_CHANGED', 'Changed');
      }
      if (name == 'GUIDANCE_BOOTSTRAP') return guidanceBootstrap([changed]);
      return {};
    });
    final session = GuidanceSession(api, VaultLease(null, () {}))
      ..flow = guidanceDefinition();
    await expectLater(session.advance(), throwsStateError);
    expect(session.flow?['version'], 2);
    expect(session.completion, isNull);
    api.dispose();
  });
  test(
    'lost acknowledgement retries without repeating the completed effect',
    () async {
      var acks = 0;
      final api = FakeApi((name, args) async {
        if (name == 'ACK_GUIDANCE_OPERATION') {
          if (++acks == 1) throw const ApiFailure('NETWORK', 'Offline');
          return {'finishGuidedActionOperation': true};
        }
        return {};
      });
      final session = GuidanceSession(api, VaultLease(null, () {}))
        ..flow = guidanceDefinition(
          actions: [
            {'id': 'action', 'type': 'create_item_id'},
          ],
        )
        ..completion = {'status': 'complete'};
      await expectLater(session.finish(), throwsA(isA<ApiFailure>()));
      final id = session.effects['action'];
      await session.finish();
      expect(session.effects['action'], id);
      expect(session.finished, contains('action'));
      expect(acks, 2);
      api.dispose();
    },
  );
  test('unsupported available definitions cannot silently disappear', () async {
    final flow = guidanceDefinition()..['protocolVersion'] = 4;
    final api = FakeApi(
      (name, args) async =>
          name == 'GUIDANCE_BOOTSTRAP' ? guidanceBootstrap([flow]) : {},
    );
    final session = GuidanceSession(api, VaultLease(null, () {}));
    await expectLater(session.load(), throwsStateError);
    api.dispose();
  });
}
