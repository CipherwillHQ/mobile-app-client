// Exercises temporary signing-file preparation using dummy CI secrets.
// Owns secret-file contents, permissions and safe success/error output checks.
// Does not use real upload keys or change the application's configuration.
import assert from 'node:assert/strict';
import {spawnSync} from 'node:child_process';
import {existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, statSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join} from 'node:path';
import {fileURLToPath} from 'node:url';
import {test} from 'node:test';
import {signingProperties} from './android_signing.mjs';

const cli = fileURLToPath(new URL('./prepare_android_release.mjs', import.meta.url));

test('preparation writes restricted files and keeps secrets out of logs', context => {
  const directory = mkdtempSync(join(tmpdir(), 'cipherwill-signing-test-'));
  context.after(() => rmSync(directory, {recursive: true, force: true}));
  const runnerTemp = join(directory, 'runner');
  mkdirSync(runnerTemp);
  mkdirSync(join(directory, 'android'));
  const config = {APP_ENV: 'production', API_URL: 'https://api.example.com/graphql'};
  const environment = {
    ...process.env, RUNNER_TEMP: runnerTemp,
    ANDROID_UPLOAD_KEYSTORE_BASE64: Buffer.from('dummy-key-bytes').toString('base64'),
    ANDROID_KEYSTORE_PASSWORD: 'dummy-store-secret',
    ANDROID_KEY_ALIAS: 'upload', ANDROID_KEY_PASSWORD: 'dummy-key-secret',
    CIPHERWILL_PRODUCTION_CONFIG: JSON.stringify(config),
  };
  const result = spawnSync(process.execPath, [cli], {cwd: directory, encoding: 'utf8', env: environment});
  assert.equal(result.status, 0, result.stderr);
  assert.doesNotMatch(result.stdout + result.stderr, /dummy|api\.example/);
  const storeFile = join(runnerTemp, 'cipherwill-upload-key.jks');
  assert.equal(readFileSync(storeFile, 'utf8'), 'dummy-key-bytes');
  assert.equal(readFileSync(join(directory, 'android/key.properties'), 'utf8'), signingProperties({
    storeFile, storePassword: environment.ANDROID_KEYSTORE_PASSWORD,
    keyAlias: environment.ANDROID_KEY_ALIAS, keyPassword: environment.ANDROID_KEY_PASSWORD,
  }));
  assert.deepEqual(JSON.parse(readFileSync(join(directory, 'config/production.json'), 'utf8')), config);
  if (process.platform !== 'win32') {
    for (const file of [storeFile, join(directory, 'android/key.properties'), join(directory, 'config/production.json')]) {
      assert.equal(statSync(file).mode & 0o777, 0o600);
    }
  }
  const failure = spawnSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...environment, RUNNER_TEMP: '', ANDROID_KEY_PASSWORD: ''},
  });
  assert.notEqual(failure.status, 0);
  assert.match(failure.stderr, /ANDROID_KEY_PASSWORD/);
  assert.doesNotMatch(failure.stderr, /dummy-store-secret|dummy-key-secret/);
});

test('invalid inputs create no signing files', context => {
  const directory = mkdtempSync(join(tmpdir(), 'cipherwill-signing-test-'));
  context.after(() => rmSync(directory, {recursive: true, force: true}));
  const result = spawnSync(process.execPath, [cli], {
    cwd: directory, encoding: 'utf8', env: {...process.env, ANDROID_UPLOAD_KEYSTORE_BASE64: ''},
  });
  assert.notEqual(result.status, 0);
  assert.equal(existsSync(join(directory, 'android/key.properties')), false);
  assert.equal(existsSync(join(directory, 'config/production.json')), false);
});
