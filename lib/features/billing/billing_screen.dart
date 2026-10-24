// Manages subscriptions and offers the existing web upgrade entry.
// Owns subscription details, invoice links and the hosted Paddle portal.
// Does not implement checkout or activate Premium locally.

import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/feature_card.dart';
import '../../shared/ui/navigation_row.dart';
import 'billing_refresh.dart';
import 'upgrade_entry.dart';

class BillingScreen extends ConsumerWidget {
  const BillingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Billing',
    actions: const [BillingRefreshButton()],
    children: [
      const UpgradeEntry(),
      RemotePanel(
        operation: 'GET_MY_SUBSCRIPTION',
        builder: (r) {
          final raw = r['getMySubscription'];
          if (raw == null) {
            if (ref.read(accountProvider).value?['plan'] == 'free') {
              return const SizedBox.shrink();
            }
            return const EmptyState(
              title: 'No active subscription',
              message: 'Your existing subscription details will appear here.',
              icon: AppIcons.premium,
            );
          }
          final s = asJson(raw);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                s['plan_name'],
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: StatusPill(s['status'], icon: AppIcons.premium),
              ),
              if (s['next_billing_at'] != null)
                NavigationRow(
                  icon: AppIcons.timeline,
                  title: 'Next billing',
                  detail: dateLabel(s['next_billing_at']),
                ),
              if (s['cancel_at'] != null)
                NavigationRow(
                  icon: AppIcons.timeline,
                  title: 'Cancellation scheduled',
                  detail: dateLabel(s['cancel_at'], includeTime: true),
                ),
              NavigationRow(
                icon: AppIcons.card,
                title: 'Payment method',
                detail: s['last_payment_method']?.toString() ?? 'Unavailable',
              ),
              if (s['payment_gateway'] == 'paddle')
                FilledButton.icon(
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
                  icon: const Icon(AppIcons.external, size: 20),
                  label: const Text('Manage billing'),
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
                icon: AppIcons.billing,
                title: invoice['plan_name'],
                subtitle:
                    invoice['status'] +
                    ' · ' +
                    dateLabel(invoice['created_at']) +
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'No invoices yet',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
