// Tests local guidance conditions and the final network allowlist.
// Owns validation, sensitive whitespace and private-context isolation.
// Does not contact services or register objectives.
import 'package:flutter_test/flutter_test.dart' hide matches;
import 'rules.dart';
import 'input_validation.dart';

void main() {
  test('nested conditions and safe template paths match the web protocol', () {
    final scope = {
      'account': {'firstName': 'Sam', 'count': 2},
      'answers': {},
      'context': {},
    };
    expect(
      matches({
        'all': [
          {'path': 'account.count', 'operator': 'gte', 'value': 2},
          {
            'not': {'path': 'account.firstName', 'operator': 'missing'},
          },
        ],
      }, scope),
      true,
    );
    expect(guidanceText('Hello {{account.firstName}}', scope), 'Hello Sam');
    expect(guidancePath(scope, 'account.constructor'), null);
  });
  test('completion includes only catalog allowlisted identifiers', () {
    final flow = {
      'completion': {
        'fields': ['itemId'],
        'values': {
          'itemId': {'path': 'effects.savedItem.itemId'},
        },
      },
    };
    expect(
      completionAnswers(
        flow,
        {'password': 'secret'},
        {
          'effects': {
            'savedItem': {'itemId': 'guided_123'},
          },
          'context': {'password': 'secret'},
        },
      ),
      {'itemId': 'guided_123'},
    );
  });
  test(
    'credential whitespace, email normalization and valid calendar dates',
    () {
      expect(
        normalizeGuidance({
          'type': 'single_line_text',
          'sensitive': true,
        }, '  secret  '),
        '  secret  ',
      );
      expect(
        normalizeGuidance({'type': 'email'}, ' Sam@Example.com '),
        'sam@example.com',
      );
      expect(
        () => normalizeGuidance({'type': 'date'}, '2026-02-30'),
        throwsStateError,
      );
      expect(
        () => normalizeGuidance({'type': 'number', 'min': 2}, '1'),
        throwsStateError,
      );
      expect(
        () => normalizeGuidance({'type': 'boolean'}, null),
        throwsStateError,
      );
    },
  );
  test('segment rules preserve plan and opt-in requirements', () {
    final flow = {
      'segment': {
        'key': 'segment_storage',
        'planRequired': 'premium',
        'requireEnabled': true,
      },
    };
    expect(
      segmentAllowed(flow, {
        'plan': 'free',
        'preferences': {'segment_storage': true},
      }),
      false,
    );
    expect(
      segmentAllowed(flow, {
        'plan': 'premium',
        'preferences': {'segment_storage': false},
      }),
      false,
    );
  });
}
