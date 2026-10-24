// Shows a beneficiary's released access and confirmed revocation.
// Owns the pending-action guard and backend-success requirement.
// Does not remove grants on cancellation or an incomplete mutation.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/person_name.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/navigation_row.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/remote_panel.dart';
import '../security/session_controller.dart';
import 'executor_providers.dart';

class ReleasedAccessRow extends ConsumerStatefulWidget {
  final Json grant;
  const ReleasedAccessRow({super.key, required this.grant});
  @override
  ConsumerState<ReleasedAccessRow> createState() => _ReleasedAccessRowState();
}

class _ReleasedAccessRowState extends ConsumerState<ReleasedAccessRow> {
  bool busy = false;
  Future<void> revoke(String name) async {
    if (busy) return;
    setState(() => busy = true);
    final api = ref.read(apiProvider);
    final container = ProviderScope.containerOf(context);
    final lease = ref.read(sessionProvider.notifier).lease();
    await perform(context, () async {
      if (!await confirm(context, 'Revoke $name’s access to your will?')) {
        throw const ActionCancelled();
      }
      lease.check();
      final result = await api.run('REVOKE_ACCESS_TO_MY_WILL', {
        'id': widget.grant['id'],
      });
      lease.check();
      if (result['revokeAccessToMyWill'] != true) {
        throw StateError('Access could not be revoked. Try again.');
      }
      container.invalidate(releasedAccessProvider);
    }, success: 'Access revoked.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => RemotePanel(
    operation: 'GET_PERSON',
    variables: {'id': widget.grant['user']},
    builder: (result) {
      final name = personName(asJson(result['getPerson']));
      final action = TextButton(
        onPressed: busy ? null : () => revoke(name),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.error,
        ),
        child: Text(busy ? 'Revoking…' : 'Revoke access'),
      );
      final largeText = MediaQuery.textScalerOf(context).scale(14) >= 22;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavigationRow(
            leading: PersonAvatar(name),
            title: name,
            detail: 'Available until ${dateLabel(widget.grant['expire_at'])}',
            trailing: largeText ? null : action,
          ),
          if (largeText) Align(alignment: Alignment.centerRight, child: action),
          const Divider(height: 1),
        ],
      );
    },
  );
}
