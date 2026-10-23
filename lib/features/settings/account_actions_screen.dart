// Directs account reset and deletion to the existing desktop web application.
// Owns the mobile account-action explanation.
// Does not send destructive mutations or clear account data locally.
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/desktop_handoff.dart';
export 'feedback_screen.dart';

class AccountActionsScreen extends StatelessWidget {
  const AccountActionsScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Reset or delete account',
    children: [DesktopHandoff(purpose: 'reset or delete your account')],
  );
}
