// Renders the existing Cipherwill logo into native launcher sizes.
// Owns Android and iOS icon generation from the local vector asset.
// Does not invent new branding or download artwork.
import {readFileSync,readdirSync} from 'node:fs';
import {resolve,dirname} from 'node:path';
import {fileURLToPath} from 'node:url';
import {createRequire} from 'node:module';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
const require=createRequire(resolve(process.env.CIPHERWILL_WEB_PATH || resolve(root,'../Cipherwill'),'package.json'));
const sharp=require('sharp');
const source=readFileSync(resolve(root,'assets/branding/app_icon.svg'));
const densities={'mipmap-mdpi':48,'mipmap-hdpi':72,'mipmap-xhdpi':96,'mipmap-xxhdpi':144,'mipmap-xxxhdpi':192};
for(const [density,size] of Object.entries(densities))await sharp(source).resize(size,size).png().toFile(resolve(root,'android/app/src/main/res',density,'ic_launcher.png'));
const ios=resolve(root,'ios/Runner/Assets.xcassets/AppIcon.appiconset');
const {images}=JSON.parse(readFileSync(resolve(ios,'Contents.json'),'utf8'));
for(const entry of images){
  if(!entry.filename)continue;
  const size=Math.round(Number(entry.size.split('x')[0])*Number(entry.scale.replace('x','')));
  await sharp(source).resize(size,size).removeAlpha().png().toFile(resolve(ios,entry.filename));
}
console.log('Generated native Cipherwill launcher icons.');
