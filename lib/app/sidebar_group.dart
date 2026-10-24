// Opens the existing Data, Network and Platform hubs from menu headings.
// Owns accessible group links and predictable drawer dismissal.
// Does not add destinations or evaluate feature eligibility.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_icons.dart';

class SidebarGroup extends StatelessWidget {
  final String title;
  final String destination;
  const SidebarGroup(this.title, {super.key, required this.destination});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: ListTile(
      minTileHeight: 48,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(AppIcons.next, size: 16),
      onTap: () {
        Navigator.of(context).pop();
        context.go(destination);
      },
    ),
  );
}
