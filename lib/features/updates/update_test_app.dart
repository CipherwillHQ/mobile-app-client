// Mounts the real global update host around a native navigator in tests.
// Owns synthetic store responses, an editable page and accessibility fixtures.
// Does not contact Firebase or persist note and profile data.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/theme.dart';
import '../../shared/ui/app_notice.dart';
import '../../shared/ui/page_frame.dart';
import 'app_update_host.dart';
import 'store_update.dart';
import 'update_providers.dart';

class UpdateTestApp extends StatelessWidget {
  final AppUpdateService service;
  final Widget home;
  final Brightness brightness;
  final double textScale;
  final double keyboard;
  const UpdateTestApp({
    super.key,
    required this.service,
    this.home = const UpdateDraftPage(),
    this.brightness = Brightness.light,
    this.textScale = 1,
    this.keyboard = 0,
  });
  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [appUpdateServiceProvider.overrideWithValue(service)],
    child: RepaintBoundary(
      key: const ValueKey('design-capture'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: cipherwillTheme(brightness),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            viewPadding: const EdgeInsets.only(top: 24, bottom: 24),
            textScaler: TextScaler.linear(textScale),
            viewInsets: EdgeInsets.only(bottom: keyboard),
          ),
          child: AppNoticeHost(child: AppUpdateHost(child: child!)),
        ),
        home: home,
      ),
    ),
  );
}

class UpdateDraftPage extends StatefulWidget {
  const UpdateDraftPage({super.key});
  @override
  State<UpdateDraftPage> createState() => _UpdateDraftPageState();
}

class _UpdateDraftPageState extends State<UpdateDraftPage> {
  final text = TextEditingController(text: 'Saved note');
  bool dirty = false;
  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Note',
    canLeave: !dirty,
    footer: FilledButton(
      onPressed: () => setState(() => dirty = false),
      child: const Text('Save'),
    ),
    children: [
      TextField(
        controller: text,
        decoration: const InputDecoration(labelText: 'Note'),
        onChanged: (_) => setState(() => dirty = true),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('Executor details'))),
          ),
        ),
        child: const Text('Next page'),
      ),
    ],
  );
}
