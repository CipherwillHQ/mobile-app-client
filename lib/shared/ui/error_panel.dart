// Shows a recoverable failure without exposing private backend output.
// Owns accessible retry presentation.
// Does not swallow failures or report an incomplete operation as successful.
import 'package:flutter/material.dart';
import 'icon_badge.dart';

class ErrorPanel extends StatelessWidget {
  final String message;
  final VoidCallback? retry;
  const ErrorPanel({
    super.key,
    this.message = 'Check your connection and try again.',
    this.retry,
  });
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconBadge(
            Icons.cloud_off_outlined,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Unable to load',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          Text(message, style: Theme.of(context).textTheme.bodySmall),
          if (retry != null) ...[
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: retry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ],
      ),
    ),
  );
}
