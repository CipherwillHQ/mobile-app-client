// Shows the backend's separate text and file storage counters.
// Owns readable byte labels without fabricated quotas.
// Does not enforce plan limits or expose storage response objects.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/byte_label.dart';

class StorageUsage extends StatelessWidget {
  const StorageUsage({super.key});
  @override
  Widget build(BuildContext context) => RemotePanel(
    operation: 'GET_STORAGE_USED',
    builder: (result) {
      final usage = asJson(result['getStorageUsed']);
      return PanelSection(
        title: 'Storage usage',
        children: [
          for (final entry in [
            ('Text assets', 'text_pods'),
            ('Files', 'storage_pods'),
          ])
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                entry.$2 == 'text_pods' ? AppIcons.notes : AppIcons.folder,
              ),
              title: Text(entry.$1),
              subtitle: Text(byteLabel(usage[entry.$2])),
            ),
        ],
      );
    },
  );
}
