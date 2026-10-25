# Android WebView capabilities

The Android client retains native Firebase sign-in and the web application at
`https://cipherwill.com/app`. The existing authentication bridge is unchanged.

The separate `CipherwillDevice` channel provides:

- A native picker for HTML file inputs.
- Save and share dialogs for individual vault and executor files.
- Android Credential Manager/WebAuthn support for existing passkey unlock.
- Native clipboard writes with completion feedback.
- Unsaved-note state for Android back confirmations.
- A background event that flushes pending web note saves and a foreground event
  that refreshes billing and account details after external checkout.

File keys and decryption stay in the web client. Completed file bytes travel in
acknowledged chunks of at most 48 KiB. Native code checks the announced byte count,
uses an isolated temporary directory, and deletes its temporary file after the
save/share action or cancellation. Saving creates the user's selected file outside
the app; sharing uses Android's system share sheet.

Upgrades open the public `https://cipherwill.com/upgrade` checkout in the system
browser, with the account email and backend user ID. Firebase credentials remain
inside the app. Return to the app after payment; Premium is activated by the
existing payment webhook. Billing details and invoices remain available in the app.

Backups and restores, wallet factors, subscription management, and security
factor management display desktop-required notices inside the mobile wrapper.
Existing browser controls remain available. Wallet-only users receive guidance to
add a supported factor on desktop. Devices without WebAuthn support show a clear
passkey notice instead of a nonworking unlock action.

## Deployment

Deploy the web client changes, including `public/.well-known/assetlinks.json`.
The association includes the configured release certificate and this development
device's certificate. A build distributed through Google Play must additionally
include its Play App Signing certificate if it differs from the local certificate.
Android verifies the association before an app can use passkeys for cipherwill.com.

Reinstall the Android APK using `adb install -r` to preserve the native Firebase
session. No backend changes are required.

iOS implementation and device validation are deferred. Browser process termination
or force-closing Android can interrupt any pending save; background flushing does
not guarantee completion after the operating system kills the application.
