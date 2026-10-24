// Mounts Timeline with synthetic online account and preference responses.
// Owns provider overrides shared by timeline interaction regressions.
// Does not connect to Firebase or change production scheduling.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'timeline_screen.dart';

class TimelineTestApp extends StatelessWidget {
  final FakeApi api;
  final Json account;
  final Json? preferences;
  const TimelineTestApp({
    super.key,
    required this.api,
    this.account = previewAccount,
    this.preferences,
  });
  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [
      apiProvider.overrideWithValue(api),
      accountProvider.overrideWith((ref) async => account),
      preferencesProvider.overrideWith(
        (ref) async => preferences ?? previewPreferences,
      ),
    ],
    child: const MaterialApp(home: TimelineScreen()),
  );
}
