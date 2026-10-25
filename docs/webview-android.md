# Android WebView capabilities

The Android client retains native Firebase sign-in and the web application at
`https://cipherwill.com/app`. The existing authentication bridge is unchanged.

The separate `CipherwillDevice` channel provides:

- A native picker for HTML file inputs.
- Save and share dialogs for individual vault and executor files.
- Android Credential Manager/WebAuthn support for passkey creation and unlock.
- MetaMask SDK handoff to the installed wallet and return to the existing vault.
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

Security factor management is available on desktop and Android for master
passwords, MetaMask and supported passkeys. Devices without WebAuthn support show
an explanation for passkey actions while other factors remain available. Backups,
restores and subscription management retain their existing desktop notices.

MetaMask must be installed on Android. The web SDK sends only its connection link
through the trusted device bridge; signatures stay on the SDK's encrypted
connection. The `cipherwill-wallet` return scheme resumes the existing activity
without navigating or recreating the vault page. A cold return opens the normal
authentication boundary. Missing wallets, rejected requests and timeouts can be
retried. Key synchronization and factor removal keep the native back warning
active until completion or failure. Keep the app open until synchronization ends;
Android can terminate background work.

## Deployment

Deploy the web client changes and install the companion Android build, including
its wallet bridge and return intent. Retain `public/.well-known/assetlinks.json`.
The association includes the configured release certificate and this development
device's certificate. A build distributed through Google Play must additionally
include its Play App Signing certificate if it differs from the local certificate.
Android verifies the association before an app can use passkeys for cipherwill.com.

Reinstall the Android APK using `adb install -r` to preserve the native Firebase
session. No backend changes are required.

iOS implementation remains deferred. Before release, verify all three factors on
a physical Android device: create, synchronize, lock/unlock and remove a factor;
cancel a passkey prompt; sign in MetaMask and return to the same vault screen;
retry with MetaMask absent; and interrupt synchronization without deleting source
keys. Repeat passkey enrollment using the actual release/Play signing certificate.
