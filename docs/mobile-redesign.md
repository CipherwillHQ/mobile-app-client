<!-- Documents the implemented Flutter redesign and its acceptance checks.
Owns navigation, component behavior, motion and verification evidence.
Does not certify untested live account flows or iOS device scenarios. -->
# Cipherwill mobile redesign

Status: implemented in Flutter on 2026-10-24, based on mobile commit `3f7c3e5` and the sibling web client. Local build and verification results are recorded below; live release acceptance remains separate.

## Direction

The Cipherwill web client defines page names, hierarchy, section order and task locations. Adapt its existing pages for phone screens with cleaner spacing, touch targets, typography and motion. Linear and Raycast inform visual restraint and interaction quality. Keep Gilroy, Cipherwill blue, warm neutral light surfaces and charcoal dark surfaces.

Scope: the Flutter implementation preserves the web's page names, separate Data / Network / Platform hubs, sidebar groups and Settings tabs. Mobile uses a grouped drawer, native Back and task-specific actions. The permanent web mobile section bar is removed. Existing destinations remain reachable; desktop handoffs for backups, restore, reset and deletion remain explicit. Existing GraphQL, encryption, guidance and subscription services remain authoritative.

## What the review found

| Prior behavior | Evidence | Implemented change |
|---|---|---|
| Dashboard sections occupy substantial space | `home_screen.dart`, `dashboard_metrics.dart`; fresh Flutter render | Keep the web's greeting, checklist, secured-data, factors, segments and access sections; tighten their mobile presentation |
| Navigation tiles require substantial scrolling | `category_grid.dart`, `destination_grid.dart` use 128px tiles | Keep the web's grouped two-column hubs; use compact icon/label tiles, growing with text size |
| Every protected page retains the same global navigation | `navigation_shell.dart`, `page_frame.dart` | Match the web's page-specific Back/menu and list/editor behavior; isolate sensitive task flows |
| Settings combines a header, four tabs, section headings and a global footer | `settings_screen.dart`, `settings_tabs.dart`; fresh render | Keep General Settings / Profile / Backup / Usage; make tabs responsive and prevent duplicate action/navigation areas |
| Notes have separate title/content headings, help, status, save and sharing controls | `asset_draft_form.dart` | Title and editor form the page; compact save status; sharing in the item menu; retry remains visible |
| Other items and people use bordered cards for ordinary rows | `vault_item_tile.dart`, `people_list_screen.dart` | Use one reusable row pattern; show relevant secondary information only |
| Refresh consumes a separate row on every paginated list | `paged_list.dart` | Pull to refresh with an accessible refresh action; preserve pagination and retry |
| All page children receive a 420ms entrance effect | `page_frame.dart`, `motion.dart` | Animate navigation and structural changes; ordinary list content appears promptly |
| Authentication is a tall centered card over a landscape | `auth_layout.dart`; fresh render | Use the existing photograph as a bounded upper region with a flat, keyboard-aware form |
| Loading/error/empty states always create another card | Shared state components | Match the affected content's layout; concise context and one recovery action |

The visual suite now covers 34 real screen compositions, including focused editors, adding people, Friends and executor lists. It checks both themes at 393px and all screens at 320 / 360 / 430px and 852×393 landscape with 2× text and reduced motion. Synthetic renders do not prove live account behavior or measured device performance.

Web references: `Design.md`, `app.design.md`, `components/app/Sidebar`, `components/app/Topbar`, the mobile page headers, data/network/platform hubs and the Guide overview. The redesign adapts their branding and behavior to native mobile navigation.

## Navigation and chrome

Keep familiar web pages, task locations and section ordering. Use a native sidebar for browsing, Back for nested pages, and contextual actions for the active task. Mobile has no permanent bottom navigation bar; only a task's own action area appears when useful.

| Level | Header | Footer | Behavior |
|---|---|---|---|
| Home / Dashboard | Menu, Dashboard title, score and profile | None | Keep the web dashboard's sections in a compact native layout |
| Manage Data, Network, Platform | Menu and existing page title | None | Preserve all three hubs and their existing destinations |
| Category and person lists | Back, title, Add and menu access | None | Return to the parent hub; keep the full drawer accessible |
| Settings, Profile, Backup, Usage | Settings title, Back, four existing tabs and menu access | None | Keep tab selection and existing web query/deep links |
| Timeline, Billing, Security Factors | Back, existing title, page actions and menu access | None | Keep each page under Platform; avoid duplicated controls |
| Item editor, adding a person, factor setup, active guidance | Back or close, concise title/progress | One task action when needed | Preserve drafts, validation, save guards and cancellation rules |
| Executor workspace | Back, donor/context, read-only indication | None | Keep owner and executor access distinct |
| Auth/unlock | Minimal branding and account context | Auth controls only | Keep account authentication separate from factor unlocking |

- Retain the sidebar order: Home, Guide, Segments, Notifications; Data, Web3 Finance, Finance, Storage; Network; Platform. Group headings can open their corresponding hub. Include every enabled working category and scroll the menu independently when needed.
- Keep System / Light / Dark in the drawer's bottom area. Lock and sign-out stay in account settings.
- Keep the displayed page names and existing task locations. Platform continues to open Timeline, Billing, Security Factors and Settings. Preserve mobile routes and all web deep links; internal Flutter route names need not match displayed labels.
- A visible menu button opens the drawer. Nested pages have predictable Back behavior to their parent context. Focused editors keep Back/close and their own actions; navigation must respect unsaved-change and privacy guards.
- Let one layer own system insets, keyboard resizing and the action area. Reserve space for pinned actions and notices; content scrolls clear of them.
- Use one compact header per screen. Long titles truncate in navigation chrome, while the full name remains readable in the page and accessible label.
- Put secondary actions in a labeled options sheet. Keep reveal/copy and the main task action directly available. Confirm deletion and revocation explicitly.

## Visual system

| Element | Specification |
|---|---|
| Surfaces | Existing `#f8f8f6` light canvas, white controls; `#1f1f1e` dark canvas, `#2c2c2a` elevated controls |
| Accent | Existing `#003ecb` for the main action and selection; accessible brighter blue for dark text links |
| Color usage | Neutral icons by default; semantic color for status and errors; no decorative color per category |
| Typography | Gilroy; page titles 20–22px, section labels 13–14px, body 15–16px, metadata 12–13px; support system scaling |
| Sensitive values | Monospace, masked by default, explicit reveal/copy; long values wrap safely |
| Spacing | 4 / 8 / 12 / 16 / 24 / 32; consistent 16px phone gutters |
| Rows | 56px minimum for one line, 64px for two; grow naturally with text scaling |
| Hub tiles | Same web groups in two phone columns, approximately 96px minimum height; grow or switch to one column for enlarged text |
| Touch | At least 48px on Android and 44px on iOS; visible icon size 20–24px |
| Corners | 8–12px controls; approximately 20px sheets; flat lists use spacing and occasional hairline separators |
| Icons | One outline family aligned with the web's Tabler style; common icon mapping, labels and semantics |
| Elevation | Reserved for drawers, sheets, menus and notices; ordinary lists need no shadows |

Remove text that repeats a title, button or obvious state. Keep short context where it changes a decision: who receives data, what a security factor does, release conditions, failed saves and desktop requirements. Essential actions keep labels; recognizable utility icons have accessible names.

## Screens and feature parity

| Area | Implemented experience | Preserved behavior |
|---|---|---|
| Home / Dashboard | Same web sections and relative order, with compact checklist, secured-data breakdown and account controls | Existing counts, score, factors, segments and access/revocation destinations; completed setup hides automatically |
| Manage Data | Same category groups and order in compact two-column tiles; category pages retain their individual layouts | All eight text categories, files, CRUD, pagination, preferences, plan restrictions and server authorization |
| Item forms | Required fields first; “Add field” opens grouped optional fields; one Save action | Exact contracts, existing optional values, arrays, validation, beneficiary exclusions and confirmed commits |
| Notes | Flat title/body; saved/saving/failure indicator near the title; simple editing | Web HTML and legacy content preservation, queued autosave, retry, Back guard and stable input focus |
| Files | File-manager rows, folder context, one add menu, visible pending-upload row | Upload/download/preview, rename, folders, deletion, sharing, quota, same-ID retry and expired-URL recovery |
| Network | Separate hub leading to Beneficiaries and Friends & Family; retain both separate list pages | Search first, then guest email with email/anonymity choices; no invitation before confirmation |
| Beneficiary | Identity, custom message and shared/excluded items in clear sections | Key migration, exclusions, permission changes, removal and access revocation |
| Guide | Existing centered overview and full-area slides, compact status links, one primary action | Catalog wording, eligibility, validation, timing, skip, defer, resume, encrypted effects and recovery |
| Timeline | Chronological schedule first; interval/reminder values are editable rows | Birthdate schedule, last activity, next check-in, cumulative reminder timing, defaults and release conditions |
| Factors | Compact factor rows; setup/rename/migration/options in focused flows | Master password, MetaMask, passkeys, key counts, factorless direct entry and available fallbacks |
| Biometrics | Offer after a successful factor unlock; show enrollment state only when known | Account/factor-bound key retrieval, online checks, enrollment invalidation, logout cleanup and cancellation |
| Platform | Separate hub containing Timeline, Billing, Security Factors and Settings | Existing page locations, permissions and deep links |
| Settings | General Settings / Profile / Backup / Usage tabs; appearance and account controls remain in General Settings | Verification, communications, feedback, all preferences and existing web tab links |
| Billing | Plan summary; Upgrade for free users or Manage billing for subscribers; invoices below | Existing `/upgrade` WebView, hosted Paddle portal and authoritative backend activation; no native cancel/refund controls |
| Executor | Clear donor context; matching compact categories/items/files | Read-only behavior, release conditions, exclusions, layered decryption and refreshed permissions before protected reads |
| Backup/restore | Settings → Backup tab; compact desktop explanation and selectable/copyable address | Direct to `https://cipherwill.com/app` on desktop; no mobile import/export workflow |
| Reset/delete | Account settings row marked “Desktop”; explicit destination | Direct to the same desktop app; no destructive mobile mutation |
| Authentication | Existing landscape, short title, reachable form, provider controls, concise legal links | Email/Google/iOS Apple, verification/reset, onboarding, inactive accounts, logout and cold/warm links |

Desktop copy: “Back up or restore your data at cipherwill.com/app on a desktop.” Account copy: “Reset or delete your account at cipherwill.com/app on a desktop.” Keep the full address selectable, with a copy action and clear dismissal. Mark the origin row so the handoff is predictable.

## Shared components and states

- Page header: main, detail and focused variants with explicit Back behavior.
- Navigation row: leading icon/avatar, title, optional secondary detail, optional value and trailing action.
- Form field: label above input, matching keyboard/autofill, validation below; optional fields preserve their controllers.
- Action sheet: readable choices, safe-area padding, keyboard-aware height and clear cancellation.
- Save status: distinguish unsaved, saving, committed and failed; announce meaningful state changes.
- Transfer row: pending/uploading/recovery state next to the file; show only measured progress.
- Feedback: quiet brief confirmation; errors keep a retry route. Preserve `AppNoticeHost` across navigation and its navigator/Overlay constraints.
- Loading: content-shaped placeholders with no fabricated counts. Empty: short heading and one next action. Permission denied and network failure remain distinguishable.

Reuse these components only where needed. Keep feature services intact. Mobile polish must not introduce a new information architecture, command framework or search API.

## Motion and performance

| Interaction | Motion |
|---|---|
| Main section switch | Short 120–160ms crossfade; no repeated stagger of every child |
| Detail navigation | Platform Back/predictive-back-compatible transition, approximately 200–260ms |
| Drawer and action sheet | 220–260ms easing; clear gesture dismissal |
| Optional field reveal | 160–180ms size/opacity change with stable focus |
| Guidance change | Existing directional transition, approximately 240–280ms; no boxed carousel |
| Press feedback | Native pressed state; optional subtle haptics for committed actions |
| Save confirmation | Brief state change after server commit; never celebrate an unconfirmed write |

Respect reduced motion, screen-reader navigation and device haptic settings. Cover sensitive content immediately when backgrounded or locked; privacy changes never wait for an animation. Do not animate decrypted content across an account or permission boundary.

Use lazy lists for long metadata collections. Preserve safe metadata context within the active account where appropriate; do not retain inactive decrypted screens or add offline vault caching. Decode the authentication image at an appropriate size. Profile transitions and scrolling in release/profile builds on real devices before claiming performance improvements.

## Implementation order and verification

1. Foundation and chrome → update tokens/theme, icon mapping, `PageFrame`, `NavigationShell` and sidebar; remove the permanent section bar. Verify route selection, all deep links, Back behavior, insets, keyboard and privacy gates.
2. Main screens → refine Dashboard and the existing Data / Network / Platform grids; keep Settings tabs. Verify web page names, group order, destinations, preference visibility and free/premium behavior.
3. Focused flows → notes, required/optional forms, people search, files, factors and Guide. Verify composition/backspace, save races, validation, cancellations, file recovery and catalog scenarios.
4. Remaining screens → Timeline, billing, executor, account/desktop handoffs and authentication. Verify schedule values, portal/WebView returns, read-only permissions and every handoff message.
5. Motion and acceptance → apply motion to verified state changes; measure real-device performance; complete the existing `parity-scenarios.md` on Android and iOS.

Acceptance: no hidden required fields or unreachable actions at 320 / 360 / 393 / 430px and 2× text; test landscape, keyboard, long names, long values and system bars. Reflow content rather than shrinking it. Verify screen-reader names/order, contrast, touch targets, sheets, notices and both themes. Include long lists, empty/loading/error, factorless and premium/free states, revoked executor access, interrupted uploads and failed saves.

Live scenarios in `parity-scenarios.md` remain required before public release. Synthetic layouts and service tests do not replace real account, biometric, wallet, payment and iOS device acceptance. The redesign introduces no backend migrations, encryption protocol changes or release version bump.

## Recorded verification

- `flutter analyze --no-pub`: passed with no issues.
- `flutter test --no-pub lib test --dart-define=DESIGN_REVIEW=true`: all 170 tests passed.
- Handwritten source caps, three introductory comments, Dart formatting and `git diff --check`: passed.
- Visual checks: 34 screen compositions in both themes; 320 / 360 / 430px and landscape at 2× text; all eight text-category forms. Current PNGs are in the ignored `.dart_tool/design-review/` directory.
- Interaction checks: direct/pushed/system Back, preserved drafts, note input/backspace, failed-save retry, scoped list refresh, factor actions, Guide pause/resume, desktop handoffs, free/subscriber billing, upload recovery and privacy gates.
- Accessible sheet checks: labeled actions, Android tap targets, cancellation and scrolling with 2× text and a visible keyboard. Four phone widths also keep Save above the keyboard.
- Android debug build: `flutter build apk --debug --dart-define-from-file=config/production.json` passed.
- Wireless device: `adb install -r` succeeded on the paired I2011 phone. A cold launch returned `Status: ok`; Android confirmed MainActivity resumed and the process remained running. Installed version is `1.0.0+3`, with `lastUpdateTime=2026-10-24 05:38:55`.

These tests use synthetic account metadata and mocked services/native plugins. They establish regression and layout coverage; they do not certify live Firebase accounts, hardware biometric behavior, store review or measured release performance.
