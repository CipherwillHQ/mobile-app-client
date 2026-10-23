// Serializes Quill lines back to web-compatible note HTML
// Owns grouped nested list trees and inline marks.
// Does not sanitize content or fetch embeds.

import 'dart:convert';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

String exportNoteHtml(Delta delta) {
  final root = dom.Element.tag('div');
  final lines = noteLines(delta);
  final lists = <dom.Element>[];
  final listTypes = <String>[];
  for (final line in lines) {
    final content = line.$1;
    final attributes = line.$2;
    final list = attributes['list'];
    if (list != null) {
      final tag = list == 'ordered' ? 'ol' : 'ul';
      final indent = (attributes['indent'] as int? ?? 0).clamp(0, 8);
      while (lists.length > indent + 1) {
        lists.removeLast();
        listTypes.removeLast();
      }
      if (lists.length == indent + 1 && listTypes.last != tag) {
        lists.removeLast();
        listTypes.removeLast();
      }
      while (lists.length <= indent) {
        final element = dom.Element.tag(tag);
        if (lists.isEmpty) {
          root.append(element);
        } else {
          if (lists.last.children.isEmpty) {
            lists.last.append(dom.Element.tag('li'));
          }
          lists.last.children.last.append(element);
        }
        lists.add(element);
        listTypes.add(tag);
      }
      final li = dom.Element.tag('li')
        ..innerHtml = content.isEmpty ? '<br>' : content;
      lists.last.append(li);
      continue;
    }
    lists.clear();
    listTypes.clear();
    if (content.startsWith('<hr') ||
        content.startsWith('<table') ||
        content.startsWith('<ol') ||
        content.startsWith('<ul')) {
      root.nodes.addAll(parseFragment(content).nodes);
      continue;
    }
    final header = attributes['header'];
    final tag = attributes['code-block'] != null
        ? 'pre'
        : header is int
        ? 'h' + header.toString()
        : 'p';
    final element = dom.Element.tag(tag)
      ..innerHtml = content.isEmpty ? '<br>' : content;
    if (tag == 'pre') {
      final code = dom.Element.tag('code')..innerHtml = element.innerHtml;
      element.nodes.clear();
      element.append(code);
    }
    if (attributes['blockquote'] == true) {
      root.append(dom.Element.tag('blockquote')..append(element));
    } else {
      root.append(element);
    }
  }
  return root.innerHtml;
}

List<(String, Map<String, dynamic>)> noteLines(Delta delta) {
  final result = <(String, Map<String, dynamic>)>[];
  final line = StringBuffer();
  for (final operation in delta.toJson()) {
    final insert = operation['insert'];
    final attrs = Map<String, dynamic>.from(
      operation['attributes'] as Map? ?? {},
    );
    if (insert is Map) {
      if (insert['custom'] is String) {
        final value = jsonDecode(insert['custom']);
        line.write(value['cipherwill_html'] ?? '');
      } else if (insert['image'] != null) {
        line.write(
          '<img src="' + const HtmlEscape().convert(insert['image']) + '">',
        );
      }
      continue;
    }
    if (insert is! String) {
      throw const FormatException('Unsupported note operation');
    }
    final parts = insert.split('\n');
    for (var index = 0; index < parts.length; index++) {
      if (index > 0) {
        result.add((line.toString(), attrs));
        line.clear();
      }
      if (parts[index].isEmpty) continue;
      var text = const HtmlEscape()
          .convert(parts[index])
          .replaceAll(' ', '<br>');
      for (final entry in {
        'bold': 'strong',
        'italic': 'em',
        'strike': 's',
        'underline': 'u',
        'code': 'code',
      }.entries) {
        if (attrs[entry.key] == true) {
          text = '<' + entry.value + '>' + text + '</' + entry.value + '>';
        }
      }
      if (attrs['link'] is String) {
        text =
            '<a href="' +
            const HtmlEscape().convert(attrs['link']) +
            '">' +
            text +
            '</a>';
      }
      line.write(text);
    }
  }
  if (line.isNotEmpty) result.add((line.toString(), {}));
  return result;
}
