// Generates web fixtures and verifies mobile ciphertext with actual web libraries.
// Owns all asset versions, factor derivations, E0/E1 layers and binary compatibility.
// Does not access real account data or production services.
import {createRequire} from 'node:module';
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath} from 'node:url';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {cryptoPayloads} from './crypto_payloads.mjs';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const require=createRequire(resolve(process.env.CIPHERWILL_WEB_PATH || resolve(root,'../Cipherwill'),'package.json'));
const torus=require('@toruslabs/eccrypto');
const CryptoJS=require('crypto-js');
const {ec:EC}=require('elliptic');
const curve=new EC('secp256k1');
const privateKey=Buffer.from('1'.padStart(64,'0'),'hex');
const publicKey=Buffer.from(torus.getPublic(privateKey)).toString('hex');
const podKey='0123456789abcdef0123456789abcdef0123456789abcdef';
const capsulePrivate=Buffer.from('2'.padStart(64,'0'),'hex');
const iv=Buffer.alloc(16,7),salt=Buffer.alloc(8,9);
function pack(encrypted,type='E0'){return JSON.stringify({type,ciphertext:Buffer.from(encrypted.ciphertext).toString('base64'),ephemPublicKey:Buffer.from(encrypted.ephemPublicKey).toString('base64'),iv:Buffer.from(encrypted.iv).toString('base64'),mac:Buffer.from(encrypted.mac).toString('base64')});}
function unpack(value){const data=JSON.parse(value);return Object.fromEntries(['ciphertext','ephemPublicKey','iv','mac'].map(k=>[k,Buffer.from(data[k],'base64')]));}
function privateBuffer(secret){return Buffer.from(secret.padStart(64,'0'),'hex');}
async function decryptWrapped(envelope,secret){return Buffer.from(await torus.decrypt(privateBuffer(secret),unpack(envelope))).toString();}
function digest(data){return crypto.createHash('sha256').update(data).digest('hex');}
function factor(type,nonce,input){
  const secret=type==='master-password'?digest(input+':'+nonce):type==='metamask'?digest(input.slice(-8)+':'+nonce):digest(Buffer.concat([Buffer.from(nonce,'base64'),Buffer.from(input,'base64')]));
  const key=curve.keyFromPrivate(secret);
  return {type,nonce,input,privateKey:key.getPrivate('hex'),publicKey:key.getPublic('hex')};
}
if(process.argv.includes('--verify-mobile')){
  const result=JSON.parse(readFileSync(resolve(root,'build/mobile_crypto_vectors.json'),'utf8'));
  assert.equal(await decryptWrapped(result.wrapped,privateKey.toString('hex')),podKey);
  for(const text of result.texts)assert.equal(CryptoJS.AES.decrypt(text.ciphertext,podKey).toString(CryptoJS.enc.Utf8),text.plaintext);
  const decipher=crypto.createDecipheriv('aes-256-cbc',podKey.slice(16),podKey.slice(0,16));
  assert.equal(Buffer.concat([decipher.update(Buffer.from(result.binary,'base64')),decipher.final()]).toString('base64'),result.binaryPlaintext);
  for(const output of result.factors){
    const expected=factor(output.type,output.nonce,output.input);
    assert.equal(output.privateKey,expected.privateKey);
    assert.equal(output.publicKey,expected.publicKey);
    assert.equal(await decryptWrapped(output.wrapped,expected.privateKey),podKey);
    const e1=await decryptWrapped(output.beneficiary,expected.privateKey);
    assert.equal(JSON.parse(e1).type,'E1');
    assert.equal(await decryptWrapped(e1,capsulePrivate.toString('hex')),podKey);
  }
  console.log('All mobile asset versions, factors, beneficiary layers and binary ciphertext decrypt with web libraries.');
}else{
  let scalar=2n,ephemeral;
  do{ephemeral=Buffer.from(scalar.toString(16).padStart(64,'0'),'hex');scalar++;}while((await torus.derivePadded(privateKey,torus.getPublic(ephemeral)))[0]!==0);
  const current=pack(await torus.encrypt(Buffer.from(publicKey,'hex'),Buffer.from(podKey),{ephemPrivateKey:ephemeral,iv}));
  const legacy=pack(await torus.encrypt(Buffer.from(publicKey,'hex'),Buffer.from(podKey),{ephemPrivateKey:ephemeral,iv,padding:false}));
  const texts=cryptoPayloads(root).map(payload=>{const plaintext=JSON.stringify(payload);return{plaintext,ciphertext:CryptoJS.AES.encrypt(plaintext,podKey,{salt:CryptoJS.lib.WordArray.create(salt)}).toString()};});
  const factors=[factor('master-password','12345','Unicode 🔐 password  '),factor('metamask','654321','0x'+'ab'.repeat(61)+'deadbeef'),factor('passkey',Buffer.from([0,128,255,1,2,3,4,5]).toString('base64'),Buffer.from([255,0,128,4,5,6,7,8]).toString('base64'))];
  for(const f of factors){
    f.wrapped=pack(await torus.encrypt(Buffer.from(f.publicKey,'hex'),Buffer.from(podKey)));
    const e1=pack(await torus.encrypt(torus.getPublic(capsulePrivate),Buffer.from(podKey)),'E1');
    f.beneficiary=pack(await torus.encrypt(Buffer.from(f.publicKey,'hex'),Buffer.from(e1)));
  }
  const beneficiaryWithoutFactor=pack(await torus.encrypt(torus.getPublic(capsulePrivate),Buffer.from(podKey)),'E1');
  const binary=Buffer.from([0,1,127,128,255,10,13,0]);
  const cipher=crypto.createCipheriv('aes-256-cbc',podKey.slice(16),podKey.slice(0,16));
  const fixture={privateKey:privateKey.toString('hex'),publicKey,podKey,ephemeralPrivateKey:ephemeral.toString('hex'),iv:iv.toString('base64'),salt:salt.toString('base64'),current,legacy,texts,factors,capsulePrivate:capsulePrivate.toString('hex'),beneficiaryWithoutFactor,binaryPlaintext:binary.toString('base64'),binary:Buffer.concat([cipher.update(binary),cipher.final()]).toString('base64')};
  mkdirSync(resolve(root,'assets/contracts'),{recursive:true});
  writeFileSync(resolve(root,'assets/contracts/crypto_vectors.json'),JSON.stringify(fixture,null,2)+'\n');
  console.log('Generated web fixtures for all asset fields, legacy notes, factors and beneficiary layers.');
}
