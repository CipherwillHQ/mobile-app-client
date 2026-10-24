<!-- Explains native CI prerequisites and dependency cache behavior.
Owns workflow maintenance and verification guidance.
Does not contain signing credentials or publish to app stores. -->
# GitHub Actions

The mobile workflow runs analysis, tests and Android/iOS validation builds. It pins
Flutter 3.41.4, Android NDK 28.2.13676358 and Xcode 26.1.1. The selected Xcode is
installed on the macos-15 runner and satisfies connectivity_plus 7.3.2's SDK requirement.

Pushes whose HEAD commit starts with `release` call `android-release.yml` after
validation, producing signed APK and AAB artifacts instead of an Android debug
build. The commit version must match pubspec.yaml and increase the build number.
Signing requires the five GitHub secrets documented in [release.md](../release.md).
Other pushes, pull requests and manual runs keep the existing debug builds.

Android installs the NDK before Gradle starts. The installer reuses a completed
installation, retries failed or incomplete installations three times, and removes
partial SDK download/NDK directories between attempts. A failed installation still
fails the job. Its isolated regression suite runs in the validation job.

## Caches

- Flutter SDK and Pub downloads use flutter-action's platform/version/lockfile caches.
- Dart generation caches only .dart_tool/build, with platform, Flutter and dependency
  keys. New commits restore the previous compatible graph and still run build_runner.
- Android caches the exact NDK version. setup-gradle caches Gradle dependencies,
  distributions and task outputs; the Gradle build cache is enabled. Pull requests
  restore this Gradle cache without writing new entries.
- Signed Android releases reuse Flutter/Pub, Gradle and NDK caches. Temporary
  keystores and signing configuration are excluded from caches and artifacts.
- CocoaPods downloads can be reused after dependency changes. Installed Pods and
  their generated lockfile require an exact platform, Flutter, Xcode and dependency
  match; they have no fallback to an older dependency set.
- The contract workflow caches npm and Yarn downloads against the sibling
  repositories' lockfiles, plus Flutter/Pub dependencies.

The first successful run fills the caches. Later runs can reuse them; analysis,
tests, dependency resolution and native builds still execute. Each workflow cancels
its superseded runs for the same Git ref. Changing the corresponding tool version
or dependency lockfile invalidates the affected cache automatically.

## Artifact cleanup

`artifact-cleanup.yml` runs after Mobile validation completes, daily at 03:17 UTC,
and through manual dispatch. It keeps the newest **three artifacts per platform**
whose names start with `android-release-` or `ios-release-`, ordered by upload time.
Each Android artifact contains both APK and AAB files, so they are retained together.
The limit applies across repository branches. Debug artifacts and other uploads
are excluded; GitHub's configured age expiry still applies to the retained artifacts.

The current iOS job validates an unsigned build without uploading an artifact.
Future iOS release uploads should use the `ios-release-VERSION+BUILD` name prefix
to participate in the same policy.

Cleanup paginates all artifacts before deleting, runs one cleanup job at a time,
and uses only the built-in token with `actions: write` and `contents: read`.
It checks out the default branch, including when triggered by a pull request's
completed validation run. Manual dispatch's `dry_run` option previews the plan.
It deletes artifact archives while retaining workflow logs and GitHub release assets.

## Verification

Validate all YAML workflows with actionlint, then run:

```sh
bash tool/install_android_ndk_test.sh
node --test tool/release_*_test.mjs tool/android_signing_test.mjs
```

These checks and actionlint passed locally on 2026-10-24. Production Android
APK/AAB compilation and signature verification passed with a temporary test key.
Actual upload-key signing, the iOS build and cache hits must be confirmed on GitHub
after configuring secrets and pushing. Windows cannot run the iOS build.
