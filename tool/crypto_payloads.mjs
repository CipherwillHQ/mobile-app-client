// Supplies synthetic payloads using the exported web field contracts.
// Owns representative arrays, legacy notes and Unicode fixture content.
// Does not use production vault data or duplicate asset schemas.
import {readFileSync} from 'node:fs';
export function cryptoPayloads(root){
  const {assets}=JSON.parse(readFileSync(root+'/assets/contracts/asset_contracts.json','utf8'));
  const current=Object.entries(assets).map(([type,contract])=>({
    type:type.toLowerCase(),version:contract.version,
    data:Object.fromEntries(contract.fields.map(field=>[field.key,
      field.array?['first 🔐','second  ']:field.key==='content'?'<h2>Unicode 🔐</h2><p><strong>Text</strong>  </p>':'001234 '+field.key+' 🔐  '])),
  }));
  return [...current,{type:'note',version:'0.0.1',data:'<p>Legacy note 🔐  </p>'},{type:'note',data:'<p>Unversioned legacy note</p>'}];
}
