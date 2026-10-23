// Composes routing, account gates and accessible app themes
// Owns the application widget and navigator lifetime.
// Does not initialize Firebase or crash reporting.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/settings/appearance.dart';
import 'privacy_guard.dart';
import '../shared/ui/app_notice.dart';
import 'router.dart';
import 'theme.dart';

class CipherwillApp extends ConsumerStatefulWidget {
  const CipherwillApp({super.key});
  @override
  ConsumerState<CipherwillApp> createState() => _CipherwillAppState();
}

class _CipherwillAppState extends ConsumerState<CipherwillApp> {
  late final GoRouter router = createRouter();
  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Cipherwill',
    debugShowCheckedModeBanner: false,
    theme: cipherwillTheme(Brightness.light),
    darkTheme: cipherwillTheme(Brightness.dark),
    themeMode: ref.watch(appearanceProvider),
    routerConfig: router,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      FlutterQuillLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en')],
    builder: (context, child) =>
        PrivacyGuard(child: AppNoticeHost(child: child!)),
  );
}
