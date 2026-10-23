// Checks native note formatting against the web-supported HTML contract.
// Owns rich-text round trips and unsafe-link rejection.
// Does not launch a browser or contact services.
import 'package:flutter_test/flutter_test.dart';
import 'package:html/parser.dart';
import 'html_codec.dart';

void main() {
  test('marks, headings, hard breaks and horizontal rules round trip', () {
    const html =
        '<h2>Heading</h2><p><strong>Bold</strong> <em>italic</em> <s>strike</s> <code>x</code><br>next</p><hr><blockquote><p>Quote</p></blockquote>';
    final document = parseFragment(noteToHtml(noteFromHtml(html)));
    for (final tag in [
      'h2',
      'strong',
      'em',
      's',
      'code',
      'br',
      'hr',
      'blockquote',
    ]) {
      expect(document.querySelector(tag), isNotNull, reason: tag);
    }
    expect(document.text, contains('next'));
  });
  test('nested and contiguous lists preserve structure', () {
    const html =
        '<ol><li><p>One</p><ul><li><p>Nested</p></li></ul></li><li><p>Two</p></li></ol>';
    final output = parseFragment(noteToHtml(noteFromHtml(html)));
    expect(output.querySelectorAll('ol').length, 1);
    expect(output.querySelector('ol > li > ul > li')?.text, 'Nested');
    expect(output.querySelectorAll('ol > li').length, 2);
  });
  test('safe legacy blocks are preserved and executable markup removed', () {
    final output = noteToHtml(
      noteFromHtml(
        '<table><tr><td>Legacy</td></tr></table><script>secret()</script><p><a href="javascript:bad()" onclick="bad()">Link</a></p>',
      ),
    );
    expect(output, contains('<table>'));
    expect(output, contains('Legacy'));
    expect(output, isNot(contains('javascript:')));
    expect(output, isNot(contains('onclick')));
    expect(output, isNot(contains('secret()')));
  });
  test('unchanged code-block line content survives a round trip', () {
    const html = '<pre><code>line 1\n  line 2</code></pre>';
    final output = parseFragment(noteToHtml(noteFromHtml(html)));
    expect(
      output.querySelectorAll('pre').map((e) => e.text).join('\n'),
      'line 1\n  line 2',
    );
  });
}
