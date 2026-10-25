// Expands Data records in the overview layout so neighboring items make room.
// Owns the inline animation, outside/Escape/back dismissal and segments action.
// Does not fetch records or gate setup and email verification.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/motion.dart';
import 'data_records_pill_menu.dart';

class DataRecordsMetric extends StatefulWidget {
  final int count;
  final List<Json> typeCounts;
  const DataRecordsMetric({
    super.key,
    required this.count,
    required this.typeCounts,
  });
  @override
  State<DataRecordsMetric> createState() => _DataRecordsMetricState();
}

class _DataRecordsMetricState extends State<DataRecordsMetric>
    with SingleTickerProviderStateMixin {
  final focus = FocusNode();
  late final AnimationController animation;
  bool open = false, expanded = false;
  Size originalSize = Size.zero;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    )..addStatusListener(animationStatus);
  }

  void animationStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && mounted) {
      setState(() => expanded = false);
    }
  }

  void showBreakdown() {
    originalSize = (context.findRenderObject()! as RenderBox).size;
    animation.duration = AppMotion.duration(context);
    setState(() {
      open = true;
      expanded = true;
    });
    focus.requestFocus();
    animation.forward();
  }

  void closeBreakdown() {
    setState(() => open = false);
    animation.reverse();
    focus.requestFocus();
  }

  void seeSegments() {
    closeBreakdown();
    context.push('/preferences');
  }

  @override
  void dispose() {
    animation.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TapRegion(
    onTapOutside: open ? (_) => closeBreakdown() : null,
    child: Focus(
      focusNode: focus,
      onKeyEvent: (_, event) {
        if (open &&
            event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.escape) {
          closeBreakdown();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: BackButtonListener(
        onBackButtonPressed: () async {
          if (!open) return false;
          closeBreakdown();
          return true;
        },
        child: Semantics(
          label: 'Data records (${widget.count})',
          expanded: open,
          child: expanded
              ? DataRecordsPillMenu(
                  count: widget.count,
                  typeCounts: widget.typeCounts,
                  originalSize: originalSize,
                  animation: animation,
                  close: closeBreakdown,
                  seeSegments: seeSegments,
                )
              : ActionChip(
                  onPressed: showBreakdown,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Text('${widget.count} Data records')),
                      const SizedBox(width: 4),
                      const Icon(TablerIcons.chevron_up, size: 14),
                    ],
                  ),
                ),
        ),
      ),
    ),
  );
}
