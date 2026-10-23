// Compares native forms with generated web asset field contracts.
// Owns payload fields, required inputs, arrays and data-version parity.
// Does not duplicate field rules or execute the web app.
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'categories.dart';

void main() {
  test('every native text form matches the exported web contract', () {
    final contracts =
        jsonDecode(
              File('assets/contracts/asset_contracts.json').readAsStringSync(),
            )['assets']
            as Map;
    for (final entry in contracts.entries) {
      final category = categoryFor(entry.key);
      expect(category.version, entry.value['version'], reason: entry.key);
      final fields = entry.value['fields'] as List;
      expect(
        category.fields.map((f) => f.key),
        fields.map((f) => f['key']),
        reason: entry.key,
      );
      for (var i = 0; i < fields.length; i++) {
        final actual = category.fields[i], expected = fields[i];
        expect(actual.label, expected['label'], reason: entry.key);
        expect(actual.required, expected['required'], reason: entry.key);
        expect(actual.array, expected['array'], reason: entry.key);
        expect(actual.multiline, expected['multiline'], reason: entry.key);
      }
    }
  });
}
