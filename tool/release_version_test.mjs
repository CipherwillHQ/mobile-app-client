// Tests the release naming contract and monotonically increasing build numbers.
// Owns parsing, package matching and release history regression scenarios.
// Does not invoke Flutter or access signing credentials.
import assert from 'node:assert/strict';
import {test} from 'node:test';
import {packageVersion, releaseVersion, validateRelease, versionDetails} from './release_version.mjs';

test('release subject accepts an optional summary and a multiline body', () => {
  const expected = {version: '1.0.1', buildNumber: 2, label: '1.0.1+2'};
  assert.deepEqual(releaseVersion('release 1.0.1+2'), expected);
  assert.deepEqual(releaseVersion('release 1.0.1+2: Improve vault\n\nDetails'), expected);
  assert.deepEqual(releaseVersion('release 1.0.1+2: Fix\r\nBody'), expected);
  assert.deepEqual(packageVersion('name: cipherwill\nversion: 1.0.1+2\n'), expected);
});

test('invalid release messages and unstable versions fail', () => {
  for (const message of [
    'Release 1.0.1+2', 'release', 'releases 1.0.1+2', 'release 1.0.1',
    'release 1.0.1+0', 'release 1.0.1+-1', 'release 01.0.1+2',
    'release 1.0.1+02', 'release 1.0.1-beta+2', 'release 1.0.1+2:',
    'release 1.0.1+2 extra', ' release 1.0.1+2',
  ]) assert.throws(() => releaseVersion(message));
  for (const version of ['1.0.0+0', '1.0.0+-1', '1.0.0', '1.0.0+2extra']) {
    assert.throws(() => versionDetails(version));
  }
  assert.throws(() => packageVersion('version: 1.0.0'));
});

test('Android build numbers respect the Play Store limit', () => {
  assert.equal(versionDetails('1.0.0+2100000000').buildNumber, 2100000000);
  assert.throws(() => releaseVersion('release 1.0.0+2100000001'), /between/);
  assert.throws(() => releaseVersion('release 1.0.0+9007199254740992'), /between/);
});

test('release version and build must match the package declaration', () => {
  for (const pubspec of ['version: 1.0.0+2', 'version: 1.0.1+3']) {
    assert.throws(() => validateRelease({message: 'release 1.0.1+2', pubspec}), /match/);
  }
});

test('a missing release bump reports both versions and the required declaration', () => {
  assert.throws(() => validateRelease({
    message: 'release 1.0.0+2: First Android release',
    pubspec: 'version: 1.0.0+1', previousPubspec: 'version: 1.0.0+1',
  }), /Release 1\.0\.0\+2 does not match pubspec\.yaml \(1\.0\.0\+1\).*Set version: 1\.0\.0\+2/);
});

test('a release must increase the build number even if the version changes', () => {
  for (const build of [1, 2]) {
    assert.throws(() => validateRelease({
      message: `release 2.0.0+${build}`, pubspec: `version: 2.0.0+${build}`,
      previousPubspec: 'version: 1.0.0+2',
    }), /above 2/);
  }
  assert.equal(validateRelease({
    message: 'release 1.0.0+3', pubspec: 'version: 1.0.0+3',
    previousPubspec: 'version: 1.0.0+2',
  }).buildNumber, 3);
});

test('earlier release history prevents build reuse after a version rollback', () => {
  const inputs = {
    message: 'release 1.0.0+3', pubspec: 'version: 1.0.0+3',
    previousPubspec: 'version: 1.0.0+1',
    previousMessages: ['release 1.0.0+5: Previous upload', 'chore: Rollback', 'release notes'],
  };
  assert.throws(() => validateRelease(inputs), /above 5/);
  assert.equal(validateRelease({
    ...inputs, message: 'release 1.0.0+6', pubspec: 'version: 1.0.0+6',
  }).buildNumber, 6);
});
