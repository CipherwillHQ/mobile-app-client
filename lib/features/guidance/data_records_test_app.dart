// Mounts the record menu with synthetic counts and a real segments route.
// Owns reusable navigation, theme and accessibility fixtures for widget tests.
// Does not load account data or contact native plugins.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme.dart';
import '../../core/api/json_values.dart';
import 'data_records_metric.dart';

class DataRecordsTestApp extends StatefulWidget {
  final int count;
  final List<Json> typeCounts;
  final double textScale;
  final bool reducedMotion;
  const DataRecordsTestApp({
    super.key,
    this.count = 5,
    this.typeCounts = const [
      {'type': 'NOTE', 'count': 2},
      {'type': 'PASSWORD', 'count': 3},
      {'type': 'FILE', 'count': 0},
    ],
    this.textScale = 1,
    this.reducedMotion = false,
  });
  @override
  State<DataRecordsTestApp> createState() => _DataRecordsTestAppState();
}

class _DataRecordsTestAppState extends State<DataRecordsTestApp> {
  late final router = GoRouter(
    initialLocation: '/guide',
    routes: [
      GoRoute(
        path: '/guide',
        builder: (_, _) => Scaffold(
          body: Center(
            child: DataRecordsMetric(
              count: widget.count,
              typeCounts: widget.typeCounts,
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/preferences',
        builder: (_, _) => const Scaffold(body: Text('All segments')),
      ),
    ],
  );
  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    theme: cipherwillTheme(Brightness.light),
    routerConfig: router,
    builder: (context, child) => MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(widget.textScale),
        disableAnimations: widget.reducedMotion,
      ),
      child: child!,
    ),
  );
}
