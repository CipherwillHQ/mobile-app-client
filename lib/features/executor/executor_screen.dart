// Lists released wills and donor information for the beneficiary.
// Owns executor entry points and read-only presentation.
// Does not read protected asset contents.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/navigation_row.dart';

class ExecutorScreen extends StatelessWidget {
  const ExecutorScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Executor workspace',
    children: [
      const GuidePanel(
        title: 'Released wills',
        message:
            'Read-only access becomes available when a will is released to you. Each donor controls what you receive.',
        icon: AppIcons.beneficiary,
      ),
      const SizedBox(height: 20),
      RemotePanel(
        operation: 'GET_ALL_BENEFICIARY_ACCESS',
        builder: (r) {
          final grants = jsonList(r['getAllBeneficiaryAccess']);
          if (grants.isEmpty) {
            return const EmptyState(
              title: 'No released wills yet',
              message: 'Wills entrusted to you will appear here after release.',
              icon: AppIcons.timeline,
            );
          }
          return Column(
            children: [
              for (final access in grants)
                RemotePanel(
                  operation: 'GET_PERSON',
                  variables: {'id': access['user']},
                  builder: (p) => NavigationRow(
                    leading: PersonAvatar(personName(asJson(p['getPerson']))),
                    title: personName(asJson(p['getPerson'])),
                    detail:
                        'Read-only · Expires ' + dateLabel(access['expire_at']),
                    trailing: const Icon(AppIcons.next),
                    onTap: () => context.push('/executor/' + access['id']),
                  ),
                ),
            ],
          );
        },
      ),
    ],
  );
}
