// Edits the existing backend profile fields
// Owns profile form serialization and birth-date conversion.
// Does not change identity providers or account email.

import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../people/person_identity.dart';
import 'profile_fields.dart';
import 'settings_tabs.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final fields = <String, TextEditingController>{};
  bool loaded = false;
  bool busy = false;
  @override
  void dispose() {
    for (final field in fields.values) {
      field.dispose();
    }
    super.dispose();
  }

  Future<void> save() async {
    setState(() => busy = true);
    await perform(context, () async {
      final data = {
        for (final entry in fields.entries) entry.key: entry.value.text,
      };
      if (data['birth_date']!.isEmpty) {
        data.remove('birth_date');
      } else {
        final date = DateTime.parse(data['birth_date']!);
        data['birth_date'] = DateTime.utc(
          date.year,
          date.month,
          date.day,
        ).millisecondsSinceEpoch.toString();
      }
      await ref.read(apiProvider).run('UPDATE_USER', {'data': data});
      ref.invalidate(accountProvider);
    }, success: 'Profile saved.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final account = ref.watch(accountProvider).value;
    if (account == null) {
      return const PageFrame(
        title: 'Settings',
        tabs: SettingsTabs(location: '/profile'),
        children: [CircularProgressIndicator()],
      );
    }
    if (!loaded) {
      for (final key in [
        'first_name',
        'middle_name',
        'last_name',
        'birth_date',
        'gender',
        'country',
        'address_line1',
        'address_line2',
        'city',
        'state',
        'postal_code',
      ]) {
        var value = account[key]?.toString() ?? '';
        if (key == 'birth_date' && int.tryParse(value) != null) {
          value = DateTime.fromMillisecondsSinceEpoch(
            int.parse(value),
            isUtc: true,
          ).toIso8601String().split('T').first;
        }
        fields[key] = TextEditingController(text: value);
      }
      loaded = true;
    }
    return PageFrame(
      title: 'Settings',
      tabs: const SettingsTabs(location: '/profile'),
      footer: FilledButton.icon(
        onPressed: busy ? null : save,
        icon: const Icon(AppIcons.check),
        label: Text(busy ? 'Saving…' : 'Save profile'),
      ),
      children: [
        PersonIdentity(person: account, caption: 'Your Cipherwill account'),
        ProfileFields(fields: fields),
      ],
    );
  }
}
