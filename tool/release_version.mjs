// Validates release commit names against the Flutter package version.
// Owns stable version parsing and increasing Play Store build numbers.
// Does not modify commits, publish artifacts or infer a new version.
const versionPattern = String.raw`(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\+[1-9]\d*`;
const messagePattern = new RegExp(`^release (${versionPattern})(?:: .+)?$`);

export function versionDetails(value) {
  if (!new RegExp(`^${versionPattern}$`).test(value)) {
    throw Error('Use a stable VERSION+BUILD, for example 1.0.1+2.');
  }
  const [version, rawBuild] = value.split('+');
  const buildNumber = Number(rawBuild);
  if (!Number.isSafeInteger(buildNumber) || buildNumber > 2100000000) {
    throw Error('The Android build number must be between 1 and 2100000000.');
  }
  return {version, buildNumber, label: value};
}

export function packageVersion(pubspec) {
  const match = pubspec.match(new RegExp(`^version: (${versionPattern})\\s*$`, 'm'));
  if (!match) throw Error('pubspec.yaml must declare version: VERSION+BUILD, for example 1.0.1+2.');
  return versionDetails(match[1]);
}

export function releaseVersion(message) {
  const match = message.split(/\r?\n/, 1)[0].match(messagePattern);
  if (!match) throw Error('Use release VERSION+BUILD or release VERSION+BUILD: summary, for example release 1.0.1+2.');
  return versionDetails(match[1]);
}

export function validateRelease({message, pubspec, previousPubspec, previousMessages = []}) {
  const release = releaseVersion(message);
  if (release.label !== packageVersion(pubspec).label) {
    throw Error('The release commit version/build must match pubspec.yaml.');
  }
  let previousBuild = previousPubspec ? packageVersion(previousPubspec).buildNumber : 0;
  for (const message of previousMessages) {
    const match = message.match(messagePattern);
    if (match) previousBuild = Math.max(previousBuild, versionDetails(match[1]).buildNumber);
  }
  if (release.buildNumber <= previousBuild) {
    throw Error(`Increase the pubspec.yaml build number above ${previousBuild} in this release commit.`);
  }
  return release;
}
