// Persists the device appearance preference
// Owns theme mode selection only.
// Does not persist account or vault data.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppearanceController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    load();
    return ThemeMode.system;
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('appearance');
    state = ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> select(ThemeMode mode) async {
    await (await SharedPreferences.getInstance()).setString(
      'appearance',
      mode.name,
    );
    state = mode;
  }
}

final appearanceProvider = NotifierProvider<AppearanceController, ThemeMode>(
  AppearanceController.new,
);
