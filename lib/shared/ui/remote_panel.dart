// Loads public account-scoped GraphQL selections into mobile widgets
// Owns query keys and reload behavior.
// Does not decrypt or persist vault records.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import 'async_panel.dart';

final remoteProvider = FutureProvider.autoDispose
    .family<Json, (String, String)>(
      (ref, key) =>
          ref.watch(apiProvider).run(key.$1, asJson(jsonDecode(key.$2))),
    );

class RemotePanel extends ConsumerWidget {
  final String operation;
  final Json variables;
  final Widget Function(Json) builder;
  const RemotePanel({
    super.key,
    required this.operation,
    this.variables = const {},
    required this.builder,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = (operation, jsonEncode(variables));
    return AsyncPanel(
      value: ref.watch(remoteProvider(key)),
      retry: () => ref.invalidate(remoteProvider(key)),
      builder: builder,
    );
  }
}
