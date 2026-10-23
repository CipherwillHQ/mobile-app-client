<!-- Explains the Cipherwill native client and its local setup.
Owns development commands and links to verification/release instructions.
Does not claim device acceptance or public release readiness. -->
# Cipherwill mobile

Flutter Android/iOS client for the existing Cipherwill backend and Firebase accounts. The implementation includes owner vault categories, encrypted storage, beneficiaries/friends, executor access, guidance, planning, account settings, existing subscriptions, and compatible text backups.

**Status:** Android debug builds, analysis and 82 automated tests pass. Firebase Android/iOS registration is configured. Live backend scenarios, physical-device security tests, iOS compilation and store acceptance remain pending. See [release checklist](docs/release-checklist.md).

## Local setup

Use Flutter stable **3.41.4**, Dart **3.11.1**, Java **17**, and an Android SDK. Minimum supported targets are Android 9/API 28 and iOS 16. iOS builds require macOS, Xcode and CocoaPods.

On this Windows workspace, Flutter is installed at C:\flutter\bin. Add that directory, the Dart global Pub Cache bin directory, and the npm global bin directory to PATH.

1. Run flutter pub get.
2. Sign the Firebase CLI into an account with access to project-cipherwill.
3. Run ./tool/configure_firebase.ps1. It generates Dart options, downloads both native configurations, wires the iOS resource, and synchronizes Google client IDs.
4. On macOS, run FlutterFire directly with project-cipherwill, Android package com.cipherwill.app and iOS bundle com.cipherwill.app, followed by node tool/sync_ios_firebase.mjs and node tool/sync_google_config.mjs.
5. Copy the chosen config/*.example.json to config/development.json, config/staging.json or config/production.json. Set API_URL and REOWN_PROJECT_ID. Leave Firebase override values empty to use the generated FlutterFire options.
6. Run flutter run --dart-define-from-file=config/development.json on an emulator or device.

Firebase is configured for project-cipherwill and com.cipherwill.app on Android and iOS. The generated Dart options, android/app/google-services.json, and ios/Runner/GoogleService-Info.plist contain the registered public client configuration. This machine's Android debug SHA-1/SHA-256 fingerprints are registered. Release/Play signing fingerprints and Apple provider/device acceptance remain pending.

When rerunning configuration, use a current Node.js release. Node 24.14.0 on this Windows machine crashed during Firebase CLI shutdown; configuration completed cleanly using Node 24.22.1.

Public API endpoints from the existing web environment files were copied into ignored local config files. An Android emulator uses 10.0.2.2 to reach a local host service. A physical device needs a reachable LAN endpoint. HTTP is permitted only in debug Android builds; production requires HTTPS.

Build environments currently share com.cipherwill.app and the authorized Firebase project. Additional simultaneous app identifiers require separate Firebase registrations and matching native configuration.

## Verification

Run the co-located tests under lib as well as test:

- flutter analyze
- flutter test lib test
- node tool/check_source_rules.mjs --format
- dart run build_runner build
- node tool/generate_operation_registry.mjs --check
- flutter build apk --debug --dart-define-from-file=config/development.json

The contract tools use the sibling Cipherwill and cipherwill-backend repositories:

- node tool/export_backend_schema.mjs --check
- node tool/export_asset_contracts.mjs --check
- flutter test lib/core/crypto/crypto_test.dart
- node tool/crypto_interop.mjs --verify-mobile

CIPHERWILL_WEB_PATH and CIPHERWILL_BACKEND_PATH can point to other checkouts. Dependencies must be installed in those repositories. Regenerate schema/asset snapshots without --check, review the native mappings, then rerun code generation and tests. Crypto fixture regeneration uses node tool/crypto_interop.mjs.

## Implementation

Home, Vault, People and Settings provide the primary navigation. Features own their screens/services. core contains networking, protocol-compatible cryptography, configuration and native security adapters. Application services are injected through Riverpod. GraphQL operations have generated documents/types and no persistent response cache.

See [security compatibility](docs/security.md), [platform configuration](docs/platform-setup.md), [parity scenarios](docs/parity-scenarios.md), and [store draft](docs/store-draft.md).

Existing backend authorization, quotas and release conditions remain authoritative. Account authentication is separate from factor unlocking. Saved biometric keys use native secret retrieval controls. Backups contain decrypted text; files are excluded. There is no persistent offline vault cache, push notification setup, checkout, upgrade flow, chat, wishes, marketing or HQ workspace.
