<!-- Explains native CI prerequisites and dependency cache behavior.
Owns workflow maintenance and verification guidance.
Does not configure production signing or publish application builds. -->
# GitHub Actions

The mobile workflow runs analysis, tests and unsigned Android/iOS builds. It pins
Flutter 3.41.4, Android NDK 28.2.13676358 and Xcode 26.1.1. The selected Xcode is
installed on the macos-15 runner and satisfies connectivity_plus 7.3.2's SDK requirement.

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
- CocoaPods downloads can be reused after dependency changes. Installed Pods and
  their generated lockfile require an exact platform, Flutter, Xcode and dependency
  match; they have no fallback to an older dependency set.
- The contract workflow caches npm and Yarn downloads against the sibling
  repositories' lockfiles, plus Flutter/Pub dependencies.

The first successful run fills the caches. Later runs can reuse them; analysis,
tests, dependency resolution and native builds still execute. Each workflow cancels
its superseded runs for the same Git ref. Changing the corresponding tool version
or dependency lockfile invalidates the affected cache automatically.

## Verification

Validate both YAML workflows with actionlint, then run:

```sh
bash tool/install_android_ndk_test.sh
```

These checks passed locally on 2026-10-24. Both platform builds and actual cache
hits must be confirmed on GitHub after pushing the updated workflows. Windows
cannot run the iOS build.
