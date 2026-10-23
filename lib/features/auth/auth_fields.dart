// Renders account credentials with keyboard and explicit visibility controls.
// Owns input presentation and empty-field validation.
// Does not keep passwords beyond the parent-owned controllers.
import 'package:flutter/material.dart';

class AuthFields extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  final bool busy;
  final bool signup;
  final VoidCallback submit;
  final VoidCallback reset;
  const AuthFields({
    super.key,
    required this.email,
    required this.password,
    required this.busy,
    required this.signup,
    required this.submit,
    required this.reset,
  });
  @override
  State<AuthFields> createState() => _AuthFieldsState();
}

class _AuthFieldsState extends State<AuthFields> {
  final form = GlobalKey<FormState>();
  bool revealed = false;
  void submit() {
    if (!widget.busy && form.currentState!.validate()) widget.submit();
  }

  @override
  Widget build(BuildContext context) => Form(
    key: form,
    child: AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Email address',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.email,
            enabled: !widget.busy,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            autocorrect: false,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Enter your email'
                : null,
            decoration: const InputDecoration(hintText: 'you@example.com'),
          ),
          const SizedBox(height: 18),
          const Text(
            'Account password',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.password,
            enabled: !widget.busy,
            obscureText: !revealed,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => submit(),
            autocorrect: false,
            enableSuggestions: false,
            autofillHints: [
              widget.signup
                  ? AutofillHints.newPassword
                  : AutofillHints.password,
            ],
            validator: (value) => value == null || value.isEmpty
                ? 'Enter your account password'
                : null,
            decoration: InputDecoration(
              hintText: 'Enter password',
              suffixIcon: IconButton(
                tooltip: revealed ? 'Hide password' : 'Show password',
                onPressed: () => setState(() => revealed = !revealed),
                icon: Icon(
                  revealed
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                ),
              ),
            ),
          ),
          if (!widget.signup)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: widget.busy ? null : widget.reset,
                child: const Text('Forgot password?'),
              ),
            )
          else
            const SizedBox(height: 20),
          FilledButton(
            style: FilledButton.styleFrom(shape: const StadiumBorder()),
            onPressed: widget.busy ? null : submit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.busy)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                if (widget.busy) const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.busy
                        ? 'Please wait…'
                        : widget.signup
                        ? 'Create account'
                        : 'Sign in',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
