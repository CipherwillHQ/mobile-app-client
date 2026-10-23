// Validates release signing inputs and public production app configuration.
// Owns fail-fast input checks without printing their values.
// Does not store private signing keys in Flutter runtime configuration.
const required = [
  'ANDROID_UPLOAD_KEYSTORE_BASE64', 'ANDROID_KEYSTORE_PASSWORD',
  'ANDROID_KEY_ALIAS', 'ANDROID_KEY_PASSWORD', 'CIPHERWILL_PRODUCTION_CONFIG',
];
const configKeys = new Set([
  'APP_ENV', 'API_URL', 'FIREBASE_API_KEY', 'FIREBASE_ANDROID_APP_ID',
  'FIREBASE_IOS_APP_ID', 'FIREBASE_PROJECT_ID', 'FIREBASE_SENDER_ID',
  'GOOGLE_SERVER_CLIENT_ID', 'GOOGLE_IOS_CLIENT_ID', 'REOWN_PROJECT_ID', 'SENTRY_DSN',
]);

export function releaseInputs(environment) {
  const missing = required.filter(name => !environment[name]);
  if (missing.length) throw Error('Configure GitHub secrets: ' + missing.join(', '));
  let config;
  try { config = JSON.parse(environment.CIPHERWILL_PRODUCTION_CONFIG); }
  catch { throw Error('CIPHERWILL_PRODUCTION_CONFIG must be valid JSON.'); }
  if (!config || Array.isArray(config) || typeof config !== 'object' ||
      Object.entries(config).some(([key, value]) => !configKeys.has(key) || typeof value !== 'string')) {
    throw Error('Use the public string fields from config/production.example.json.');
  }
  let url;
  try { url = new URL(config.API_URL); }
  catch { throw Error('Set a valid production API_URL in CIPHERWILL_PRODUCTION_CONFIG.'); }
  if (config.APP_ENV !== 'production' || url.protocol !== 'https:' || url.username || url.password) {
    throw Error('Release configuration requires APP_ENV=production and an HTTPS API_URL without credentials.');
  }
  const base64 = environment.ANDROID_UPLOAD_KEYSTORE_BASE64.replace(/\s/g, '');
  const keystore = Buffer.from(base64, 'base64');
  if (!keystore.length || keystore.toString('base64') !== base64) {
    throw Error('ANDROID_UPLOAD_KEYSTORE_BASE64 must contain the base64-encoded upload keystore.');
  }
  return {config, keystore};
}
