// Presents full owner filenames and their existing metadata.
// Owns readable names, dates and file types without duplicated action buttons.
// Does not edit metadata, decrypt bytes or grant executor rights.
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/remote_panel.dart';

class FileDetails extends StatelessWidget {
  final String id;
  const FileDetails({super.key, required this.id});
  @override
  Widget build(BuildContext context) => RemotePanel(
    operation: 'GET_METAMODEL',
    variables: {'id': id},
    builder: (r) {
      final model = asJson(r['getMetamodel']);
      final metadata = asJson(jsonDecode(model['metadata']));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label(metadata),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Updated ' + dateLabel(model['updated_at']),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (metadata['file_ext'] != null)
            Text(
              '.' + metadata['file_ext'],
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      );
    },
  );
}
