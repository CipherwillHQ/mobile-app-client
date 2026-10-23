// Refreshes online billing data after checkout and on user request.
// Owns billing reload controls and terminal checkout feedback.
// Does not treat a payment message as confirmed Premium activation.
import 'package:flutter/material.dart';
import '../../shared/ui/app_notice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/remote_panel.dart';
import 'upgrade_contract.dart';

void refreshBilling(WidgetRef ref) {
  ref.invalidate(accountProvider);
  for (final operation in ['GET_MY_SUBSCRIPTION', 'GET_MY_INVOICES']) {
    ref.invalidate(remoteProvider((operation, '{}')));
  }
}

void showUpgradeResult(
  BuildContext context,
  WidgetRef ref,
  UpgradeResult result,
) {
  if (result.success) refreshBilling(ref);
  showNotice(
    context,
    result.success
        ? 'Payment received. Premium will appear after processing. Refresh to check your plan.'
        : result.message ??
              'Checkout could not be completed. Please try again.',
    error: !result.success,
  );
}

class BillingRefreshButton extends ConsumerWidget {
  const BillingRefreshButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => IconButton(
    tooltip: 'Refresh billing',
    icon: const Icon(Icons.refresh_rounded),
    onPressed: () => refreshBilling(ref),
  );
}
