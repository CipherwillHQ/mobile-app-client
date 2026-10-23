// Presents the signed-in account with its real subscription state.
// Owns the settings identity card and profile navigation.
// Does not fetch external avatars or infer security state.
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/async_panel.dart';

class SettingsProfile extends ConsumerWidget {
  const SettingsProfile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => AsyncPanel(
    value: ref.watch(accountProvider),
    retry: () => ref.invalidate(accountProvider),
    builder: (account) => Card(
      child: InkWell(
        onTap: () => context.push('/profile'),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonAvatar(personName(account), size: 64),
              const SizedBox(height: 16),
              Text(
                personName(account),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(
                account['email']?.toString() ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              StatusPill(
                account['plan'] == 'free' ? 'Free plan' : 'Premium plan',
                icon: Icons.workspace_premium_outlined,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
