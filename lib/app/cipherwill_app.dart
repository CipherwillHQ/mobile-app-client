// Composes the retained authentication screens and web application route.
// Owns native theme and router lifetime.
// Does not provide a second implementation of web application features.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';
import 'theme.dart';

class CipherwillApp extends StatefulWidget {
  const CipherwillApp({super.key});
  @override
  State<CipherwillApp> createState() => _CipherwillAppState();
}

class _CipherwillAppState extends State<CipherwillApp> {
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
    routerConfig: router,
  );
}
