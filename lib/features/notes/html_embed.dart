// Displays preserved safe markup without loading external resources
// Owns the Quill embed rendering fallback.
// Does not execute HTML or discard its export payload.

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:html/parser.dart';

class HtmlEmbedBuilder extends EmbedBuilder {
  const HtmlEmbedBuilder();
  @override
  String get key => 'cipherwill_html';
  @override
  Widget build(BuildContext context, EmbedContext embedContext) {
    final html = embedContext.node.value.data.toString();
    if (html.trim().startsWith('<hr')) return const Divider();
    final text = parseFragment(html).text;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Text(
        text?.isNotEmpty == true ? text! : 'Embedded content preserved',
        style: embedContext.textStyle,
      ),
    );
  }
}
