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
- [ ] Replace pending store metadata/screenshots with actual accepted builds.
- [ ] Approve public release only when every parity scenario passes on both platforms.

No signed builds, device/emulator sessions, TestFlight/Play uploads or public release have occurred. Windows cannot verify iOS. Firebase Android/iOS configuration is installed as of 2026-10-24. Provider linking, live sign-in and production signing acceptance remain pending.
