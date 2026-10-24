// Shows a recoverable failure without exposing private backend output.
// Owns accessible retry presentation.
// Does not swallow failures or report an incomplete operation as successful.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';

class ErrorPanel extends StatelessWidget {
  final String message;
  final VoidCallback? retry;
  const ErrorPanel({
    super.key,
    this.message = 'Check your connection and try again.',
    this.retry,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          AppIcons.cloudOff,
          size: 24,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text('Unable to load', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        Text(message, style: Theme.of(context).textTheme.bodySmall),
        if (retry != null) ...[
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: retry,
            icon: const Icon(AppIcons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ],
    ),
  );
}
