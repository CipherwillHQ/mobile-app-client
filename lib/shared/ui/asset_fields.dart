// Renders category fields while preserving sensitive whitespace and arrays
// Owns field editors and explicit secret visibility.
// Does not serialize metadata or save records.
import 'package:flutter/material.dart';
import '../../features/vault/asset_category.dart';
import '../../core/api/json_values.dart';

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
  final revealed = <String>{};
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

  void change() {
    widget.onChanged({
      for (final field in widget.fields)
        field.key: field.array
            ? (controllers[field.key]!.text.isEmpty
                  ? <String>[]
                  : controllers[field.key]!.text.split('\n'))
            : controllers[field.key]!.text,
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final field in widget.fields)
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextFormField(
            controller: controllers[field.key],
            readOnly: widget.readOnly,
            autocorrect: !field.sensitive,
            enableSuggestions: !field.sensitive,
            obscureText: field.sensitive && !revealed.contains(field.key),
            maxLines: field.sensitive && !revealed.contains(field.key)
                ? 1
                : field.array || field.multiline
                ? 4
                : 1,
            onChanged: (_) => change(),
            validator: (value) =>
                !widget.readOnly &&
                    field.required &&
                    (value == null || value.isEmpty)
                ? 'Enter ' + field.label
                : null,
            decoration: InputDecoration(
              labelText: field.label,
              helperText: field.array ? 'One value per line' : null,
              suffixIcon: field.sensitive
                  ? IconButton(
                      tooltip: revealed.contains(field.key)
                          ? 'Hide value'
                          : 'Reveal value',
                      onPressed: () => setState(
                        () => revealed.contains(field.key)
                            ? revealed.remove(field.key)
                            : revealed.add(field.key),
                      ),
                      icon: Icon(
                        revealed.contains(field.key)
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    )
                  : null,
            ),
          ),
        ),
    ],
  );
}
