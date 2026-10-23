// Provides consistent mobile page spacing and navigation
// Owns scaffold and scrollable content.
// Does not fetch account data.
import 'package:flutter/material.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  const PageFrame({
    super.key,
    required this.title,
    required this.children,
    this.actions,
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), actions: actions),
    body: SafeArea(
      child: ListView(padding: const EdgeInsets.all(20), children: children),
    ),
  );
}
