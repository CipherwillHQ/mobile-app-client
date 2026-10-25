<!-- Explains the Cipherwill mobile authentication and WebView wrapper.
Owns local setup and verification commands.
Does not claim physical-device or app-store acceptance. -->
# Cipherwill mobile

Flutter Android/iOS wrapper for [cipherwill.com/app](https://cipherwill.com/app).
Email/password, Google and Apple sign-in stay native. After sign-in, a small
bridge restores the same Firebase account in the web client. Onboarding, email
verification, encryption factors and all application features run in the existing
web client. Web logout also signs out the native account.

The native vault, storage, people, settings, billing, support, updates, crypto,
generated GraphQL operations and related tests/tooling have been removed.

## Local setup

Use Flutter stable **3.41.4**, Dart **3.11.1**, Java **17** and an Android SDK.
Minimum targets remain Android 9/API 28 and iOS 16. iOS builds require macOS,
Xcode and CocoaPods. Flutter is installed at `C:\flutter\bin` on this workspace.

1. Run `flutter pub get`.
2. Firebase registrations for `project-cipherwill` and `com.cipherwill.app`
   are committed. To regenerate them, run `./tool/configure_firebase.ps1`,
   then the Firebase/Google synchronization scripts in `tool/`.
3. Copy a `config/*.example.json` to the matching ignored environment JSON.
   Set `API_URL` to the existing GraphQL endpoint for native password resets.
   Leave Firebase overrides empty to use the registered FlutterFire options.
4. Run `flutter run --dart-define-from-file=config/production.json`.

The wrapper always loads the production web app. With no build overrides,
password resets use its public production API endpoint. Google client IDs are
synchronized from the committed native Firebase registration.

Deploy the backend token-exchange route and companion web authentication adapter
before distributing this mobile build. The previous deployed web client cannot
read the new bridge. See [authentication bridge](docs/webview-auth.md).

## Verification

- `flutter analyze`
- `flutter test lib test`
- `node tool/check_source_rules.mjs --format`
- `node --test tool/release_*_test.mjs tool/android_signing_test.mjs`
- `flutter build apk --debug`

GitHub Actions validates the wrapper and builds Android/iOS artifacts. Signed
Android APK/AAB builds still use release commits; see [release instructions](release.md).
Physical-device Firebase providers, WebView uploads/downloads, web encryption
factors, Android back navigation and iOS compilation require device acceptance.
