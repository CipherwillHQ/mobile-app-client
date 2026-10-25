// Switches between native sign-in and the authenticated web application.
// Owns the WebView lifetime for each Firebase account.
// Does not duplicate web onboarding, verification or factor unlocking.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/auth_screen.dart';
import '../features/webview/mobile_webview.dart';
import 'providers.dart';

class AccountGate extends ConsumerWidget {
  final Uri? uri;
  const AccountGate({super.key, this.uri});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);
    if (auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final user = auth.value;
    if (user == null) return const AuthScreen();
    return MobileWebView(
      key: ValueKey(user.uid),
      auth: ref.watch(firebaseProvider),
      user: user,
      uri: uri,
    );
  }
}
