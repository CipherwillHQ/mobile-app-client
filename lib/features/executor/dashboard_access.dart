// Presents the two conditional access scenarios on the owner dashboard.
// Owns released-access priority and the received-wills entry widget.
// Does not create permanent navigation links or grant access.
import 'package:flutter/material.dart';
import 'will_access_refresh.dart';
import 'received_wills.dart';
import 'released_access_notice.dart';

class DashboardAccess extends StatelessWidget {
  const DashboardAccess({super.key});
  @override
  Widget build(BuildContext context) => const WillAccessRefresh(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ReleasedAccessNotice(), ReceivedWills()],
    ),
  );
}
