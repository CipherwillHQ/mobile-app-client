// Creates isolated Git history for release contract integration tests.
// Owns temporary repositories, fixture commits and automatic cleanup.
// Does not read or change the application's working tree.
import {execFileSync} from 'node:child_process';
import {mkdtempSync, rmSync, writeFileSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join} from 'node:path';

export function releaseTestRepository(context) {
  const directory = mkdtempSync(join(tmpdir(), 'cipherwill-release-test-'));
  context.after(() => rmSync(directory, {recursive: true, force: true}));
  execFileSync('git', ['init', '--quiet'], {cwd: directory});
  execFileSync('git', ['config', 'user.name', 'Release test'], {cwd: directory});
  execFileSync('git', ['config', 'user.email', 'release@example.com'], {cwd: directory});
  return directory;
}

export function commitTestVersion(directory, version, message) {
  writeFileSync(join(directory, 'pubspec.yaml'), `name: cipherwill\nversion: ${version}\n`);
  execFileSync('git', ['add', 'pubspec.yaml'], {cwd: directory});
  execFileSync('git', ['-c', 'commit.gpgsign=false', 'commit', '--quiet', '--allow-empty', '-m', message],
    {cwd: directory});
}
