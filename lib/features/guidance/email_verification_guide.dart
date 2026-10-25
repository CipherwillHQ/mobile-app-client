// Wraps guidance with an independent banner-triggered email verification flow.
// Owns send/check transitions while keeping setup available separately.
// Does not load catalog objectives or bypass server verification.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../auth/email_verification.dart';
import 'guidance_overview_data.dart';
import 'guidance_slide.dart';
import 'email_verification_slide.dart';

class EmailVerificationGuide extends ConsumerStatefulWidget {
  final Widget Function(VoidCallback verifyEmail) builder;
  const EmailVerificationGuide({super.key, required this.builder});
  @override
  ConsumerState<EmailVerificationGuide> createState() =>
      _EmailVerificationGuideState();
}

class _EmailVerificationGuideState
    extends ConsumerState<EmailVerificationGuide> {
  bool active = false, sent = false, busy = false;
  String? error;

  void open() => setState(() => active = true);
  void close() => setState(() => active = false);

  Future<void> send() async {
    if (busy) return;
    setState(() {
      busy = true;
      error = null;
    });
    try {
      await sendVerificationEmail(ref.read(apiProvider));
      if (mounted) setState(() => sent = true);
    } catch (cause) {
      if (mounted) setState(() => error = cause.toString());
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> check() async {
    if (busy) return;
    setState(() {
      busy = true;
      error = null;
    });
    try {
      final verified = await checkEmailVerification(
        ref.read(apiProvider),
        ref.read(firebaseProvider),
      );
      if (!mounted) return;
      if (verified) {
        setState(() => active = false);
        context.go('/guide');
        ref.invalidate(accountProvider);
        ref.invalidate(guidanceOverviewProvider);
      } else {
        setState(
          () => error =
              "Your email isn't verified yet. Open the link in your inbox, then try again.",
        );
      }
    } catch (cause) {
      if (mounted) setState(() => error = cause.toString());
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => active
      ? GuidanceSlide(
          active: true,
          pause: busy ? null : close,
          identity: sent ? 'verification-check' : 'verification-send',
          child: EmailVerificationSlide(
            sent: sent,
            busy: busy,
            error: error,
            send: send,
            check: check,
            close: close,
          ),
        )
      : widget.builder(open);
}
