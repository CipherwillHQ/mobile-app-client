<!-- Documents native service registration and signing setup.
Owns platform prerequisites and externally supplied public identifiers.
Does not contain signing credentials or approve deployments. -->
# Platform setup

## Firebase and providers

Firebase Android/iOS registration was completed on 2026-10-24. Generated public configurations are installed in Dart and both native projects; initialization selects the registered platform options. Live sign-in remains a device acceptance check.

Use the authorized Firebase project project-cipherwill and package/bundle ID com.cipherwill.app. Run tool/configure_firebase.ps1 with Flutter, FlutterFire and Firebase CLI on PATH. The setup script also explicitly downloads the iOS plist on Windows and adds it to Runner resources; Android google-services.json and iOS GoogleService-Info.plist must belong to the selected registrations.

Enable email/password, Google and Apple providers in that project. This machine's Android debug SHA-1 and SHA-256 fingerprints are registered, and the Android OAuth client is present in google-services.json. Register release signing fingerprints and the Play app-signing certificate before distribution. Run the Google configuration synchronization tool to add the iOS reversed-client URL scheme and native client ID and the shared Google web client ID. GOOGLE_SERVER_CLIENT_ID may supply an explicit OAuth server client ID when needed.

For Sign in with Apple, configure the Apple capability, Firebase provider integration and the Apple developer identifiers/keys outside source control. Sign-in providers are offered on authentication screens; mobile Settings does not expose provider-linking actions.

API_URL identifies the existing GraphQL endpoint. Tokens are supplied using its existing raw Authorization header format. Ordinary feature parity adds no backend business APIs or database migrations.

The CLI completed cleanly with Node 24.22.1. Update the local Node installation if Firebase commands crash on shutdown under Node 24.14.0.

## Passkey and app links

Publish Android Digital Asset Links on cipherwill.com, www.cipherwill.com and auth.cipherwill.com at /.well-known/assetlinks.json. Include com.cipherwill.app and actual release/Play signing SHA-256 fingerprints, with handle_all_urls and get_login_creds relationships.

Publish Apple App Site Association on the same three hosts at /.well-known/apple-app-site-association. Include the actual TEAM_ID.com.cipherwill.app in cipherwill.com webcredentials.apps. Approve /app*, /executor*, /auth* and /login on cipherwill.com and www.cipherwill.com, plus /__/auth/action on auth.cipherwill.com.

Existing web category/item and executor/storage links translate to native screens with safely encoded identifiers. Verification return pages use the account gate; Firebase links containing mode and oobCode use a separate account-action screen. These are URI tests, not verified cold/warm device delivery.

These association files require actual signing identities and deployment to the website. They have not been published by this task. The existing domain association and credential IDs must allow web-created passkeys to derive the same mobile factor.

Set a public REOWN_PROJECT_ID from the Cipherwill Reown project to enable MetaMask connection. The adapter signs Cipherwill Factor: nonce with personal_sign and closes the memory-only connection after use. No project ID is currently supplied.

## Signing

Android release builds read ignored android/key.properties:

storeFile=absolute/path/to/release-keystore.jks
storePassword=provided-outside-source-control
keyAlias=release-alias
keyPassword=provided-outside-source-control

Release builds do not silently use the debug signing key. Generate the Play upload key and register the app in Play Console through the authorized account.

On macOS, set the Apple Team and provisioning in Xcode for com.cipherwill.app. Enable associated domains and Apple sign-in. Build an archive with the production define file and verify entitlements in the signed product.

The development, staging and production build files select APP_ENV and public service configuration. tool/build.ps1 creates APK debug builds, release AABs or iOS IPAs using the selected JSON. iOS can also be built directly from macOS with flutter build ipa --dart-define-from-file=config/production.json.

## CI

mobile.yml runs code generation, source rules, analysis, all co-located tests, Android debug compilation and macOS unsigned iOS compilation.

contracts.yml checks backend schema, web asset fields, guidance protocol and bidirectional crypto. It needs CONTRACTS_READ_TOKEN with read access to the two existing repositories. Yarn uses the web repository's frozen lockfile. Credentials are not part of fixtures.

CI workflows are prepared locally and have not been pushed or executed. Unsigned compilation does not establish provider, biometric, associated-domain or distribution readiness.
