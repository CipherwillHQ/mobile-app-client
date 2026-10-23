<!-- Records the native client's compatibility and security boundaries.
Owns protocol behavior, device secrets and verification limits.
Does not prescribe a new encryption protocol or migration. -->
# Protocol compatibility

The app preserves existing identifiers and encrypted data formats:

| Component | Existing behavior |
|---|---|
| Master password | SHA256 of password:nonce, secp256k1 scalar |
| MetaMask | Last eight signature characters followed by the master derivation |
| Passkey factor | SHA256 of decoded factor nonce concatenated with raw credential ID |
| Text | CryptoJS/OpenSSL salted AES format with MD5 EVP key/IV derivation |
| Binary | AES-256-CBC using the established character-based key and IV slices |
| Owner wrapping | Torus secp256k1 ECDH, SHA512, AES-CBC and authenticated E0 envelope |
| Beneficiary wrapping | E1 capsule layer, optionally wrapped by beneficiary factor E0 |
| Legacy ECIES | Accept both minimal and padded shared-secret representations |
| Legacy notes | Preserve raw note data and established versions |
| Factorless owner | Preserve the existing unwrapped pod-key behavior |

Synthetic fixtures generated with the web Torus/CryptoJS libraries verify both directions for every text category, all fields, legacy notes, factor derivations, binary data and beneficiary layers. These checks verify format compatibility; native passkey and wallet signing behavior still require devices.

## Known legacy issues

Master-password derivation has no password-hardening KDF and uses a short nonce. MetaMask factor derivation retains only eight signature characters. Passkey derivation uses the credential identifier rather than an authenticator-held secret; credential IDs should not be assumed confidential. Binary CBC and the historical text format do not add modern authenticated encryption.

These issues are deliberately preserved for compatibility. Protocol strengthening and account migration are outside this implementation, as requested. Avoid representing successful interoperability tests as a protocol-security audit.

## Native key retrieval

Biometrics are opt-in after a successful factor unlock. Only the derived private key and its public key are stored; the alias binds Firebase UID, factor ID and public key. Master passwords are never saved.

Android uses per-factor Keystore AES-GCM keys, authentication-per-use, strong BiometricPrompt CryptoObjects and enrollment invalidation. iOS uses device-only Keychain access with biometryCurrentSet. Key retrieval itself requires approval.

The app checks account availability and the factor online before and after retrieval. Changed factors are rejected and saved keys removed. Factor refresh prunes obsolete records. Logout/reset/deletion and disabling saved unlocking clear device secrets. Session generations and account IDs invalidate pending work after locking or account switching.

Background transitions cover contents and discard unlocked screen state. A successful native picker/wallet handoff remains shielded until online validation completes. Accounts without factors must reauthenticate the Firebase account on return. Android FLAG_SECURE blocks screenshots; iOS covers app-switcher snapshots.

## Transfers and telemetry

Only ciphertext is uploaded. File transfers use temporary directories and streaming crypto. Download URLs are renewed on authorization expiry. Executor grants/exclusions are checked around protected reads and before sharing. Backups and explicit exports are plaintext and are disclosed as such.

Sentry is disabled when SENTRY_DSN is empty. Configured Dart reports retain a small stack allowlist and redact messages, payloads, account context, URLs, breadcrumbs and locals. Native crash handling, native breadcrumbs, automatic tracing, screenshots and watchdog tracking are disabled so native reports cannot bypass the Dart filter. Confirm network payloads on both platforms before enabling release telemetry.

Unit tests cover prompt cancellation/missing secrets, factor deletion during approval and account switches. Hardware unavailability, biometric enrollment changes, process death, wallet handoffs and native secret-storage behavior still require physical-device acceptance.
