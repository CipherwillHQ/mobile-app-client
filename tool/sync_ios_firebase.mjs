// Adds the registered Firebase iOS configuration to the Runner target.
// Owns plist validation, Xcode resource references and FlutterFire metadata.
// Does not compile iOS or alter signing and authentication providers.

import {readFileSync,writeFileSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath} from 'node:url';
import {plistString} from './plist_values.mjs';

const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const metadataPath=resolve(root,'firebase.json');
const metadata=JSON.parse(readFileSync(metadataPath,'utf8'));
const dart=metadata.flutter.platforms.dart['lib/core/config/firebase_options.dart'];
const source=readFileSync(resolve(root,process.argv[2] || 'ios/Runner/GoogleService-Info.plist'),'utf8');
if(plistString(source,'GOOGLE_APP_ID')!==dart.configurations.ios ||
   plistString(source,'PROJECT_ID')!==dart.projectId ||
   plistString(source,'BUNDLE_ID')!=='com.cipherwill.app') {
  throw Error('iOS Firebase configuration does not match the registered Cipherwill app.');
}

const target=resolve(root,'ios/Runner/GoogleService-Info.plist');
const projectPath=resolve(root,'ios/Runner.xcodeproj/project.pbxproj');
let project=readFileSync(projectPath,'utf8');
if(!project.includes('GoogleService-Info.plist')) {
  const file='C1F1BA010000000000000001';
  const build='C1F1BA020000000000000001';
  const changes=[
    ['/* End PBXBuildFile section */',
      '\t\t'+build+' /* GoogleService-Info.plist in Resources */ = {isa = PBXBuildFile; fileRef = '+file+' /* GoogleService-Info.plist */; };'],
    ['/* End PBXFileReference section */',
      '\t\t'+file+' /* GoogleService-Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = "GoogleService-Info.plist"; sourceTree = "<group>"; };'],
    ['\t\t\t\t97C147021CF9000F007C117D /* Info.plist */,',
      '\t\t\t\t'+file+' /* GoogleService-Info.plist */,'],
    ['\t\t\t\t3B3967161E833CAA004F5970 /* AppFrameworkInfo.plist in Resources */,',
      '\t\t\t\t'+build+' /* GoogleService-Info.plist in Resources */,'],
  ];
  for(const [anchor,line] of changes) {
    if(!project.includes(anchor))throw Error('Missing Xcode Firebase insertion point: '+anchor);
    project=project.replace(anchor,line+'\n'+anchor);
  }
}
if(!project.includes('GoogleService-Info.plist in Resources')) {
  throw Error('GoogleService-Info.plist must be included in Runner resources.');
}
metadata.flutter.platforms.ios={
  default: {
    projectId:dart.projectId,
    appId:dart.configurations.ios,
    uploadDebugSymbols:false,
    fileOutput:'ios/Runner/GoogleService-Info.plist',
  },
};
writeFileSync(target,source);
writeFileSync(projectPath,project);
writeFileSync(metadataPath,JSON.stringify(metadata,null,2)+'\n');
console.log('Validated and wired the registered Firebase iOS configuration.');
