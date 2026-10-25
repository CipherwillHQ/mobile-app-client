// Opens the web-style status overview and full-area guided setup slides.
// Owns pause/resume, objective introductions, timed displays and error recovery.
// Does not persist plaintext drafts or replace catalog eligibility rules.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/security/temp_cleanup.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../security/session_controller.dart';
import 'guidance_session.dart';
import 'guidance_overview.dart';
import 'guidance_overview_data.dart';
import 'guidance_active_slide.dart';
import 'guidance_slide.dart';
import 'email_verification_guide.dart';

class GuidanceSetup extends ConsumerStatefulWidget {
  const GuidanceSetup({super.key});
  @override
  ConsumerState<GuidanceSetup> createState() => _GuidanceSetupState();
}

class _GuidanceSetupState extends ConsumerState<GuidanceSetup> {
  late final GuidanceSession session;
  bool busy = true, active = false, introduction = true;
  String? error, inputId;
  dynamic answer;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    session = GuidanceSession(
      ref.read(apiProvider),
      ref.read(sessionProvider.notifier).lease(),
    );
    run(session.load);
  }

  @override
  void dispose() {
    timer?.cancel();
    session.clear();
    answer = null;
    unawaited(cleanupPickedFiles());
    super.dispose();
  }

  Future<void> run(Future<void> Function() action) async {
    timer?.cancel();
    final previous = session.flow?['id'];
    setState(() {
      busy = true;
      error = null;
    });
    try {
      await action();
      if (!mounted) return;
      setState(() {
        busy = false;
        if (previous != session.flow?['id']) introduction = true;
        if (session.flow == null) active = false;
      });
      schedule();
    } catch (e) {
      if (mounted) {
        setState(() {
          busy = false;
          error = e.toString();
        });
      }
    }
  }

  int get displayForMs {
    final spec = session.completion != null
        ? asJson(session.flow?['completion'])
        : session.step;
    return ((spec?['displayForMs']) as num? ?? 0).toInt();
  }

  void schedule() {
    timer?.cancel();
    if (!active || introduction || busy || error != null) return;
    final delay = displayForMs;
    if (delay > 0 && session.step?['input'] == null) {
      timer = Timer(Duration(milliseconds: delay.toInt()), advance);
    }
  }

  void pause() {
    timer?.cancel();
    setState(() => active = false);
    ref.invalidate(guidanceOverviewProvider);
  }

  void start() {
    setState(() => active = true);
    if (error != null && session.flow == null) {
      run(session.load);
    }
    schedule();
  }

  Future<void> advance() async {
    if (introduction) {
      setState(() => introduction = false);
      schedule();
      return;
    }
    await run(
      () => session.advance(
        answer: answer,
        submitted: session.step?['input'] != null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final flow = session.flow, step = session.step;
    if (inputId != step?['id']) {
      inputId = step?['id'];
      answer = null;
    }
    final deferred = jsonList(
      session.account['deferrals'],
    ).where((choice) => choice['dismissed'] != true).toList();
    final complete = session.completion != null;
    return EmailVerificationGuide(
      builder: (verifyEmail) => GuidanceSlide(
        active: active,
        pause: busy ? null : pause,
        identity: !active
            ? 'overview'
            : error != null
            ? 'error'
            : introduction
            ? 'intro-' + (flow?['id'] ?? '')
            : complete
            ? 'complete-' + (flow?['id'] ?? '')
            : step?['id'] ?? 'loading',
        child: !active
            ? GuidanceOverview(
                busy: busy,
                available: flow != null,
                failed: error != null,
                deferred: deferred,
                catalog: session.catalog,
                start: start,
                verifyEmail: verifyEmail,
                resume: (id) {
                  setState(() => active = true);
                  run(() => session.resume(id));
                },
              )
            : GuidanceActiveSlide(
                session: session,
                answer: answer,
                busy: busy,
                introduction: introduction,
                error: error,
                displayForMs: displayForMs,
                changed: (value) => answer = value,
                advance: advance,
                retry: () => run(
                  flow == null
                      ? session.load
                      : () => session.advance(
                          answer: answer,
                          submitted: step?['input'] != null,
                        ),
                ),
                skip: () =>
                    run(() => session.advance(answer: null, submitted: true)),
                defer: () => run(session.defer),
              ),
      ),
    );
  }
}
