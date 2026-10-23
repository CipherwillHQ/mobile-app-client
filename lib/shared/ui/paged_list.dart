// Paginates metadata lists with retry and duplicate-safe page merging
// Owns cursor state and item rendering.
// Does not load decrypted item contents.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';

class PagedList extends ConsumerStatefulWidget {
  final String operation;
  final String field;
  final String itemsField;
  final Json variables;
  final Widget Function(Json) itemBuilder;
  const PagedList({
    super.key,
    required this.operation,
    required this.field,
    required this.itemsField,
    this.variables = const {},
    required this.itemBuilder,
  });
  @override
  ConsumerState<PagedList> createState() => _PagedListState();
}

class _PagedListState extends ConsumerState<PagedList> {
  List<Json> items = [];
  bool more = true;
  bool loading = false;
  String? error;
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void didUpdateWidget(covariant PagedList old) {
    super.didUpdateWidget(old);
    if (old.operation != widget.operation ||
        jsonEncode(old.variables) != jsonEncode(widget.variables)) {
      items = [];
      more = true;
      load();
    }
  }

  Future<void> load({bool reset = false}) async {
    if (loading) return;
    setState(() => loading = true);
    try {
      final vars = {
        ...widget.variables,
        if (!reset && items.isNotEmpty) 'cursor': items.last['id'],
      };
      final response = asJson(
        (await ref.read(apiProvider).run(widget.operation, vars))[widget.field],
      );
      if (!mounted) return;
      final page = jsonList(response[widget.itemsField]);
      setState(() {
        items = {
          for (final item in [...(reset ? <Json>[] : items), ...page])
            item['id']: item,
        }.values.toList();
        more = response['has_more'] == true;
        error = null;
      });
    } catch (_) {
      if (mounted) {
        setState(
          () =>
              error = 'Unable to load items. Check your connection and retry.',
        );
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: TextButton.icon(
          onPressed: loading ? null : () => load(reset: true),
          icon: const Icon(Icons.refresh),
          label: const Text('Refresh'),
        ),
      ),
      for (final item in items) widget.itemBuilder(item),
      if (items.isEmpty && !loading && error == null)
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text('No items yet.'),
        ),
      if (error != null) Text(error!),
      if (loading)
        const CircularProgressIndicator()
      else if (more || error != null)
        TextButton(
          onPressed: load,
          child: Text(error != null ? 'Retry' : 'Load more'),
        ),
    ],
  );
}
