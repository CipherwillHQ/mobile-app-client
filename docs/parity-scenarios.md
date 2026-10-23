<!-- Maps agreed web capabilities to mobile acceptance scenarios.
Owns the live Android/iOS parity gates and automated evidence.
Does not mark an unexecuted device scenario as passing. -->
# Feature parity scenarios

Every row requires an Android and iOS result against the existing backend. All live-device results are currently **pending**. Automated evidence covers service contracts and codecs where listed; it does not substitute for these scenarios.

| Area | Required live scenario | Automated evidence |
|---|---|---|
| Account authentication | Existing/new email account, Google, iOS Apple, explicit provider linking, logout | Account-bound lease tests |
| Account actions | Email verification/reset links, onboarding, inactive account reactivation | Generated API validation |
| Factors | Master password, MetaMask and web/mobile passkey unlock; creation, rename, migration, removal, key counts | Actual-library factor vectors; migration tests |
| Biometrics | Enable/disable; cancellation, missing hardware, changed enrollment; web factor deletion; account switching | Retrieval/account/factor race tests |
| Return security | Background, app switcher, system prompts, wallet return, process death and factorless return | Factorless locking and lease invalidation tests |
| Notes | CRUD/autosave, queued edits, legacy versions, headings, marks, lists, links, code and preserved unknown blocks | HTML round trips and category crypto |
| Passwords | CRUD, username/password, TOTP secret, website arrays and note | Web field snapshot and crypto |
| Email accounts | CRUD, provider/recovery fields, security answers, backup codes, aliases | Web field snapshot and crypto |
| Device locks | CRUD, password/PIN/note | Web field snapshot and crypto |
| Bank accounts | CRUD, exact account numbers and bank names | Web field snapshot and crypto |
| Payment cards | CRUD, holder/number/expiry/CVV/network/issuer/note | Web field snapshot and crypto |
| Seed phrases | CRUD, word arrays/public key/note, premium restrictions | Web field snapshot and crypto |
| DeFi staking | CRUD, platform/amount/asset/lock/wallet/login/note, premium restrictions | Web field snapshot and crypto |
| Files | Upload/download/preview/share, folders/delete/usage/quota, large files | Binary streaming and stable-retry tests |
| Upload recovery | Interrupted transfer, lost commit response, same-ID retry/reselection, expired URLs, duplicate prevention | Commit/pending-upload tests |
| People | Search, new guest invite/anonymous choice, beneficiaries, friends and removal | Generated API validation |
| Beneficiary sharing | Custom messages, exclusions, rewrapping and account-factor changes | Exclusion and migration tests |
| Planning | Check-in interval/days, cumulative reminders, current defaults, next event and account score | Backend contracts |
| Activity recording | Authenticated activity eventually appears; eight-hour deduplication and pending job handling | Backend code reviewed; live pending |
| Guidance | Every active catalog definition; input validation, eligibility/dependencies, skip/resume, encrypted effects | Rules, input effects and schema tests |
| Guidance recovery | Failed effects/completion, catalog changes, lost acknowledgements, durable recovery | Guidance session retry tests |
| Profile/preferences | Profile/birthdate, segments, light/dark/system appearance, marketing choice | Generated API validation |
| Communication | Add/verify/delete phone, SMS/WhatsApp/phone preferences, feedback | Generated API validation |
| Reset/deletion | Clear local keys, deliberately request/reset/delete account; repeat/cancel/failure | Cancel/failure feedback tests |
| Existing subscriptions | Details, invoices, portal, period-end cancellation, eligible immediate refund | Generated API validation |
| Executor lists | Granted wills, donor details, allowed categories/items and folder traversal | Generated API validation |
| Executor protected reads | Unreleased/expired/revoked grants; changed exclusions; E0/E1 decryption | Permission/revocation tests and web crypto |
| Backups | Web/mobile ZIP v0.0.2, import v0.0.1; text only; plaintext disclosure | ZIP codec and restore tests |
| Repeated restore | Preserve readable content, exclusions and concurrent saves; fail on unreadable saved data | Restore regression tests |
| Links | Cold/warm verification/reset/executor links, wallet return, expired/invalid links | Owner/executor URI mapping and action-code/cancellation tests; live pending |
| Accessibility | Large text, screen readers, keyboards, touch targets, safe areas, both themes | Large-text navigation widget test |

Free/premium authorization and quota rejection must be exercised on real test accounts. All save failures must preserve a retry route and avoid reporting success. Temporary exported copies must be removed after sharing and on the next launch after an interruption.

Exclude unfinished chat, wishes and end-of-life placeholders, marketing/HQ, push, offline vault caching, checkout and upgrade flows. Confirm no existing-subscriber portal route introduces an in-app purchase/upgrade flow.
