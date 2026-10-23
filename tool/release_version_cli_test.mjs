// Exercises the release CLI against isolated Git commit history.
// Owns output, rollback and commit-text execution regression scenarios.
// Does not modify the app repository or call GitHub.
import assert from 'node:assert/strict';
import {execFileSync, spawnSync} from 'node:child_process';
import {existsSync, readFileSync} from 'node:fs';
import {join} from 'node:path';
import {fileURLToPath} from 'node:url';
import {test} from 'node:test';
import {commitTestVersion, releaseTestRepository} from './release_test_fixture.mjs';

const cli = fileURLToPath(new URL('./release_version_cli.mjs', import.meta.url));

test('CLI checks HEAD and writes only validated version outputs', context => {
  const directory = releaseTestRepository(context);
  commitTestVersion(directory, '1.0.0+1', 'Initial commit');
  commitTestVersion(directory, '1.0.0+2', 'release 1.0.0+2: $(touch injected) `touch injected`\n\nBody');
  const output = join(directory, 'github-output');
  const stdout = execFileSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...process.env, GITHUB_OUTPUT: output},
  });
  assert.equal(stdout.trim(), 'Validated release 1.0.0+2.');
  assert.equal(readFileSync(output, 'utf8'), 'version=1.0.0\nbuild_number=2\nlabel=1.0.0+2\n');
  assert.equal(existsSync(join(directory, 'injected')), false);
});

test('CLI rejects reused builds from earlier reachable release commits', context => {
  const directory = releaseTestRepository(context);
  commitTestVersion(directory, '1.0.0+1', 'Initial commit');
  commitTestVersion(directory, '1.0.0+7', 'release 1.0.0+7: First release');
  commitTestVersion(directory, '1.0.0+1', 'chore: Restore old pubspec');
  commitTestVersion(directory, '1.0.0+2', 'release 1.0.0+2');
  const output = join(directory, 'github-output');
  const result = spawnSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...process.env, GITHUB_OUTPUT: output},
  });
  assert.notEqual(result.status, 0);
  assert.match(result.stderr, /above 7/);
  assert.equal(existsSync(output), false);
});

test('CLI rejects a release commit that did not update the previous build number', context => {
  const directory = releaseTestRepository(context);
  commitTestVersion(directory, '1.0.0+2', 'chore: Prepare release');
  commitTestVersion(directory, '1.0.0+2', 'release 1.0.0+2');
  const result = spawnSync(process.execPath, [cli], {cwd: directory, encoding: 'utf8'});
  assert.notEqual(result.status, 0);
  assert.match(result.stderr, /above 2/);
});

test('CLI accepts a new build after a release failed because its pubspec was not bumped', context => {
  const directory = releaseTestRepository(context);
  commitTestVersion(directory, '1.0.0+1', 'Initial commit');
  commitTestVersion(directory, '1.0.0+1', 'release 1.0.0+2: First Android release');
  const failed = spawnSync(process.execPath, [cli], {cwd: directory, encoding: 'utf8'});
  assert.notEqual(failed.status, 0);
  assert.match(failed.stderr, /does not match pubspec\.yaml \(1\.0\.0\+1\)/);
  commitTestVersion(directory, '1.0.0+2', 'release 1.0.0+2: Retry');
  const reused = spawnSync(process.execPath, [cli], {cwd: directory, encoding: 'utf8'});
  assert.notEqual(reused.status, 0);
  assert.match(reused.stderr, /above 2/);
  commitTestVersion(directory, '1.0.0+3', 'release 1.0.0+3: Fix release version');
  assert.match(execFileSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...process.env, GITHUB_OUTPUT: ''},
  }), /Validated release 1\.0\.0\+3/);
});

test('CLI supports a first commit with no parent', context => {
  const directory = releaseTestRepository(context);
  commitTestVersion(directory, '1.0.0+1', 'release 1.0.0+1');
  assert.match(execFileSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...process.env, GITHUB_OUTPUT: ''},
  }), /Validated release 1.0.0\+1/);
});
