// Presents native provider alternatives to email authentication.
// Owns Google and iOS Apple sign-in buttons.
// Does not link providers or initialize their SDKs.
import 'dart:io';
import 'package:flutter/material.dart';

class AuthProviders extends StatelessWidget {
  final bool busy;
  final VoidCallback google;
  final VoidCallback apple;
  const AuthProviders({
    super.key,
    required this.busy,
    required this.google,
    required this.apple,
  });
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 20),
      Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'or continue with',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
      const SizedBox(height: 14),
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: busy ? null : google,
        icon: Image.asset(
          'assets/images/google.png',
          width: 22,
          height: 22,
          excludeFromSemantics: true,
        ),
        label: const Text('Continue with Google'),
      ),
      if (Platform.isIOS) ...[
        const SizedBox(height: 10),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
          onPressed: busy ? null : apple,
          icon: const Icon(Icons.apple, size: 22),
          label: const Text('Continue with Apple'),
        ),
      ],
    ],
  );
}
