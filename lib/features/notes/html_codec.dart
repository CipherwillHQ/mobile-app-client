// Imports and exports supported web notes through native Quill
// Owns safe markup and formatting-preserving adapters.
// Does not execute markup or fetch network resources.

import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:html/parser.dart';
import 'html_import.dart';
import 'html_export.dart';

String sanitizeNoteHtml(String html) {
  final fragment = parseFragment(html);
  for (final element in fragment.querySelectorAll(
    'script,style,iframe,object,embed',
  )) {
    element.remove();
  }
  for (final element in fragment.querySelectorAll('*')) {
    element.attributes.removeWhere(
      (key, value) =>
          key.toString().toLowerCase().startsWith('on') ||
          key == 'style' ||
          (['href', 'src'].contains(key) && !safeNoteUrl(value)),
    );
  }
  return fragment.outerHtml;
}

bool safeNoteUrl(String value) {
  final uri = Uri.tryParse(value.trim());
  return uri != null &&
      ['', 'https', 'http', 'mailto', 'tel'].contains(uri.scheme.toLowerCase());
}

Delta noteFromHtml(String html) => importNoteHtml(sanitizeNoteHtml(html));
String noteToHtml(Delta delta) => sanitizeNoteHtml(exportNoteHtml(delta));
