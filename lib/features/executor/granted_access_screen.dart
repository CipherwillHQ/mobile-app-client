// Preserves direct links to the owner's contextual access review.
// Owns the focused page fallback for the dashboard review sheet.
// Does not expose a permanent owner navigation destination.
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import 'released_access_list.dart';
import 'will_access_refresh.dart';

class GrantedAccessScreen extends StatelessWidget {
  const GrantedAccessScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Review access',
    focused: true,
    children: [WillAccessRefresh(child: ReleasedAccessList())],
  );
}
