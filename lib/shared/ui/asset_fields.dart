// Shows mandatory fields first and adds optional fields using the web groups.
// Owns in-memory controllers, existing-value visibility and grouped removal.
// Does not serialize metadata or save records.
import 'package:flutter/material.dart';
import '../../features/vault/asset_category.dart';
import '../../core/api/json_values.dart';
import 'optional_fields.dart';
import 'asset_input.dart';

class AssetFields extends StatefulWidget {
  final List<AssetField> fields;
  final Json initial;
  final ValueChanged<Json> onChanged;
  final bool readOnly;
  const AssetFields({
    super.key,
    required this.fields,
    required this.initial,
    required this.onChanged,
    this.readOnly = false,
  });
  @override
  State<AssetFields> createState() => _AssetFieldsState();
}

class _AssetFieldsState extends State<AssetFields> {
  final controllers = <String, TextEditingController>{};
  final added = <String>{};
  Json get values => {
    for (final f in widget.fields)
      f.key: f.array
          ? (controllers[f.key]!.text.isEmpty
                ? <String>[]
                : controllers[f.key]!.text.split('\n'))
          : controllers[f.key]!.text,
  };
  bool visible(AssetField f) => fieldVisible(widget.fields, f, values, added);
  void add(String key) {
    final field = widget.fields.firstWhere((f) => f.key == key);
    setState(
      () => added.addAll(fieldGroup(widget.fields, field).map((f) => f.key)),
    );
  }

  void remove(AssetField field) {
    setState(() {
      for (final f in fieldGroup(widget.fields, field)) {
        controllers[f.key]!.clear();
        added.remove(f.key);
      }
    });
    change();
  }

  @override
  void initState() {
    super.initState();
    for (final field in widget.fields) {
      final value = widget.initial[field.key];
      controllers[field.key] = TextEditingController(
        text: value is List ? value.join('\n') : value?.toString() ?? '',
      );
    }
  }

  @override
  void dispose() {
    for (final value in controllers.values) {
      value.dispose();
    }
    super.dispose();
  }

  void change() => widget.onChanged({...widget.initial, ...values});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final field in widget.fields.where(visible))
        AssetInput(
          key: ValueKey(field.key),
          field: field,
          controller: controllers[field.key]!,
          readOnly: widget.readOnly,
          changed: change,
          remove: () => remove(field),
        ),
      if (!widget.readOnly && widget.fields.any((f) => !visible(f)))
        PopupMenuButton<String>(
          onSelected: add,
          itemBuilder: (_) => [
            for (final f in widget.fields.where((f) => !visible(f)))
              PopupMenuItem(value: f.key, child: Text(f.label)),
          ],
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 18),
                SizedBox(width: 8),
                Text('Add field'),
              ],
            ),
          ),
        ),
    ],
  );
}
