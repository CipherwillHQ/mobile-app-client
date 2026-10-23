// Redacts crash reports to exception types and minimal stack frames.
// Owns the final outbound telemetry allowlist.
// Does not retain messages, locals, breadcrumbs, requests or account context.
import 'package:sentry_flutter/sentry_flutter.dart';

SentryEvent redactCrash(SentryEvent event, Hint hint) => SentryEvent(
  eventId: event.eventId,
  timestamp: event.timestamp,
  level: event.level,
  platform: event.platform,
  release: event.release,
  environment: event.environment,
  exceptions: event.exceptions
      ?.map(
        (exception) => SentryException(
          type: exception.type,
          value: 'Redacted',
          stackTrace: exception.stackTrace == null
              ? null
              : redactStack(exception.stackTrace!),
        ),
      )
      .toList(),
  message: SentryMessage('Cipherwill application error'),
);
SentryStackTrace redactStack(SentryStackTrace trace) => SentryStackTrace(
  frames: trace.frames
      .map(
        (frame) => SentryStackFrame(
          fileName: frame.fileName?.split('/').last,
          function: frame.function,
          module: frame.module,
          lineNo: frame.lineNo,
          colNo: frame.colNo,
          inApp: frame.inApp,
          package: frame.package,
          native: frame.native,
        ),
      )
      .toList(),
);
