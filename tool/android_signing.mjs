// Serializes upload-key settings for Android's existing Gradle signing hook.
// Owns Java properties escaping for paths, aliases and passwords.
// Does not read secrets, create keystores or expose credential values.
export function escapeProperty(value) {
  return value.replace(/[\\\s:=#!\u0080-\uffff]/g, character => {
    const escapes = {'\\': '\\\\', '\n': '\\n', '\r': '\\r', '\t': '\\t', '\f': '\\f', ' ': '\\ '};
    return escapes[character] ?? (character.charCodeAt(0) > 127
      ? '\\u' + character.charCodeAt(0).toString(16).padStart(4, '0')
      : '\\' + character);
  });
}

export function signingProperties({storeFile, storePassword, keyAlias, keyPassword}) {
  return Object.entries({storeFile, storePassword, keyAlias, keyPassword})
    .map(([key, value]) => `${key}=${escapeProperty(value)}`).join('\n') + '\n';
}
