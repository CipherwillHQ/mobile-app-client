// Checks the checked-out release commit and emits safe GitHub output values.
// Owns Git history reads and the release job's version/build outputs.
// Does not evaluate commit text as shell code or modify pubspec.yaml.
import {execFileSync} from 'node:child_process';
import {appendFileSync, readFileSync} from 'node:fs';
import {validateRelease} from './release_version.mjs';

const git = (...args) => execFileSync('git', args, {encoding: 'utf8'}).trimEnd();
const parent = git('rev-list', '--parents', '-n', '1', 'HEAD').split(' ')[1];
const release = validateRelease({
  message: git('show', '-s', '--format=%B', 'HEAD'),
  pubspec: readFileSync('pubspec.yaml', 'utf8'),
  previousPubspec: parent ? git('show', `${parent}:pubspec.yaml`) : null,
  previousMessages: parent ? git('log', '--format=%s', parent).split('\n') : [],
});
if (process.env.GITHUB_OUTPUT) {
  appendFileSync(process.env.GITHUB_OUTPUT,
    `version=${release.version}\nbuild_number=${release.buildNumber}\nlabel=${release.label}\n`);
}
console.log(`Validated release ${release.label}.`);
