// Presents email verification above the Guide's setup button.
// Owns responsive notice styling and its independent verification action.
// Does not block setup or read account verification status.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';

class EmailVerificationBanner extends StatelessWidget {
  final VoidCallback verify;
  const EmailVerificationBanner({super.key, required this.verify});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExcludeSemantics(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(AppIcons.email, size: 22, color: colors.primary),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email verification needed',
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Confirm your email address to secure your account.',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    final action = OutlinedButton.icon(
      onPressed: verify,
      icon: const ExcludeSemantics(child: Icon(AppIcons.next, size: 16)),
      iconAlignment: IconAlignment.end,
      label: const Text('Verify your email'),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: colors.primary,
        backgroundColor: colors.primary.withValues(alpha: .05),
        side: BorderSide(color: colors.primary.withValues(alpha: .2)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        border: Border.all(color: colors.primary.withValues(alpha: .15)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact =
                constraints.maxWidth < 560 ||
                MediaQuery.textScalerOf(context).scale(1) > 1.3;
            return compact
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [content, const SizedBox(height: 16), action],
                  )
                : Row(
                    children: [
                      Expanded(child: content),
                      const SizedBox(width: 20),
                      action,
                    ],
                  );
          },
        ),
      ),
    );
  }
}
