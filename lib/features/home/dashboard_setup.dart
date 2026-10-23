// Matches the web dashboard's three-step setup checklist.
// Owns presentation of profile, stored-data and beneficiary completion.
// Does not change account setup or infer will release readiness.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/remote_panel.dart';

class DashboardSetup extends ConsumerWidget {
  const DashboardSetup({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => RemotePanel(
    operation: 'GET_STORAGE_USED',
    builder: (storage) => RemotePanel(
      operation: 'GET_SMARTWILL_BENEFICIARY',
      builder: (beneficiaries) {
        final account = ref.watch(accountProvider).value ?? {};
        final birth = num.tryParse(account['birth_date']?.toString() ?? '');
        final usage = asJson(storage['getStorageUsed']);
        final steps = [
          (
            'Complete your profile',
            '/profile',
            account['first_name']?.toString().trim().isNotEmpty == true &&
                birth != null &&
                birth.isFinite &&
                birth != 0,
          ),
          (
            'Secure your first item',
            '/vault',
            (num.tryParse(usage['text_pods']?.toString() ?? '') ?? 0) > 0 ||
                (num.tryParse(usage['storage_pods']?.toString() ?? '') ?? 0) >
                    0,
          ),
          (
            'Add a beneficiary',
            '/beneficiaries',
            jsonList(beneficiaries['getSmartWillBeneficiaries']).isNotEmpty,
          ),
        ];
        final completed = steps.where((step) => step.$3).length;
        if (completed == 3) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 12,
              runSpacing: 4,
              children: [
                Text(
                  'Get started',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '$completed of 3 complete',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (final step in steps)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  step.$3
                      ? Icons.check_circle_outline
                      : Icons.radio_button_unchecked,
                  size: 22,
                  color: step.$3 ? Theme.of(context).colorScheme.primary : null,
                ),
                title: Text(
                  step.$1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(Icons.chevron_right, size: 18),
                onTap: () => context.push(step.$2),
              ),
            const Divider(),
          ],
        );
      },
    ),
  );
}
