// Tests Java properties serialization of upload-key settings.
// Owns escaping regression coverage for paths, Unicode and password whitespace.
// Does not read real keystores or exercise Gradle signing.
import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {mkdtempSync, rmSync, writeFileSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join} from 'node:path';
import {test} from 'node:test';
import {escapeProperty, signingProperties} from './android_signing.mjs';

test('properties escape password punctuation and control characters', () => {
  assert.equal(escapeProperty(' a:b=c#!\\\n\r\t\f '),
    '\\ a\\:b\\=c\\#\\!\\\\\\n\\r\\t\\f\\ ');
});

test('Unicode uses the encoding understood by Properties.load(InputStream)', () => {
  assert.equal(escapeProperty('clé🔑'), 'cl\\u00e9\\ud83d\\udd11');
});

test('signing configuration preserves Windows paths and all four fields', () => {
  assert.equal(signingProperties({
    storeFile: 'C:\\Release Keys\\upload.jks', storePassword: ' leading ',
    keyAlias: 'upload', keyPassword: 'p=ss',
  }), 'storeFile=C\\:\\\\Release\\ Keys\\\\upload.jks\n' +
    'storePassword=\\ leading\\ \nkeyAlias=upload\nkeyPassword=p\\=ss\n');
});

test('Java Properties.load round trips Unicode and whitespace exactly', context => {
  const directory = mkdtempSync(join(tmpdir(), 'cipherwill-properties-test-'));
  context.after(() => rmSync(directory, {recursive: true, force: true}));
  const values = {
    storeFile: 'C:\\Release Keys\\upload.jks', storePassword: ' secret\t\n\\:=#!é🔑 ',
    keyAlias: 'upload', keyPassword: ' key\r\f ',
  };
  const properties = join(directory, 'key.properties');
  writeFileSync(properties, signingProperties(values));
  const source = join(directory, 'PropertiesCheck.java');
  writeFileSync(source, `// Reads only dummy signing properties for a serialization test.
// Owns Java InputStream decoding compatibility coverage.
// Does not access production keys or print passwords.
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
class PropertiesCheck {
  public static void main(String[] args) throws Exception {
    Properties properties = new Properties();
    try (var input = Files.newInputStream(Path.of(args[0]))) { properties.load(input); }
    String[] keys = {"storeFile", "storePassword", "keyAlias", "keyPassword"};
    for (int index = 0; index < keys.length; index++) {
      String expected = new String(Base64.getDecoder().decode(args[index + 1]), StandardCharsets.UTF_8);
      if (!expected.equals(properties.getProperty(keys[index]))) {
        throw new AssertionError("Property round trip failed: " + keys[index]);
      }
    }
  }
}`);
  const java = process.env.JAVA_HOME ? join(process.env.JAVA_HOME, 'bin', 'java') : 'java';
  const expected = Object.values(values).map(value => Buffer.from(value).toString('base64'));
  execFileSync(java, [source, properties, ...expected], {stdio: 'pipe'});
});
