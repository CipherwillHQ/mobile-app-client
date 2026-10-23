<!-- Documents the web-inspired Flutter redesign and its verification.
Owns visual references, implemented interactions and review commands.
Does not equate synthetic renders with live Android/iOS feature acceptance. -->
# Mobile design

The native app uses the web client's Gilroy typography, Cipherwill blue, cream canvas, forest text, sage/clay accents and charcoal dark surfaces. The authentication landscape, family photography, Cipherwill marks and Google mark come from existing web assets. Photographs are resized for mobile.

The redesign covers authentication/onboarding/unlocking, Home, Vault, People, settings, every text-asset form, rich notes, storage, beneficiaries and friends, timeline, guidance, subscriptions, backups and executor access.

- Authentication uses a photographic header, explicit account-password visibility, native autofill and a keyboard-accessible scroll layout.
- Home shows actual account score and item counts, guidance, timeline and security destinations. Accounts without an unlocked encryption factor are labeled accordingly.
- Vault categories have recognizable icons, descriptions and actual counts. Category and loaded item-title search preserve pagination.
- Category forms have grouped fields, masked sensitive values, explicit copying, beneficiary access and committed-save feedback. Seed phrase copying uses the web's space-separated representation.
- Notes retain the HTML adapter and queued autosave behavior with a compact scrollable formatting toolbar.
- Storage shows separate readable text/file usage, folders and upload recovery. File metadata can be renamed without altering its extension or binary contents; beneficiary exclusions are available for files.
- Settings group profile, plan, communication, security, planning, backups, appearance and account actions. Essential and promotional email preferences match the web client.
- Executor screens identify the donor and read-only state. Existing online authorization, exclusions and layered decryption remain in place.
- Short fade/slide transitions, entrance reveals and native iOS transitions respect reduced-motion settings. Secret retrieval, background protection and the routed account gate retain their existing responsibilities.

## Automated visual review

    flutter test lib test --dart-define=DESIGN_REVIEW=true

This produces synthetic PNGs under the ignored .dart_tool/design-review/ directory. The regression suite exercises 25 screen layouts in both themes, 320-pixel phones at 2× text size, all eight text-asset forms, password visibility, keyboard reachability, copy behavior and success/failure save feedback. Preview fonts are bundled Gilroy and Material Icons; native system monospace rendering still requires device inspection.

Existing codec/security/service tests continue to cover encryption, leases, permission changes, backups, rich HTML and retry behavior. Final verification for this redesign: **100 tests passed**, Android development debug APK compiled, and source rules/analysis were checked.

## Acceptance still required

Renders use synthetic accounts and are not store screenshots. Run every scenario in parity-scenarios.md against real Android and iOS accounts before claiming full accepted feature parity. ADB was disconnected during final review, and iOS compilation/device testing requires macOS. Provider linking, MetaMask project configuration, passkey domain association and release signing retain the gates in release-checklist.md.
