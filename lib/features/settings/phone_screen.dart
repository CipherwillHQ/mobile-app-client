// Manages phone verification and existing communication channels.
// Owns adding numbers and refreshing their server state.
// Does not introduce push notifications.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/empty_state.dart';
import 'email_preferences.dart';
import 'phone_card.dart';

class PhoneScreen extends ConsumerWidget {
  const PhoneScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Notifications',
    children: [
      const EmailPreferences(),
      const SectionHeading('Phone numbers'),
      FilledButton.icon(
        onPressed: () => perform(context, () async {
          final code = await prompt(
            context,
            'Country dialling code',
            initial: '91',
          );
          if (code == null || !context.mounted) throw const ActionCancelled();
          final number = await prompt(context, 'Phone number');
          if (number == null) throw const ActionCancelled();
          await ref.read(apiProvider).run('ADD_USER_PHONE_NUMBER', {
            'phone_code': code,
            'phone_num': number,
          });
          ref.invalidate(remoteProvider);
        }, success: 'Phone number added.'),
        icon: const Icon(AppIcons.add),
        label: const Text('Add phone number'),
      ),
      const SizedBox(height: 16),
      RemotePanel(
        operation: 'GET_USER_PHONE_NUMBERS',
        builder: (r) {
          final phones = jsonList(r['getUserPhoneNumbers']);
          if (phones.isEmpty) {
            return const EmptyState(
              title: 'Add another way to reach you',
              message:
                  'Verify a phone number to enable SMS, WhatsApp and phone channels.',
              icon: AppIcons.phone,
            );
          }
          return Column(
            children: [for (final phone in phones) PhoneCard(phone: phone)],
          );
        },
      ),
    ],
  );
}
