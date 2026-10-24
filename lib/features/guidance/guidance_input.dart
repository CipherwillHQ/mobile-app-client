// Renders accessible native guidance input controls
// Owns input widgets and temporary file selection.
// Does not save answers or encrypt selected files.

import '../../app/app_icons.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/native_handoff.dart';
import '../../core/api/json_values.dart';

class GuidanceInput extends ConsumerStatefulWidget {
  final Json spec;
  final ValueChanged<dynamic> changed;
  final dynamic value;
  const GuidanceInput({
    super.key,
    required this.spec,
    required this.changed,
    this.value,
  });
  @override
  ConsumerState<GuidanceInput> createState() => _GuidanceInputState();
}

class _GuidanceInputState extends ConsumerState<GuidanceInput> {
  final text = TextEditingController();
  @override
  void initState() {
    super.initState();
    text.text = widget.value?.toString() ?? '';
    selected = widget.value?.toString();
  }

  bool hidden = true;
  String? selected;
  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spec = widget.spec;
    final type = spec['type'];
    if (type == 'boolean') {
      return Wrap(
        spacing: 12,
        children: [
          for (final value in [true, false])
            OutlinedButton(
              onPressed: () {
                setState(() => selected = value.toString());
                widget.changed(value);
              },
              child: Text(
                (value ? spec['trueLabel'] : spec['falseLabel'])?.toString() ??
                    (value ? 'Yes' : 'No'),
              ),
            ),
          if (selected != null) Text('Selected: ' + selected!),
        ],
      );
    }
    if (type == 'choices') {
      return DropdownButtonFormField<String>(
        initialValue: widget.value?.toString(),
        decoration: InputDecoration(
          labelText: spec['placeholder'] ?? 'Choose an option',
        ),
        items: [
          for (final value in spec['choices'] as List)
            DropdownMenuItem(
              value: value.toString(),
              child: Text(value.toString()),
            ),
        ],
        onChanged: widget.changed,
      );
    }
    if (type == 'file') {
      return FilledButton.icon(
        onPressed: () async {
          final result = await nativeHandoff(
            ref,
            () => FilePicker.platform.pickFiles(),
          );
          if (result?.files.single.path != null && mounted) {
            setState(() => selected = result!.files.single.name);
            widget.changed(File(result!.files.single.path!));
          }
        },
        icon: const Icon(AppIcons.attachment),
        label: Text(selected ?? 'Select file'),
      );
    }
    return TextField(
      controller: text,
      onChanged: widget.changed,
      obscureText: spec['sensitive'] == true && hidden,
      autocorrect: spec['sensitive'] != true,
      enableSuggestions: spec['sensitive'] != true,
      maxLines: type == 'multi_line_text' && spec['sensitive'] != true ? 5 : 1,
      keyboardType: type == 'number'
          ? const TextInputType.numberWithOptions(decimal: true)
          : type == 'email'
          ? TextInputType.emailAddress
          : type == 'date'
          ? TextInputType.datetime
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: spec['placeholder'] ?? 'Your answer',
        hintText: type == 'date' ? 'YYYY-MM-DD' : null,
        suffixIcon: spec['sensitive'] == true
            ? IconButton(
                tooltip: hidden ? 'Show answer' : 'Hide answer',
                onPressed: () => setState(() => hidden = !hidden),
                icon: Icon(hidden ? AppIcons.reveal : AppIcons.hide),
              )
            : null,
      ),
    );
  }
}
