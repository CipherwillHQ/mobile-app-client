<!-- Documents the authentication contract between Flutter and the web client.
Owns session handoff, token exchange, logout and acceptance requirements.
Does not implement application features or store server credentials. -->
# Authentication bridge

Flutter retains Firebase authentication and loads `https://cipherwill.com/app`
with the `CipherwillAuth` JavaScript channel registered before navigation.

Requests are JSON objects with an integer `id` and `type` of `session` or
`logout`. Responses call `window.CipherwillAuthResponse(id, session)`. A session
contains only the native Firebase `uid` and a fresh short-lived `idToken`.
Native refresh tokens are not exported.

The web authentication hook waits for the native session before subscribing to
Firebase identity changes. It sends the ID token as a Bearer authorization header
to `POST /rest/v1/mobile-auth` on the existing API host. The endpoint verifies
the token, including revocation/disabled-account checks, and creates a Firebase
custom token for the verified UID. It supports new, unverified accounts so the
web client's existing onboarding and verification gates remain responsible.

The web client signs in with Firebase's public `signInWithCustomToken` API using
`inMemoryPersistence`. Its existing Firebase token refresh, GraphQL authorization
and application providers continue to work. Ordinary browsers keep their existing
Firebase behavior. Neither ID tokens nor custom tokens are put in URLs.

Flutter sends sessions only while the original native account is current and
the main WebView URL has the exact `https://cipherwill.com` origin. Injected
responses check that origin again. External main-frame links open through the
native URL launcher. Native logout disposes the authenticated WebView; an account
switch creates a new one. Web logout also requests native logout.

If the exchange fails, the web client sends `{"type":"error","id":0}`, which
opens the wrapper's Retry/Sign out recovery screen. Retrying creates a fresh
WebView and authentication handshake.

## Deployment and verification

Deploy the backend token-exchange route and companion web authentication changes
before distributing the mobile wrapper. The exchange uses the backend's existing
Firebase Admin service account and needs no new credentials or dependencies.

Tests use synthetic identities, fake WebViews, a local test HTTP server and mocked
Firebase requests. They cover token exchange and revocation checks, Firebase web
session restoration/refresh, web/native logout, account-switch races, origin
rejection, deep links, native sign-in layout and loading/back-navigation recovery.

Before release, check email/Google/Apple sign-in on devices, fresh and expired
sessions, logout/relaunch, email action links, uploads/downloads, web factor
unlocking and external links. Verify browser-dependent features on both Android
and iOS.