// Paginates metadata lists with retry and duplicate-safe page merging
// Owns cursor state and item rendering.
// Does not load decrypted item contents.
import '../../app/app_icons.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import 'empty_state.dart';
import 'loading_panel.dart';
import 'error_panel.dart';
import 'page_refresh.dart';

class PagedList extends ConsumerStatefulWidget {
  final String operation;
  final String field;
  final String itemsField;
  final Json variables;
  final Widget Function(Json) itemBuilder;
  final Widget? empty;
  final bool Function(Json)? filter;
  final bool Function(Object)? onFailure;
  const PagedList({
    super.key,
    required this.operation,
    required this.field,
    required this.itemsField,
    this.variables = const {},
    required this.itemBuilder,
    this.empty,
    this.filter,
    this.onFailure,
  });
  @override
  ConsumerState<PagedList> createState() => _PagedListState();
}

class _PagedListState extends ConsumerState<PagedList> {
  List<Json> items = [];
  bool more = true;
  bool loading = false;
  String? error;
  PageRefreshScope? refreshScope;
  Future<void> refresh() => load(reset: true);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scope = PageRefreshScope.maybeOf(context);
    if (scope == refreshScope) return;
    refreshScope?.callbacks.remove(refresh);
    refreshScope = scope;
    refreshScope?.callbacks.add(refresh);
  }

  @override
  void dispose() {
    refreshScope?.callbacks.remove(refresh);
    super.dispose();
  }

  Iterable<Json> get visibleItems =>
      widget.filter == null ? items : items.where(widget.filter!);
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
    } catch (failure) {
      if (mounted) {
        if (widget.onFailure?.call(failure) == true) return;
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
  Widget build(BuildContext context) => Semantics(
    customSemanticsActions: {
      const CustomSemanticsAction(label: 'Refresh items'): refresh,
    },
    child: Column(
      children: [
        for (final item in visibleItems) widget.itemBuilder(item),
        if (visibleItems.isEmpty && !loading && error == null)
          widget.empty ??
              const EmptyState(
                title: 'Nothing here yet',
                message: 'Items will appear here when added.',
                icon: AppIcons.folder,
              ),
        if (error != null) ErrorPanel(message: error!, retry: load),
        if (loading)
          const LoadingPanel()
        else if (more && error == null)
          TextButton(onPressed: load, child: const Text('Load more')),
      ],
    ),
  );
}
