<!-- Documents the Flutter app's web mobile layout and its verification.
Owns source references, implemented interactions and review commands.
Does not equate synthetic renders with live Android/iOS feature acceptance. -->
# Mobile design

The native layout follows the existing web mobile pages in the sibling Cipherwill repository. It uses Gilroy, Cipherwill blue, the dashboard cream canvas, forest text, and the web's charcoal/card dark surfaces. Authentication uses the web landscape and Cipherwill/Google marks.

## Layout

- A hamburger opens a 280px sidebar, capped at 85% of the viewport. It follows the web's Home, Guide, Segments, Notifications, Data, Web3 Finance, Finance, Storage, Network and Platform groups. Disabled data categories are hidden. Appearance, lock and logout controls stay below the scrollable links.
- Protected pages share the sidebar and flat Home / Data / Network / Platform section bar. Keyboard input hides the bar and resizes the page once. Authentication, onboarding and the lock gate remain outside this shell. Web checkout retains its separate screen.
- Dashboard uses a compact score link, greeting, the web's profile/data/beneficiary checklist, secured-data breakdown, planning and security/access destinations. Checklist completion comes from existing profile, storage and beneficiary responses.
- Manage Data, Network and Platform use the web's 128px icon/title tiles. The data hub groups enabled categories without extra descriptions and metrics.
- Settings uses General Settings / Profile / Backup / Usage tabs. Provider linking, communication preferences, planning, account actions and feedback remain available. Existing web settings links open the corresponding native tab.
- Notes use flat title/date rows. Other records use compact metadata cards. Text-asset forms retain grouped fields, sensitive-value visibility/copying and confirmed-save feedback. The HTML adapter and queued note autosave remain in place.
- Security factors use compact type/key/count rows and an options menu for rename, migration, biometrics and removal. The header's add menu exposes all three factor types.
- Storage places folder/upload actions in the header and retains retry controls for interrupted saves. Readable text/file usage is available in Settings → Usage.
- Shared headings, notices and form sections use smaller spacing and flat surfaces. Existing fade/slide and iOS transitions respect reduced motion.

Encryption, server authorization, beneficiary exclusions, temporary-file cleanup, background protection and committed-save behavior retain their existing services.

## Web references

- components/app/Sidebar/{menu,MobileMenu,MobileFloatingMenu,SidebarPanel}.tsx
- components/app/Topbar/index.tsx
- app/app/{page,data/page,network/page,platform/page,settings/page}.tsx
- components/app/dashboard/SecuredCounter.tsx
- components/app/OnboardingChecklist/index.tsx
- app/app/data/notes/NotesLayout.tsx
- components/app/data/DataTile.tsx
- app/app/factors/{FactorsList,OptionsMenu}.tsx
- app/auth/{page,LoginSection,EmailLogin}.tsx
- tailwind.config.js

## Verification

    flutter analyze --no-pub
    flutter test --no-pub lib test --dart-define=DESIGN_REVIEW=true
    node tool/check_source_rules.mjs --format

The full regression run passed 127 tests, and the two new factor-menu tests passed separately (129 total). Subsequent final theme/drawer render checks passed. Source caps, introductory comments, formatting, analysis and diff whitespace checks passed.

The visual suite renders 27 screen layouts in both themes, 320px phones at 2× text size and all eight text-asset forms. PNGs use synthetic account data under the ignored .dart_tool/design-review/ directory. overview.png shows the current auth, dashboard, sidebar, data, network and settings layouts.

Drawer navigation/category visibility, Settings tabs, keyboard reachability, factor-menu dispatch, checkout isolation and locked/background route behavior have automated coverage. Existing tests cover codecs, permission changes, backups, rich HTML, save failures and retry behavior.

The Android development debug APK built successfully, was installed with adb install -r on the paired I2011 phone, and cold-launched successfully. Android reported the app as resumed and lastUpdateTime=2026-10-24 03:12:54. This verifies installation/startup; account scenarios still require live acceptance.

## Release acceptance

Synthetic renders are not store screenshots. Android/iOS account scenarios in parity-scenarios.md still require live acceptance before claiming full feature parity. iOS build and device validation require macOS. Provider/domain configuration and release signing retain the requirements in release-checklist.md.
