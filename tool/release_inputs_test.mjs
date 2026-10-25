// Tests safe handling of CI signing secrets and public runtime configuration.
// Owns input validation and prevention of secret values in error messages.
// Does not use production credentials or create Android artifacts.
import assert from 'node:assert/strict';
import {test} from 'node:test';
import {releaseInputs} from './release_inputs.mjs';

const config = {APP_ENV: 'production', API_URL: 'https://api.example.com/graphql'};
const environment = {
  ANDROID_UPLOAD_KEYSTORE_BASE64: Buffer.from('dummy-keystore').toString('base64'),
  ANDROID_KEYSTORE_PASSWORD: 'dummy-store-password',
  ANDROID_KEY_ALIAS: 'upload', ANDROID_KEY_PASSWORD: 'dummy-key-password',
  CIPHERWILL_PRODUCTION_CONFIG: JSON.stringify(config),
};

test('valid inputs preserve key bytes and public configuration', () => {
  const result = releaseInputs(environment);
  assert.deepEqual(result.config, config);
  assert.equal(result.keystore.toString(), 'dummy-keystore');
  assert.equal(releaseInputs({
    ...environment, ANDROID_UPLOAD_KEYSTORE_BASE64: environment.ANDROID_UPLOAD_KEYSTORE_BASE64 + '\n',
  }).keystore.toString(), 'dummy-keystore');
});

test('missing signing inputs identify the secret names only', () => {
  assert.throws(() => releaseInputs({}), /Configure GitHub secrets: ANDROID_UPLOAD_KEYSTORE_BASE64/);
  for (const name of Object.keys(environment)) {
    assert.throws(() => releaseInputs({...environment, [name]: ''}), new RegExp(name));
  }
});

test('malformed JSON errors do not expose the input', () => {
  assert.throws(() => releaseInputs({
    ...environment, CIPHERWILL_PRODUCTION_CONFIG: 'sensitive-invalid-config',
  }), error => error.message === 'CIPHERWILL_PRODUCTION_CONFIG must be valid JSON.');
});

test('configuration permits only the public string fields', () => {
  for (const invalid of [null, [], 'text', {...config, PRIVATE_KEY: 'secret'}, {...config, GOOGLE_SERVER_CLIENT_ID: 1}]) {
    assert.throws(() => releaseInputs({
      ...environment, CIPHERWILL_PRODUCTION_CONFIG: JSON.stringify(invalid),
    }), /public string fields/);
  }
});

test('releases require production with an HTTPS endpoint without credentials', () => {
  for (const invalid of [
    {...config, APP_ENV: 'staging'}, {...config, API_URL: 'http://api.example.com'},
    {...config, API_URL: 'https://user:password@example.com'},
    {...config, API_URL: 'file:///config'}, {...config, API_URL: ''},
  ]) assert.throws(() => releaseInputs({
    ...environment, CIPHERWILL_PRODUCTION_CONFIG: JSON.stringify(invalid),
  }), /production|API_URL/);
});

test('invalid base64 keystore data fails before file preparation', () => {
  for (const encoded of ['???', 'YQ', 'YQ===', ' ', 'YQ==!!']) {
    assert.throws(() => releaseInputs({
      ...environment, ANDROID_UPLOAD_KEYSTORE_BASE64: encoded,
    }), /base64-encoded upload keystore/);
  }
});
