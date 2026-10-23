// Converts StarterKit blocks and marks to a Quill document.
// Owns nested lists, code blocks, hard breaks and preserved safe embeds.
// Does not sanitize HTML or discard unknown content.
import 'dart:convert';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

Delta importNoteHtml(String html) {
  final delta = Delta();
  final fragment = parseFragment(html);
  for (final node in fragment.nodes) {
    importBlock(node, delta, {});
  }
  if (delta.isEmpty ||
      delta.last.data is! String ||
      !(delta.last.data as String).endsWith('\n')) {
    delta.insert('\n');
  }
  return delta;
}

void importBlock(dom.Node node, Delta delta, Map<String, dynamic> block) {
  if (node is dom.Text) {
    if (node.text.trim().isNotEmpty) {
      delta.insert(node.text);
      delta.insert('\n', block.isEmpty ? null : block);
    }
    return;
  }
  if (node is! dom.Element) return;
  final tag = node.localName;
  if (tag == 'ul' || tag == 'ol') {
    if (node.attributes['start'] != null && node.attributes['start'] != '1') {
      preserveHtml(node, delta);
      return;
    }
    for (final li in node.children) {
      importBlock(li, delta, {
        ...block,
        'list': tag == 'ol' ? 'ordered' : 'bullet',
      });
    }
    return;
  }
  if (tag == 'blockquote') {
    for (final child in node.nodes) {
      importBlock(child, delta, {...block, 'blockquote': true});
    }
    return;
  }
  if (tag == 'pre') {
    final lines = node.text.replaceFirst(RegExp(r'\n$'), '').split('\n');
    for (final line in lines) {
      delta.insert(line);
      delta.insert('\n', {'code-block': true});
    }
    return;
  }
  if (tag == 'hr') {
    preserveHtml(node, delta);
    return;
  }
  if (tag == 'p' ||
      tag == 'div' ||
      tag == 'li' ||
      RegExp(r'^h[1-6]$').hasMatch(tag ?? '')) {
    final attributes = {
      ...block,
      if ((tag ?? '').startsWith('h')) 'header': int.parse(tag!.substring(1)),
    };
    for (final child in node.nodes) {
      if (child is dom.Element && ['ul', 'ol'].contains(child.localName)) {
        continue;
      }
      if (tag == 'li' && child is dom.Element && child.localName == 'p') {
        for (final inline in child.nodes) {
          importInline(inline, delta, {});
        }
      } else {
        importInline(child, delta, {});
      }
    }
    delta.insert('\n', attributes.isEmpty ? null : attributes);
    for (final nested in node.children.where(
      (c) => ['ul', 'ol'].contains(c.localName),
    )) {
      importBlock(nested, delta, {
        'indent': (block['indent'] as int? ?? 0) + 1,
      });
    }
    return;
  }
  preserveHtml(node, delta);
}

void importInline(dom.Node node, Delta delta, Map<String, dynamic> marks) {
  if (node is dom.Text) {
    delta.insert(node.text, marks.isEmpty ? null : marks);
    return;
  }
  if (node is! dom.Element) return;
  final tag = node.localName;
  if (tag == 'br') {
    delta.insert('\u2028', marks.isEmpty ? null : marks);
    return;
  }
  final attributes = {...marks};
  for (final entry in {
    'strong': 'bold',
    'b': 'bold',
    'em': 'italic',
    'i': 'italic',
    's': 'strike',
    'strike': 'strike',
    'u': 'underline',
    'code': 'code',
  }.entries) {
    if (tag == entry.key) attributes[entry.value] = true;
  }
  if (tag == 'a') attributes['link'] = node.attributes['href'];
  if (![
    'strong',
    'b',
    'em',
    'i',
    's',
    'strike',
    'strike',
    'u',
    'code',
    'a',
    'span',
  ].contains(tag)) {
    delta.insert({
      'custom': jsonEncode({'cipherwill_html': node.outerHtml}),
    });
    return;
  }
  for (final child in node.nodes) {
    importInline(child, delta, attributes);
  }
}

void preserveHtml(dom.Element node, Delta delta) {
  delta.insert({
    'custom': jsonEncode({'cipherwill_html': node.outerHtml}),
  });
  delta.insert('\n');
}
