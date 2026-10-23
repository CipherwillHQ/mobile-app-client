// Generates modular lookups from the checked-in GraphQL operation files.
// Owns generated document registrations and drift detection.
// Does not duplicate query strings or contact services.
import {readFileSync,writeFileSync,readdirSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath} from 'node:url';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const directory=resolve(root,'lib/core/api');
const names=readdirSync(resolve(directory,'operations')).filter(name=>name.endsWith('.graphql')).sort();
const header='// Registers generated GraphQL operation documents.\n// Owns one modular operation lookup group.\n// Does not cache account or vault data.\n';
const groups=[];
function output(name,source){
  if(process.argv.includes('--check')){if(readFileSync(resolve(directory,name),'utf8').replace(/\s/g,'')!==source.replace(/\s/g,''))throw Error('Operation registry drift: '+name);}
  else writeFileSync(resolve(directory,name),source);
}
for(let offset=0;offset<names.length;offset+=22){
  const group=names.slice(offset,offset+22);const index=groups.length;groups.push(index);
  const imports=group.map((name,i)=>"import 'operations/"+name+".dart' as op"+i+";").join('\n');
  const entries=group.map((name,i)=>{const document=readFileSync(resolve(directory,'operations',name),'utf8');const match=document.match(/\b(query|mutation)\s+(\w+)/);if(!match)throw Error('Unnamed operation: '+name);return "  '"+match[2]+"': op"+i+".documentNode"+(match[1]==='query'?'Query':'Mutation')+match[2]+",";}).join('\n');
  output('operation_group_'+index+'.dart',header+"import 'package:gql/ast.dart';\n"+imports+"\nfinal operationGroup"+index+"=<String,DocumentNode>{\n"+entries+"\n};\n");
}
output('operation_documents.dart',header+"import 'package:gql/ast.dart';\n"+groups.map(i=>"import 'operation_group_"+i+".dart';").join('\n')+"\nfinal operationDocuments=<String,DocumentNode>{\n"+groups.map(i=>'  ...operationGroup'+i+',').join('\n')+"\n};\n");
console.log('Operation registries match generated documents.');
