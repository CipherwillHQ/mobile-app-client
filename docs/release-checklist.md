<!-- Tracks actual verification and the remaining public-release gates.
Owns test/build evidence and platform acceptance prerequisites.
Does not treat implemented screens as accepted device parity. -->
# Release checklist

## Completed locally

Verified on 2026-10-23 using Flutter 3.41.4 and Dart 3.11.1:

- flutter analyze: no issues.
- flutter test lib test: 79 tests passed.
- Code generation, operation registry, backend schema and asset/guidance drift checks: passed.
- Web-library verification of mobile ciphertext: passed for all fixture categories, versions, factors, beneficiary layers and binary data.
- Handwritten Dart source comments, files under 200 lines and formatting: passed.
- Final Android debug build with development defines: passed; build/app/outputs/flutter-apk/app-debug.apk.


- [x] Flutter Android/iOS foundation and native navigation.
- [x] Existing GraphQL operations generated and schema-validated.
- [x] Web asset and guidance contract drift checks.
- [x] Cross-client synthetic crypto checks using actual web libraries.
- [x] Automated regression suite, including co-located tests.
- [x] Analysis and handwritten source limits.
- [x] Android debug compilation.
- [x] Native biometric/passkey implementations and release signing hooks.
- [x] CI definitions and store/privacy/reviewer drafts.

## Firebase configuration verified on 2026-10-24

- Android/iOS app registrations and generated Dart/native identifiers match project-cipherwill and com.cipherwill.app.
- Android debug SHA-1/SHA-256 are registered, and the native Google OAuth client is present.
- iOS Runner includes GoogleService-Info.plist and matching Google client/return identifiers.
- Reconfiguration reuses the existing registrations; repeated Google synchronization preserves identical output.
- flutter analyze: no issues; flutter test lib test: 82 tests passed.
- Source rules and generated-option formatting: passed.
- Android debug APK rebuilt successfully with the registered Firebase configuration and development defines.
- No Android device is currently connected; live sign-in and iOS compilation remain pending.

## Master-password dialog regression verified on 2026-10-24

- Reproduced the missing Navigator error by tapping a master-password factor through the actual application widget.
- Moved the account gate into protected routes so locked screens can open native dialogs; email account-action routes remain accessible.
- Regression checks cover private password entry, incorrect-password rejection, cancellation/retry, locked tab/detail routes and account-action return navigation.
- flutter analyze --no-pub: no issues; flutter test --no-pub lib test: 85 tests passed.
- Handwritten source limits, formatting and git diff --check: passed.
- Development Android debug APK rebuilt successfully at build/app/outputs/flutter-apk/app-debug.apk.
- An earlier APK was installed and cold-launched on the I2011 (Android 13); its sign-in screen was observed.
- Reinstalling this fixed APK returned "no devices/emulators found". Physical-device confirmation of the dialog fix remains pending reconnection.

## Flutter redesign verified on 2026-10-24

- Web-inspired branding, photographic authentication, owner/executor screens and reduced-motion-aware transitions are implemented.
- flutter test --no-pub lib test --dart-define=DESIGN_REVIEW=true: 100 tests passed.
- flutter analyze, handwritten source/format rules, operation registry and git diff --check: passed.
- Development Android debug APK compiled successfully at build/app/outputs/flutter-apk/app-debug.apk.
- Synthetic visual review covers 25 screens in both themes, narrow phones at 2× text size and all eight text-asset forms; see mobile-design.md.
- ADB is disconnected; live Android acceptance and iOS compilation/testing on macOS remain pending.

## Web upgrade integration verified on 2026-10-24

- Free accounts can open the existing public /upgrade page using webview_flutter and fresh GraphQL account attribution.
- The full regression suite passed 114 tests; after the final duplicate-tap guard, all 16 focused upgrade tests passed, including two additional route tests.
- Flutter analysis, source/format rules and git diff --check: passed.
- The public https://www.cipherwill.com/upgrade endpoint returned HTTP 200.
- Development Android debug compilation passed; live Paddle/payment-handoff and iOS acceptance remain pending.
- No ADB device is connected. See web-upgrade.md for the integration contract and device scenarios.

## Required before acceptance

- [x] Firebase CLI account can access project-cipherwill; registered Android/iOS configurations are installed.
- [ ] Google/Apple provider linking works with existing accounts.
- [ ] Public Reown project ID is configured and MetaMask signing works.
- [x] This machine's Android debug SHA-1/SHA-256 fingerprints are registered.
- [ ] Release/Play signing fingerprints and Apple Team ID are supplied.
- [ ] cipherwill.com association files are deployed and verified.
- [ ] Compile iOS on macOS; resolve any Swift/Pod/Xcode diagnostics.
- [ ] Run every parity-scenarios.md row on Android and iOS; record account/device/build/result.
- [ ] Test actual biometric enrollment changes, fallback hardware and app-switcher protection.
- [ ] Exercise real network interruption, storage quotas, large files and server permission changes.
- [ ] Verify rich-text and backup round trips through the existing web app.
- [ ] Inspect outbound release crash telemetry and SDK privacy manifests.
- [ ] Supply disposable owner/executor/free/premium reviewer accounts outside source control.
- [ ] Execute the CI workflows after repository publication.

## Distribution

- [ ] Sign Android AAB with approved upload key and upload to Google Play internal testing.
- [ ] Sign iOS archive with approved Team/provisioning and upload to TestFlight.
- [ ] Complete both internal test cycles and accessibility checks.
- [ ] Confirm privacy policy, support and outside-app deletion request access with the product owner.
- [ ] Complete App Store privacy and Play Data Safety forms against actual production SDK configuration.
- [ ] Review existing-subscriber portal behavior under both store policies.
- [ ] Validate embedded web upgrades, payment handoffs and permitted distribution under both store policies.
- [ ] Replace pending store metadata/screenshots with actual accepted builds.
- [ ] Approve public release only when every parity scenario passes on both platforms.

No signed builds, TestFlight/Play uploads or public release have occurred. Windows cannot verify iOS. Firebase Android/iOS configuration is installed as of 2026-10-24. Provider linking, live sign-in and production signing acceptance remain pending.
