// Renders one web-contract asset field with masking and copy controls.
// Owns keyboard hints, required validation and optional removal action.
// Does not save values or own category/group visibility.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/vault/asset_category.dart';
import 'app_notice.dart';

class AssetInput extends StatefulWidget {
  final AssetField field;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback changed, remove;
  const AssetInput({
    super.key,
    required this.field,
    required this.controller,
    required this.readOnly,
    required this.changed,
    required this.remove,
  });
  @override
  State<AssetInput> createState() => _AssetInputState();
}

class _AssetInputState extends State<AssetInput> {
  bool revealed = false;
  @override
  Widget build(BuildContext context) {
    final field = widget.field;
    final hidden = field.sensitive && !revealed;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        autocorrect: !field.sensitive,
        enableSuggestions: !field.sensitive,
        keyboardType: field.inputType == 'email'
            ? TextInputType.emailAddress
            : null,
        style: field.sensitive
            ? const TextStyle(fontFamily: 'monospace')
            : null,
        obscureText: hidden,
        maxLines: hidden
            ? 1
            : field.array || field.multiline
            ? 4
            : 1,
        onChanged: (_) => widget.changed(),
        validator: (value) =>
            !widget.readOnly &&
                field.required &&
                (value == null || value.isEmpty)
            ? 'Enter ' + field.label
            : null,
        decoration: InputDecoration(
          labelText: field.label,
          helperText: field.array ? 'One value per line' : null,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (field.sensitive)
                IconButton(
                  tooltip: revealed ? 'Hide value' : 'Reveal value',
                  onPressed: () => setState(() => revealed = !revealed),
                  icon: Icon(
                    revealed ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              if (!field.required && !widget.readOnly)
                IconButton(
                  tooltip: 'Remove ' + field.label,
                  onPressed: widget.remove,
                  icon: const Icon(Icons.close, size: 18),
                ),
              IconButton(
                tooltip: 'Copy ' + field.label,
                icon: const Icon(Icons.copy_outlined, size: 19),
                onPressed: () async {
                  final value = widget.controller.text;
                  if (value.isEmpty) return;
                  await Clipboard.setData(
                    ClipboardData(
                      text: field.key == 'phrase'
                          ? value.split('\n').join(' ')
                          : value,
                    ),
                  );
                  if (context.mounted) {
                    showNotice(context, 'Copied to clipboard.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
