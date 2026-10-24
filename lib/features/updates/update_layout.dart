// Reserves real page space for the update bar without remounting navigation.
// Owns keyboard and safe-area coordination with nested page scaffolds.
// Does not overlay save controls or alter routes and editor state.
import 'package:flutter/material.dart';
import '../../shared/ui/keyboard_presence.dart';
import 'update_bar.dart';

class UpdateLayout extends StatelessWidget {
  final bool visible;
  final bool busy;
  final VoidCallback onUpdate;
  final Widget child;
  const UpdateLayout({
    super.key,
    required this.visible,
    required this.busy,
    required this.onUpdate,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return KeyboardPresence(
      visible: media.viewInsets.bottom > 0,
      child: Padding(
        padding: EdgeInsets.only(bottom: visible ? media.viewInsets.bottom : 0),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => MediaQuery(
                  data: visible
                      ? media.copyWith(
                          size: Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          ),
                          padding: media.padding.copyWith(bottom: 0),
                          viewPadding: media.viewPadding.copyWith(bottom: 0),
                          viewInsets: media.viewInsets.copyWith(bottom: 0),
                        )
                      : media,
                  child: AbsorbPointer(absorbing: busy, child: child),
                ),
              ),
            ),
            if (visible) UpdateBar(busy: busy, onUpdate: onUpdate),
          ],
        ),
      ),
    );
  }
}
