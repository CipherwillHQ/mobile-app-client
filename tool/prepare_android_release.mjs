// Prepares temporary signing files and production defines for the release job.
// Owns restricted file permissions and existing Gradle configuration inputs.
// Does not log credentials, create upload keys or publish to Google Play.
import {mkdirSync, writeFileSync} from 'node:fs';
import {join, resolve} from 'node:path';
import {releaseInputs} from './release_inputs.mjs';
import {signingProperties} from './android_signing.mjs';

const environment = process.env;
const {config, keystore} = releaseInputs(environment);
if (!environment.RUNNER_TEMP) throw Error('RUNNER_TEMP is required for temporary signing files.');
const storeFile = join(resolve(environment.RUNNER_TEMP), 'cipherwill-upload-key.jks');
writeFileSync(storeFile, keystore, {mode: 0o600});
writeFileSync('android/key.properties', signingProperties({
  storeFile, storePassword: environment.ANDROID_KEYSTORE_PASSWORD,
  keyAlias: environment.ANDROID_KEY_ALIAS, keyPassword: environment.ANDROID_KEY_PASSWORD,
}), {mode: 0o600});
mkdirSync('config', {recursive: true});
writeFileSync('config/production.json', JSON.stringify(config), {mode: 0o600});
console.log('Prepared temporary Android upload signing and production configuration.');
