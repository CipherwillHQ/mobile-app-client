<!-- Documents the Flutter app's web mobile layout and its verification.
Owns source references, implemented interactions and review commands.
Does not equate synthetic renders with live Android/iOS feature acceptance. -->
# Mobile design

The native layout follows the existing web mobile pages in the sibling Cipherwill repository. It uses Gilroy, Cipherwill blue, the dashboard cream canvas, forest text, and the web's charcoal/card dark surfaces. Authentication uses the web landscape and Cipherwill/Google marks.

## Layout

- A hamburger opens a sidebar capped at 320px and 88% of the viewport. It follows the web's Home, Guide, Segments, Notifications, Data, Web3 Finance, Finance, Storage, Network and Platform groups. Disabled data categories are hidden. System, Light and Dark appearance choices stay below the scrollable links; lock and logout are absent from the sidebar.
- The sidebar theme switcher uses one icon rail with a 160ms sliding selection indicator. System, Light and Dark retain native tooltips, selected semantics and 48px tap targets. It fits 320–430px phones at up to 3× text and respects reduced motion; Settings retains its labeled appearance choices.
- Owner pages share the sidebar with no permanent bottom navigation. Nested pages have Back and menu access; editors, adding people and active guidance show focused controls. Drawer edge swipes are disabled so they cannot bypass draft guards. Authentication, onboarding and the lock gate remain outside this shell. Web checkout retains its separate screen.
- Dashboard uses a compact score link, greeting, the web's profile/data/beneficiary checklist, secured-data breakdown, planning and security destinations. Checklist completion comes from existing profile, storage and beneficiary responses.
- Unverified accounts show an email verification banner in the reusable BannerArea above Continue Setup. The area stacks independent notices and collapses when empty. Continue Setup and deferred-task Resume open objectives without entering verification; only the banner opens the send/check flow. I've verified it reloads Firebase, refreshes the token and checks the backend account, removing the banner once confirmed. Onboarding and factor gates remain before protected guidance, and slide motion, scrolling and reduced-motion support use the shared guidance shell.
- Received wills and the owner's released access appear as independent conditional dashboard widgets. The released-access notice comes first and opens a focused review sheet with confirmed per-beneficiary revocation. A grant stays in the list until the backend confirms success. Empty scenarios have no permanent sidebar or Network entries; direct review links remain supported.
- Received wills open a separate Execution dashboard and drawer: Shared wills, the selected donor's overview, populated shared categories and My dashboard. Donor identity and a read-only deadline follow text, folders and files. Each selected route is checked online; resume, refresh and expiry recheck access. Ended grants return to shared wills with an explanation; connection failures retain a retry. Outgoing protected pages hide contents when their donor context disappears.
- Manage Data, Network and Platform retain the web's groups with compact 96px icon/title tiles that grow or reflow with text size. The data hub groups enabled categories without extra descriptions and metrics.
- Settings uses General Settings / Profile / Backup / Usage / About us tabs. About us shows the public website, web app, privacy policy and terms, followed by the installed version/build at 50% opacity. Policies are absent from General Settings and remain available during authentication. The selected tab stays visible on narrow screens. Communication preferences and feedback remain available. Segments only configures categories; check-in and reminder controls live on Timeline. Account reset/deletion and Backup actions direct users to the desktop app. Existing web settings links open the corresponding native tab.
- Timeline leads with an estimated next check-in and last activity, followed by a flat, connected reminder/access rail. Whole-row edits open native interval sheets with selected choices and relative-step explanations; the birthday facts sit below the schedule. Free check-in editing, Premium reminder/default controls, custom existing values and the web's cumulative date calculations are preserved. Date changes fade and sheet motion respects reduced motion.
- Notes use a flat title/body, compact save state and a labeled options sheet. Other records and people use flat metadata rows. Forms show required fields first and use an Add field sheet for optional groups, with one pinned Save action. The HTML adapter, stable editor focus and queued note autosave remain in place.
- Security factors use compact type/key/count rows and an options menu for rename, migration, biometrics and removal. The header's add menu exposes all three factor types.
- Storage has one Add menu for upload/folder creation and a visible incomplete-upload row with same-ID retry. File options handle rename, beneficiary access and confirmed deletion; decrypted export remains an explicit task action. Readable text/file usage is available in Settings → Usage.
- Gilroy typography, one semantic Tabler outline icon map, shared flat rows and short state messages replace oversized cards. Top-level navigation uses a 150ms crossfade; detail pages retain native Android predictive Back and iOS transitions. Structural changes and guidance respect reduced motion.
- PageFrame owns keyboard resizing and task footers. Notices appear below the header, and save errors retain reachable retry controls. Pull to refresh replaces repeated list controls and includes an accessible refresh action.

Encryption, server authorization, beneficiary exclusions, temporary-file cleanup, background protection and committed-save behavior retain their existing services.

## Web references

- components/app/Sidebar/{menu,MobileMenu,MobileFloatingMenu,SidebarPanel}.tsx
- components/app/Topbar/index.tsx
- app/app/{page,data/page,network/page,platform/page,settings/page}.tsx
- app/app/timeline/{CycleDescription,CustomCipherwillInterval,Timeline/EventRow,Timeline/TimelineReset}.tsx
- components/app/dashboard/SecuredCounter.tsx
- components/app/OnboardingChecklist/index.tsx
- components/executor/{ExecutorPermissions,GrantedBeneficiaryAccessList,ExecutorDashboard,ExecutorAccessBoundary}.tsx
- components/executor/ExecutorSidebar/getExecutorMenu.tsx
- app/app/data/notes/NotesLayout.tsx
- components/app/data/DataTile.tsx
- app/app/factors/{FactorsList,OptionsMenu}.tsx
- app/auth/{page,LoginSection,EmailLogin}.tsx
- tailwind.config.js

## Verification

    flutter analyze --no-pub
    flutter test --no-pub lib test --dart-define=DESIGN_REVIEW=true
    node tool/check_source_rules.mjs --format

Physical Android test builds must include the environment file:

    flutter build apk --debug --target-platform android-arm64 --no-pub --dart-define-from-file=config/production.json

The configured phone build uses Firebase project `project-cipherwill` and `https://api.stack.cipherwill.com/v1/`. Firebase/native and Google client consistency checks passed with these build defines. The corrected APK was installed over wireless ADB and cold-started; device UI verification confirmed the dashboard appeared and the startup configuration error was absent. An APK built without the environment file has an empty `API_URL` and fails startup validation.

The current redesign's complete verification results are recorded in `mobile-redesign.md`.

The visual suite renders 34 screen layouts in both themes; checks 320 / 360 / 430px phones and landscape at 2× text; and covers all eight text-asset forms. PNGs use synthetic account data under the ignored .dart_tool/design-review/ directory. Individual screen captures are the current evidence; older contact sheets may predate the redesign.

Drawer navigation/category visibility, Settings tabs, keyboard reachability, factor-menu dispatch, checkout isolation and locked/background route behavior have automated coverage. Existing tests cover codecs, permission changes, backups, rich HTML, save failures and retry behavior.

The access-flow update passed all 205 automated Flutter tests, analysis, source/format checks and an Android arm64 debug build on 2026-10-24. Co-located executor tests cover all four dashboard states, confirmed revocation, donor switching, shared folders, denied links, stale responses, background refresh and foreground expiry. Eight additional captures cover the dashboard, review sheet, will overview and execution sidebar in both themes; access controls also fit 320px phones at 2× and 3× text.

The Timeline redesign passed all 219 automated Flutter tests, analysis, source/format checks and a production-configured Android arm64 debug build on 2026-10-24. Its 20 co-located tests cover all five interval identities/units, free check-in editing, custom existing values, cancellation, unchanged selections, pending/failed saves and Premium default resets. Captures cover the schedule, milestone summary and native sheets in both themes, with 320px layouts through 3× text, reduced motion, contrast and labeled tap targets.

The updated APK was installed successfully over wireless ADB. Automatic approval review blocked the Android intent for opening the Timeline link with “blocked by policy”; physical Timeline page verification is pending. The synthetic previews are available in .dart_tool/design-review/timeline-schedule-{light,dark}.png.

The About us update passed all 225 Flutter tests, analysis, source/format checks and a production-configured Android arm64 debug build on 2026-10-24. Tests cover the production Settings route, policy relocation, native version/build metadata, 50% footer opacity, browser presentation and 320px layouts at 3× text. The updated APK was installed over wireless ADB; installed package metadata confirms version 1.0.0 and build 3.

Build/install verification confirms startup only; account scenarios still require live acceptance. See `mobile-redesign.md` for the current build's results.

## Release acceptance

Synthetic renders are not store screenshots. Android/iOS account scenarios in parity-scenarios.md still require live acceptance before claiming full feature parity. iOS build and device validation require macOS. Provider/domain configuration and release signing retain the requirements in release-checklist.md.
