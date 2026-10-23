// Runs one in-memory guidance objective from the backend catalog
// Owns selection, effects, identifier-only completion and recovery.
// Does not persist decrypted drafts or duplicate objective definitions.

import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../security/session_controller.dart';
import 'rules.dart';
export 'guidance_progress.dart';
import 'guidance_operations.dart';
import 'guidance_account.dart';
import 'guidance_catalog.dart';

class GuidanceSession {
  final ApiClient api;
  final VaultLease lease;
  late final GuidanceOperations operations;
  List<Json> catalog = [];
  Json account = {};
  Json context = {};
  Json answers = {};
  Json effects = {};
  Json? flow;
  Json? completion;
  final visited = <String>{};
  final finished = <String>{};
  final executed = <String>{};
  final completed = <String>{};
  GuidanceSession(this.api, this.lease) {
    operations = GuidanceOperations(api, lease);
  }
  Json get scope => {
    'account': account,
    'context': context,
    'answers': answers,
    'effects': effects,
    'completion': completion,
  };
  Json? get step => flow == null
      ? null
      : jsonList(flow!['steps'])
            .where(
              (step) =>
                  !visited.contains(step['id']) && matches(step['when'], scope),
            )
            .firstOrNull;
  Future<void> load() async {
    final snapshot = await loadGuidanceAccount(api, lease);
    final bootstrap = snapshot.$1;
    account = snapshot.$2;
    catalog = jsonList(bootstrap['getGuidedObjectiveCatalog'])
      ..sort((a, b) => (a['priority'] as int).compareTo(b['priority'] as int));
    context = {'savedAssets': bootstrap['getGuidedAssetCounts']};
    answers = {};
    effects = {};
    completion = null;
    visited.clear();
    finished.clear();
    executed.clear();
    final recovery = jsonList(
      account['recovery'],
    ).where((r) => !completed.contains(r['definition']['id'])).firstOrNull;
    if (recovery != null) {
      flow = asJson(recovery['definition']);
      if (!supportsGuidance(flow!)) {
        throw StateError('This recovery requires an updated Cipherwill app.');
      }
      completion = asJson(recovery['completion']);
      finished.addAll(
        jsonList(flow!['completion']['actions'])
            .where(
              (a) => !(recovery['pendingActionIds'] as List).contains(a['id']),
            )
            .map((a) => a['id'] as String),
      );
      return;
    }
    flow = null;
    if (catalog.any((c) => (c['contexts'] as List? ?? []).contains('assets'))) {
      context['assets'] = await operations.assets();
      lease.check();
    }
    for (final candidate in catalog) {
      if (!segmentAllowed(candidate, account)) continue;
      if (!supportsGuidance(candidate)) {
        if (!guidanceComplete(candidate, scope, completed)) {
          throw StateError(
            'Update Cipherwill to use ' + candidate['title'].toString() + '.',
          );
        }
        continue;
      }
      final deferred = jsonList(account['deferrals']).any(
        (d) =>
            d['objectiveId'] == candidate['id'] &&
            (d['dismissed'] == true ||
                (int.tryParse(d['resumeAfter']?.toString() ?? '') ?? 0) >
                    DateTime.now().millisecondsSinceEpoch),
      );
      if (!deferred &&
          guidanceAvailable(candidate, catalog, scope, completed)) {
        flow = candidate;
        break;
      }
    }
  }

  Future<void> executeEffect(Json effect) async {
    if (matches(effect['when'], scope)) {
      effects[effect['id']] = await operations.run(
        effect['type'],
        guidanceValues(effect['args'], scope),
      );
    }
    lease.check();
  }

  void clear() {
    answers.clear();
    effects.clear();
    context.clear();
    flow = null;
    completion = null;
  }
}
