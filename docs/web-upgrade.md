<!-- Documents the existing web checkout integration in the Flutter app.
Owns account attribution, bridge behavior and live acceptance requirements.
Does not certify Paddle payments, deployment or store approval. -->
# Web upgrade integration

Free accounts open Settings → Subscriptions & invoices → Upgrade to Premium.
The protected /upgrade route embeds the public web page with webview_flutter:

    https://www.cipherwill.com/upgrade?email=EMAIL&user_id=ACCOUNT_ID

Both values come from a fresh GraphQL ME response, with URI encoding. The account
ID is Cipherwill's backend ID, not the Firebase UID. Link parameters cannot replace
the current account. No Firebase ID token, factor key or vault content is injected.

The app registers the CipherwillUpgrade JavaScript channel before loading the page
and enables unrestricted JavaScript for Paddle. This matches the contract in the
web repository's app/upgrade/FlutterWebView.md.

- A cipherwill.upgrade success result closes checkout and refreshes the account,
  subscription and invoices. Feedback says payment processing may still be pending;
  Premium is never granted locally. The billing refresh button checks again later.
- An error result closes checkout and displays the web error message. Another attempt
  can be opened from billing. Manual closing and checkout.closed do not report success.
- Malformed messages, duplicate results and callbacks from disposed attempts are ignored.
- Page/account failures show a retry control. Retry rechecks the account and creates
  a fresh WebView. An account switch during the lookup prevents stale attribution.
- The main frame stays on the HTTPS Cipherwill upgrade page. Other HTTPS links open
  in the system browser; HTTPS Paddle payment frames remain embedded.

The existing account gate and background privacy protection still apply. Actual
Paddle/3DS/PayPal/wallet handoffs, background/reunlock behavior, webhook activation
and Android/iOS rendering must be verified on devices. This integration adds no
payment API, database migration, native payment SDK or locally inferred entitlement.

Local verification: the full regression suite passed 114 tests; all 16 checkout
tests passed after the final duplicate-tap guard and additional route coverage.
Flutter analysis and source/format checks passed. The public upgrade URL returned
HTTP 200, and Android debug compilation passed. Actual payment acceptance is pending.
