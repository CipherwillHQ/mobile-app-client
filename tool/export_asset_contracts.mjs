// Exports web asset fields and the maintained backend guidance protocol.
// Owns drift checks for native forms and protocol fixtures.
// Does not execute web components or initialize backend services.
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync,readdirSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath,pathToFileURL} from 'node:url';
import {createHash} from 'node:crypto';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const web=resolve(process.env.CIPHERWILL_WEB_PATH || resolve(root,'../Cipherwill'));
const backend=resolve(process.env.CIPHERWILL_BACKEND_PATH || resolve(root,'../cipherwill-backend'));
const directory=resolve(web,'types/pods');
const assets={};
for(const filename of readdirSync(directory)){
  const type=filename.replace('.ts','');
  if(type==='FILE')continue;
  const source=readFileSync(resolve(directory,filename),'utf8');
  const version=[...source.matchAll(/\/\/ (\d+\.\d+\.\d+)/g)].at(-1)?.[1];
  if(type==='NOTE'){assets[type]={version,fields:[{key:'content',label:'Note',required:false,array:false,multiline:false}]};continue;}
  const url=pathToFileURL(resolve(directory,filename)).href;
  const script='import * as fields from '+JSON.stringify(url)+'; console.log(JSON.stringify(fields.default ?? fields));';
  const fields=JSON.parse(execFileSync(process.execPath,['--import','tsx','--input-type=module','-e',script],{cwd:backend,encoding:'utf8'}));
  assets[type]={version,fields:['MANDATORY','OPTIONAL'].flatMap(group=>(fields[type+'_'+group] || []).map(field=>({
    key:field.key,label:field.label,required:group==='MANDATORY',
    array:new RegExp(field.key+'\\??:\\s*string\\[\\]').test(source),
    multiline:field.type==='textarea',
  })))};
}
const guidance=readFileSync(resolve(backend,'src/objectiveEngine/catalog/contract.ts'),'utf8');
const snapshot=JSON.stringify({guidanceProtocolVersion:Number(guidance.match(/GUIDANCE_PROTOCOL_VERSION = (\d+)/)[1]),
  guidanceContractHash:createHash('sha256').update(guidance.replace(/\r\n/g,'\n')).digest('hex'),assets},null,2)+'\n';
const target=resolve(root,'assets/contracts/asset_contracts.json');
if(process.argv.includes('--check')){
  if(readFileSync(target,'utf8')!==snapshot)throw Error('Asset or guidance contract drift. Regenerate the snapshot and review native forms.');
}else writeFileSync(target,snapshot);
console.log('Web asset fields and backend guidance contract are compatible.');
