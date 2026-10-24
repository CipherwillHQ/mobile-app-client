// Builds the existing Tawk widget document with an explicit support identity.
// Owns public widget IDs, safe serialization and account-scoped chat storage.
// Does not include authentication tokens, factor keys or vault contents.
import 'dart:convert';
import '../../core/api/json_values.dart';
import '../../shared/person_name.dart';

const supportChatBaseUrl = 'https://cipherwill.com/mobile-support';
const supportChatBlankDocument = '<!doctype html><html><body></body></html>';
const tawkPropertyId = '6a2bb8fcf0b5881c2ac3eee3';
const tawkWidgetId = '1jqtcl749';

String supportChatDocument(Json account) {
  final identity = jsonEncode({
    'visitor': {'name': personName(account), 'email': account['email']},
    'attributes': {'id': account['id'], 'plan': account['plan']},
  }).replaceAll('<', r'\u003c');
  final script = jsonEncode(
    Uri.https('embed.tawk.to', '/$tawkPropertyId/$tawkWidgetId').toString(),
  ).replaceAll('<', r'\u003c');
  return '''<!doctype html>
<html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>html,body{margin:0;height:100%;background:transparent}</style>
</head><body><script>
const identity = $identity;
try {
  const ownerKey = 'cipherwill-support-account';
  if (localStorage.getItem(ownerKey) !== identity.attributes.id) {
    for (const store of [localStorage, sessionStorage]) {
      for (const key of Object.keys(store)) {
        if (/^(twk_|tawk|__tawk)/i.test(key)) store.removeItem(key);
      }
    }
    for (const cookie of document.cookie.split(';')) {
      const name = cookie.split('=')[0].trim();
      if (!/^(twk_|tawk|__tawk)/i.test(name)) continue;
      for (const domain of ['', ';domain=cipherwill.com', ';domain=.cipherwill.com']) {
        document.cookie = name + '=;Max-Age=0;path=/' + domain;
      }
    }
    localStorage.setItem(ownerKey, identity.attributes.id);
  }
} catch (_) {}
window.Tawk_API = {
  visitor: identity.visitor,
  onLoad: function () {
    window.Tawk_API.setAttributes(identity.attributes, function () {});
    window.Tawk_API.maximize();
    CipherwillSupport.postMessage('ready');
  },
  onChatMinimized: function () { CipherwillSupport.postMessage('close'); }
};
window.Tawk_LoadStart = new Date();
const script = document.createElement('script');
script.async = true;
script.src = $script;
script.charset = 'UTF-8';
script.setAttribute('crossorigin', '*');
script.onerror = function () { CipherwillSupport.postMessage('error'); };
document.head.appendChild(script);
</script></body></html>''';
}
