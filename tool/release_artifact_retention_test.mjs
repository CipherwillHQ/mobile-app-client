// Exercises platform retention and artifact deletion with a synthetic GitHub API.
// Owns ordering, pagination, dry-run and disappearance/error regression coverage.
// Does not contact GitHub or remove real release artifacts.
import assert from 'node:assert/strict';
import {test} from 'node:test';
import {cleanupReleaseArtifacts, releaseArtifactPlan} from './release_artifact_retention.mjs';

function artifact(id, platform = 'android', createdAt = '2026-10-24T00:00:00Z') {
  return {id, name: `${platform}-release-1.0.0+${id}`, created_at: createdAt, expired: false};
}

function harness(artifacts, status) {
  const calls = [], logs = [];
  const listArtifactsForRepo = Symbol('listArtifactsForRepo');
  return {
    calls, logs,
    context: {repo: {owner: 'example', repo: 'mobile'}},
    core: {info: message => logs.push(message)},
    github: {
      paginate: async (route, options) => {
        assert.equal(route, listArtifactsForRepo);
        assert.deepEqual(options, {owner: 'example', repo: 'mobile', per_page: 100});
        calls.push('paginate');
        return artifacts;
      },
      rest: {actions: {
        listArtifactsForRepo,
        deleteArtifact: async options => {
          calls.push(options);
          if (status && options.artifact_id === 2) throw Object.assign(Error('GitHub API error'), {status});
        },
      }},
    },
  };
}

test('keeps the newest three artifacts independently for Android and iOS', () => {
  const artifacts = [
    artifact(101, 'android', '2026-10-21T00:00:00Z'),
    artifact(3, 'android', '2026-10-22T00:00:00Z'),
    artifact(55, 'android', '2026-10-23T00:00:00Z'),
    artifact(2, 'android', '2026-10-24T00:00:00Z'),
    artifact(5, 'ios', '2026-10-21T00:00:00Z'),
    artifact(6, 'ios', '2026-10-22T00:00:00Z'),
    artifact(7, 'ios', '2026-10-23T00:00:00Z'),
    artifact(8, 'ios', '2026-10-24T00:00:00Z'),
  ];
  const [android, ios] = releaseArtifactPlan(artifacts.reverse());
  assert.deepEqual(android.keep.map(value => value.id), [2, 55, 3]);
  assert.deepEqual(android.remove.map(value => value.id), [101]);
  assert.deepEqual(ios.keep.map(value => value.id), [8, 7, 6]);
  assert.deepEqual(ios.remove.map(value => value.id), [5]);
});

test('ignores debug, unrelated and expired artifacts without filling retention slots', () => {
  const artifacts = [
    artifact(1), artifact(2), artifact(3), artifact(4),
    {...artifact(5), expired: true},
    {...artifact(6), name: 'android-debug'},
    {...artifact(7), name: 'ios-debug'},
    {...artifact(8), name: 'coverage'},
    {...artifact(9), name: 'other-android-release-file'},
  ];
  const [android, ios] = releaseArtifactPlan(artifacts);
  assert.deepEqual(android.keep.map(value => value.id), [4, 3, 2]);
  assert.deepEqual(android.remove.map(value => value.id), [1]);
  assert.deepEqual(ios, {platform: 'ios', keep: [], remove: []});
});

test('preserves all artifacts when fewer than three exist', () => {
  for (const artifacts of [[], [artifact(1)], [artifact(1), artifact(2)]]) {
    const plan = releaseArtifactPlan(artifacts);
    assert.equal(plan[0].keep.length, artifacts.length);
    assert.equal(plan[0].remove.length, 0);
    assert.equal(plan[1].remove.length, 0);
  }
});

test('deduplicates overlapping pages and breaks timestamp ties by artifact ID', () => {
  const [android] = releaseArtifactPlan([artifact(3), artifact(3), artifact(1), artifact(4), artifact(2)]);
  assert.deepEqual(android.keep.map(value => value.id), [4, 3, 2]);
  assert.deepEqual(android.remove.map(value => value.id), [1]);
});

test('lists all pages before deleting only the surplus release artifacts', async () => {
  const fixture = harness(Array.from({length: 105}, (_, index) => artifact(index + 1)));
  await cleanupReleaseArtifacts(fixture);
  assert.equal(fixture.calls[0], 'paginate');
  assert.equal(fixture.calls.length, 103);
  assert.deepEqual(fixture.calls[1], {owner: 'example', repo: 'mobile', artifact_id: 102});
  assert.deepEqual(fixture.calls.at(-1), {owner: 'example', repo: 'mobile', artifact_id: 1});
  assert.match(fixture.logs[0], /android: keeping 3; deleting 102/);
});

test('dry-run previews deletions without calling the delete endpoint', async () => {
  const fixture = harness([artifact(1), artifact(2), artifact(3), artifact(4)]);
  await cleanupReleaseArtifacts({...fixture, dryRun: true});
  assert.deepEqual(fixture.calls, ['paginate']);
  assert.ok(fixture.logs.includes('Would delete android-release-1.0.0+1 (1).'));
});

test('an artifact removed during cleanup does not prevent remaining deletions', async () => {
  const fixture = harness([1, 2, 3, 4, 5].map(id => artifact(id)), 404);
  await cleanupReleaseArtifacts(fixture);
  assert.deepEqual(fixture.calls.at(-1), {owner: 'example', repo: 'mobile', artifact_id: 1});
  assert.ok(fixture.logs.includes('android-release-1.0.0+2 (2) was already removed.'));
});

test('permission and service failures fail cleanup instead of reporting success', async () => {
  for (const status of [403, 500]) {
    const fixture = harness([1, 2, 3, 4, 5].map(id => artifact(id)), status);
    await assert.rejects(cleanupReleaseArtifacts(fixture), error => error.status === status);
    assert.equal(fixture.calls.length, 2);
  }
});

test('a failed artifact listing cannot cause any deletion', async () => {
  const fixture = harness([1, 2, 3, 4, 5].map(id => artifact(id)));
  fixture.github.paginate = async () => { throw Error('Listing unavailable'); };
  await assert.rejects(cleanupReleaseArtifacts(fixture), /Listing unavailable/);
  assert.deepEqual(fixture.calls, []);
});
