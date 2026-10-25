// Presents the Guide's verification delivery and confirmation instructions.
// Owns two-step progress, action labels and retryable feedback.
// Does not send emails or read authentication state.
import 'package:flutter/material.dart';

class EmailVerificationSlide extends StatelessWidget {
  final bool sent, busy;
  final String? error;
  final VoidCallback send, check, close;
  const EmailVerificationSlide({
    super.key,
    required this.sent,
    required this.busy,
    required this.error,
    required this.send,
    required this.check,
    required this.close,
  });
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        sent ? 'Check your inbox' : 'Verify your email',
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 28),
      Text(
        sent
            ? 'Open the verification link in your email, then return here to continue your Cipherwill setup.'
            : "We'll send a verification link to your account email. Open it to confirm your email address.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: 28),
      if (error != null) ...[
        Semantics(
          liveRegion: true,
          child: Text(error!, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 16),
      ],
      FilledButton(
        onPressed: busy
            ? null
            : sent
            ? check
            : send,
        child: Text(
          sent
              ? busy
                    ? 'Checking status…'
                    : "I've verified it"
              : busy
              ? 'Sending…'
              : 'Send verification email',
        ),
      ),
      if (sent)
        TextButton(
          onPressed: busy ? null : send,
          child: const Text('Resend verification email'),
        ),
      const SizedBox(height: 28),
      TextButton(
        onPressed: busy ? null : close,
        child: const Text('Back to overview'),
      ),
      const SizedBox(height: 12),
      Text('Step ${sent ? 2 : 1} of 2'),
    ],
  );
}
