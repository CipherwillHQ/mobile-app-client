// Synchronizes public Google client identifiers after FlutterFire setup.
// Owns iOS client configuration and the Google return URL scheme.
// Does not handle credentials or change Firebase registrations.

import {readFileSync,writeFileSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath} from 'node:url';
import {plistString} from './plist_values.mjs';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const config=readFileSync(resolve(root,'ios/Runner/GoogleService-Info.plist'),'utf8');
const client=plistString(config,'CLIENT_ID');
const reverse=plistString(config,'REVERSED_CLIENT_ID');
if(!client || !reverse)throw Error('Enable Google and configure its iOS OAuth client in Firebase first.');
const android=JSON.parse(readFileSync(resolve(root,'android/app/google-services.json'),'utf8'));
const app=android.client.find(entry=>entry.client_info.android_client_info.package_name==='com.cipherwill.app');
const server=app?.oauth_client?.find(entry=>entry.client_type===3)?.client_id;
if(!server)throw Error('Firebase Android configuration is missing the Google web OAuth client.');
const target=resolve(root,'ios/Runner/Info.plist');
let source=readFileSync(target,'utf8');
source=source.replace(/\s*<key>GIDClientID<\/key>\s*<string>[^<]*<\/string>\s*/,'\n');
source=source.replace(/\s*<key>GIDServerClientID<\/key>\s*<string>[^<]*<\/string>\s*/,'\n');
if(!source.includes('<string>'+reverse+'</string>')){
  source=source.replace('<key>CFBundleURLSchemes</key><array>','<key>CFBundleURLSchemes</key><array><string>'+reverse+'</string>');
}
source=source.replace('<key>CFBundleExecutable</key>',
  '<key>GIDClientID</key><string>'+client+'</string>\n'+
  '<key>GIDServerClientID</key><string>'+server+'</string>\n'+
  '<key>CFBundleExecutable</key>');
writeFileSync(target,source);
console.log('Synchronized public iOS and server Google client configuration.');
