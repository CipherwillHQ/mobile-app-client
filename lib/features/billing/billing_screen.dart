// Manages subscriptions and offers the existing web upgrade entry.
// Owns cancellation, invoice links and billing refresh controls.
// Does not implement checkout or activate Premium locally.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/time.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/feature_card.dart';
import 'billing_refresh.dart';
import 'upgrade_entry.dart';

class BillingScreen extends ConsumerWidget {
  const BillingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Subscription and invoices',
    subtitle: 'Your plan and billing, in one place.',
    actions: const [BillingRefreshButton()],
    children: [
      const UpgradeEntry(),
      RemotePanel(
        operation: 'GET_MY_SUBSCRIPTION',
        builder: (r) {
          final raw = r['getMySubscription'];
          if (raw == null) {
            return const EmptyState(
              title: 'No active subscription',
              message: 'Your existing subscription details will appear here.',
              icon: Icons.workspace_premium_outlined,
            );
          }
          final s = asJson(raw);
          return PanelSection(
            title: s['plan_name'],
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: StatusPill(
                  s['status'],
                  icon: Icons.workspace_premium_outlined,
                ),
              ),
              ListTile(
                title: const Text('Next billing'),
                subtitle: Text(localTime(s['next_billing_at'])),
              ),
              if (s['cancel_at'] != null)
                ListTile(
                  title: const Text('Cancellation scheduled'),
                  subtitle: Text(localTime(s['cancel_at'])),
                ),
              ListTile(
                title: const Text('Payment method'),
                subtitle: Text(
                  s['last_payment_method']?.toString() ?? 'Unavailable',
                ),
              ),
              if (s['payment_gateway'] == 'paddle')
                TextButton(
                  onPressed: () => perform(context, () async {
                    final url = (await ref.read(apiProvider).run(
                      'GET_PADDLE_PORTAL_SESSION_URL',
                      {'subscription_id': s['id']},
                    ))['getPaddlePortalSessionUrl'];
                    if (!await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw StateError('Unable to open subscriber portal.');
                    }
                  }),
                  child: const Text('Manage existing subscription'),
                ),
              for (final entry in {
                'Cancel at period end': 'CANCEL_SUBSCRIPTION_AT_PERIOD_END',
                'Cancel now and request eligible refund':
                    'CANCEL_SUBSCRIPTION_NOW_AND_REFUND',
              }.entries)
                TextButton(
                  onPressed: () => perform(context, () async {
                    if (!await confirm(
                      context,
                      entry.key + '? Eligibility is checked by Cipherwill.',
                    )) {
                      throw const ActionCancelled();
                    }
                    await ref.read(apiProvider).run(entry.value, {
                      'subscriptionId': s['id'],
                    });
                    ref.invalidate(remoteProvider);
                    ref.invalidate(accountProvider);
                  }, success: 'Cancellation request completed.'),
                  child: Text(entry.key),
                ),
            ],
          );
        },
      ),
      const SectionHeading('Invoices'),
      RemotePanel(
        operation: 'GET_MY_INVOICES',
        builder: (r) => Column(
          children: [
            for (final invoice in jsonList(r['getMyInvoices']))
              FeatureCard(
                icon: Icons.receipt_long_outlined,
                title: invoice['plan_name'],
                subtitle:
                    invoice['status'] +
                    ' · ' +
                    localTime(invoice['created_at']) +
                    '\n' +
                    invoice['amount'].toString() +
                    ' ' +
                    invoice['currency'],
                onTap: () => perform(context, () async {
                  final url = (await ref.read(apiProvider).run(
                    'GET_INVOICE_PDF',
                    {'invoiceId': invoice['id']},
                  ))['getInvoicePdf'];
                  if (!await launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw StateError('Unable to open invoice.');
                  }
                }),
              ),
            if (jsonList(r['getMyInvoices']).isEmpty)
              const EmptyState(
                title: 'No invoices yet',
                message: 'Invoices for your subscription appear here.',
                icon: Icons.receipt_long_outlined,
              ),
          ],
        ),
      ),
    ],
  );
}
