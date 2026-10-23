// Renders asynchronous data with explicit retry controls
// Owns loading and failure presentation.
// Does not log private backend responses.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncPanel<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) builder;
  final VoidCallback retry;
  const AsyncPanel({
    super.key,
    required this.value,
    required this.builder,
    required this.retry,
  });
  @override
  Widget build(BuildContext context) => value.when(
    loading: () => const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: CircularProgressIndicator(),
      ),
    ),
    error: (error, stack) => Column(
      children: [
        const Text(
          'Unable to load this screen. Check your connection and retry.',
        ),
        TextButton(onPressed: retry, child: const Text('Retry')),
      ],
    ),
    data: builder,
  );
}
