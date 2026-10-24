// Displays the installed app's native version and build number.
// Owns package metadata loading and the subdued About footer.
// Does not infer a release version from hardcoded text or account data.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/app_package.dart';

class AppVersion extends ConsumerWidget {
  const AppVersion({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appPackageProvider).asData?.value;
    if (info == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Opacity(
        opacity: .5,
        child: Text(
          'Version ${info.version} · Build ${info.buildNumber}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
