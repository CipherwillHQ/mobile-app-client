// Manages phone verification and existing communication channels
// Owns OTP entry and per-number channel preferences.
// Does not introduce push notifications.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';

class PhoneScreen extends ConsumerWidget {
  const PhoneScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Phone and communication',
    children: [
      FilledButton(
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
        child: const Text('Add phone number'),
      ),
      RemotePanel(
        operation: 'GET_USER_PHONE_NUMBERS',
        builder: (r) => Column(
          children: [
            for (final phone in jsonList(r['getUserPhoneNumbers']))
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '+' + phone['phone_code'] + ' ' + phone['phone_num'],
                      ),
                      subtitle: Text(
                        phone['verified'] == true
                            ? 'Verified'
                            : 'Verification required',
                      ),
                    ),
                    if (phone['verified'] != true) ...[
                      TextButton(
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
                          final otp = await prompt(
                            context,
                            'Verification code',
                          );
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
                    for (final key in [
                      'mandatory_phone_calls',
                      'mandatory_sms',
                      'mandatory_whatsapp',
                      'promotional_phone_calls',
                      'promotional_sms',
                      'promotional_whatsapp',
                    ])
                      SwitchListTile(
                        title: Text(key.replaceAll('_', ' ')),
                        value: phone[key] == true,
                        onChanged: phone['verified'] != true
                            ? null
                            : (value) => perform(context, () async {
                                await ref.read(apiProvider).run(
                                  'UPDATE_MOBILE_PREFERENCES',
                                  {
                                    'id': phone['id'],
                                    'key': key,
                                    'value': value,
                                  },
                                );
                                ref.invalidate(remoteProvider);
                              }),
                      ),
                    TextButton(
                      onPressed: () => perform(context, () async {
                        if (!await confirm(
                          context,
                          'Remove this phone number?',
                        )) {
                          throw const ActionCancelled();
                        }
                        await ref.read(apiProvider).run(
                          'REMOVE_USER_PHONE_NUMBER',
                          {'id': phone['id']},
                        );
                        ref.invalidate(remoteProvider);
                      }),
                      child: const Text('Remove number'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
