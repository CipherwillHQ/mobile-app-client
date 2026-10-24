// Defines shared System, Light and Dark appearance choices.
// Owns labels and icons used by Settings and the sidebar.
// Does not save preferences or choose the current theme.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';

const appearanceOptions = <({ThemeMode mode, String label, IconData icon})>[
  (mode: ThemeMode.system, label: 'System', icon: AppIcons.system),
  (mode: ThemeMode.light, label: 'Light', icon: AppIcons.light),
  (mode: ThemeMode.dark, label: 'Dark', icon: AppIcons.dark),
];
