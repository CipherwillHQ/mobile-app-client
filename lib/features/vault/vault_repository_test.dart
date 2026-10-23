// Verifies mobile assets use category-compatible metadata and pod envelopes.
// Owns category coverage, sensitive data and legacy note decoding tests.
// Does not contact production services.
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../security/session_controller.dart';
import 'categories.dart';
import 'pod_codec.dart';
import 'vault_repository.dart';

void main() {
  test(
    'every text category creates the existing metadata label field',
    () async {
      final api = FakeApi(
        (name, args) async => {
          'createMetamodel': {'id': 'model123'},
        },
      );
      for (final category in categories.where((c) => c.type != 'FILE')) {
        await VaultRepository(
          api,
          VaultLease(null, () {}),
        ).create(category, 'Label');
        final metadata = jsonDecode(api.calls.last.$2['metadata']);
        expect(metadata, {category.type == 'NOTE' ? 'title' : 'name': 'Label'});
        final data = {
          for (final field in category.fields)
            field.key: field.array
                ? ['one', ' two ']
                : field.sensitive
                ? ' secret '
                : 'value',
        };
        expect(parsePod(encodePod(data, category), category), data);
      }
      api.dispose();
    },
  );
  test('legacy raw note data remains readable', () {
    expect(
      parsePod('{"type":"note","data":"<p>Legacy</p>"}', categoryFor('NOTE')),
      {'content': '<p>Legacy</p>'},
    );
  });
}
