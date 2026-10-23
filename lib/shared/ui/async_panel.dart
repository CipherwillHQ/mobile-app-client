// Renders asynchronous data with explicit retry controls
// Owns loading and failure presentation.
// Does not log private backend responses.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'loading_panel.dart';
import 'error_panel.dart';

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
    loading: () => const LoadingPanel(),
    error: (error, stack) => ErrorPanel(retry: retry),
    data: builder,
  );
}
