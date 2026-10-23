// Verifies sensitive values cannot escape the crash-report allowlist.
// Owns request, message, local-variable and breadcrumb redaction tests.
// Does not send telemetry.
import 'dart:convert';
// ignore_for_file: deprecated_member_use
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'crash_reporting.dart';

void main() {
  test(
    'tokens, vault content and signed URLs are stripped from all contexts',
    () {
      final event = SentryEvent(
        message: SentryMessage('secret-token'),
        extra: {'vault': 'private-data'},
        request: SentryRequest(url: 'https://example.com/?signature=secret'),
        breadcrumbs: [Breadcrumb(message: 'private-data')],
        exceptions: [
          SentryException(
            type: 'StateError',
            value: 'private-data',
            stackTrace: SentryStackTrace(
              frames: [
                SentryStackFrame(
                  function: 'save',
                  vars: {'key': 'secret-token'},
                  contextLine: 'private-data',
                ),
              ],
            ),
          ),
        ],
      );
      final encoded = jsonEncode(redactCrash(event, Hint()).toJson());
      for (final value in [
        'secret-token',
        'private-data',
        'signature=secret',
      ]) {
        expect(encoded, isNot(contains(value)));
      }
      expect(encoded, contains('StateError'));
    },
  );
}
