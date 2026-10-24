<!-- Explains the persistent native store-update bar and its acceptance checks.
Owns store eligibility, user-triggered update behavior and testing limits.
Does not publish releases, distribute APKs or contain store credentials. -->
# App updates

The app checks its published store release at startup, on return to the foreground,
and every 30 minutes while open. Routine checks are throttled; returning with a
known update refreshes eligibility immediately. Store/network failures do not
block startup and keep the last known update visible during the session.

When an update is available, a permanent bottom bar says **New update available**
and offers **Update**. It has no dismiss action and stays across authentication,
owner and executor routes until a store check confirms the installed build is
current. It also works on the startup configuration-error screen without Firebase.

The bar reserves its own space above the system navigation area or keyboard.
It does not cover page Save buttons or remount navigation and editors when it
appears. Large text reflows into a vertical layout, and light/dark themes use
the existing app tokens.

Update first checks unsaved notes, active guidance, profile drafts/saves, open
text prompts and pending file uploads. Finish or save those before updating.
Cancelled update requests keep the bar. Native store handoffs retain normal
background shielding and vault locking.

## Android

Google Play's official in-app update API checks the installed package and compares
Android build numbers. Update refreshes Play information and opens its immediate
update flow when permitted. Otherwise it opens the app's Play Store listing.
No installation starts without the user's Update tap and platform approval.

Updates require a Play-installed/owned app, eligible account/track, matching package
and app signing certificate, and a greater version code. Publish a higher build
to a testing track to exercise the real flow. ADB debug installs and GitHub APK
artifacts cannot validate Play update eligibility.

## iOS

An independent HTTP client queries Apple's public lookup API using the installed
bundle ID and device country (US when no country is available). It compares the
published version and opens the matching App Store page for Update. It sends no
Cipherwill/Firebase authorization headers. Missing listings produce no update bar.
Apple lookup caching can delay detection; it does not expose TestFlight updates
or same-version build changes. TestFlight's update delivery remains separate.

The public store flow needs device acceptance after both store listings exist.
The first release containing this feature can detect subsequent published updates;
older builds without update detection need their usual store update first.

## Verification

Co-located tests cover store identity/version validation, Apple JSON response
formatting, cancellation/fallback, failures, duplicate actions, route/editor
preservation, unsaved work, background privacy, footers, keyboards and large text.
Run `flutter test lib test` and the standard analysis/source checks before releasing.

Local verification on 2026-10-24: all 274 Flutter tests, analysis, handwritten
source/format checks and the Android debug build with production configuration
passed. Windows cannot verify iOS compilation or live store update delivery.
