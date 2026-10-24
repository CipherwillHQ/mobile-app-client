// Presents one number and its existing verification/channel actions.
// Owns OTP entry and server-controlled per-number preferences.
// Does not enable channels for unverified numbers.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/remote_panel.dart';

const channelLabels = {
  'mandatory_phone_calls': 'Essential phone calls',
  'mandatory_sms': 'Essential SMS',
  'mandatory_whatsapp': 'Essential WhatsApp',
  'promotional_phone_calls': 'Promotional phone calls',
  'promotional_sms': 'Promotional SMS',
  'promotional_whatsapp': 'Promotional WhatsApp',
};

class PhoneCard extends ConsumerWidget {
  final Json phone;
  const PhoneCard({super.key, required this.phone});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PanelSection(
    title: '+' + phone['phone_code'] + ' ' + phone['phone_num'],
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: StatusPill(
          phone['verified'] == true ? 'Verified' : 'Verification required',
          icon: phone['verified'] == true ? AppIcons.verified : AppIcons.info,
        ),
      ),
      if (phone['verified'] != true) ...[
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => perform(context, () async {
            await ref.read(apiProvider).run(
              'SEND_USER_PHONE_VERIFICATION_CODE',
              {'id': phone['id']},
            );
          }, success: 'Code requested.'),
          child: const Text('Send verification code'),
        ),
        TextButton(
          onPressed: () => perform(context, () async {
            final otp = await prompt(context, 'Verification code');
            if (otp == null) throw const ActionCancelled();
            final result = await ref.read(apiProvider).run(
              'VERIFY_USER_PHONE_NUMBER',
              {'id': phone['id'], 'otp': otp},
            );
            if (result['verifyUserPhoneNumber'] != true) {
              throw StateError('Verification failed.');
            }
            ref.invalidate(remoteProvider);
          }, success: 'Number verified.'),
          child: const Text('Enter code'),
        ),
      ],
      const SizedBox(height: 16),
      for (final entry in channelLabels.entries)
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(entry.value),
          value: phone[entry.key] == true,
          onChanged: phone['verified'] != true
              ? null
              : (value) => perform(context, () async {
                  await ref.read(apiProvider).run('UPDATE_MOBILE_PREFERENCES', {
                    'id': phone['id'],
                    'key': entry.key,
                    'value': value,
                  });
                  ref.invalidate(remoteProvider);
                }),
        ),
      TextButton(
        onPressed: () => perform(context, () async {
          if (!await confirm(context, 'Remove this phone number?')) {
            throw const ActionCancelled();
          }
          await ref.read(apiProvider).run('REMOVE_USER_PHONE_NUMBER', {
            'id': phone['id'],
          });
          ref.invalidate(remoteProvider);
        }),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.error,
        ),
        child: const Text('Remove number'),
      ),
    ],
  );
}
