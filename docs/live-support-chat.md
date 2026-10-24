<!-- Documents the mobile integration with Cipherwill's existing Tawk support widget.
Owns account attribution, navigation, recovery and device acceptance checks.
Does not certify live conversations, attachment handling or store acceptance. -->
# Live support chat

Open **Live Chat with Team** from the owner sidebar or Settings → General Settings.
The protected `/support-chat` screen embeds the same public Tawk property and widget
as the web client, using the existing `webview_flutter` dependency.

A fresh GraphQL ME response supplies the visitor's name and email before the widget
script loads. The backend account ID and plan are added through Tawk's JavaScript
API. The document includes only these profile fields; it contains no Firebase token,
factor keys or vault contents. Tawk's public embed IDs are configured in
`lib/features/support/support_chat_document.dart`; no API secret is required.

The widget maximizes when ready. Native Back or minimizing the widget closes the
screen, returning to the previous page or Settings for a direct entry. Closing or
locking unloads the document. Account/network failures and a 30-second readiness
timeout offer Retry, which refreshes the account and creates a new WebView.

The support document uses an HTTPS Cipherwill base URL. When the backend account
changes, it removes Tawk-prefixed storage entries and accessible first-party cookies
before loading the widget. Reopening for the same account retains those entries.
An account switch during ME lookup prevents opening with stale attribution.

HTTPS chat frames remain embedded; external HTTPS, mail and telephone links use
the existing native link opener. The JavaScript bridge accepts only ready, error
and close events. Chat operates while this screen is open; there is no background
unread badge or push notification integration.

Automated verification uses synthetic accounts, a fake native WebView and a Node VM:

```text
flutter test --no-pub lib/features/support
node --test tool/support_chat_script_test.mjs
```

Run the Flutter tests first to generate the ignored synthetic document fixture used
by the Node tests. These checks do not load the remote widget or send messages.

Local verification passed all 286 Flutter tests, three JavaScript tests, Flutter
analysis, source/format checks and Android arm64 debug compilation. The public
Tawk embed script returned HTTP 200. Live conversations and iOS compilation
remain unverified.

Before release, verify Android and iOS rendering, keyboard/rotation behavior,
online/offline support, identity in the agent dashboard, and chat history after
reopening, signing out and switching accounts. Attachment/file-picker support and
external-link handoffs require device acceptance. Coordinate a test conversation
with the support team; automated checks do not establish live delivery.
