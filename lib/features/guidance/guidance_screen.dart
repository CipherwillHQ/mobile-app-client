// Opens the Guide once the current account is available.
// Owns account loading and retry before independently accessible setup.
// Does not bypass onboarding or unlock encryption factors.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import 'guidance_setup.dart';
import 'guidance_slide.dart';

class GuidanceScreen extends ConsumerWidget {
  const GuidanceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    if (account.isLoading || account.hasError) {
      return GuidanceSlide(
        identity: 'account',
        active: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              account.hasError
                  ? "We couldn't load your account overview."
                  : 'Preparing your account overview…',
            ),
            if (account.hasError)
              TextButton(
                onPressed: () => ref.invalidate(accountProvider),
                child: const Text('Retry'),
              ),
          ],
        ),
      );
    }
    return const GuidanceSetup();
  }
}
