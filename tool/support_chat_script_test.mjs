// Executes the generated support document against a synthetic Tawk API.
// Owns callback behavior, safe profile serialization and account storage isolation.
// Does not run a browser, download scripts or contact a support agent.
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {test} from 'node:test';
import vm from 'node:vm';
const {html} = JSON.parse(readFileSync(new URL('../build/support_chat_document.json', import.meta.url)));
const code = html.match(/<script>([\s\S]+)<\/script>/)[1];

function storage(values) {
  const store = {...values};
  Object.defineProperties(store, {
    getItem: {value: key => store[key] ?? null},
    setItem: {value: (key, value) => { store[key] = value; }},
    removeItem: {value: key => { delete store[key]; }},
  });
  return store;
}
function widget(previousAccount) {
  const messages = [], cookies = [], scripts = [], attributes = [];
  let maximized = 0;
  const localStorage = storage({
    'cipherwill-support-account': previousAccount,
    'twk_token_old': 'previous-chat-token',
    'tawk_uuid_old': 'previous-visitor',
    'checkout-state': 'keep-checkout',
  });
  const sessionStorage = storage({'twk_uuid_old': 'previous-chat-id'});
  const document = {
    createElement: () => ({setAttribute() {}}),
    head: {appendChild: script => scripts.push(script)},
    get cookie() { return 'twk_uuid_old=previous-chat; tawk_uuid_old=previous-visitor; checkout=session'; },
    set cookie(value) { cookies.push(value); },
  };
  const window = {};
  vm.runInNewContext(code, {
    window, document, localStorage, sessionStorage,
    CipherwillSupport: {postMessage: value => messages.push(value)},
  });
  const api = window.Tawk_API;
  api.setAttributes = value => attributes.push(value);
  api.maximize = () => { maximized++; };
  return {api, messages, cookies, scripts, attributes, localStorage, sessionStorage,
    get maximized() { return maximized; }};
}
test('widget callbacks identify the visitor and expose readiness/close/failure', () => {
  const result = widget('support-account');
  assert.equal(result.api.visitor.email, 'sam+support@example.com');
  assert.equal(result.api.visitor.name, '</script><script>alert("injected")</script> Sam Mobile');
  result.api.onLoad();
  assert.equal(result.maximized, 1);
  assert.deepEqual(JSON.parse(JSON.stringify(result.attributes)), [{id: 'support-account', plan: 'premium'}]);
  result.api.onChatMinimized();
  result.scripts[0].onerror();
  assert.deepEqual(result.messages, ['ready', 'close', 'error']);
  assert.match(result.scripts[0].src, /^https:\/\/embed\.tawk\.to\//);
  assert.equal((html.match(/<\/script>/g) ?? []).length, 1);
});
test('changing accounts removes chat identifiers while retaining unrelated web state', () => {
  const result = widget('another-account');
  assert.equal(result.localStorage['twk_token_old'], undefined);
  assert.equal(result.localStorage['tawk_uuid_old'], undefined);
  assert.equal(result.sessionStorage['twk_uuid_old'], undefined);
  assert.equal(result.localStorage['checkout-state'], 'keep-checkout');
  assert.equal(result.localStorage['cipherwill-support-account'], 'support-account');
  assert.equal(result.cookies.length, 6);
  assert.ok(result.cookies.every(cookie => /^(twk_uuid_old|tawk_uuid_old)=;Max-Age=0;/.test(cookie)));
});
test('reopening support for the same account preserves the chat session', () => {
  const result = widget('support-account');
  assert.equal(result.localStorage['twk_token_old'], 'previous-chat-token');
  assert.equal(result.localStorage['tawk_uuid_old'], 'previous-visitor');
  assert.equal(result.sessionStorage['twk_uuid_old'], 'previous-chat-id');
  assert.deepEqual(result.cookies, []);
});
