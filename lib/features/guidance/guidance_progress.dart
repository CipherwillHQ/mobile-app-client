// Advances guidance steps and durable completion operations.
// Owns retry-safe effects, acknowledgements, deferral and resume.
// Does not load or duplicate catalog definitions.
import '../../core/api/api_failure.dart';
import '../../core/api/json_values.dart';
import 'rules.dart';
import 'input_validation.dart';
import 'guidance_session.dart';
import 'guidance_catalog.dart';

extension GuidanceProgress on GuidanceSession {
  Future<void> advance({dynamic answer, bool submitted = false}) async {
    lease.check();
    if (flow == null) return;
    if (completion != null) {
      await finish();
      completed.add(flow!['id']);
      await load();
      return;
    }
    final current = step;
    if (current != null && current['input'] != null) {
      if (!submitted) throw StateError('Enter an answer first.');
      final input = asJson(current['input']);
      answers[input['key']] = normalizeGuidance(input, answer);
      if (current['effect'] != null) {
        await executeEffect(asJson(current['effect']));
      }
      visited.add(current['id']);
      if (flow!['skipWhen'] != null && matches(flow!['skipWhen'], scope)) {
        await defer();
        return;
      }
    } else if (current != null && current['effect'] == null) {
      visited.add(current['id']);
    }
    while (step?['effect'] != null && step?['input'] == null) {
      final current = step!;
      await executeEffect(asJson(current['effect']));
      visited.add(current['id']);
    }
    if (step == null && completion == null) {
      final config = asJson(flow!['completion']);
      if (config['mode'] == 'local') {
        completion = {'status': 'complete', 'beneficiaryPersonId': null};
      } else {
        Json result;
        try {
          result = asJson(
            (await api.run('COMPLETE_GUIDED_ACTION', {
              'objectiveId': flow!['id'],
              'answers': completionAnswers(flow!, answers, scope),
              'version': flow!['version'],
            }))['completeGuidedAction'],
          );
        } on ApiFailure catch (error) {
          if (error.code != 'GUIDANCE_CATALOG_CHANGED') rethrow;
          await load();
          throw StateError(
            'Guidance changed. Review the refreshed step and continue.',
          );
        }
        lease.check();
        if (!['complete', 'already_complete'].contains(result['status'])) {
          throw StateError('Guidance completion is pending. Retry.');
        }
        completion = result;
        if (result['recovery'] != null) {
          final recovery = asJson(result['recovery']);
          flow = asJson(recovery['definition']);
          if (!supportsGuidance(flow!)) {
            throw StateError('Update Cipherwill to finish this saved action.');
          }
          finished.addAll(
            jsonList(flow!['completion']['actions'])
                .where(
                  (a) =>
                      !(recovery['pendingActionIds'] as List).contains(a['id']),
                )
                .map((a) => a['id'] as String),
          );
        }
      }
      account.addAll(
        guidanceValues(flow!['completion']['updateAccount'], scope),
      );
    }
  }

  Future<void> finish() async {
    for (final action in jsonList(flow!['completion']['actions'])) {
      lease.check();
      final id = action['id'] as String;
      if (finished.contains(id)) continue;
      if (!executed.contains(id)) {
        if (matches(action['when'], scope)) {
          effects[id] = await operations.run(
            action['type'],
            guidanceValues(action['args'], scope),
          );
        }
        lease.check();
        executed.add(id);
      }
      if (flow!['completion']['mode'] == 'server') {
        final result = await api.run('ACK_GUIDANCE_OPERATION', {
          'objectiveId': flow!['id'],
          'actionId': id,
        });
        lease.check();
        if (result['finishGuidedActionOperation'] != true) {
          throw StateError('Completion action acknowledgement is pending.');
        }
      }
      finished.add(id);
    }
  }

  Future<void> defer() async {
    if (flow?['skippable'] != true) {
      throw StateError('Complete this required step.');
    }
    await api.run('DEFER_GUIDED_ACTION', {
      'objectiveId': flow!['id'],
      'dismiss': false,
    });
    lease.check();
    await load();
  }

  Future<void> resume(String id) async {
    await api.run('RESUME_GUIDED_ACTION', {'objectiveId': id});
    lease.check();
    await load();
    final candidate = catalog.where((c) => c['id'] == id).firstOrNull;
    if (completion != null) {
      throw StateError(
        'Finish the saved action before resuming another objective.',
      );
    }
    if (candidate == null ||
        !guidanceAvailable(candidate, catalog, scope, completed)) {
      throw StateError(
        'This objective is no longer available for this account.',
      );
    }
    flow = candidate;
  }
}
