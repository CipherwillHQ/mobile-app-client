// Supplies shared guidance definitions for protocol regression tests.
// Owns deterministic catalog and account snapshots.
// Does not execute operations or contact services.
import '../../core/api/json_values.dart';

Json guidanceDefinition({
  List<Json> steps = const [],
  List<Json> actions = const [],
}) => {
  'id': 'test_objective',
  'title': 'Test objective',
  'priority': 1,
  'protocolVersion': 3,
  'version': 1,
  'skippable': true,
  'steps': steps,
  'completion': {
    'mode': 'server',
    'fields': ['name'],
    'title': 'Saved',
    'subtext': 'Ready',
    'actions': actions,
  },
};
Json guidanceBootstrap(List<Json> definitions) => {
  'getGuidedObjectiveCatalog': definitions,
  'getGuidedAssetCounts': {},
  'getGuidedActionCompletions': [],
  'getGuidedActionDeferrals': [],
  'getGuidedActionRecovery': [],
};
