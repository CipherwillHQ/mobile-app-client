<!-- Prepares store descriptions, privacy disclosures and reviewer instructions.
Owns draft wording that must be verified against production behavior.
Does not submit a listing or certify store compliance. -->
# Store submission draft

## Listing

Name: Cipherwill

Subtitle/short description: Secure your information and plan access for the people you trust.

Description:

Cipherwill helps you organize the information your loved ones may need. Save notes, passwords, account details and files, manage beneficiaries, and review your legacy-planning timeline from your phone.

Use your existing Cipherwill account and subscriptions. Unlock supported security factors, optionally save a derived factor key behind device biometrics, and review access granted to you in a separate executor workspace.

The app includes profile and communication settings, compatible text backup import/export, and account-deletion access. An internet connection is required. Backups and explicitly exported files contain decrypted data; keep those copies secure.

Privacy policy: https://cipherwill.com/i/privacy-policy
Terms: https://cipherwill.com/i/terms-of-service
Support contact: support@cipherwill.com (published in the existing privacy policy).
Outside-app deletion URL: confirm an existing public request route before Play submission.

## Privacy/data safety draft

| Data | Purpose/configuration to verify |
|---|---|
| Name, email, birthdate, account identifier | Existing Firebase/Cipherwill account setup and authentication |
| Phone numbers and channel preferences | Existing verification and reminder channels |
| Beneficiary/friend details and custom messages | User-entered relationships and release communication |
| Vault text and financial/account/file content | Existing encrypted vault storage; metadata/exclusions follow the web protocol |
| Subscription/invoice details | Existing-subscriber management through Cipherwill/payment provider |
| Web upgrade account attribution | Account email and backend user ID are passed to the public Cipherwill upgrade page; Paddle collects payment details on the web |
| Authentication/device information | Firebase/provider security; actual SDK collection needs platform review |
| Crash diagnostics | Optional configured Sentry; redacted Dart reports, native reports disabled |
| Biometrics | Device OS authorization; derived keys stay in protected native storage |

The app does not request access to the system address book, continuously track location, add push subscriptions, or persist an offline vault cache. File selection and sharing use system interfaces. Do not declare end-to-end secrecy for factorless accounts or credential-ID-derived legacy passkeys beyond the established protocol.

Verify backend retention, processor disclosures, encryption-in-transit configuration, SDK manifests and production telemetry before answering store questionnaires. Declare actual server-side handling rather than assuming encrypted content is exempt from data-safety categories.

## Reviewer setup

Supply disposable credentials through App Store Connect/Play Console review fields, never in the repository:

- An onboarded, verified owner with sample data and an existing subscription.
- A separate beneficiary/executor with a released sample will and an excluded item.
- A free account for restrictions.
- A recoverable security factor and documented biometric/passkey fallback.

Review flow: sign in, unlock the sample factor, open Home/Vault/People/Settings, edit a synthetic note, inspect beneficiary access, enter the executor workspace, and view existing subscription details. Explain that encrypted file storage/seed phrases/DeFi follow the existing account plan. Free accounts can open the existing Cipherwill web upgrade page from Subscription and invoices; the backend confirms Premium after payment processing.

Account deletion is under Settings → Reset or delete account. Use disposable accounts because deletion/reset affects backend data. Provide a sample archive for backup review and disclose its decrypted contents.

Capture store screenshots only from accepted Android/iOS builds using synthetic data. Internal distribution, final screenshots, privacy completion and public submission remain pending.
