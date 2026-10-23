<!-- Explains the signed Android release procedure.
Owns release commit naming, version/build rules and CI signing setup.
Does not publish to Play Store or contain signing credentials. -->
# Android releases

Every release commit must start with the lowercase string `release`, followed by
the version and build number in `VERSION+BUILD` format:

```text
release 1.0.0+2: Describe this release
```

`release 1.0.0+2` without a summary is also valid. Use stable three-part versions
such as `1.0.0` or `1.1.0`. The release subject must exactly match `pubspec.yaml`.

## Always update the build number

Update `pubspec.yaml` **in every release commit**, including rebuilds of the same
version. For example, change the current `version: 1.0.0+1` to:

```yaml
version: 1.0.0+2
```

The part before `+` is the user-visible version (`versionName`). The positive
integer after `+` is the Android build number (`versionCode`). It must increase
above the parent commit's build number and all earlier valid release commits in
the commit's Git history. CI fails if it is unchanged, lower, or greater than
2,100,000,000. If a higher build was uploaded outside this workflow or from another
branch, use a number above that too; CI does not query Play Console.

Choose the next unused build number, edit `pubspec.yaml`, then include that change
and the release changes in one commit. For example:

```sh
git add pubspec.yaml
# Stage the reviewed application changes for this release too.
git commit -m "release 1.0.0+2: Improve mobile navigation"
git push origin main
```

The release commit must be the **last commit of the push**. The workflow checks
the pushed HEAD message. A pull request, manual workflow run, or ordinary push
runs validation/debug builds. A release-prefixed push on any branch runs the
signed Android release job after analysis and tests, replacing the Android debug
job. The existing iOS validation job still runs without signing.

## One-time signing setup

The repository must have these GitHub Actions secrets before a release push:

| Secret | Value |
| --- | --- |
| `ANDROID_UPLOAD_KEYSTORE_BASE64` | Base64-encoded Android upload keystore |
| `ANDROID_KEYSTORE_PASSWORD` | Keystore password |
| `ANDROID_KEY_ALIAS` | Alias of the upload key in that keystore |
| `ANDROID_KEY_PASSWORD` | Password for the upload key |
| `CIPHERWILL_PRODUCTION_CONFIG` | Contents of `config/production.json` |

Use the upload key authorized for this app in Play Console. For an existing app,
reuse its approved upload key. Keep a secure backup of the keystore and passwords;
keep signing files out of this public mobile repository. If this is the first
release and no upload key exists, create
one interactively outside the repository with the JDK's `keytool`:

```powershell
keytool -genkeypair -v -keystore "$env:USERPROFILE\cipherwill-upload-key.jks" -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

If `keytool` is not on PATH on this Windows workspace, replace it with
`& "C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"`.

The current upload key and signing settings are backed up, at the owner's request,
in the [private backend repository](https://github.com/CipherwillHQ/cipherwill-backend/tree/main/mobile-client-signing-details).
From that backend checkout, restore all five GitHub secrets without printing
their values by running:

```sh
node mobile-client-signing-details/restore-github-secrets.mjs
```

With `gh` signed in, set the secrets from PowerShell. Adjust the keystore path to
your approved key. The password commands prompt for their values:

```powershell
$uploadKeyPath = "$env:USERPROFILE\cipherwill-upload-key.jks"
[Convert]::ToBase64String([IO.File]::ReadAllBytes($uploadKeyPath)) | gh secret set ANDROID_UPLOAD_KEYSTORE_BASE64 --repo CipherwillHQ/mobile-app-client
gh secret set ANDROID_KEYSTORE_PASSWORD --repo CipherwillHQ/mobile-app-client
gh secret set ANDROID_KEY_ALIAS --repo CipherwillHQ/mobile-app-client
gh secret set ANDROID_KEY_PASSWORD --repo CipherwillHQ/mobile-app-client
Get-Content -LiteralPath config/production.json -Raw | gh secret set CIPHERWILL_PRODUCTION_CONFIG --repo CipherwillHQ/mobile-app-client
```

Create the ignored `config/production.json` from `config/production.example.json`.
Set `APP_ENV` to `production` and `API_URL` to the production HTTPS GraphQL endpoint.
Set `REOWN_PROJECT_ID` and any other required public client values. Leave Firebase
overrides empty to use the committed FlutterFire registrations. Include only the
public string fields in the example; never add backend credentials or private keys
to runtime configuration, which is compiled into the app.

Register the upload certificate and Play App Signing certificate SHA-1/SHA-256
fingerprints with Firebase/Google authentication as appropriate. Google Play signs
distributed installs with its app signing key, which can differ from the upload key.
The current upload certificate's SHA-1/SHA-256 fingerprints are already registered
with the Firebase Android app; add Play's app signing fingerprints after enrollment.

CI validates the keystore and alias, signs through `android/key.properties`, and
verifies both output signatures before saving artifacts. Signing files are created
under the runner's temporary directory and ignored local configuration paths,
then removed even if a step fails. Secrets and keystores are excluded from uploaded
artifacts and dependency caches.

## Download and upload

Open **GitHub → Actions → Mobile validation → the release run → Artifacts**.
Download and extract `android-release-1.0.0+2`. It contains:

- `cipherwill-1.0.0+2.aab`: signed Android App Bundle for manual Play Console upload.
- `cipherwill-1.0.0+2.apk`: signed release APK for direct device installation/testing.

Artifacts are retained for **90 days**. Save your release files elsewhere if you
need longer retention. Allow the release run to finish before pushing another
commit to the same branch: the workflow cancels superseded runs. Flutter/Pub,
Gradle and NDK caches speed up subsequent builds.

This workflow does not upload to Play Console. Complete the device acceptance,
store disclosures and other checks in [the release checklist](docs/release-checklist.md)
before promoting a build publicly.

## Validate the release tooling locally

With Node.js 22+, JDK 17+ and Git available:

```sh
node --test tool/release_*_test.mjs tool/android_signing_test.mjs
```

After creating a release commit, `node tool/release_version_cli.mjs` checks its
message and build-number history without changing files. Run `actionlint` to
validate the GitHub workflow YAML.
