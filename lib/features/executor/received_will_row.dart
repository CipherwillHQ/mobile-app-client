// Renders a donor and deadline for a received will.
// Owns the explicit open action and disabled expired-access state.
// Does not authorize reads or reveal decrypted data.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/person_name.dart';
import '../../shared/ui/navigation_row.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/remote_panel.dart';
import 'access_status.dart';
import 'executor_location.dart';

class ReceivedWillRow extends StatelessWidget {
  final Json grant;
  const ReceivedWillRow({super.key, required this.grant});
  @override
  Widget build(BuildContext context) {
    final active = isActiveAccess(grant);
    return RemotePanel(
      operation: 'GET_PERSON',
      variables: {'id': grant['user']},
      builder: (result) {
        final name = personName(asJson(result['getPerson']));
        return NavigationRow(
          leading: PersonAvatar(name),
          title: name,
          detail: active
              ? 'Available until ${dateLabel(grant['expire_at'])}'
              : 'Access ended',
          trailing: active
              ? TextButton(
                  onPressed: () =>
                      context.push(executorWillLocation(grant['id'])),
                  child: const Text('Open will'),
                )
              : null,
        );
      },
    );
  }
}
