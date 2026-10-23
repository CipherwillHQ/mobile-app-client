// Checks guidance definitions against native capabilities and account eligibility.
// Owns protocol, dependency and completion selection rules.
// Does not fetch context or execute operations.
import '../../core/api/json_values.dart';
import 'rules.dart';
import 'guidance_operations.dart';

bool supportsGuidance(Json definition) =>
    (definition['protocolVersion'] as int? ?? 1) <= 3 &&
    (definition['contexts'] as List? ?? []).every(
      (c) => ['assets', 'savedAssets'].contains(c),
    ) &&
    jsonList(definition['steps']).every(
      (s) =>
          s['effect'] == null ||
          GuidanceOperations.types.contains(s['effect']['type']),
    ) &&
    jsonList(
      definition['completion']['actions'],
    ).every((a) => GuidanceOperations.types.contains(a['type']));
bool guidanceComplete(Json definition, Json scope, Set<String> completed) =>
    completed.contains(definition['id']) ||
    (definition['completedWhen'] != null
        ? matches(definition['completedWhen'], scope)
        : (scope['account']['completedObjectiveIds'] as List).contains(
            definition['id'],
          ));
bool guidanceAvailable(
  Json definition,
  List<Json> catalog,
  Json scope,
  Set<String> completed,
) =>
    supportsGuidance(definition) &&
    !guidanceComplete(definition, scope, completed) &&
    segmentAllowed(definition, scope['account']) &&
    matches(definition['eligibleWhen'], scope) &&
    (definition['dependencies'] as List? ?? []).every(
      (id) => catalog.any(
        (d) => d['id'] == id && guidanceComplete(d, scope, completed),
      ),
    );
