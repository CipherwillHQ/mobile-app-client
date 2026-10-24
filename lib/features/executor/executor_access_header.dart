// Identifies the selected donor and read-only deadline on shared pages.
// Owns the contextual header and permission-refresh registration.
// Does not display protected asset contents.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/person_name.dart';
import '../../shared/ui/navigation_row.dart';
import '../../shared/ui/page_refresh.dart';
import '../../shared/ui/remote_panel.dart';

class ExecutorAccessHeader extends StatefulWidget {
  final Json grant;
  final Future<void> Function()? refresh;
  const ExecutorAccessHeader({super.key, required this.grant, this.refresh});
  @override
  State<ExecutorAccessHeader> createState() => _ExecutorAccessHeaderState();
}

class _ExecutorAccessHeaderState extends State<ExecutorAccessHeader> {
  PageRefreshScope? scope;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final next = PageRefreshScope.maybeOf(context);
    if (scope == next) return;
    if (widget.refresh != null) {
      scope?.callbacks.remove(widget.refresh);
      next?.callbacks.add(widget.refresh!);
    }
    scope = next;
  }

  @override
  void dispose() {
    scope?.callbacks.remove(widget.refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      RemotePanel(
        operation: 'GET_PERSON',
        variables: {'id': widget.grant['user']},
        builder: (result) => NavigationRow(
          icon: AppIcons.beneficiary,
          title: personName(asJson(result['getPerson'])),
          detail:
              'Read-only · Available until ${dateLabel(widget.grant['expire_at'])}',
        ),
      ),
      const Divider(height: 16),
    ],
  );
}
